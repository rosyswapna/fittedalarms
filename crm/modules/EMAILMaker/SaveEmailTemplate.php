<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
require_once('include/utils/utils.php');
require_once('modules/EMAILMaker/EMAILMaker.php');
global $adb,$current_user;

$EMAILMaker = new EmailMaker();

if($EMAILMaker->CheckPermissions("EDIT")) 
{
    $filename = vtlib_purify($_REQUEST["filename"]);
    $modulename = from_html($_REQUEST["modulename"]);
    $templateid = vtlib_purify($_REQUEST["templateid"]);
    $description = from_html($_REQUEST["description"]);
    $subject = from_html($_REQUEST["subject"]);
    $body = fck_from_html($_REQUEST["body"]);
    $owner = $current_user->id;
    $sharingtype = "public";
    
    if(isset($templateid) && $templateid !='')
    {
    	$sql = "update vtiger_emakertemplates set templatename =?, module =?, description =?, subject =?, body =?, owner=?, sharingtype = ? where templateid =?";
    	$params = array($filename, $modulename, $description, $subject, $body, $owner, $sharingtype, $templateid);
    	$adb->pquery($sql, $params);
    }
    else
    {
    	$templateid = $adb->getUniqueID('vtiger_emakertemplates');
    	$sql2 = "insert into vtiger_emakertemplates (templatename,module,description,subject,body,deleted,templateid,owner,sharingtype) values (?,?,?,?,?,?,?,?,?)";
    	$params2 = array($filename, $modulename, $description, $subject, $body, 0, $templateid,$owner, $sharingtype);
    	$adb->pquery($sql2, $params2);
    }
    
    $dec_point = $_REQUEST["dec_point"];
    $dec_decimals = $_REQUEST["dec_decimals"];
    $dec_thousands = ($_REQUEST["dec_thousands"]!=" " ? $_REQUEST["dec_thousands"]:"sp");
    
    $sql3 = "DELETE FROM vtiger_emakertemplates_settings";
    $adb->query($sql3);
    
    $sql4 = "INSERT INTO vtiger_emakertemplates_settings (decimals, decimal_point, thousands_separator) VALUES (?,?,?)";
    $params4 = array($dec_decimals, $dec_point, $dec_thousands);
    $adb->pquery($sql4, $params4);
    
    //ignored picklist values
    $adb->query("DELETE FROM vtiger_emakertemplates_ignorepicklistvalues");
    $pvvalues=explode(",", $_REQUEST["ignore_picklist_values"]);
    foreach($pvvalues as $value)
      $adb->query("INSERT INTO vtiger_emakertemplates_ignorepicklistvalues(value) VALUES('".trim($value)."')");
    // end ignored picklist values
         
    header("Location:index.php?module=EMAILMaker&action=DetailViewEmailTemplate&parenttab=Tools&templateid=".$templateid);
}
else
{
    header("Location:index.php?module=EMAILMaker&action=ListEmailTemplates&parenttab=Tools");
}
exit;

?>
