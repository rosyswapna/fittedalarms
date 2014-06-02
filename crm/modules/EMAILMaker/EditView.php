<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
require_once('Smarty_setup.php');
require_once('data/Tracker.php');
require_once('include/utils/utils.php');
require_once('include/utils/UserInfoUtil.php');
require_once("include/Zend/Json.php");

global $log;
global $app_strings;
global $app_list_strings;
global $current_user;
global $currentModule;
global $default_charset;

$language = $_SESSION['authenticated_user_language'];
$mod_strings = return_specified_module_language($language, "Emails");
$e_mod_strings = return_specified_module_language($language, "EMAILMaker");

$focus = CRMEntity::getInstance("Emails");
$smarty = new vtigerCRM_Smarty();
$json = new Zend_Json();

$type = $_REQUEST["type"];
$add_all = false;

if (isset($_REQUEST["pid"]) && $_REQUEST["pid"] == "all")
{
    $_REQUEST["pid"] = "";
    $add_all = true;
}  

if (isset($_REQUEST["pid"]) && $_REQUEST["pid"] != "") 
{
    $Pids = explode(";",$_REQUEST["pid"]);
}    
else
{
    $Pids = array("0");
}

if($_REQUEST['upload_error'] == true)
{
        echo '<br><b><font color="red"> The selected file has no data or a invalid file.</font></b><br>';
}

//Email Error handling
if($_REQUEST['mail_error'] != '') 
{
	require_once("modules/Emails/mail.php");
	echo parseEmailErrorString($_REQUEST['mail_error']);
}
//added to select the module in combobox of compose-popup
if(isset($_REQUEST['par_module']) && $_REQUEST['par_module']!=''){
	$smarty->assign('select_module',vtlib_purify($_REQUEST['par_module']));
}

if(isset($_REQUEST['pmodule']) && $_REQUEST['pmodule']!='') {
	$smarty->assign('select_module',vtlib_purify($_REQUEST['pmodule']));	
    $pmodule = vtlib_purify($_REQUEST['pmodule']);
}


if (count($Pids) > 1 && ($pmodule == "Accounts" || $pmodule == "Contacts"))
    $emailoptout = true;
else
    $emailoptout = false;


if(isset($_REQUEST['record']) && $_REQUEST['record'] !='') 
{
	$focus->id = $_REQUEST['record'];
	$focus->mode = 'edit';
	$focus->retrieve_entity_info($_REQUEST['record'],"Emails");
	$query = 'select idlists,from_email,to_email,cc_email,bcc_email from vtiger_emaildetails where emailid =?';
	$result = $adb->pquery($query, array($focus->id));
	$from_email = $adb->query_result($result,0,'from_email');
	$smarty->assign('FROM_MAIL',$from_email);	
	$to_email = implode(',',$json->decode($adb->query_result($result,0,'to_email')));
	$smarty->assign('TO_MAIL',$to_email);
	$cc_add = implode(',',$json->decode($adb->query_result($result,0,'cc_email')));
	$smarty->assign('CC_MAIL',$cc_add);
	$bcc_add = implode(',',$json->decode($adb->query_result($result,0,'bcc_email')));
	$smarty->assign('BCC_MAIL',$bcc_add);
	$idlist = $adb->query_result($result,0,'idlists');
	$smarty->assign('IDLISTS',$idlist);
	$log->info("Entity info successfully retrieved for EditView.");
	$focus->name=$focus->column_fields['name'];
}
elseif(isset($_REQUEST['sendmail']) && $_REQUEST['sendmail'] !='')
{
    $pmodule = addslashes($_REQUEST["pmodule"]);

    $From_Sorce = array();
    $To_Email = array();
    $No_Rcpts = array();
    
    if (!$add_all)
    {
        foreach ($Pids AS $pid)
        {
            $Entries = array();
            $mailids = "";
            
            $entityNames = getEntityName($pmodule, $pid);
        	$pname = $entityNames[$pid];
    
            if(isset($_REQUEST["field_lists"]) && $_REQUEST["field_lists"] != "")
        	{
                $Mailids = array();
    
                $CrmidsFields = explode(":",$_REQUEST["field_lists"]);
                
                foreach ($CrmidsFields AS $crmid_fieldid)
                {
                    $CF = explode("@",$crmid_fieldid);
                    $crmid = $CF[0];
                    $fieldid = $CF[1];
                    
                    if ($crmid == "0") 
                    {
                        if ($CF[2] != "0")
                            $crmid = getParentIDtoEMAIL($pid,$CF[2]);
                        else
                            $crmid = $pid;
                    }
                    
                    if ($crmid > 0) $Entries[$crmid][] = $fieldid;
                }   
              
                if (count($Entries) > 0)
                {
                    foreach ($Entries AS $crmid => $fields)
                    {
                         $Mailids = get_to_table_emailids($emailoptout,$pid,$Mailids,$crmid,$fields);
                    }
                }  
                            
                if (count($Mailids["mailds"]) > 0)
                {
                    $mailids = implode("",$Mailids["mailds"]);
                }
                else
                {
                    $No_Rcpts[] = $pname;
                }
                
            }
            
            $To_Email[$pid] = $mailids;
            
            $From_Sorce[$pid] = $pname;
        }
    }
    else
    {
        $Mailids = array();
        
        $Id_Lists = getSelectedRecords($_REQUEST,vtlib_purify($_REQUEST['pmodule']),"all",vtlib_purify($_REQUEST['excludedRecords']));
        
        $CrmidsFields = explode(":",$_REQUEST["field_lists"]);
                
        foreach ($CrmidsFields AS $crmid_fieldid)
        {
            $CF = explode("@",$crmid_fieldid);
            $fieldid = $CF[1];
            
            foreach ($Id_Lists AS $crmid)
            {
                $Entries[$crmid][] = $fieldid;  
            }
        } 
        
        foreach ($Entries AS $crmid => $fields)
        {
             $Mailids = get_to_table_emailids($emailoptout,$crmid,$Mailids,$crmid,$fields);
        }
        $mailids = implode("",$Mailids["mailds"]);
        $To_Email[0] = $mailids;
            
        $From_Sorce[0] = "";
    }
    
	$smarty->assign('TO_MAIL',$To_Email);
    $smarty->assign('FROM_SORCE',$From_Sorce);
	$focus->mode = '';

}

$coun_sorces = count($From_Sorce);

$smarty->assign('COUNT_SORCES',$coun_sorces);

global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";

$disp_view = getView($focus->mode);
$details = getBlocks("Emails",$disp_view,$mode,$focus->column_fields);
//changed this below line to view description in all language - bharath
$smarty->assign("BLOCKS",$details[$mod_strings['LBL_EMAIL_INFORMATION']]); 
$smarty->assign("MODULE","Emails");
$smarty->assign("SINGLE_MOD",$app_strings['Email']);
//id list of attachments while forwarding
$smarty->assign("ATT_ID_LIST",$att_id_list);

//needed when creating a new email with default values passed in
if (isset($_REQUEST['contact_name']) && is_null($focus->contact_name)) 
{
	$focus->contact_name = vtlib_purify($_REQUEST['contact_name']);
}
if (isset($_REQUEST['contact_id']) && is_null($focus->contact_id)) 
{
	$focus->contact_id = vtlib_purify($_REQUEST['contact_id']);
}
if (isset($_REQUEST['parent_name']) && is_null($focus->parent_name)) 
{
	$focus->parent_name = vtlib_purify($_REQUEST['parent_name']);
}
if (isset($_REQUEST['parent_id']) && is_null($focus->parent_id)) 
{
	$focus->parent_id = vtlib_purify($_REQUEST['parent_id']);
}
if (isset($_REQUEST['parent_type'])) 
{
	$focus->parent_type = vtlib_purify($_REQUEST['parent_type']);
}
if (isset($_REQUEST['filename']) && $_REQUEST['isDuplicate'] != 'true') 
{
        $focus->filename = vtlib_purify($_REQUEST['filename']);
}
elseif (is_null($focus->parent_type)) 
{
	$focus->parent_type = $app_list_strings['record_type_default_key'];
}

$log->info("Email detail view");

$smarty->assign("EMOD", $e_mod_strings);
$smarty->assign("MOD", $mod_strings);
$smarty->assign("APP", $app_strings);
if (isset($focus->name)) $smarty->assign("NAME", $focus->name);
else $smarty->assign("NAME", "");


if($focus->mode == 'edit')
{
	$smarty->assign("UPDATEINFO",updateInfo($focus->id));
	if(((!empty($_REQUEST['forward']) || !empty($_REQUEST['reply'])) &&
			$focus->column_fields['email_flag'] != 'SAVED') || (empty($_REQUEST['forward']) &&
			empty($_REQUEST['reply']) && $focus->column_fields['email_flag'] != 'SAVED')) {
		$mode = '';
	} else {
		$mode = $focus->mode;
	}
	$smarty->assign("MODE", $mode);
}

// Unimplemented until jscalendar language vtiger_files are fixed

$smarty->assign("CALENDAR_LANG", $app_strings['LBL_JSCALENDAR_LANG']);
$smarty->assign("CALENDAR_DATEFORMAT", parse_calendardate($app_strings['NTC_DATE_FORMAT']));

if(isset($_REQUEST['return_module'])) $smarty->assign("RETURN_MODULE", vtlib_purify($_REQUEST['return_module']));
else $smarty->assign("RETURN_MODULE",'Emails');
if(isset($_REQUEST['return_action'])) $smarty->assign("RETURN_ACTION", vtlib_purify($_REQUEST['return_action']));
else $smarty->assign("RETURN_ACTION",'index');
if(isset($_REQUEST['return_id'])) $smarty->assign("RETURN_ID", vtlib_purify($_REQUEST['return_id']));
if (isset($_REQUEST['return_viewname'])) $smarty->assign("RETURN_VIEWNAME", vtlib_purify($_REQUEST['return_viewname']));

$smarty->assign("THEME", $theme);
$smarty->assign("IMAGE_PATH", $image_path);
$smarty->assign("PRINT_URL", "phprint.php?jt=".session_id().$GLOBALS['request_string']);
$smarty->assign("ID", $focus->id);
$smarty->assign("ENTITY_ID", vtlib_purify($_REQUEST["record"]));
$smarty->assign("ENTITY_TYPE",vtlib_purify($_REQUEST["email_directing_module"]));
$smarty->assign("OLD_ID", $old_id );
//Display the RTE or not? -- configure $USE_RTE in config.php
$USE_RTE = vt_hasRTE();
$smarty->assign("USE_RTE",$USE_RTE);

if(empty($focus->filename))
{
        $smarty->assign("FILENAME_TEXT", "");
        $smarty->assign("FILENAME", "");
}
else
{
        $smarty->assign("FILENAME_TEXT", "(".$focus->filename.")");
        $smarty->assign("FILENAME", $focus->filename);
}
if($ret_error == 1) {
	require_once('modules/Webmails/MailBox.php');
	$smarty->assign("RET_ERROR",$ret_error);
	if($ret_parentid != ''){
		$smarty->assign("IDLISTS",$ret_parentid);
	}
	if($ret_toadd != '')
                $smarty->assign("TO_MAIL",$ret_toadd);
	$ret_toadd = '';
	if($ret_subject != '')
		$smarty->assign("SUBJECT",$ret_subject);
	if($ret_ccaddress != '')
        	$smarty->assign("CC_MAIL",$ret_ccaddress);
	if($ret_bccaddress != '')
        	$smarty->assign("BCC_MAIL",$ret_bccaddress);
	if($ret_description != '')
        	$smarty->assign("DESCRIPTION", $ret_description);
	$temp_obj = new MailBox($mailbox);
	$temp_id = $temp_obj->boxinfo['mail_id'];
	if($temp_id != '')
		$smarty->assign('from_add',$temp_id);
}
$check_button = Button_Check($module);
$smarty->assign("CHECK", $check_button);

$description = "";

if (isset($_REQUEST["commontemplateid"]) && $_REQUEST["commontemplateid"] != "")
{
    $Subjects = array();
    $smarty->assign('WEBMAIL',"true");
    $commontemplateids = trim($_REQUEST["commontemplateid"],";");  
	$Templateids = explode(";",$commontemplateids);
    $template_ids = implode(",",$Templateids);
    $parent_type = $_REQUEST["pmodule"];
    
    include_once("modules/EMAILMaker/ConvertEMAIL.php");
    
    $sql = "SELECT subject, body FROM vtiger_emakertemplates WHERE templateid IN (".$template_ids.")";
    $result = $adb->pquery($sql, array());
    $num_rows = $adb->num_rows($result);
    
    for($i=0;$i < $num_rows; $i++)
    {	
        $t_subject = $adb->query_result($result,$i,'subject');
        $body = $adb->query_result($result,$i,'body');
        
        if (count($Pids) == 1 && $add_all == false)
        { 
            $Email_Content = new EMAILContent();
            $Email_Content->setContent($t_subject."|@{[&]}@|".$body, "", $parent_type, $Pids[0]);
            $convert_content = $Email_Content->getContent(false); 
            list($t_subject,$body) = explode("|@{[&]}@|",$convert_content);
        }
        
        if ($t_subject != "") $Subjects[] = $t_subject;
        $description .= $body;
    }
    
    $smarty->assign("DESCRIPTION", $description);
    
    $subject = implode(", ",$Subjects);
    $smarty->assign("SUBJECT", $subject);
}

$smarty->assign("TYPE", $type);

$show_pdf_templates = "false";
if (isset($_REQUEST["pdftemplateid"]) && $_REQUEST["pdftemplateid"] != "")
{
    $PDF_Maker_Templates = array();
    $PDF_Template_Ids = array();
    $pdftemplateids = addslashes(trim($_REQUEST["pdftemplateid"],";"));
    $pdftemplateids = str_replace(";",",",$pdftemplateids);
    $sql = "SELECT templateid, filename FROM vtiger_pdfmaker WHERE templateid IN (".$pdftemplateids.")";
	$result = $adb->query($sql);
    while($row = $adb->fetchByAssoc($result))
    {
    	$PDF_Maker_Templates[$row['templateid']] = $row['filename'];
        $PDF_Template_Ids[] = $row['templateid'];
    }
    
    $smarty->assign("PDFMakerTemplates", $PDF_Maker_Templates);
    
    if (count($PDF_Maker_Templates) > 0)
    {
        $show_pdf_templates = "true";
        
        $pdf_template_ids = implode(";",$PDF_Template_Ids);
        $smarty->assign("PDF_TEMPLATE_IDS", $pdf_template_ids);
        
        $pdf_language = addslashes($_REQUEST["language"]);
        $smarty->assign("PDF_LANGUAGE", $pdf_language);
    }
}
$smarty->assign("SHOW_PDF_TEMPLATES", $show_pdf_templates);

$full_name = trim($current_user->first_name." ".$current_user->last_name);
$From_Emails = array("email1::".$current_user->id => $full_name." <".$current_user->column_fields['email1'].">");

if ($current_user->column_fields['email2'] != "")
    $From_Emails["email2::".$current_user->id ] = $full_name." <".$current_user->column_fields['email2'].">";

if ($current_user->column_fields['secondaryemail'] != "")
    $From_Emails["secondaryemail::".$current_user->id] = $full_name." <".$current_user->column_fields['secondaryemail'].">";
    

$sql_a="select * from vtiger_systems where from_email_field != ? AND server_type = ?";
$result_a = $adb->pquery($sql_a, array('','email'));
$from_email_field = $adb->query_result($result_a,0,"from_email_field");   

if($from_email_field != "")
{
    $sql2="select * from vtiger_organizationdetails where organizationname != ''";
    $result2 = $adb->pquery($sql2, array());

    while($row2 = $adb->fetchByAssoc($result2))
    {
        $From_Emails["a::".$row2['organizationname']] = $row2['organizationname']." <".$from_email_field.">";
    }
}

$smarty->assign("FROM_EMAILS", $From_Emails);

$smarty->display("modules/EMAILMaker/ComposeEmail.tpl");

function get_to_table_emailids($emailoptout,$pid,$Mailids,$crmid,$field_lists)
{
	global $image_path,$adb;

    $module = getSalesEntityType($crmid);
    $module_tabid = getTabId($module);

	$query = 'select tabid,columnname,fieldid from vtiger_field where fieldid in ('. generateQuestionMarks($field_lists) .') and presence in (0,2)';
	$result = $adb->pquery($query, array($field_lists));
    
    $columns = Array();
	$idlists = '';

	while($row = $adb->fetch_array($result))
	{
		if ($module_tabid == $row['tabid'])
        {
            $columns[]=$row['columnname'];
    		$fieldid[]=$row['fieldid'];
        }
	}
	
    if (count($columns) > 0)
    {
        $columnlists = implode(',',$columns);
        
    	switch($module)
    	{
    		case 'Leads':
    			$query = 'select concat(lastname," ",firstname) as entityname,'.$columnlists.' from vtiger_leaddetails inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_leaddetails.leadid left join vtiger_leadscf on vtiger_leadscf.leadid = vtiger_leaddetails.leadid where vtiger_crmentity.deleted=0 and vtiger_crmentity.crmid = ?';
    			break;
    		case 'Contacts':
    			//email opt out funtionality works only when we do mass mailing.
    			if($emailoptout)
    			$concat_qry = 'vtiger_contactdetails.emailoptout != 1 and ';
    			else
    			$concat_qry = '';
                
    			$query = 'select concat(lastname," ",firstname) as entityname,'.$columnlists.' from vtiger_contactdetails inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_contactdetails.contactid left join vtiger_contactscf on vtiger_contactscf.contactid = vtiger_contactdetails.contactid where vtiger_crmentity.deleted=0 and '.$concat_qry.'  vtiger_crmentity.crmid = ?';
    			break;
    		case 'Accounts':
    			//added to work out email opt out functionality.
    			if($emailoptout)
    				$concat_qry = 'vtiger_account.emailoptout != 1 and ';
    			else
    				$concat_qry = '';
    				
    			$query = 'select accountname as entityname,'.$columnlists.' from vtiger_account inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_account.accountid left join vtiger_accountscf on vtiger_accountscf.accountid = vtiger_account.accountid where vtiger_crmentity.deleted=0 and '.$concat_qry.' vtiger_crmentity.crmid = ?';
    			break;
            case 'Vendors':
    			$query = 'select vendorname as entityname,'.$columnlists.' from vtiger_vendor inner join vtiger_crmentity on vtiger_crmentity.crmid=vtiger_vendor.vendorid left join vtiger_vendorcf on vtiger_vendorcf.vendorid = vtiger_vendor.vendorid where vtiger_crmentity.deleted=0 and vtiger_vendor.vendorid = ?';
    	        break;
        }

        $result = $adb->pquery($query, array($crmid));
        
        $border_top = '';
        $border_bottom = '';
        $border_left = '';
        $border_right = '';
        $td_style = $border_top.$border_bottom; 
        
        
        while($row = $adb->fetch_array($result))
    	{
    		$name = $row['entityname'];
    		for($i=0;$i<count($columns);$i++)
    		{
    			if($row[$columns[$i]] != NULL && $row[$columns[$i]] !='')
    			{
    				//echo $crmid.'@'.$fieldid[$i]."-".$row[$columns[$i]]."<br>";
                    $selectbox = getEMakerSelectbox($pid.'_'.$crmid.'_'.$fieldid[$i]);
                    $clear_btn = '<img src="'.$image_path.'clear_field.gif" alt="'.$app_strings["LBL_CLEAR"].'" title="'.$app_strings["LBL_CLEAR"].'" LANGUAGE=javascript onClick="clearEmailFromTable(\''.$pid.'\',\''.$crmid.'\',\''.$fieldid[$i].'\',this); return false;" align="absmiddle" style="cursor:hand;cursor:pointer">';
                    
                    $Mailids["idlists"][] = $crmid.'@'.$fieldid[$i]; 
                    
                    $Mailids["mailds"][] = '<tr id="emailadress_'.$pid.'_'.$crmid.'_'.$fieldid[$i].'" title="'.$name.' - '.$row[$columns[$i]].'"><td width="10px" valign="top" style="'.$td_style.$border_left.'">'.$selectbox.'</td><td style="font-size:10px;line-height:12px;'.$td_style.'">'.$name.' <i>&lt;'.$row[$columns[$i]].'&gt;</i></td><td width="10px" align="right" style="'.$td_style.$border_right.'">'.$clear_btn.'</td></tr>';
                }
    		}
    	}
    }
    
	return $Mailids;
}

function getEMakerSelectbox($name)
{
    global $mod_strings;
    $s = '<select name="ToEmails[]" id="to_email_'.$name.'" style="font-size:10px;">';
    $s .= '<option value="normal_'.$name.'">'.$mod_strings["LBL_TO"].'</option>';
    $s .= '<option value="cc_'.$name.'">'.$mod_strings["LBL_CC"].'</option>';
    $s .= '<option value="bcc_'.$name.'">'.$mod_strings["LBL_BCC"].'</option>';
    $s .= '</select>';
     
    return $s;
}


function getParentIDtoEMAIL($crmid,$field_id)
{
	global $adb;

	$query1 = "SELECT vtiger_tab.name, vtiger_field.tablename, vtiger_field.columnname, vtiger_field.fieldid FROM vtiger_field INNER JOIN vtiger_tab ON vtiger_tab.tabid = vtiger_field.tabid WHERE vtiger_field.fieldid = ? AND vtiger_field.presence IN (0,2)";
	$result1 = $adb->pquery($query1, array($field_id));
	$Field = $adb->fetchByAssoc($result1, 0); 
    
    $p_focus = CRMEntity::getInstance($Field["name"]);
    
    $main_coln = $p_focus->tab_name_index[$Field["tablename"]];
    
    $query2 = "SELECT ".$Field["columnname"]." FROM ".$Field["tablename"]." WHERE ".$main_coln." = ?";
    $result2 = $adb->pquery($query2, array($crmid));
    
    $parent_id = $adb->query_result($result2,0,$Field["columnname"]);
    
    return $parent_id;
}

?>