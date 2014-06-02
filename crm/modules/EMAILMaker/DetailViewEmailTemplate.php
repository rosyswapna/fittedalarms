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
require_once('include/utils/UserInfoUtil.php');
require_once('include/database/PearDatabase.php');
require_once('modules/EMAILMaker/EMAILMaker.php');
global $adb;
global $log;
global $mod_strings;
global $app_strings;
global $current_language;
global $theme;
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";

$log->info("Inside Email Template Detail View");

$EMAILMaker = new EmailMaker();
if($EMAILMaker->CheckPermissions("DETAIL") == false)
  $EMAILMaker->DieDuePermission();

$smarty = new vtigerCRM_smarty;

$smarty->assign("APP", $app_strings);
$smarty->assign("THEME", $theme);
$smarty->assign("MOD", $mod_strings);

$smarty->assign("MODULE", 'Tools');
$smarty->assign("IMAGE_PATH", $image_path);

$category = getParentTab();
$smarty->assign("CATEGORY",$category);


if($EMAILMaker->CheckPermissions("EDIT")) {
  $smarty->assign("EDIT","permitted");
  $smarty->assign("IMPORT","yes");
  $smarty->assign("EXPORT","yes");
}

if($EMAILMaker->CheckPermissions("DELETE")) {
  $smarty->assign("DELETE","permitted");
}

if(isset($_REQUEST['templateid']) && $_REQUEST['templateid']!='')
{
  	$log->info("The templateid is set");
  	$tempid = $_REQUEST['templateid'];

  	$sql = "SELECT * FROM vtiger_emakertemplates WHERE vtiger_emakertemplates.templateid=?";
  	$result = $adb->pquery($sql, array($tempid));
  	$pdftemplateResult = $adb->fetch_array($result);

    $smarty->assign("FILENAME", $pdftemplateResult["templatename"]);
    $smarty->assign("DESCRIPTION", $pdftemplateResult["description"]);
    $smarty->assign("TEMPLATEID", $pdftemplateResult["templateid"]);
    $smarty->assign("MODULENAME", getTranslatedString($pdftemplateResult["module"]));
    $smarty->assign("SUBJECT", decode_html($pdftemplateResult["subject"]));
    $smarty->assign("BODY", decode_html($pdftemplateResult["body"]));
}

include_once("version.php");
$smarty->assign("VERSION",$version);


$smarty->display("modules/EMAILMaker/DetailViewEmailTemplate.tpl");

?>
