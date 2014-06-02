<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
require_once('Smarty_setup.php');
require_once("include/utils/utils.php");

global $mod_strings,$app_strings,$theme,$currentModule,$app_list_strings;
$smarty=new vtigerCRM_Smarty;
$smarty->assign("MOD",$mod_strings);
$smarty->assign("APP",$app_strings);
$smarty->assign("THEME", $theme);

$Modules_List = array();

$sql = "SELECT vtiger_tab.* FROM vtiger_tab 
        INNER JOIN vtiger_links ON vtiger_links.tabid = vtiger_tab.tabid 
        WHERE vtiger_tab.isentitytype=1 
          AND vtiger_tab.tabid NOT IN (9, 10, 16, 28) 
          AND vtiger_tab.name != 'EMAILMaker'
          AND vtiger_links.linktype = 'DETAILVIEWWIDGET' 
          AND vtiger_links.linkurl LIKE 'module=EMAILMaker&action=EMAILMakerAjax&file=getEMAILActions&record=%'";
$result = $adb->query($sql);
while($row = $adb->fetchByAssoc($result))
{
    $tabid = $row['tabid']; 
    $tablabel = getTranslatedString($row['tablabel'],$row['name']);
    
    if ($tablabel == "") $tablabel = $row['tablabel'];
        
    $Modules_List[] = array("name"=>$row['name'],
                            "tabid"=>$tabid,
                            "tablabel"=>$tablabel);
}

$smarty->assign("MODULESLIST", $Modules_List);
$smarty->display(vtlib_getModuleTemplate($currentModule,'EditPicklist.tpl'));


?>