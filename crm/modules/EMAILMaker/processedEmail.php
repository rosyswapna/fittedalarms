<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
require_once("include/Zend/Json.php");
require_once("include/utils/GetGroupUsers.php");
require_once("include/utils/UserInfoUtil.php");
require_once("modules/EMAILMaker/ConvertEMAIL.php");
require_once("modules/EMAILMaker/SavePDFIntoEmail.php");   

global $current_user,$theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";

if(isset($_REQUEST['type']) && $_REQUEST['type'] == 'control')
{
    $sql = "SELECT DISTINCT tb1.esentid FROM vtiger_emakertemplates_sent AS tb1 INNER JOIN vtiger_emakertemplates_emails AS tb2 ON tb1.esentid = tb2.esentid WHERE status = '0' AND tb1.userid = ?";
    $result = $adb->pquery($sql,array($current_user->id));

    $records=$adb->num_rows($result);
    
	if($records>0)
		echo $adb->query_result($result,0,"esentid");
	else
		echo 'NO';	
	
    exit;
}

//check for mail server configuration thro ajax
if(isset($_REQUEST['server_check']) && $_REQUEST['server_check'] == 'true')
{
	$sql="select * from vtiger_systems where server_type = ?";
	$records=$adb->num_rows($adb->pquery($sql, array('email')),0,"id");
	if($records != '')
		echo 'SUCCESS';
	else
		echo 'FAILURE';	
	die;	
}

//Added on 09-11-2005 to avoid loading the webmail vtiger_files in Email process
if($_REQUEST['smodule'] != '')
{
	define('SM_PATH','modules/squirrelmail-1.4.4/');
	/* SquirrelMail required vtiger_files. */
	require_once(SM_PATH . 'functions/strings.php');
	require_once(SM_PATH . 'functions/imap_general.php');
	require_once(SM_PATH . 'functions/imap_messages.php');
	require_once(SM_PATH . 'functions/i18n.php');
	require_once(SM_PATH . 'functions/mime.php');
	require_once(SM_PATH .'include/load_prefs.php');
	//require_once(SM_PATH . 'class/mime/Message.class.php');
	require_once(SM_PATH . 'class/mime.class.php');
	sqgetGlobalVar('key',       $key,           SQ_COOKIE);
	sqgetGlobalVar('username',  $username,      SQ_SESSION);
	sqgetGlobalVar('onetimepad',$onetimepad,    SQ_SESSION);
	$mailbox = 'INBOX';
}

require_once('modules/Emails/Emails.php');
require_once('include/logging.php');
require_once('include/database/PearDatabase.php');

$local_log =& LoggerManager::getLogger('index');

$focus = new Emails();

function checkIfContactExists($mailid)
{
	global $log;
	$log->debug("Entering checkIfContactExists(".$mailid.") method ...");
	global $adb;
	$sql = "select contactid from vtiger_contactdetails inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_contactdetails.contactid where vtiger_crmentity.deleted=0 and email= ?";
	$result = $adb->pquery($sql, array($mailid));
	$numRows = $adb->num_rows($result);
	if($numRows > 0)
	{
		$log->debug("Exiting checkIfContactExists method ...");
		return $adb->query_result($result,0,"contactid");
	}
	else
	{
		$log->debug("Exiting checkIfContactExists method ...");
		return -1;
	}
}

//assign the focus values
$focus->filename = "";
$focus->parent_id = "";
$focus->parent_type = "";
$focus->column_fields["assigned_user_id"]=$current_user->id;
$focus->column_fields["activitytype"]="Emails";
$focus->column_fields["date_start"]= date(getNewDisplayDate());//This will be converted to db date format in save

//$focus->save("Emails");
$return_id = $focus->id;

require_once("modules/EMAILMaker/mail.php");

$language = $_SESSION['authenticated_user_language'];
$e_mod_strings = return_specified_module_language($language, "EMAILMaker");

$esentid = $_REQUEST["esentid"];

$sql = "SELECT * FROM vtiger_emakertemplates_sent WHERE esentid = '".$esentid."'";
$result = $adb->query($sql);

$from_name = $adb->query_result($result,0,"from_name");
$from_address = $adb->query_result($result,0,"from_email");

$type = $adb->query_result($result,0,"type");
$load_subject = $adb->query_result($result,0,"subject");
$load_body = $adb->query_result($result,0,"body");
$total_emails = $adb->query_result($result,0,"total_emails");

$pdf_template_ids = $adb->query_result($result,0,"pdf_template_ids");
$pdf_language = $adb->query_result($result,0,"pdf_language");

$attachments = $adb->query_result($result,0,"attachments");
$att_documents = $adb->query_result($result,0,"att_documents");
        
$cc = "";
$bcc = "";

$all_emails_count = 0;
$sent_emails_count = 0;
$sql2 = "SELECT * FROM vtiger_emakertemplates_emails WHERE esentid = '".$esentid."' AND status = 0";
$result2 = $adb->query($sql2);
$not_emails_sent_num = $adb->num_rows($result2); 

$start = $_REQUEST["start"];

if ($start == "true")
{
    $status = "START";
    $status_title = $mod_strings["LBL_EMAILS_DISTRIBUTION"];
    
    $sent_emails = getCountEmailsStatus($esentid);
    $content = $sent_emails." ".$mod_strings["LBL_EMAILS_SENT_FROM"]." ".$total_emails;
}
else
{
    if ($not_emails_sent_num > 0)
    {
        $Inserted_Emails = array();
        
        $semailid = $adb->query_result($result2,0,"emailid");
        $pid = $adb->query_result($result2,0,"pid");
        $myid = $adb->query_result($result2,0,"email");
        $cc = $adb->query_result($result2,0,"cc");
        $bcc = $adb->query_result($result2,0,"bcc");
        
        list($mycrmid,$temp) = explode("@",$myid,2);
        
        if ($mycrmid == "email")
        {
            $emailadd = $temp;
            $mycrmid = "";
            $pmodule = "";
            $track_URL = "";
        }          
        else
        {
            $emailadd = "";
            
            if ($temp == "-1")
                $pmodule = "Users";
            else
                $pmodule=getSalesEntityType($mycrmid);
        }
        
        //$description = "<img src='$track_URL' alt='' width='1' height='1'>$description";
        // END
        $pos = strpos($description, '$logo$');
        if ($pos !== false)
        {
        
        	$description =str_replace('$logo$','<img src="cid:logo" />',$description);
        	$logo=1;
        } 
    
        $Email_Content = new EMAILContent();
        $Email_Content->setContent($load_subject."|@{[&]}@|".$load_body, $mycrmid, $pmodule, $pid); 
        $convert_content = $Email_Content->getContent();    
        $Email_Images = $Email_Content->getEmailImages();
    
        list($subject,$body) = explode("|@{[&]}@|",$convert_content);
        
        $focus->column_fields["parent_id"] = $mycrmid;
        //$focus->parent_type = $pmodule;
        $focus->column_fields["subject"] = $subject;
        $focus->column_fields["description"] = $body;
        
        $saved_toid = "";
        if($temp == "-1")
        {
            $emailadd = $adb->query_result($adb->pquery("select email1 from vtiger_users where id=?", array($mycrmid)),0,'email1');
            $user_full_name = getUserFullName($mycrmid);
            
            $saved_toid = $user_full_name."<".$emailadd.">"; 
        }
        else
        {
            if ($mycrmid != "")
            {
                $emailadd = getEmailToAdressat($mycrmid,$temp,$pmodule);
                
                $entityNames = getEntityName($pmodule, $mycrmid);
        	    $pname = $entityNames[$mycrmid];
                
                $saved_toid = $pname."<".$emailadd.">"; 
            }
            else
            {
                $saved_toid = $emailadd;
            }
        } 
        $focus->column_fields["saved_toid"] = $saved_toid;
        
        $focus->column_fields["ccmail"] = $cc;
        $focus->column_fields["bccmail"] = $bcc;

        $focus->save("Emails");
        
        if ($mycrmid != "")
        {
            $Inserted_Emails[] = $mycrmid; 
            $rel_sql = 'insert into vtiger_seactivityrel values(?,?)';
    		$rel_params = array($mycrmid,$focus->id);
    		$adb->pquery($rel_sql,$rel_params);
        }
      
        if ($attachments == "1")
        {
            $sql_attch = "SELECT * FROM vtiger_emakertemplates_attch WHERE esentid = '".$esentid."'";
            
            $result_attch = $adb->query($sql_attch);
            while($row_attch = $adb->fetchByAssoc($result_attch))
            {
                SaveAttachmentIntoEmail($focus->id,$row_attch["filename"],$row_attch["type"],$row_attch["file_desc"]);
            }
        }
        
        if ($att_documents != "")
        {
            saveDocumentsIntoEmail($focus->id,$att_documents);
        }
        
        if ($pdf_template_ids != "")
        {
            savePDFIntoEmail($focus,$pid,$pdf_template_ids,$pdf_language);
        }
        
        if($temp == "-1")
        {
            $pmodule = 'Users';
            
            $mail_status = send_em_mail('Emails',$emailadd,$from_name,$from_address,$subject,$body,$cc,$bcc,'all',$focus->id,$logo,$Email_Images);
            $mail_status_str .= $emailadd."=".$mail_status."&&&";
        }
        else
        {
        	global $site_URL, $application_unique_key;
            $emailid = $focus->id;
            
            if ($mycrmid == "")
            {
                  $mail_status = send_em_mail('Emails',$emailadd,$from_name,$from_address,$subject,$body,$cc,$bcc,'all',$focus->id,$logo,$Email_Images);
	
            
            	  $mail_status_str .= $emailadd."=".$mail_status."&&&";

            	  if($mail_status != 1)
            	  {
            			$errorheader2 = 1;
            	  }
            }
            else
            {
                $track_URL = $site_URL."/modules/Emails/TrackAccess.php?record=$mycrmid&mailid=$emailid&app_key=$application_unique_key";
                $body = $body."<img src='".$track_URL."' alt='' width='1' height='1'>";
           
            	if($emailadd != '')
            	{
            		if(isPermitted($pmodule,'DetailView',$mycrmid) == 'yes')
            		{
            			$mail_status = send_em_mail('Emails',$emailadd,$from_name,$from_address,$subject,$body,$cc,$bcc,'all',$focus->id,$logo,$Email_Images);
            		}	
            
            		$mail_status_str .= $emailadd."=".$mail_status."&&&";
            		//added to get remain the EditView page if an error occurs in mail sending
            		if($mail_status != 1)
            		{
            			$errorheader2 = 1;
            		}
            	}
            }    
        }

        

        $sql_u = "UPDATE vtiger_emakertemplates_emails SET status = '1', parent_id = '".$focus->id."'";
        if ($mail_status != 1) 
        {
            $sql_u .= ", error = '".$mail_status."'";        
        }
        $sql_u .= " WHERE emailid = '".$semailid."'";
        $adb->query($sql_u); 
        
        if ($mail_status == 1) 
        {
            $sql_u2 = "UPDATE vtiger_emaildetails SET email_flag = 'SENT' WHERE emailid = '".$focus->id."'";
            $adb->query($sql_u2); 
        }
        
        $sent_emails = getCountEmailsStatus($esentid);
        
        $status = "IN_PROCESS";
        $status_title = $mod_strings["LBL_EMAILS_DISTRIBUTION"];
        $content = $sent_emails." ".$mod_strings["LBL_EMAILS_SENT_FROM"]." ".$total_emails;	

    }
    else
    {
        $sql_e = "SELECT error FROM vtiger_emakertemplates_emails WHERE esentid = '".$esentid."' AND error != ''";
        $result_e = $adb->query($sql_e);
        $emails_error = $adb->num_rows($result_e); 
        
        if ($emails_error > 0)
        {
            $Errors = array();
            
            $status = "END_ERRORS";
            
            if ($emails_error > 1)
                $status_title = "<span style='color:red'>".$emails_error." ".$mod_strings["LBL_EMAILS_HAS_NOT_BEEN_SENT"]."</span>";
            else
                $status_title = "<span style='color:red'>".$mod_strings["LBL_EMAIL_HAS_NOT_BEEN_SENT"]."</span>";
                
            while($row_e = $adb->fetchByAssoc($result_e))
            {
            	$Errors[] = $row_e['error'];
            }
            
            $send_email = $total_emails - $emails_error;
            
            $content = $send_email." ".$mod_strings["LBL_EMAILS_SENT_FROM"]." ".$total_emails;
            $content .= "<br /><br /><div style='color:red'><b>".$mod_strings["LBL_ERRORS"].":</b><hr style='background-color:red;color:red;'>";
            if (count($Errors) > 0)
            {
                $content .= implode("<hr style='background-color:red;color:red;'>",$Errors); 
            }
        }
        else
        {
            $status = "END";
            
            if ($total_emails > 1)
                $status_title = $mod_strings["LBL_EMAILS_HAS_BEEN_SENT"];
            else
                $status_title = $mod_strings["LBL_EMAIL_HAS_BEEN_SENT"];
    
            $content = $total_emails." ".$mod_strings["LBL_EMAILS_SENT_FROM"]." ".$total_emails;
            
            if ($attachments == "1")
            {
                $sql_attch = "SELECT * FROM vtiger_emakertemplates_attch WHERE esentid = '".$esentid."'";
                
                $result_attch = $adb->query($sql_attch);
                while($row_attch = $adb->fetchByAssoc($result_attch))
                {
                    if (file_exists($row_attch["file_desc"]))
                        unlink($row_attch["file_desc"]);
                }
            }
        }    
        
    }
}

if (isset($_REQUEST["style"]) && $_REQUEST["style"] == "1")
{
    $messesage = $status."|@|".$status_title."|@|".$content;
}
else
{
    $messesage = $status."@<table  border='0' cellpadding='5' cellspacing='0'>
        						<tr>
        							<td style='padding:10px;' colspan='2'><b>".$status_title." </b></td>
        						</tr>
        					</table>
        					<table  border='0' cellpadding='0' cellspacing='0' class='hdrNameBg' style='width:100%'>
        						<tr><td style='padding:10px;' colspan='2'>";
                      
                      //if ($content != "")
                          $messesage .= $content;
                      //else          
                      //    $messesage .= "<b>".$mod_strings["LBL_MAIL_ON_ADDRESS"]." <br /><b>".$email."</b>,<br /> ".$status_content."</b>";
                          
        	   	  $messesage .= "</td></tr>
        				  </table>";
}                      
echo $messesage;   
  
//The following function call is used to parse and form a encoded error message and then pass to result page
$mail_error_str = getMailErrorString($mail_status_str);
$adb->println("Mail Sending Process has been finished.\n\n");  


function getEmailToAdressat($mycrmid,$temp, $pmodule = "")
{
    global $adb;
    
    if ($pmodule == "") $pmodule=getSalesEntityType($mycrmid);

	$myquery='Select columnname from vtiger_field where fieldid = ? and vtiger_field.presence in (0,2)';
	$fresult=$adb->pquery($myquery, array($temp));			
	if ($pmodule=='Contacts')
	{
		require_once('modules/Contacts/Contacts.php');
		$myfocus = new Contacts();
		$myfocus->retrieve_entity_info($mycrmid,"Contacts");
	}
	elseif ($pmodule=='Accounts')
	{
		require_once('modules/Accounts/Accounts.php');
		$myfocus = new Accounts();
		$myfocus->retrieve_entity_info($mycrmid,"Accounts");
	} 
	elseif ($pmodule=='Leads')
	{
		require_once('modules/Leads/Leads.php');
		$myfocus = new Leads();
		$myfocus->retrieve_entity_info($mycrmid,"Leads");
	}
	elseif ($pmodule=='Vendors')
    {
            require_once('modules/Vendors/Vendors.php');
            $myfocus = new Vendors();
            $myfocus->retrieve_entity_info($mycrmid,"Vendors");
    }
    else 
    {
    	// vtlib customization: Enabling mail send from other modules
    	$myfocus = CRMEntity::getInstance($pmodule);
    	$myfocus->retrieve_entity_info($mycrmid, $pmodule);
    	// END
    }
	$fldname=$adb->query_result($fresult,0,"columnname");
	$emailadd=br2nl($myfocus->column_fields[$fldname]);

    return $emailadd;
}

function getCountEmailsStatus($esentid)
{
    global $adb;
    $sql = "SELECT count(emailid) as total FROM vtiger_emakertemplates_emails WHERE status = '1' AND esentid = '".$esentid."'";
    $result = $adb->query($sql);
    
    return $adb->query_result($result,0,"total");  
}

function saveDocumentsIntoEmail($id,$documents)
{
    global $adb;
    $Documents = explode(",",$documents);
    
    foreach ($Documents AS $document_id)
    {
        if ($document_id!="")
        {
            $sql1='insert into vtiger_seattachmentsrel values(?,?)';
            $adb->pquery($sql1, array($id, $document_id));
        }
    }
}

function SaveAttachmentIntoEmail($id,$file_name,$filetype,$filetmp_name)
{
	global $adb, $current_user;

	$date_var = date("Y-m-d H:i:s");

	$ownerid = $current_user->id;

	$current_id = $adb->getUniqueID("vtiger_crmentity");

	$filename = ltrim(basename(" ".$file_name)); 
	$upload_file_path = decideFilePath();

    if (copy($filetmp_name, $upload_file_path.$current_id."_".$file_name)) 
    {
        $sql1 = "insert into vtiger_crmentity (crmid,smcreatorid,smownerid,setype,description,createdtime,modifiedtime) values(?, ?, ?, ?, ?, ?, ?)";
    	$params1 = array($current_id, $current_user->id, $ownerid, "Email Attachment", "", $adb->formatDate($date_var, true), $adb->formatDate($date_var, true));		
    
    	$adb->pquery($sql1, $params1);
    
    	$sql2="insert into vtiger_attachments(attachmentsid, name, type, path) values(?, ?, ?, ?)";
    	$params2 = array($current_id, $filename, $filetype, $upload_file_path);
    	$result=$adb->pquery($sql2, $params2);
    
    	$sql3='insert into vtiger_seattachmentsrel values(?,?)';
    	$adb->pquery($sql3, array($id, $current_id));
    }
}

?>