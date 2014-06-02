<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
require_once('Smarty_setup.php');
require_once('include/utils/utils.php');
require_once('modules/EMAILMaker/EMAILMaker.php');

global $app_strings;
global $mod_strings;
global $app_list_strings;
global $adb;
global $upload_maxsize;
global $theme,$default_charset;
global $current_language;
global $site_URL;
    
$theme_path="themes/".$theme."/";
$image_path=$theme_path."images/";

$EMAILMaker = new EmailMaker(); 
if($EMAILMaker->CheckPermissions("DETAIL") == false)
  $EMAILMaker->DieDuePermission();

$smarty = new vtigerCRM_Smarty;

$category = getParentTab();
$smarty->assign("CATEGORY",$category);


  
if($EMAILMaker->CheckPermissions("EDIT")) {
    $smarty->assign("EDIT","permitted");
    $smarty->assign("IMPORT","yes");
} else {
    header("Location:index.php?module=EMAILMaker&action=ListEmailTemplates&parenttab=Tools");
    exit;
}

if($EMAILMaker->CheckPermissions("DELETE")) {
  $smarty->assign("DELETE","permitted");
}

if(isset($_REQUEST['templateid']) && $_REQUEST['templateid']!='')
{
  	$templateid = $_REQUEST['templateid'];
  	
  	$sql = "SELECT * FROM vtiger_emakertemplates WHERE vtiger_emakertemplates.templateid=?";
  	$result = $adb->pquery($sql, array($templateid));
  	$emailtemplateResult = $adb->fetch_array($result);

  	$select_module = $emailtemplateResult["module"];
  	$email_language = $emailtemplateResult["email_language"];
    
}
else
{
    $templateid = "";
    
    if (isset($_REQUEST["return_module"]) && $_REQUEST["return_module"] != "") 
       $select_module = $_REQUEST["return_module"]; 
    else 
       $select_module = "";
       
    $email_language = $current_language;
    
    if (isset($_REQUEST["template"]))
    {
       $template_path = getcwd()."/modules/EMAILMaker/templates/".$_REQUEST["template"]."/index.html";
       
       $template_content = file_get_contents($template_path);
       
       if (file_exists($template_path)) 
       {
           $emailtemplateResult["body"] = str_replace("[site_URL]",$site_URL,$template_content);
       }
    }
}

if ($_REQUEST["test"] && $_REQUEST["test"] != "")
{
    $select_module = addslashes($_REQUEST["test"]);
}


if(isset($_REQUEST["isDuplicate"]) && $_REQUEST["isDuplicate"]=="true")
{
  $smarty->assign("FILENAME", "");
  $smarty->assign("SUBJECT", "");
  $smarty->assign("DUPLICATE_FILENAME", $emailtemplateResult["templatename"]);
}
else
{
  $smarty->assign("FILENAME", $emailtemplateResult["templatename"]);
  $smarty->assign("SUBJECT", $emailtemplateResult["subject"]);
}  
$smarty->assign("DESCRIPTION", $emailtemplateResult["description"]);

if (!isset($_REQUEST["isDuplicate"]) OR (isset($_REQUEST["isDuplicate"]) && $_REQUEST["isDuplicate"] != "true")) $smarty->assign("SAVETEMPLATEID", $templateid);
if ($templateid!="")
  $smarty->assign("EMODE", "edit");  

$smarty->assign("TEMPLATEID", $templateid);
$smarty->assign("MODULENAME", getTranslatedString($select_module));
$smarty->assign("SELECTMODULE", $select_module);

$smarty->assign("BODY", $emailtemplateResult["body"]);

$smarty->assign("MOD",$mod_strings);
$smarty->assign("THEME", $theme);
$smarty->assign("IMAGE_PATH",$image_path);
$smarty->assign("APP", $app_strings);
$smarty->assign("PARENTTAB", getParentTab());


$Modulenames = Array(''=>$mod_strings["LBL_PLS_SELECT"]);
$sql = "SELECT tabid, name FROM vtiger_tab WHERE (isentitytype=1 AND tabid NOT IN (9, 10, 16, 28)) OR tabid = '29' ORDER BY name ASC";
$result = $adb->query($sql);
while($row = $adb->fetchByAssoc($result)){
  if ($row['tabid'] != "29") $Modulenames[$row['name']] = getTranslatedString($row['name']);
  $ModuleIDS[$row['name']] = $row['tabid'];
} 

$smarty->assign("MODULENAMES",$Modulenames);

$RecipientModulenames = array(""=>$mod_strings["LBL_PLS_SELECT"],
                              "Contacts" => $app_strings["COMBO_CONTACTS"],
                              "Accounts" => $app_strings["COMBO_ACCOUNTS"],
                              "Vendors" => $app_strings["Vendors"],
                              "Leads" => $app_strings["COMBO_LEADS"],
                              "Users" => $app_strings["COMBO_USERS"]);

$smarty->assign("RECIPIENTMODULENAMES",$RecipientModulenames);
 
 
// ******************************************   Company and User information: **********************************


$CUI_BLOCKS["Account"]=$mod_strings["LBL_COMPANY_INFO"];
$CUI_BLOCKS["Assigned"]=$mod_strings["LBL_USER_INFO"];
$CUI_BLOCKS["Logged"]=$mod_strings["LBL_LOGGED_USER_INFO"];
$smarty->assign("CUI_BLOCKS",$CUI_BLOCKS);


$sql="SELECT * FROM vtiger_organizationdetails";
$result = $adb->pquery($sql, array());

$organization_logoname = decode_html($adb->query_result($result,0,'logoname'));
$organization_header = decode_html($adb->query_result($result,0,'headername'));
$organization_stamp_signature = $adb->query_result($result,0,'stamp_signature');

global $site_URL;	
$path = $site_URL."/test/logo/";

if (isset($organization_logoname))
{
	$organization_logo_img = "<img src=\"".$path.$organization_logoname."\">";
	$smarty->assign("COMPANYLOGO",$organization_logo_img);
}
if (isset($organization_stamp_signature))
{
	$organization_stamp_signature_img = "<img src=\"".$path.$organization_stamp_signature."\">";
	$smarty->assign("COMPANY_STAMP_SIGNATURE",$organization_stamp_signature_img);
}	
if (isset($organization_header))
{
	$organization_header_img = "<img src=\"".$path.$organization_header."\">";
	$smarty->assign("COMPANY_HEADER_SIGNATURE",$organization_header_img);
}

$Acc_Info = array(''=>$mod_strings["LBL_PLS_SELECT"],
                  "company-name"=>$mod_strings["LBL_COMPANY_NAME"],
                  "company-logo"=>$mod_strings["LBL_COMPANY_LOGO"],
                  "company-address"=>$mod_strings["LBL_COMPANY_ADDRESS"],
                  "company-city"=>$mod_strings["LBL_COMPANY_CITY"],
                  "company-state"=>$mod_strings["LBL_COMPANY_STATE"],
                  "company-zip"=>$mod_strings["LBL_COMPANY_ZIP"],
                  "company-country"=>$mod_strings["LBL_COMPANY_COUNTRY"],
                  "company-phone"=>$mod_strings["LBL_COMPANY_PHONE"],
                  "company-fax"=>$mod_strings["LBL_COMPANY_FAX"],
                  "company-website"=>$mod_strings["LBL_COMPANY_WEBSITE"]
                 );
                 
$CUI["Account"][$mod_strings["LBL_COMPANY_INFO"]] = $Acc_Info;
 
$smarty->assign("ACCOUNTINFORMATIONS",$Acc_Info);

$sql_user_block = "SELECT blockid, blocklabel FROM vtiger_blocks WHERE tabid=29 ORDER BY sequence ASC";
$res_user_block = $adb->query($sql_user_block);
$user_block_info_arr = array();
while($row_user_block = $adb->fetch_array($res_user_block))
{
    $sql_user_field = "SELECT fieldid, uitype FROM vtiger_field WHERE block=".$row_user_block['blockid']." and (displaytype != 3 OR uitype = 55) and fieldid != '195' ORDER BY sequence ASC";
    $res_user_field = $adb->query($sql_user_field);
    $num_user_field = $adb->num_rows($res_user_field);  
    
    if ($num_user_field > 0)
    {
  	   $user_field_id_array = array();
        
       while($row_user_field = $adb->fetch_array($res_user_field))
       {
            $user_field_id_array[] = $row_user_field['fieldid'];
            // print_r($user_field_id_array);
       }             
       
       $user_block_info_arr[$row_user_block['blocklabel']] = $user_field_id_array;

    }
} 

// $UserOptgroupts = array();

if(file_exists("modules/Users/language/$default_language.lang.php"))  //kontrola na $default_language pretoze vo funkcii return_specified_module_language sa kontroluje $current_language a ak neexistuje tak sa pouzije $default_language  
  $current_mod_strings = return_specified_module_language($current_language, "Users");    
else 
  $current_mod_strings = return_specified_module_language("en_us", "Users");

$b = 0;

foreach ($user_block_info_arr AS $block_label => $block_fields)
{
    $b++;
    
    // $UserOptions = array();
    if (isset($current_mod_strings[$block_label]) AND $current_mod_strings[$block_label] != "")
         $optgroup_value = $current_mod_strings[$block_label];
    elseif (isset($app_strings[$block_label]) AND $app_strings[$block_label] != "")
         $optgroup_value = $app_strings[$block_label];  
    elseif(isset($mod_strings[$block_label]) AND $mod_strings[$block_label]!="")
         $optgroup_value = $mod_strings[$block_label];
    else
         $optgroup_value = $block_label;  
        
    // $UserOptgroupts[] = '"'.$optgroup_value.'","'.$b.'"';
    
    if (count($block_fields) > 0)
    {
         $field_ids = implode(",",$block_fields);
        
         $sql1 = "SELECT * FROM vtiger_field WHERE fieldid IN (".$field_ids.")";
         $result1 = $adb->query($sql1); 
        
         while($row1 = $adb->fetchByAssoc($result1))
         {
        	   $fieldname = $row1['fieldname'];
        	   $fieldlabel = $row1['fieldlabel'];
        	   
     	       $option_key = strtolower("Users"."-".$fieldname);
        	   
             if (isset($current_mod_strings[$fieldlabel]) AND $current_mod_strings[$fieldlabel] != "")
                 $option_value = $current_mod_strings[$fieldlabel];
             elseif (isset($app_strings[$fieldlabel]) AND $app_strings[$fieldlabel] != "")
                 $option_value = $app_strings[$fieldlabel];  
             else
                 $option_value = $fieldlabel;  
                 
        	   // $UserOptions[] = '"'.$option_value.'","'.$option_key.'"';
        	   // $SelectUserModuleFields[$optgroup_value][$option_key] = $option_value;
             $User_Info[$optgroup_value]["s-".$option_key] = $option_value;
             $Logged_User_Info[$optgroup_value]["l-".$option_key] = $option_value;
         }             
    }
    
    //variable RECORD ID added
    if($b==1)
    {
      $option_value = "Record ID";
      $option_key = strtolower("USERS-CRMID");
      // $UserOptions[] = '"'.$option_value.'","'.$option_key.'"';
      // $SelectUserModuleFields[$optgroup_value][$option_key] = $option_value;
      $User_Info[$optgroup_value]["s-".$option_key] = $option_value;
      $Logged_User_Info[$optgroup_value]["l-".$option_key] = $option_value;
    }        
    //end
    
    // $Convert_RelatedUserFields["Users|b] = implode(",",$UserOptions);
    // $Convert_UserFields["Users|".$b] = implode(",",$UserOptions);
}
    
// $Convert_UserBlocks["Users"] = implode(",",$UserOptgroupts);
    
// $smarty->assign("USER_BLOCKS",$UserOptgroupts);
// $smarty->assign("USERS_FIELDS",$SelectUserModuleFields);    


// echo "<pre>";
// print_r($current_mod_strings);
// print_r($UserOptions);

// print_r($user_block_info_arr);
// print_r($SelectUserModuleFields);

// print_r($Convert_RelatedUserFields);
// print_r($Convert_UserFields);
// print_r($User_Info);
// print_r($Logged_User_Info);
// print_r($Convert_UserBlocks);
// print_r($CUI_BLOCKS);
// echo "</pre>";
          
if(file_exists("modules/Users/language/$default_language.lang.php")){ 
	$user_mod_strings = return_specified_module_language($current_language, "Users");
} else {
	$user_mod_strings = return_specified_module_language("en_us", "Users");
}

$smarty->assign("USERINFORMATIONS",$User_Info);

$smarty->assign("LOGGEDUSERINFORMATION",$Logged_User_Info);          
// ****************************************** END: Company and User information **********************************

$Invterandcon = array(""=>$mod_strings["LBL_PLS_SELECT"],
                      "terms-and-conditions"=>$mod_strings["LBL_TERMS_AND_CONDITIONS"]);

$smarty->assign("INVENTORYTERMSANDCONDITIONS",$Invterandcon); 


$Article_Strings = array(""=>$mod_strings["LBL_PLS_SELECT"],
                         "PRODUCTBLOC_START"=>$mod_strings["LBL_ARTICLE_START"],
                         "PRODUCTBLOC_END"=>$mod_strings["LBL_ARTICLE_END"]
                        );

$smarty->assign("ARTICLE_STRINGS",$Article_Strings);


//PDF MARGIN SETTINGS
$s_sql = "SELECT * FROM vtiger_emakertemplates_settings"; 
$s_result = $adb->query($s_sql);
$emailtemplateSResult = $adb->fetch_array($s_result);

$Decimals = array("point"=>$emailtemplateSResult["decimal_point"],
"decimals"=>$emailtemplateSResult["decimals"],
"thousands"=>($emailtemplateSResult["thousands_separator"]!="sp" ? $emailtemplateSResult["thousands_separator"] : " "));

$smarty->assign("DECIMALS",$Decimals);

$dateVariables = array(//"##TIMESTAMP##"=>$mod_strings["LBL_TIMESTAMP"],
                       "##DD.MM.YYYY##"=>$mod_strings["LBL_DATE_DD.MM.YYYY"],
                       "##DD-MM-YYYY##"=>$mod_strings["LBL_DATE_DD-MM-YYYY"],
                       "##DD/MM/YYYY##"=>$mod_strings["LBL_DATE_DD/MM/YYYY"],
                       "##MM-DD-YYYY##"=>$mod_strings["LBL_DATE_MM-DD-YYYY"],
                       "##MM/DD/YYYY##"=>$mod_strings["LBL_DATE_MM/DD/YYYY"],
                       "##YYYY-MM-DD##"=>$mod_strings["LBL_DATE_YYYY-MM-DD"]);
                     
$smarty->assign("DATE_VARS",$dateVariables);

//Ignored picklist values
$pvsql="SELECT value FROM vtiger_emakertemplates_ignorepicklistvalues";
$pvresult = $adb->query($pvsql);
$pvvalues="";
while($pvrow=$adb->fetchByAssoc($pvresult))
  $pvvalues.=$pvrow["value"].", ";
$smarty->assign("IGNORE_PICKLIST_VALUES",rtrim($pvvalues, ", "));

$Product_Fields = array("PRODUCTPOSITION"=>$mod_strings["LBL_PRODUCT_POSITION"],
                        "CURRENCYNAME"=>$mod_strings["LBL_CURRENCY_NAME"],
                        "CURRENCYCODE"=>$mod_strings["LBL_CURRENCY_CODE"],
                        "CURRENCYSYMBOL"=>$mod_strings["LBL_CURRENCY_SYMBOL"],
                        "PRODUCTNAME"=>$mod_strings["LBL_VARIABLE_PRODUCTNAME"],
                        "PRODUCTTITLE"=>$mod_strings["LBL_VARIABLE_PRODUCTTITLE"],
                        "PRODUCTDESCRIPTION"=>$mod_strings["LBL_VARIABLE_PRODUCTDESCRIPTION"],
                        "PRODUCTEDITDESCRIPTION"=>$mod_strings["LBL_VARIABLE_PRODUCTEDITDESCRIPTION"],                                                           
                        "PRODUCTQUANTITY"=>$mod_strings["LBL_VARIABLE_QUANTITY"],
                        "PRODUCTUSAGEUNIT"=>$mod_strings["LBL_VARIABLE_USAGEUNIT"],                                                           
                        "PRODUCTLISTPRICE"=>$mod_strings["LBL_VARIABLE_LISTPRICE"],
                        "PRODUCTTOTAL"=>$mod_strings["LBL_PRODUCT_TOTAL"],
                        "PRODUCTDISCOUNT"=>$mod_strings["LBL_VARIABLE_DISCOUNT"],
                        "PRODUCTDISCOUNTPERCENT"=>$mod_strings["LBL_VARIABLE_DISCOUNT_PERCENT"],
                        "PRODUCTSTOTALAFTERDISCOUNT"=>$mod_strings["LBL_VARIABLE_PRODUCTTOTALAFTERDISCOUNT"],
                        "PRODUCTVATPERCENT"=>$mod_strings["LBL_PROCUCT_VAT_PERCENT"],
                        "PRODUCTVATSUM"=>$mod_strings["LBL_PRODUCT_VAT_SUM"],
                        "PRODUCTTOTALSUM"=>$mod_strings["LBL_PRODUCT_TOTAL_VAT"]);
                        
$smarty->assign("SELECT_PRODUCT_FIELD",$Product_Fields);

$More_Fields = array(/*"SUBTOTAL"=>$mod_strings["LBL_VARIABLE_SUM"],*/
                     "CURRENCYNAME"=>$mod_strings["LBL_CURRENCY_NAME"],
                     "CURRENCYSYMBOL"=>$mod_strings["LBL_CURRENCY_SYMBOL"],
                     "CURRENCYCODE"=>$mod_strings["LBL_CURRENCY_CODE"],
                     "TOTALWITHOUTVAT"=>$mod_strings["LBL_VARIABLE_SUMWITHOUTVAT"],
                     "TOTALDISCOUNT"=>$mod_strings["LBL_VARIABLE_TOTALDISCOUNT"],
                     "TOTALDISCOUNTPERCENT"=>$mod_strings["LBL_VARIABLE_TOTALDISCOUNT_PERCENT"],
                     "TOTALAFTERDISCOUNT"=>$mod_strings["LBL_VARIABLE_TOTALAFTERDISCOUNT"],
                     "VAT"=>$mod_strings["LBL_VARIABLE_VAT"],
                     "VATPERCENT"=>$mod_strings["LBL_VARIABLE_VAT_PERCENT"],
                     "VATBLOCK"=>$mod_strings["LBL_VARIABLE_VAT_BLOCK"],
                     "TOTALWITHVAT"=>$mod_strings["LBL_VARIABLE_SUMWITHVAT"],
                     "SHTAXTOTAL"=>$mod_strings["LBL_SHTAXTOTAL"],
                     "SHTAXAMOUNT"=>$mod_strings["LBL_SHTAXAMOUNT"],
                     "ADJUSTMENT"=>$mod_strings["LBL_ADJUSTMENT"],
                     "TOTAL"=>$mod_strings["LBL_VARIABLE_TOTALSUM"]                     
                     );

if ($select_module == "Quotes" || $select_module == "SalesOrder" || $select_module == "Invoice" || $select_module == "PurchaseOrder" || $select_module == "Issuecards" || $select_module == "Receiptcards")
   $display_product_div = "block";
else
   $display_product_div = "none";

$smarty->assign("DISPLAY_PRODUCT_DIV",$display_product_div);

$All_Related_Modules = array();
$Module_Related_Fields = "";
                               
foreach ($ModuleIDS as $module => $IDS) {
	$sql1 = "SELECT blockid, blocklabel FROM vtiger_blocks WHERE tabid=".$IDS." ORDER BY sequence ASC";
	$res1 = $adb->query($sql1);
	$block_info_arr = array();
	while($row = $adb->fetch_array($res1))
	{
 		$sql2 = "SELECT vtiger_tab.name AS module, fieldid, uitype, fieldlabel, columnname FROM vtiger_field 
                 INNER JOIN vtiger_tab ON vtiger_tab.tabid = vtiger_field.tabid WHERE block=".$row['blockid']." and (displaytype != 3 OR uitype = 55) and fieldid != '195' ORDER BY sequence ASC";
 	    $res2 = $adb->query($sql2);
 	    $num_rows2 = $adb->num_rows($res2);  
 	    
 	    if ($num_rows2 > 0)
 	    {
    	    $field_id_array = array();
          
        	while($row2 = $adb->fetch_array($res2))
        	{
            	$F_Related_Modules = array();
                $field_id_array[] = $row2['fieldid'];

            	switch ($row2['uitype'])
            	{
                	case "51": $F_Related_Modules[] = "Accounts"; break;
                	case "57": $F_Related_Modules[] = "Contacts"; break;
                	case "58": $F_Related_Modules[] = "Campaigns"; break;
                	case "59": $F_Related_Modules[] = "Products"; break;
                	case "73": $F_Related_Modules[] = "Accounts"; break;
                	case "75": $F_Related_Modules[] = "Vendors"; break;
                	case "81": $F_Related_Modules[] = "Vendors"; break;
                	case "76": $F_Related_Modules[] = "Potentials"; break;
                	case "78": $F_Related_Modules[] = "Quotes"; break;
                	case "80": $F_Related_Modules[] = "SalesOrder"; break;
                	case "68": $F_Related_Modules[] = "Accounts"; $F_Related_Modules[] = "Contacts"; break;
                	case "10": $fmrs=$adb->query('select relmodule from vtiger_fieldmodulerel where fieldid='.$row2['fieldid']);
                            while ($rm=$adb->fetch_array($fmrs)) { 
                                $F_Related_Modules[] = $rm['relmodule'];
                            }                  
                		break;
            	} 
                
                if (count($F_Related_Modules) > 0)
                {
                    $fieldlabel = getTranslatedString($row2['fieldlabel'],$row2['module']);
                    if($fieldlabel == "") $fieldlabel = $row2['fieldlabel'];
                    
                    $fieldname = $row2['columnname'];

                    foreach ($F_Related_Modules AS $r_module)
                    {
                        $r_module_label = getTranslatedString($r_module);
                        if ($r_module_label == "") $r_module_label = $r_module;      
                       
                        $All_Related_Modules[$module][] = array("module"=>$r_module,"modulelabel"=>$r_module_label,"fieldlabel"=>$fieldlabel,"fieldname"=>$fieldname);
                    
                        if (!isset($Module_Related_Fields[$module][$fieldname])) 
                        {                      
                            $Module_Related_Fields[$module][$fieldname]["name"] = $fieldlabel; 
                        }  
                        $Module_Related_Fields[$module][$fieldname]["modules"][$r_module] = $r_module_label; 
                    }
                }
                
        	}
          
        	$block_info_arr[$row['blocklabel']] = $field_id_array;
    	}
	}
  
  
	if ($module == "Quotes" || $module == "Invoice" || $module == "SalesOrder" || $module=="PurchaseOrder" || $module=="Issuecards" || $module=="Receiptcards" || $module=="Creditnote" || $module=="StornoInvoice")
    	$block_info_arr["LBL_DETAILS_BLOCK"] = array();
  
	$ModuleFields[$module] = $block_info_arr;
}
 
// ITS4YOU-CR VlZa
//Oprava prazdneho selectboxu v pripade ze zvoleny modul nemal ziadne related moduly
foreach($Modulenames as $key=>$value)
{
	if(!isset($All_Related_Modules[$key]))
		$All_Related_Modules[$key]=array();
}
// ITS4YOU-END
$module_related_fields_data = "";
$all_related_modules_data = "";
foreach ($Module_Related_Fields AS $for_module => $Related_Fields)
{
     $Rel_Fields_Array = array();
     foreach ($Related_Fields AS $rel_field => $Rel_Data)
     {
         $Rel_Modules_Array = array();
         $Rel_Fields_Array[] = '\''.$rel_field.'\',\''.$Rel_Data["name"].'\'';
         
         foreach($Rel_Data["modules"] AS $rel_module => $rel_module_label)
         {
             $Rel_Modules_Array[] = '\''.$rel_module.'\',\''.$rel_module_label.'\'';   
         } 
         $rel_modules_data = implode(",",$Rel_Modules_Array);
$all_related_modules_data .= 'all_related_modules["'.$for_module.'--'.$rel_field.'"] = new Array('.$rel_modules_data.'); 
';
     }
     
     $rel_fields_data = implode(",",$Rel_Fields_Array);
$module_related_fields_data .= 'module_related_fields["'.$for_module.'"] = new Array('.$rel_fields_data.'); 
';
}

$smarty->assign("MODULE_RELATED_FIELDS",$module_related_fields_data);
/*
echo "<pre>";
print_r($Module_Related_Fields);
echo "</pre>";
echo "<pre>";
print_r($All_Related_Modules);
echo "</pre>";
*/
$smarty->assign("ALL_RELATED_MODULES",$all_related_modules_data);

$Related_Modules = array(); 
if ($select_module != "")
{			                  
    foreach ($All_Related_Modules[$select_module] AS $rel_data)
    {		                  
         $Related_Modules[$rel_data["fieldlabel"]][$rel_data["module"]."--".$rel_data["fieldname"]] = $rel_data["modulelabel"];
    }
}

$smarty->assign("RELATED_MODULES",$Related_Modules);

$tacModules = array();
$tac4you = is_numeric(getTabId("Tac4you")); 
if($tac4you == true)
{
  $sql = "SELECT tac4you_module FROM vtiger_tac4you_module WHERE presence = 1";
  $result = $adb->query($sql);  
  while($row = $adb->fetchByAssoc($result))  
    $tacModules[$row["tac4you_module"]] = $row["tac4you_module"];  
}
                        
// print_r($ModuleFields);
foreach ($ModuleFields AS $module => $Blocks)
{
    $Optgroupts = array();
    
    if(file_exists("modules/$module/language/$default_language.lang.php"))  //kontrola na $default_language pretoze vo funkcii return_specified_module_language sa kontroluje $current_language a ak neexistuje tak sa pouzije $default_language  
    	$current_mod_strings = return_specified_module_language($current_language, $module);    
    else 
    	$current_mod_strings = return_specified_module_language("en_us", $module);
    
	$b = 0;
	foreach ($Blocks AS $block_label => $block_fields)
	{
    	$b++;
        
        $Options = array();
        

        if (isset($current_mod_strings[$block_label]) AND $current_mod_strings[$block_label] != "")
        	$optgroup_value = $current_mod_strings[$block_label];
        elseif (isset($app_strings[$block_label]) AND $app_strings[$block_label] != "")
            $optgroup_value = $app_strings[$block_label];  
        elseif(isset($mod_strings[$block_label]) AND $mod_strings[$block_label]!="")
            $optgroup_value = $mod_strings[$block_label];
        else
            $optgroup_value = $block_label;  
            
        $Optgroupts[] = '"'.$optgroup_value.'","'.$b.'"';
        
        if (count($block_fields) > 0)
        {
        	$field_ids = implode(",",$block_fields);
            
        	$sql1 = "SELECT * FROM vtiger_field WHERE fieldid IN (".$field_ids.")";
        	$result1 = $adb->query($sql1); 
            
        	while($row1 = $adb->fetchByAssoc($result1))
        	{
            	$fieldname = $row1['fieldname'];
            	$fieldlabel = $row1['fieldlabel'];
            	
         	    $option_key = strtolower($module."-".$fieldname);
            	   
                if (isset($current_mod_strings[$fieldlabel]) AND $current_mod_strings[$fieldlabel] != "")
                	$option_value = $current_mod_strings[$fieldlabel];
                elseif (isset($app_strings[$fieldlabel]) AND $app_strings[$fieldlabel] != "")
                    $option_value = $app_strings[$fieldlabel];  
                else
                    $option_value = $fieldlabel;  
                     
            	$Options[] = '"'.$option_value.'","'.$option_key.'"';
            	$SelectModuleFields[$module][$optgroup_value][$option_key] = $option_value;
        	}
		    }
        
        //variable RECORD ID added
        if($b==1)
        {
    			$option_value = "Record ID";
    			$option_key = strtolower($module."-crmid");
    			$Options[] = '"'.$option_value.'","'.$option_key.'"';
    			$SelectModuleFields[$module][$optgroup_value][$option_key] = $option_value;
        }        
       //end
       
       if($block_label == "LBL_TERMS_INFORMATION" && isset($tacModules[$module]))
       {
          $option_value = $mod_strings["LBL_TAC4YOU"];
          $option_key = strtolower($module."-TAC4YOU");
          $Options[] = '"'.$option_value.'","'.$option_key.'"';
          $SelectModuleFields[$module][$optgroup_value][$option_key] = $option_value;
       }

        if ($block_label == "LBL_DETAILS_BLOCK" && ($module == "Quotes" || $module == "Invoice" || $module == "SalesOrder" || $module == "PurchaseOrder" || $module == "Issuecards" || $module == "Receiptcards" || $module == "Creditnote" || $module == "StornoInvoice"))
        {
        	foreach ($More_Fields AS $variable => $variable_name)
            {
            	$variable_key = strtolower($variable);
                
            	$Options[] = '"'.$variable_name.'","'.$variable_key.'"';
            	$SelectModuleFields[$module][$optgroup_value][$variable_key] = $variable_name;
            }
        }
        
        $Convert_RelatedModuleFields[$module."|".$b] = implode(",",$Options);
        $Convert_ModuleFields[$module."|".$b] = implode(",",$Options);
    }
    
    $Convert_ModuleBlocks[$module] = implode(",",$Optgroupts);
    
}

if(isset($ModuleSorces))
	$smarty->assign("MODULESORCES",$ModuleSorces);
  
$smarty->assign("MODULE_BLOCKS",$Convert_ModuleBlocks);

$smarty->assign("RELATED_MODULE_FIELDS",$Convert_RelatedModuleFields);

$smarty->assign("MODULE_FIELDS",$Convert_ModuleFields);


//EMAIL SUBJECT FIELDS
$subjectFields = array("##DD.MM.YYYY##"=>$mod_strings["LBL_CURDATE_DD.MM.YYYY"],
                       "##DD-MM-YYYY##"=>$mod_strings["LBL_CURDATE_DD-MM-YYYY"],
                       "##DD/MM/YYYY##"=>$mod_strings["LBL_CURDATE_DD/MM/YYYY"],
                       "##MM-DD-YYYY##"=>$mod_strings["LBL_CURDATE_MM-DD-YYYY"],
                       "##MM/DD/YYYY##"=>$mod_strings["LBL_CURDATE_MM/DD/YYYY"],
                       "##YYYY-MM-DD##"=>$mod_strings["LBL_CURDATE_YYYY-MM-DD"]);                        
$smarty->assign("SUBJECT_FIELDS",$subjectFields);

// ITS4YOU-CR VlZa
// Product bloc templates
$sql="SELECT * FROM vtiger_emakertemplates_productbloc_tpl";
$result=$adb->query($sql);
$Productbloc_tpl[""]=$mod_strings["LBL_PLS_SELECT"];
while($row=$adb->fetchByAssoc($result))
{
  $Productbloc_tpl[$row["body"]]=$row["name"];  
}                 
$smarty->assign("PRODUCT_BLOC_TPL",$Productbloc_tpl);

$smarty->assign("PRODUCTS_FIELDS",$SelectModuleFields["Products"]);
$smarty->assign("SERVICES_FIELDS",$SelectModuleFields["Services"]);
// ITS4YOU-END

if ($templateid != "" || $select_module!="")
{
    $smarty->assign("SELECT_MODULE_FIELD",$SelectModuleFields[$select_module]);
    $smf_filename = $SelectModuleFields[$select_module];
	if($select_module=="Invoice" || $select_module=="Quotes" || $select_module=="SalesOrder" || $select_module=="PurchaseOrder" || $select_module=="Issuecards" || $select_module=="Receiptcards" || $select_module == "Creditnote" || $select_module == "StornoInvoice")
		unset($smf_filename["Details"]);
	$smarty->assign("SELECT_MODULE_FIELD_SUBJECT",$smf_filename); 
}
include_once("version.php");
$smarty->assign("VERSION",$version);

if ($_REQUEST["test"] && $_REQUEST["test"] != "")
{
    $test_module = addslashes($_REQUEST["test"]);
    
    $test_body = "<center><h2><b>Test ".$test_module."</b></h2></center>";
    
    if (isset($SelectModuleFields[$test_module]))
    {
        foreach ($SelectModuleFields[$test_module] AS $block => $Fields)
        {
            $test_body .= "<h3><b>".$block."</b></h3>";
            
            foreach ($Fields AS $key => $name)
            {
                $test_body .= '<u>'.$name.':</u> $s-'.$key.'$<br>';
            }
        } 
    }
    else
    {
        $test_body .= "module ".$test_module." not exist";    
    }
    
    if (count($All_Related_Modules[$test_module]) > 0)
    {
        foreach ($All_Related_Modules[$test_module] AS $RData)
        {
            $test_body .= "<center><h2><b>Related module ".$RData["modulelabel"]."</b></h2></center>";
        
            foreach ($SelectModuleFields[$RData["module"]] AS $block => $Fields)
            {
                $test_body .= "<h3><b>".$block."</b></h3>";
                
                foreach ($Fields AS $key => $name)
                {
                    $test_body .= '<u>'.$name.':</u> $r-'.$RData["fieldname"].'-'.$key.'$<br>';
                }
            }
        }
    }
        
    $smarty->assign("FILENAME", "test ".$test_module);
    $smarty->assign("BODY", $test_body);
}

if (count($All_Related_Modules[$select_module]) > 0)
{
    $body_variables_display = "table-row";
}
else
{
    $body_variables_display = "none";
}

$smarty->assign("BODY_VARIABLES_DISPLAY", $body_variables_display);

$smarty->display('modules/EMAILMaker/EditEmailTemplate.tpl');

?>
