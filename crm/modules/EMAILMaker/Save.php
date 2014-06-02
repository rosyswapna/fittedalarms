<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/

require_once('Smarty_setup.php'); 
require_once("include/Zend/Json.php");
require_once("modules/EMAILMaker/EMAILMaker.php");

global $current_user;
global $upload_badext;

global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";

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


global $mod_strings,$app_strings;

if(isset($_REQUEST['description']) && $_REQUEST['description'] !='')
	$_REQUEST['description'] = fck_from_html($_REQUEST['description']);

//Check if the file is exist or not.
//$file_name = '';
if(isset($_REQUEST['filename_hidden'])) {
	$file_name = $_REQUEST['filename_hidden'];
} else {
	$file_name = $_FILES['filename']['name'];
}
$errorCode =  $_FILES['filename']['error'];
$errormessage = "";
if($file_name != '' && $_FILES['filename']['size'] == 0)
{
	if($errorCode == 4 || $errorCode == 0)
	{
		 if($_FILES['filename']['size'] == 0)
			 $errormessage = "<B><font color='red'>".$mod_strings['LBL_PLEASE_ATTACH']."</font></B> <br>";
	}
	else if($errorCode == 2)
	{
		  $errormessage = "<B><font color='red'>".$mod_strings['LBL_EXCEED_MAX'].$upload_maxsize.$mod_strings['LBL_BYTES']." </font></B> <br>";
	}
	else if($errorCode == 6)
	{
	     $errormessage = "<B>".$mod_strings['LBL_KINDLY_UPLOAD']."</B> <br>";
	}
	else if($errorCode == 3 )
	{
	     if($_FILES['filename']['size'] == 0)
		     $errormessage = "<b><font color='red'>".$mod_strings['LBL_PLEASE_ATTACH']."</font></b><br>";
	}
	else{}
	if($errormessage != ""){
		$ret_error = 1;
		$ret_parentid = vtlib_purify($_REQUEST['parent_id']);
		$ret_toadd = vtlib_purify($_REQUEST['parent_name']);
		$ret_subject = vtlib_purify($_REQUEST['subject']);
		$ret_ccaddress = vtlib_purify($_REQUEST['ccmail']);
		$ret_bccaddress = vtlib_purify($_REQUEST['bccmail']);
		$ret_description = vtlib_purify($_REQUEST['description']);
		echo $errormessage;
        	include("EditView.php");	
		exit();
	}
}

$form_type = addslashes($_REQUEST['type']);

$subject = $_REQUEST['subject'];
$description = $_REQUEST['description'];

if (isset($_REQUEST["pdf_template_ids"]) && $_REQUEST["pdf_template_ids"] != "")
{
    $pdf_template_ids = addslashes($_REQUEST["pdf_template_ids"]);
    $pdf_language = addslashes($_REQUEST["pdf_language"]);
}
else
{
    $pdf_template_ids = "";
    $pdf_language = "";
}

$att_documents = "";
if (isset($_REQUEST["documents"]))
{
    $Att_Documents = array();
    foreach($_REQUEST["documents"] AS $doc)
    {
        if ($doc != "")
        {
            $result_doc = $adb->pquery("SELECT attachmentsid FROM vtiger_seattachmentsrel WHERE crmid = ?",array($doc));  
            $att_id = $adb->query_result($result_doc,0,"attachmentsid");
            
            if (!in_array($att_id,$Documents))
            {    
                $Att_Documents[] = addslashes($att_id);
            }  
        }  
    }
    
    if (count($Att_Documents) > 0)
        $att_documents = implode(",",$Att_Documents);
}

if (isset($_REQUEST["from_email"]))
{
    list($type,$email_val) = explode("::",addslashes($_REQUEST["from_email"]),2);

    if ($email_val != "")
    {
        if ($type == "email1" || $type == "email2" || $type == "secondaryemail")
        {
            $sql_u = "SELECT first_name, last_name, ".$type." AS email  FROM vtiger_users WHERE id = '".$email_val."'"; 
            $result_u = $adb->pquery($sql_u, array());
            $first_name = $adb->query_result($result_u,0,"first_name");
            $last_name = $adb->query_result($result_u,0,"last_name");
            
            $from_name = trim($first_name." ".$last_name);
            $from_email = $adb->query_result($result_u,0,"email");
        }
        elseif($type == "a")
        {
            $from_name = $email_val;
            
            $sql_a="select * from vtiger_systems where from_email_field != ? AND server_type = ?";
            $result_a = $adb->pquery($sql_a, array('','email'));

            $from_email = $adb->query_result($result_a,0,"from_email_field");
        
        }
    }
}

$f_type = "1";

$sql = "INSERT INTO vtiger_emakertemplates_sent (from_name,from_email,subject,body,type,pdf_template_ids,pdf_language,userid,att_documents) VALUES (?,?,?,?,?,?,?,?,?)";
$result = $adb->pquery($sql,array($from_name,$from_email,$subject,$description,$f_type,$pdf_template_ids,$pdf_language,$current_user->id,$att_documents));

$esentid = $adb->database->Insert_ID("vtiger_emakertemplates_sent");

$Email_IDs_Array = array();
$Emails_Array = array();

foreach($_REQUEST['ToEmails'] AS $to_email)
{
    list($email_type, $email_pid, $email_crmid, $email_fieldid) = explode("_",$to_email);

    $email_ids = $email_crmid."@".$email_fieldid;
    
    if ($email_type == "normal")
    {
        $SendMail[$email_pid][] = $email_crmid."@".$email_fieldid;
        $all_emails_count++;
    } 
    else
    {   
        if ($form_type == "1")
        {
            $for_id = "no";
             
            If(isset($Emails_Array[$email_ids]))
            {
                 $EmailCCBCC[$email_type][] = $Emails_Array[$email_ids];
            }
            else
            {
                if ($email_crmid == "email")
                    $emailadd = $email_fieldid;
                else
                    $emailadd = getEmailToAdressat($email_crmid,$email_fieldid);
                
                if ($emailadd != "")
                {
                    $EmailCCBCC[$email_type][] = $emailadd;
                    $Emails_Array[$email_ids] = $emailadd; 
                }
            }
        } 
        else
        {
             $SendCCandBCCMail[$email_pid][] = array("type" => $email_type, "email_ids" => $email_crmid."@".$email_fieldid);
             $for_id = $email_pid;
        }
        
        if ($email_crmid != "email")
        {
            if (!isset($Email_IDs_Array[$for_id][$email_type]))
                $Email_IDs_Array[$for_id][$email_type] = array();
            
            if (!in_array($email_crmid,$Email_IDs_Array[$for_id][$email_type]))
                $Email_IDs_Array[$for_id][$email_type][] = $email_crmid;
        }
    }   
}

if ($form_type == "1")
{
    if (count($EmailCCBCC["cc"]) > 0)
    {
        $cc = implode("; ",$EmailCCBCC["cc"]);
    }
    
    if (count($EmailCCBCC["bcc"]) > 0)
    {
        $bcc = implode("; ",$EmailCCBCC["bcc"]);
    }
}
$f = 0;

$attachments = "0";

if (isset($_REQUEST["file_".$f."_hidden"]) && $_REQUEST["file_".$f."_hidden"] != "")
{
    $attachments = upladEmailAttachment($_FILES,$f,$esentid,$attachments);
}

$total_emails = 0;
foreach($SendMail AS $pid => $PidsData)
{
    if ($form_type != "1")
    {
        $EmailCCBCC2 = array();
        
        if (count($SendCCandBCCMail[$pid]) > 0)
        {
            foreach($SendCCandBCCMail[$pid] AS $Email_Data)
            {
                $email_ids = $Email_Data["email_ids"];
                $email_type = $Email_Data["type"];
                
                If(isset($Emails_Array[$email_ids]))
                {
                     $EmailCCBCC2[$email_type][] = $Emails_Array[$email_ids];
                }
                else
                {
                    list($email_crmid,$email_fieldid) = explode("@",$email_ids,2);
                    
                    if ($email_crmid == "email")
                        $emailadd = $email_fieldid;
                    else
                        $emailadd = getEmailToAdressat($email_crmid,$email_fieldid);
                    
                    if ($emailadd != "")
                    {
                        $EmailCCBCC2[$email_type][] = $emailadd;
                        $Emails_Array[$email_ids] = $emailadd; 
                    }
                }
            }
        }
        
        if (count($EmailCCBCC2["cc"]) > 0)
        {
            $cc = implode("; ",$EmailCCBCC2["cc"]);
        }
        
        if (count($EmailCCBCC2["bcc"]) > 0)
        {
            $bcc = implode("; ",$EmailCCBCC2["bcc"]);
        }
    } 
       
    foreach($PidsData AS $to_email)
    {
        $sql2 = "INSERT INTO vtiger_emakertemplates_emails (esentid,pid,email,cc,bcc,status) VALUES (?,?,?,?,?,?)";
        $adb->pquery($sql2,array($esentid,$pid,$to_email,$cc,$bcc,"0"));
        $total_emails++;
    } 
  
}

$sql3 = "UPDATE vtiger_emakertemplates_sent SET total_emails = ?, attachments = ? WHERE esentid = ?";
$adb->pquery($sql3,array($total_emails,$attachments,$esentid));
/*
$inputs="<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">
<html><head><title>EMAILMaker</title></head><body>";
$inputs.="<script language='JavaScript' type='text/javascript' src='include/js/general.js'></script>";
$inputs.="<script language='JavaScript' type='text/javascript' src='modules/EMAILMaker/EMAILMakerActions.js'></script>";
$inputs.="<script>";

$inputs.="openPopUpForSent('".$esentid."'); ";
$inputs.="window.opener.startEmailProcessed('".$esentid."'); ";
$inputs.="window.self.close(); ";
$inputs.="</script>";
$inputs.="</body></html>";

echo $inputs;
*/
$smarty = new vtigerCRM_Smarty();

$smarty->assign("THEME", $theme);
$smarty->assign("IMAGE_PATH", $image_path);
$smarty->assign("APP", $app_strings);
$smarty->assign("MOD", $mod_strings);

$smarty->assign('ESENTID',$esentid);

$smarty->assign('STRING1',$mod_strings['LBL_PLEASE_DONT_CLOSE_WINDOW']);
$smarty->assign('STRING2',$mod_strings['LBL_POPUP_WILL_BE_CLOSED_AUT']);

$smarty->assign('PROCESS_CONTENT','0 '.$mod_strings["LBL_EMAILS_SENT_FROM"].' '.$total_emails);

$smarty->display("modules/EMAILMaker/EMAILPopUp.tpl");

echo "<script>";
echo "window.opener.startEmailProcessed('".$esentid."'); ";
echo "</script>";

function upladEmailAttachment($files,$f,$esentid,$attachments)
{    
    global $adb,$root_directory,$upload_badext;
    
    if (isset($files["file_".$f]) && $files["file_".$f]["tmp_name"] != "")
    {
        $File = $files["file_".$f];
        
        $file_name = $File["name"];
        $binFile = sanitizeUploadFileName($file_name, $upload_badext);
        
        //$filename = ltrim(basename(" ".$binFile));
    	$filetype= $File['type'];
    	$filesize = $File['size'];
        
        $file_desc = "modules/EMAILMaker/tmp/".$esentid."_".$binFile;
        
        move_uploaded_file($File["tmp_name"],$file_desc);
        //echo "move <br />";
        $sql3 = "INSERT INTO vtiger_emakertemplates_attch (esentid,file_desc,filename,type) VALUES (?,?,?,?)";
        $result = $adb->pquery($sql3,array($esentid,$file_desc,$binFile,$filetype));
        //echo "INSERT INTO vtiger_emakertemplates_attch (esentid,desc,filename) VALUES (".$esentid.",'".$file_desc."','".$binFile."')<br />";
    
        $attachments = "1";
    }
    
    $f++;
    
    if (isset($_REQUEST["file_".$f."_hidden"]) && $_REQUEST["file_".$f."_hidden"] != "")
    {
    	//echo "upload ".$_FILES["file_".$f]["tmp_name"]."<br />";
        $attachments = upladEmailAttachment($files,$f,$esentid,$attachments);
    }
    
    return $attachments;
}

exit;
?>