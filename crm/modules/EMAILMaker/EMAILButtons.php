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


if (isset($_REQUEST["module_enable"]) && $_REQUEST["module_enable"] == "true")
{
    //$adb->setDebug(true);
    $moduleid = addslashes($_REQUEST["moduleid"]);
    $modulename = addslashes($_REQUEST["modulename"]);
    AddEmailLinks($moduleid,$modulename);
    exit;
}

if (isset($_REQUEST["module_disable"]) && $_REQUEST["module_disable"] == "true")
{
    $moduleid = addslashes($_REQUEST["moduleid"]);
    $modulename = addslashes($_REQUEST["modulename"]);

    $adb->query("DELETE FROM vtiger_links WHERE tabid = '".$moduleid."' AND linktype = 'DETAILVIEWWIDGET' AND linkurl LIKE 'module=EMAILMaker&action=EMAILMakerAjax&file=getEMAILActions&record=%'");

    exit;
}

$Modules_List = array();

$sql = "SELECT * FROM vtiger_tab WHERE isentitytype=1 AND tabid NOT IN (9, 10, 16, 28) AND name != 'EMAILMaker'";
$result = $adb->query($sql);
while($row = $adb->fetchByAssoc($result))
{
    $tabid = $row['tabid']; 
    $tablabel = getTranslatedString($row['tablabel'],$row['name']);
    
    if ($tablabel == "") $tablabel = $row['tablabel'];
        
    $sql2 = "SELECT * FROM vtiger_links WHERE tabid = '".$tabid."' AND linktype = 'DETAILVIEWWIDGET' AND linkurl LIKE 'module=EMAILMaker&action=EMAILMakerAjax&file=getEMAILActions&record=%'";
    $result2 = $adb->query($sql2);
    $num_rows2 = $adb->num_rows($result2); 
    
    if ($num_rows2 == 0)
        $links = "disabled";
    else    
        $links = "enabled";
   
    $Modules_List[] = array("name"=>$row['name'],
                            "tabid"=>$tabid,
                            "tablabel"=>$tablabel,
                            "link"=>$links);
}

$smarty->assign("MODULESLIST", $Modules_List);


$smarty->display(vtlib_getModuleTemplate($currentModule,'EMAILButtons.tpl'));


function AddEmailLinks($tabid,$modulename) 
{
    require_once('vtlib/Vtiger/Module.php');

    $link_module = Vtiger_Module::getInstance($modulename);
    
    $link_module->addLink('DETAILVIEWWIDGET','EMAILMaker','module=EMAILMaker&action=EMAILMakerAjax&file=getEMAILActions&record=$RECORD$','themes/images/actionGenerateInvoice.gif');

}
?>