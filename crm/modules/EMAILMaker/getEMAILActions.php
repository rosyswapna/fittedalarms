<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/

 $x1d="\143ou\x6et"; 
require_once('Smarty_setup.php');require_once('data/Tracker.php');require_once('include/utils/UserInfoUtil.php');require_once('include/database/PearDatabase.php');require_once('modules/EMAILMaker/EMAILMaker.php');$x0b = "a\144\x62";$x0c = "\155\157\x64\x5fs\164\162\151\x6eg\163";$x0d = "\141\x70\160\137\163t\x72\151n\147\x73";$x0e = "cur\x72en\164\x5f\154\141\x6e\147\x75\141\147e";$x0f = "c\x75\x72\162\145\156\x74\137\x75\x73e\x72";$x10 = "\x74\x68e\x6d\145";global $$x0b;global $$x0c;global $$x0d;global $$x0e, $$x0f;global $$x10;$x11="\x74h\145m\145\163\x2f".$$x10."/";$x12=$x11."\x69\x6d\x61\x67e\x73\x2f";$x13 = new EmailMaker();if($x13->CheckPermissions("\104\105TAIL") == false){$x14 ='<table border=0 cellspacing=0 cellpadding=5 width=100% align=center bgcolor=white><tr><td class="dvtCellInfo" style="width:100%;border-top:1px solid #DEDEDE;text-align:center;"><strong>'.$$x0d["LBL_PER\x4d\x49\123\123I\x4f\x4e"].'</strong></td></tr></table>';die($x14);}$x15 = $_REQUEST["record"];$x16 = "\123\105\114E\x43T\x20\163e\164y\160e\040\106\x52\x4f\115\040\166\164\151g\x65\x72_\x63\162\155\x65n\164\151\x74\171 \127\110\105R\x45\x20\143\x72\155\x69\144\040\x3d\040'".$x15."'";$x17 = $$x0b->query_result($$x0b->query($x16),0,"\163\x65\x74\171p\145");$x18 = new vtigerCRM_smarty;$x18->assign("\x41\120\120", $$x0d);$x18->assign("\124\110\x45\x4d\105", $$x10);$x18->assign("\x4dO\104", $$x0c);$x18->assign("M\117\x44U\114\x45", $x17);$x18->assign("\x49MAG\x45\137\120A\x54\110", $x12);$x18->assign("\x49D", $_REQUEST["r\x65cord"]);require('user_privileges/user_privileges_'.$$x0f->id.'.php');$x18->assign('EMAILMAKER_MOD',return_module_language($$x0e,"EMA\111\114M\x61ker"));$x19=0;if(isset($_SESSION["\141ut\x68\x65\156t\x69c\x61\x74\x65d_u\163\x65\162_\151\x64"])) $x19 = $_SESSION["\x61\165th\145n\164\x69\143at\x65\144_\x75\163\x65\x72_\151d"];$x1a = $x13->GetAvailableTemplates($x17);if($x1d($x1a)>0) $x1b = 0;else$x1b = 1;$x18->assign('CRM_TEMPLATES',$x1a);$x18->assign('CRM_TEMPLATES_EXIST',$x1b);$x1c = getParentTab();$x18->assign("C\x41TE\107O\122Y",$x1c);$x18->display("\x6d\157\144u\154\145\x73\057\105MA\111\x4c\115\141\x6b\145r\057\105\x6da\151\x6c\115a\x6berAc\164\151\x6fn\x73\056\x74\x70l");              
?>