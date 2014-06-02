{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>
{include file='modules/EMAILMaker/Buttons_List.tpl'} 
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
<form action="index.php?module=EMAILMaker&action=SaveEMAILTemplate" method="post" enctype="multipart/form-data" onsubmit="VtigerJS_DialogBox.block();">
<input type="hidden" name="return_module" value="EMAILMaker">
<input type="hidden" name="parenttab" value="{$PARENTTAB}">
<input type="hidden" name="templateid" value="{$SAVETEMPLATEID}">
<input type="hidden" name="action" value="SaveEmailTemplate">
<tr>        
        <td class="showPanelBg" style="padding: 10px;" valign="top" width="100%">
				<!-- DISPLAY -->
				<table border=0 cellspacing=0 cellpadding=5 width=100%>
				<tr>
                    <td valign=bottom><span class="dvHeaderText">
                    {if $EMODE eq 'edit'}
                        {if $DUPLICATE_FILENAME eq ""}
                            {$MOD.LBL_EDIT} &quot;{$FILENAME}&quot;
                        {else}  
                            {$MOD.LBL_DUPLICATE} &quot;{$DUPLICATE_FILENAME}&quot;
                        {/if}    
    				{else}
    					{$MOD.LBL_NEW_TEMPLATE}
    				{/if}
                    </span></td>
				</tr>
				</table>
				<table border=0 cellspacing=0 cellpadding=10 width=100% >
				<tr>
				<td> 
					{if $DISPLAY_PRODUCT_DIV eq 'none'}
                      {assign var=DISPLAY_NO_PRODUCT_DIV value='block'}
                      {assign var=DISPLAY_PRODUCT_TPL_ROW value='none'}                      
                    {else}
                      {assign var=DISPLAY_NO_PRODUCT_DIV value='none'}
                      {assign var=DISPLAY_PRODUCT_TPL_ROW value='table-row'}
                    {/if}
                    
                    <table width="100%" align="center" border="0" cellpadding="0" cellspacing="0">
          		    <tr><td>
                    
                      <table class="small" width="100%" border="0" cellpadding="3" cellspacing="0"><tr>
                          <td class="dvtTabCache" style="width: 10px;" nowrap="nowrap">&nbsp;</td>
                          <td style="width: 15%;" class="dvtSelectedCell" id="properties_tab" onclick="showHideTab('properties');" width="75" align="center" nowrap="nowrap"><b>{$MOD.LBL_PROPERTIES_TAB}</b></td>
                          <td class="dvtUnSelectedCell" id="company_tab" onclick="showHideTab('company');" align="center" nowrap="nowrap"><b>{$MOD.LBL_OTHER_INFO}</b></td>
                          <td class="dvtUnSelectedCell" id="products_tab" onclick="showHideTab('products');" align="center" nowrap="nowrap"><b>{$MOD.LBL_ARTICLE}</b></td>
           				  <td class="dvtUnSelectedCell" id="settings_tab" onclick="showHideTab('settings');" align="center" nowrap="nowrap"><b>{$MOD.LBL_SETTINGS_TAB}</b></td>
                          <td class="dvtUnSelectedCell" id="sharing_tab" onclick="showHideTab('sharing');" align="center" nowrap="nowrap"><b>{$MOD.LBL_SHARING_TAB}</b></td>
                          <td class="dvtTabCache" style="width: 30%;" nowrap="nowrap">&nbsp;</td> 
                      </tr></table>
                    </td></tr>
					
                    <tr><td align="left" valign="top">
                      {*********************************************PROPERTIES DIV*************************************************}
                      <div style="diplay:block;" id="properties_div">       
                        <table class="dvtContentSpace" width="100%" border="0" cellpadding="3" cellspacing="0" style="padding:10px;">                        
                        {* email module name and description *}
                        <tr>
    						<td width=20% class="small cellLabel"><font color="red">*</font><strong>{$MOD.LBL_EMAIL_NAME}:</strong></td>
    						<td width=80% class="small cellText"><input name="filename" id="filename" type="text" value="{$FILENAME}" class="detailedViewTextBox" tabindex="1">&nbsp;</td>
    					</tr>
    					<tr>
    						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_DESCRIPTION}:</strong></td>
    						<td class="cellText small" valign=top>
                              <span class="small cellText">
      						    <input name="description" type="text" value="{$DESCRIPTION}" class="detailedViewTextBox" tabindex="2">
      					      </span>
                            </td>
    					</tr>     					
    					{* email source recipient and its available fields *}
    					<tr>
    						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_RECIPIENT_FIELDS}:</strong></td>
    						<td class="cellText small" valign="top">
                                <select name="r_modulename" id="r_modulename" class="classname" onChange="fillModuleFields(this,'recipientmodulefields');" {*{if $TEMPLATEID neq ""} style="display:none;"{/if}*}>
                                        {html_options  options=$RECIPIENTMODULENAMES}
                                </select>
                                &nbsp;&nbsp;
                                <select name="recipientmodulefields" id="recipientmodulefields" class="classname">
                                      <option value="">{$MOD.LBL_SELECT_MODULE_FIELD}</option>
                                </select>
        						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('recipientmodulefields');" />
                            </td>      						
    					</tr>                         
                        {* email source module and its available fields *}
    					<tr>
    						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_MODULENAMES}:</strong></td>
    						<td class="cellText small" valign="top">
                                <select name="modulename" id="modulename" class="classname" onChange="change_modulesorce(this,'modulefields');" {*{if $TEMPLATEID neq ""} style="display:none;"{/if}*}>
                                	{if $SELECTMODULE neq ""}
                                        {html_options  options=$MODULENAMES selected=$SELECTMODULE}
                                    {else}
                                        {html_options  options=$MODULENAMES}
                                    {/if}
                                </select>
                                &nbsp;&nbsp;
                                <select name="modulefields" id="modulefields" class="classname">
                                	{if $SELECTMODULE neq ""}
                                        {html_options  options=$SELECT_MODULE_FIELD}
                                    {else}
                                        <option value="">{$MOD.LBL_SELECT_MODULE_FIELD}</option>
                                    {/if}
                                </select>
        						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('modulefields');" />
                            </td>      						
    					</tr>   
                        {* related modules and its fields *}                					
                        <tr id="body_variables" style="display:{$BODY_VARIABLES_DISPLAY}">
                          	<td valign=top class="small cellLabel"><strong>{$MOD.LBL_RELATED_MODULES}:</strong></td>
                          	<td class="cellText small" valign=top>
                          
                                <select name="relatedmodulesorce" id="relatedmodulesorce" class="classname" onChange="change_relatedmodule(this,'relatedmodulefields');">
                                        <option value="none">{$MOD.LBL_SELECT_MODULE}</option>
                                        {html_options  options=$RELATED_MODULES}
                                </select>
                                &nbsp;&nbsp;
                          
                                <select name="relatedmodulefields" id="relatedmodulefields" class="classname">
                                    <option>{$MOD.LBL_SELECT_MODULE_FIELD}</option>
                                </select>
                              	<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('relatedmodulefields');">
                          	</td>      						
                        </tr> 
                        {* related bloc tpl *}
                        <tr id="related_block_tpl_row" {if $TEMPLATEID eq "" && $SELECTMODULE eq ""}style="display:none;"{/if}>    
              						  <td valign=top class="small cellLabel"><strong>{$MOD.LBL_RELATED_BLOCK_TPL}:</strong></td>
              						  <td class="cellText small" valign=top>
                                <input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="EditRelatedBlock();"/>
                				    </td>              					
                        </tr>  					
                        {* email subject bloc tpl *}
                        <tr>
    						<td width=20% class="small cellLabel"><strong>{$MOD.LBL_EMAIL_SUBJECT}:</strong></td>
    						<td width=80% class="small cellText">
                            <input name="subject" id="subject" type="text" value="{$SUBJECT}" class="detailedViewTextBox" tabindex="1" size="20" style="width:500px">&nbsp;
                            <select name="subject_fields" id="subject_fields" class="classname small" onchange="insertFieldIntoSubject(this.value);">
                                <option value="">{$MOD.LBL_SELECT_MODULE_FIELD}</option>
                                <optgroup label="{$MOD.LBL_COMMON_EMAILINFO}">
                                    {html_options  options=$SUBJECT_FIELDS}
                                </optgroup>
                                {if $TEMPLATEID neq "" || $SELECTMODULE neq ""}
                                    {html_options  options=$SELECT_MODULE_FIELD_SUBJECT}
                                {/if}
                            </select>
                            </td>
    					</tr>
                        </table>
                      </div>
                      
                      {*********************************************Labels DIV*************************************************}
                      <div style="display:none;" id="labels_div">
                        <table class="dvtContentSpace" width="100%" border="0" cellpadding="3" cellspacing="0" style="padding:10px;">
                        <tr>
    						<td width="200px" valign=top class="small cellLabel"><strong>{$MOD.LBL_GLOBAL_LANG}:</strong></td>
    						<td class="cellText small" valign=top>
        						<select name="global_lang" id="global_lang" class="classname" style="width:80%">
                                		{html_options  options=$GLOBAL_LANG_LABELS}
                                </select>
    					       	<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('global_lang');">
      						</td>
    					</tr>
    					<tr>
    						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_MODULE_LANG}:</strong></td>
    						<td class="cellText small" valign=top>
        						<select name="module_lang" id="module_lang" class="classname" style="width:80%">
                                		{html_options  options=$MODULE_LANG_LABELS}
                                </select>
        						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('module_lang');">
      						</td>
    					</tr>
                        </table>
                      </div>
                      
                      {*********************************************Company and User information DIV*************************************************}
                      <div style="display:none;" id="company_div">
                        <table class="dvtContentSpace" width="100%" border="0" cellpadding="3" cellspacing="0" style="padding:10px;">
                        <tr>
    						<td width="200px" valign=top class="small cellLabel"><strong>{$MOD.LBL_COMPANY_USER_INFO}:</strong></td>
    						<td class="cellText small" valign=top>
        						<select name="acc_info" id="acc_info" class="classname">
                                	<optGroup label="{$MOD.LBL_COMPANY_INFO}">
                                    {html_options  options=$ACCOUNTINFORMATIONS}
                                  </optGroup>
                                  <optGroup label="{$MOD.LBL_USER_INFO}">
                                    {html_options  options=$USERINFORMATIONS}
                                  </optGroup>
                                  <optGroup label="{$MOD.LBL_LOGGED_USER_INFO}">
                                    {html_options  options=$LOGGEDUSERINFORMATION}
                                  </optGroup>
                                </select>
    					       	<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('acc_info');">
      						</td>
    					</tr>
    					<tr>
    						<td valign=top class="small cellLabel"><strong>{$MOD.TERMS_AND_CONDITIONS}:</strong></td>
    						<td class="cellText small" valign=top>
        						<select name="invterandcon" id="invterandcon" class="classname">
                                		{html_options  options=$INVENTORYTERMSANDCONDITIONS}
                                </select>
        						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('invterandcon');">
      						</td>
    					</tr>
    					<tr>
    						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_CURRENT_DATE}:</strong></td>
    						<td class="cellText small" valign=top>
        						<select name="dateval" id="dateval" class="classname">
                                		{html_options  options=$DATE_VARS}
                                </select>
        						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('dateval');">
      						</td>
    					</tr>
    					</table>
    				  </div>	
                      {*********************************************Products bloc DIV*************************************************}
                      <div style="display:none;" id="products_div">
                        <table class="dvtContentSpace" width="100%" border="0" cellpadding="3" cellspacing="0" style="padding:10px;">
                        <tr><td>
                          
                          <div id="product_div" style="display:{$DISPLAY_PRODUCT_DIV};">
                          <table width="100%"  border="0" cellspacing="0" cellpadding="5" >
            					<tr>
            						<td valign=top class="small cellLabel" width="200px"><strong>{$MOD.LBL_ARTICLE}:</strong></td>
            						<td class="cellText small" valign=top>
            						<select name="articelvar" id="articelvar" class="classname">
                                    		{html_options  options=$ARTICLE_STRINGS}
                                    </select>
                                    <input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('articelvar');">
              						</td>
            					</tr>
            			        {* insert products & services fields into text *}
                                <tr>
            						<td valign=top class="small cellLabel"><strong>*{$MOD.LBL_PRODUCTS_AVLBL}:</strong></td>
            						<td class="cellText small" valign=top>
                                    <select name="psfields" id="psfields" class="classname">
                                        {html_options  options=$SELECT_PRODUCT_FIELD}
                                    </select>
            						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('psfields');">            						
              						</td>
            					</tr>
            					{* products fields *}                                
                                <tr>
            						<td valign=top class="small cellLabel"><strong>*{$MOD.LBL_PRODUCTS_FIELDS}:</strong></td>
            						<td class="cellText small" valign=top>
                                    <select name="productfields" id="productfields" class="classname">
                                        {html_options  options=$PRODUCTS_FIELDS}
                                    </select>
            						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('productfields');">            						
              						</td>
            					</tr>
                                {* services fields *}                                
                                <tr>
            						<td valign=top class="small cellLabel"><strong>*{$MOD.LBL_SERVICES_FIELDS}:</strong></td>
            						<td class="cellText small" valign=top>
                                    <select name="servicesfields" id="servicesfields" class="classname">
                                        {html_options  options=$SERVICES_FIELDS}
                                    </select>
            						<input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('servicesfields');">            						
              						</td>
            					</tr>            					
            					{* product bloc tpl which is the same as in main Properties tab*}
            					<tr>                            
            						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_PRODUCT_BLOC_TPL}:</strong></td>
            						<td class="cellText small" valign=top>
            						<select name="productbloctpl2" id="productbloctpl2" class="classname">
                                    		{html_options  options=$PRODUCT_BLOC_TPL}
                                   </select>
                                   <input type="button" value="{$MOD.LBL_INSERT_TO_TEXT}" class="crmButton small create" onclick="InsertIntoTemplate('productbloctpl2');"/>
              		               </td>              					
                               </tr>
                               <tr>
                                <td colspan="2"><small>{$MOD.LBL_PRODUCT_FIELD_INFO}</small></td>
                               </tr>
            			  </table>
                          </div>                          
                          
                          <div id="no_product_div" style="padding:15px;text-align:center;display:{$DISPLAY_NO_PRODUCT_DIV};">
                          <b>{$MOD.LBL_NOPRODUCT_BLOC}</b>
                          </div>
                          
                        </td></tr>
                        </table>
                      </div>
                      
                      
                      {*********************************************Settings DIV*************************************************}
                      <div style="display:none;" id="settings_div">
                        <table class="dvtContentSpace" width="100%" border="0" cellpadding="3" cellspacing="0" style="padding:10px;">
                        {* ignored picklist values settings *}
    					<tr>
    					   <td valign=top class="small cellLabel" title="{$MOD.LBL_IGNORE_PICKLIST_VALUES_DESC}"><strong>{$MOD.LBL_IGNORE_PICKLIST_VALUES}:</strong></td>
    					   <td class="cellText small" valign="top" title="{$MOD.LBL_IGNORE_PICKLIST_VALUES_DESC}"><input type="text" name="ignore_picklist_values" value="{$IGNORE_PICKLIST_VALUES}" class="detailedViewTextBox"/></td>
    					</tr>
                        {* decimal settings *}    					
    					<tr>
    					   <td valign=top class="small cellLabel"><strong>{$MOD.LBL_DECIMALS}:</strong></td>
    						<td class="cellText small" valign="top">
                                <table>
                                   <tr>
                                       <td align="right" nowrap><b>{$MOD.LBL_DEC_POINT}</b></td>
                                       <td><input type="text" maxlength="2" name="dec_point" class="detailedViewTextBox" value="{$DECIMALS.point}" style="width:{$margin_input_width}"/></td>
                                       
                                       <td align="right" nowrap><b>{$MOD.LBL_DEC_DECIMALS}</b></td>
                                       <td><input type="text" maxlength="2" name="dec_decimals" class="detailedViewTextBox" value="{$DECIMALS.decimals}" style="width:{$margin_input_width}"/></td>
                                       
                                       <td align="right" nowrap><b>{$MOD.LBL_DEC_THOUSANDS}</b></td>
                                       <td><input type="text" maxlength="2" name="dec_thousands"  class="detailedViewTextBox" value="{$DECIMALS.thousands}" style="width:{$margin_input_width}"/></td>                                       
                                   </tr>
                                </table>
                          	</td>
    					</tr>
                        </table>
                      </div>

                      {********************************************* Sharing DIV *************************************************}
                      <div style="display:none;" id="sharing_div">
                        <table class="dvtContentSpace" width="100%" border="0" cellpadding="3" cellspacing="0" style="padding:10px;">
                        <tr>
    						<td><div style='text-align:center;font-weight:bold;'>{$MOD.LBL_SHARING_NOT_AVAILABLE_IN_FREE}</div></td>
    					</tr>
                        </table>
                      </div>
                     {************************************** END OF TABS BLOCK *************************************}                         
                    </td></tr>
                    <tr><td class="small" style="text-align:center;padding:15px 0px 10px 0px;">
					   <input type="submit" value="{$APP.LBL_SAVE_BUTTON_LABEL}" class="crmButton small save" onclick="return saveEmail();" >&nbsp;&nbsp;            			
            		   <input type="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" class="crmButton small cancel" onclick="window.history.back()" />            			
					</td></tr>
                    </table>

                    {literal}   
                        <script type="text/javascript" src="include/ckeditor/ckeditor.js"></script>
                    {/literal} 

                    {*********************************************BODY DIV*************************************************}
                    <div style="diplay:block;" id="body_div2"> 
                        <textarea name="body" id="body" style="width:90%;height:500px" class=small tabindex="5">{$BODY}</textarea>
                    </div>

                    <table width="100%"  border="0" cellspacing="0" cellpadding="5" >
                        <tr><td class="small" style="text-align:center;padding:10px 0px 10px 0px;" colspan="3">
    					   <input type="submit" value="{$APP.LBL_SAVE_BUTTON_LABEL}" class="crmButton small save" onclick="return saveEmail();" >&nbsp;&nbsp;            			
                		   <input type="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" class="crmButton small cancel" onclick="window.history.back()" />            			
    		   	        </td></tr>
                    </table>

				</td>
				</tr><tr><td align="center" class="small" style="color: rgb(153, 153, 153);">{$MOD.EMAIL_MAKER} {$VERSION} {$MOD.COPYRIGHT}</td></tr>
				</table>
			</td>
			</tr>
                        </form>
			</table>

<script type="text/javascript" src="include/ckeditor/ckeditor.js"></script>
                    	
<script type="text/javascript">
	{php} if (file_exists("kcfinder/browse.php")) { {/php}
        {literal} CKEDITOR.replace( 'body',{customConfig:'../../../modules/EMAILMaker/fck_config_kcfinder.js'} );  {/literal} 
    {php} } else { {/php} 
        {literal} CKEDITOR.replace( 'body',{customConfig:'../../../modules/EMAILMaker/fck_config.js'} ); {/literal} 
    {php} } {/php}
</script>

{php} if (file_exists("kcfinder/browse.php")) { {/php}
    {literal} <script type="text/javascript" src="modules/EMAILMaker/fck_config_kcfinder.js"></script>{/literal} 
{php} } else { {/php} 
    {literal} <script type="text/javascript" src="modules/EMAILMaker/fck_config.js"></script>{/literal} 
{php} } {/php}
 
<script>

var selectedTab='properties';
var selectedTab2='body';

var invarray = ['SUBTOTAL', 'TOTALWITHOUTVAT', 'TOTALDISCOUNT', 'TOTALDISCOUNTPERCENT', 'TOTALAFTERDISCOUNT', 
                'VAT', 'VATPERCENT', 'VATBLOCK', 'TOTALWITHVAT', 'ADJUSTMENT', 'TOTAL', 'SHTAXTOTAL', 'SHTAXAMOUNT',
                'CURRENCYNAME', 'CURRENCYSYMBOL', 'CURRENCYCODE'];


function check4null(form)
{ldelim}

        var isError = false;
        var errorMessage = "";
        // Here we decide whether to submit the form.
        if (trim(form.templatename.value) =='') {ldelim}
                isError = true;
                errorMessage += "\n template name";
                form.templatename.focus();
        {rdelim}
        if (trim(form.foldername.value) =='') {ldelim}
                isError = true;
                errorMessage += "\n folder name";
                form.foldername.focus();
        {rdelim}
        if (trim(form.subject.value) =='') {ldelim}
                isError = true;
                errorMessage += "\n subject";
                form.subject.focus();
        {rdelim}

        // Here we decide whether to submit the form.
        if (isError == true) {ldelim}
                alert("{$MOD.LBL_MISSING_FIELDS}" + errorMessage);
                return false;
        {rdelim}
 return true;

{rdelim}

var module_blocks = new Array();

{foreach item=moduleblocks key=blockname from=$MODULE_BLOCKS}
    module_blocks["{$blockname}"] = new Array({$moduleblocks});
{/foreach}

var module_fields = new Array();

{foreach item=modulefields key=modulename from=$MODULE_FIELDS}
    module_fields["{$modulename}"] = new Array({$modulefields});
{/foreach}

var selected_module='{$SELECTMODULE}';

function change_modulesorce(first,second_name)
{ldelim}
    if(selected_module!='')
    {ldelim}
        question = confirm("{$MOD.LBL_CHANGE_MODULE_QUESTION}");
        if(question)
        {ldelim}
            var oEditor = CKEDITOR.instances.body;                        
            oEditor.setData("");
            document.getElementById('subject').value='';
        {rdelim}
        else
        {ldelim}
            first.value=selected_module;
            return;
        {rdelim}        
    {rdelim}
    selected_module=first.value;
    
    if (selected_module != "")
    {ldelim}
       document.getElementById('related_block_tpl_row').style.display='table-row';
    {rdelim}
    else
    {ldelim}
        document.getElementById('related_block_tpl_row').style.display='none';
        document.getElementById('body_variables').style.display = 'none';
    {rdelim}
    
    var module = fillModuleFields(first,second_name);
    fillModuleFields(first,'subject_fields');   
    var product_div = document.getElementById("product_div");

    try {ldelim}
    if (selectedTab2 == "body" && (module == "Quotes" || module == "SalesOrder" || module == "Invoice" || module == "PurchaseOrder" || module == "Issuecards" || module == "Receiptcards"))
    {ldelim}
        document.getElementById('no_product_div').style.display='none';
        product_div.style.display = 'block'; 
    {rdelim}    
    else
    {ldelim}
        product_div.style.display = 'none';
        document.getElementById('no_product_div').style.display='block';         
    {rdelim}
    {rdelim}catch(err){ldelim}    

     {rdelim}
    
     change_relatedmodulesorce(first,'relatedmodulesorce');
    
     fill_module_lang_array(first.value);
{rdelim}


function fillModuleFields(first,second_name)
{ldelim}
    second = document.getElementById(second_name);    
    optionTest = true;
    lgth = second.options.length - 1;

    second.options[lgth] = null;
    if (second.options[lgth]) optionTest = false;
    if (!optionTest) return;
    var box = first;
    var module = box.options[box.selectedIndex].value;
    if (!module) return;

    var box2 = second;

    //box2.options.length = 0;

    var optgroups = box2.childNodes;
    for(i = optgroups.length - 1 ; i >= 0 ; i--)
    {ldelim}
            box2.removeChild(optgroups[i]);
    {rdelim}

    var blocks = module_blocks[module];
    var blocks_length = blocks.length;
    if(second_name=='subject_fields')
    {ldelim}
        objOption=document.createElement("option");
        objOption.innerHTML = '{$MOD.LBL_SELECT_MODULE_FIELD}';
        objOption.value = '';
        box2.appendChild(objOption);
        
        optGroup = document.createElement('optgroup');
        optGroup.label = '{$MOD.LBL_COMMON_EMAILINFO}';
        box2.appendChild(optGroup); 
        
        {foreach item=field key=field_val from=$SUBJECT_FIELDS}
            objOption=document.createElement("option");
            objOption.innerHTML = '{$field}';
            objOption.value = '{$field_val}';
            optGroup.appendChild(objOption);
        {/foreach}
        
        if(module=='Invoice' || module=='Quotes' || module=='SalesOrder' || module=='PurchaseOrder' || module=='Issuecards' || module=='Receiptcards' || module=="Creditnote" || module=="StornoInvoice")
            blocks_length-=2;
    {rdelim}  
     
    for(b=0;b<blocks_length;b+=2)
    {ldelim}
            optGroup = document.createElement('optgroup');
            optGroup.label = blocks[b];
            box2.appendChild(optGroup);

            var list = module_fields[module+'|'+ blocks[b+1]];

    		for(i=0;i<list.length;i+=2)
    		{ldelim}
    		      //<optgroup label="Addresse" class=\"select\" style=\"border:none\">

                  objOption=document.createElement("option");
                  objOption.innerHTML = list[i];
                  objOption.value = list[i+1];

                  optGroup.appendChild(objOption);
    		{rdelim}
    {rdelim}
    
    return module;    
{rdelim}

var module_related_fields = new Array();
{$MODULE_RELATED_FIELDS}
{* foreach item=related_modules key=relatedmodulename from=$MODULE_RELATED_FIELDS}
module_related_fields["{$relatedmodulename}"] = new Array('',''{foreach item=module1 key=modulekey from=$related_modules},'{$modulekey}','{$module1}'{/foreach});
{/foreach *}

var all_related_modules = new Array();
{$ALL_RELATED_MODULES}
{* foreach item=related_modules key=relatedmodulename from=$ALL_RELATED_MODULES}
all_related_modules["{$relatedmodulename}--{$module1.fieldname}"] = new Array('',''{foreach item=module1 key=modulekey from=$related_modules},'{$module1.module}','{$module1.modulelabel}'{/foreach});
{/foreach *}

{*{$modulekey} - {$module1.module} - modulelabel {$module1.module} - {$module1.fieldlabel} - {$module1.fieldname}*}
{* all_related_modules["{$relatedmodulename}"] = new Array('{$MOD.LBL_SELECT_MODULE}','none'{foreach item=module1 from=$related_modules} ,'{$APP.$module1|escape}','{$module1}'{/foreach});  *}

function change_relatedmodulesorce(first,second_name)
{ldelim} 
    second = document.getElementById(second_name);
    lgth = second.options.length - 1;
    if (lgth < 0) lgth = 0;    
       second.options[lgth] = null;   
    
    var box = first;
    var number = box.options[box.selectedIndex].value;

    if (number != '') 
    {ldelim}
        var box2 = second;

        var optgroups = box2.childNodes;
        for(i = optgroups.length - 1 ; i >= 0 ; i--)
        {ldelim}
                box2.removeChild(optgroups[i]);
        {rdelim}
    
        var list = module_related_fields[number];
        
        if (!list)
        {ldelim}
            document.getElementById("body_variables").style.display = "none";  
        {rdelim}
        else
        {ldelim}
            document.getElementById("body_variables").style.display = "table-row";
            for(i=0;i<list.length;i+=2)
            {ldelim}
                if (list[i] != "")
                {ldelim}
                    optGroup = document.createElement('optgroup');
                    optGroup.label = list[i+1];
                    box2.appendChild(optGroup);
        
                    var list2 = all_related_modules[number+"--"+list[i]];
                    for(i2=0;i2<list2.length;i2+=2)
                    {ldelim}
                         if (list2[i2] != "")
                        {ldelim}
                            objOption=document.createElement("option");
                            objOption.innerHTML = list2[i2+1];
                            objOption.value = list2[i2] + "--"+list[i];
                
                            optGroup.appendChild(objOption);
                        {rdelim}
                    {rdelim}
        
                    /*      
                    objOption=document.createElement("option");
                    objOption.innerHTML = list[i];
                    objOption.value = list[i+1];
            
                    box2.appendChild(objOption);
                    */
                {rdelim}  
            {rdelim}  
            
             rel = document.getElementById('relatedmodulesorce'); 
             change_relatedmodule(rel,'relatedmodulefields');                        
        {rdelim}

    {rdelim}
    else
    {ldelim}
        document.getElementById("body_variables").style.display = "none";
    {rdelim}    
        
{rdelim}

function clearRelatedModuleFields()
{ldelim}
    second = document.getElementById("relatedmodulefields");

    lgth = second.options.length - 1;

    second.options[lgth] = null;
    if (second.options[lgth]) optionTest = false;
    if (!optionTest) return;

    var box2 = second;

    var optgroups = box2.childNodes;
    for(i = optgroups.length - 1 ; i >= 0 ; i--)
    {ldelim}
            box2.removeChild(optgroups[i]);
    {rdelim}

    objOption=document.createElement("option");
    objOption.innerHTML = "{$MOD.LBL_SELECT_MODULE_FIELD}";
    objOption.value = "";

    box2.appendChild(objOption);

{rdelim}

var related_module_fields = new Array();

{foreach item=relatedmodulefields key=relatedmodulename from=$RELATED_MODULE_FIELDS}
    related_module_fields["{$relatedmodulename}"] = new Array({$relatedmodulefields});
{/foreach}

function change_relatedmodule(first,second_name)
{ldelim}
    second = document.getElementById(second_name);

    optionTest = true;
    lgth = second.options.length - 1;

    second.options[lgth] = null;
    if (second.options[lgth]) optionTest = false;
    if (!optionTest) return;
    var box = first;
    var number_data = box.options[box.selectedIndex].value;
    var number_array = number_data.split("--");
    var number = number_array[0]; 

    if (!number) return;
   
    var box2 = second;

    //box2.options.length = 0;

    var optgroups = box2.childNodes;
    for(i = optgroups.length - 1 ; i >= 0 ; i--)
    {ldelim}
            box2.removeChild(optgroups[i]);
    {rdelim}

    if (number == "none")
    {ldelim}
        objOption=document.createElement("option");
        objOption.innerHTML = "{$MOD.LBL_SELECT_MODULE_FIELD}";
        objOption.value = "";

        box2.appendChild(objOption);
    {rdelim}
    else
    {ldelim}
        var blocks = module_blocks[number];

        for(b=0;b<blocks.length;b+=2)
        {ldelim}
            var list = related_module_fields[number+'|'+ blocks[b+1]];

    		if (list.length > 0)
    		{ldelim}

    		    optGroup = document.createElement('optgroup');
                optGroup.label = blocks[b];
                box2.appendChild(optGroup);

        		for(i=0;i<list.length;i+=2)
        		{ldelim}
                      objOption=document.createElement("option");
                      objOption.innerHTML = list[i];
                      objOption.value = list[i+1];


                      optGroup.appendChild(objOption);
        		{rdelim}
    		{rdelim}
        {rdelim}
    {rdelim}
{rdelim}


function InsertIntoTemplate(element)
{ldelim}

    selectField =  document.getElementById(element).value;

    oEditor = CKEDITOR.instances.body; 
      
    if(element!='header_var' && element!='footer_var' && element!='hmodulefields' && element!='fmodulefields')
    {ldelim}        
        

      	 if (selectField != '')
      	 {ldelim}
               if (selectField == 'ORGANIZATION_STAMP_SIGNATURE')
       	       {ldelim}
       	           insert_value = '{$COMPANY_STAMP_SIGNATURE}';
      	       {rdelim}
               else if (selectField == 'COMPANY_LOGO')
       	       {ldelim}
       	           insert_value = '{$COMPANYLOGO}';
      	       {rdelim}
               else if (selectField == 'ORGANIZATION_HEADER_SIGNATURE')
       	       {ldelim}
       	           insert_value = '{$COMPANY_HEADER_SIGNATURE}';
      	       {rdelim}
               else
      	       {ldelim}
                   if (element == "articelvar")
                      insert_value = '#'+selectField+'#';
                   else if (element == "relatedmodulefields") 
                   {ldelim}                                      
                      rel_module_sorce = document.getElementById('relatedmodulesorce').value; 
                      rel_module_data = rel_module_sorce.split("--");
                                            
                      insert_value = '$r-'+ rel_module_data[1] + '-'+ selectField+'$';   
                   {rdelim}                   
                   else if(element == "productbloctpl" || element == "productbloctpl2" || element == "dateval")
                      insert_value = selectField;
                   else if(element == "global_lang")
                      insert_value = '%G_'+selectField+'%';
                   else if(element == "module_lang")
                      insert_value = '%M_'+selectField+'%';  
                   else if(element == "modulefields")
                   {ldelim}
                       if(inArray(selectField, invarray))
                           insert_value = '$'+selectField+'$';  
                       else
                           insert_value = '$s-'+selectField+'$';      
                   {rdelim}
                   else if(element == "customfunction")
                      insert_value = '[CUSTOMFUNCTION|'+selectField+'|CUSTOMFUNCTION]'; 
                   else
                      insert_value = '$'+selectField+'$';


               {rdelim}
               oEditor.insertHtml(insert_value);
      	 {rdelim}

    {rdelim}
    else
    {ldelim}
        if (selectField != '')
        {ldelim}
            if(element=='hmodulefields' || element=='fmodulefields' )
                oEditor.insertHtml('$'+selectField+'$');
            else
                oEditor.insertHtml(selectField);
        {rdelim}
    {rdelim}
{rdelim}



function saveEmail()
{ldelim}
    var email_name =  document.getElementById("filename").value;

    var error = 0;

    if (email_name == "")
    {ldelim}
       alert("{$MOD.LBL_EMAIL_NAME}" + alert_arr.CANNOT_BE_EMPTY);
       error++;
    {rdelim}

    if(!CheckSharing())
    {ldelim}
        error++;
    {rdelim}

    if (error > 0)
       return false;
    else
       return true;
{rdelim}


function refreshPosition(type)
{ldelim}

    var i;

    selectbox = document.getElementById(type + "_position");
    selectbox_value = selectbox.value;

    for(i=selectbox.options.length-1;i>=0;i--)
    {ldelim}
        selectbox.remove(i);
    {rdelim}


    el1 = document.getElementById(type + "_function_left").value;
    el2 = document.getElementById(type + "_function_center").value;
    el3 = document.getElementById(type + "_function_right").value;


    selectbox.options[selectbox.options.length] = new Option("{$MOD.LBL_EMPTY_IMAGE}", "empty");
    if (el1 == "hf_function_1") selectbox.options[selectbox.options.length] = new Option("{$MOD.LBL_LEFT}", "left");
    if (el2 == "hf_function_1") selectbox.options[selectbox.options.length] = new Option("{$MOD.LBL_CENTER}", "center");
    if (el3 == "hf_function_1") selectbox.options[selectbox.options.length] = new Option("{$MOD.LBL_RIGHT}", "right");

    selectbox.value = selectbox_value;

{rdelim}

function showHideTab(tabname)
{ldelim}
    document.getElementById(selectedTab+'_tab').className="dvtUnSelectedCell";    
    document.getElementById(tabname+'_tab').className='dvtSelectedCell';
    
    document.getElementById(selectedTab+'_div').style.display='none';
    document.getElementById(tabname+'_div').style.display='block';
    var formerTab=selectedTab;
    selectedTab=tabname;
    
{rdelim}

{literal}
function fill_module_lang_array(module)
{    
    new Ajax.Request(
                'index.php',
                {queue: {position: 'end', scope: 'command'},
                        method: 'post',
                        postBody: 'module=EMAILMaker&action=EMAILMakerAjax&file=AjaxRequestHandle&langmod='+module,
                        onComplete: function(response) {
                                var module_lang = document.getElementById('module_lang');
                                module_lang.length=0;
                                var map = response.responseText.split('|@|');
                                var keys = map[0].split('||');
                                var values = map[1].split('||');
                                
                                for(i=0;i<values.length;i++)
                                {
                                    var item = document.createElement('option');
                                    item.text = values[i];
                                    item.value = keys[i];
                                    try {
                                      module_lang.add(item,null);
                                    }catch(ex){
                                      module_lang.add(item);
                                    }
                                }                                                                
                        }
                }
        );
}

function arrayCompare(a1, a2) {
    if (a1.length != a2.length) return false;
    var length = a2.length;
    for (var i = 0; i < length; i++) {
        if (a1[i] !== a2[i]) return false;
    }
    return true;
}

function inArray(needle, haystack) {
    var length = haystack.length;
    for(var i = 0; i < length; i++) {
        if(typeof haystack[i] == 'object') {
            if(arrayCompare(haystack[i], needle)) return true;
        } else {
            if(haystack[i] == needle) return true;
        }
    }
    return false;
}

function insertFieldIntoSubject(val)
{
    if(val!='')
    {
        if(val=='##DD.MM.YYYY##' || val=='##DD-MM-YYYY##' || val=='##DD/MM/YYYY##' || val=='##MM-DD-YYYY##' || val=='##MM/DD/YYYY##' || val=='##YYYY-MM-DD##')
            document.getElementById('subject').value+= val;
        else
            document.getElementById('subject').value+='$s-'+val+'$'; 
    }
           
}
{/literal}

function EditRelatedBlock()
{ldelim}
    alert("{$MOD.LBL_RELATED_BLOCKS_NOT_AVAILABLE_IN_FREE}");
{rdelim}



var constructedOptionValue;
var constructedOptionName;

var roleIdArr=new Array({$ROLEIDSTR});
var roleNameArr=new Array({$ROLENAMESTR});
var userIdArr=new Array({$USERIDSTR});
var userNameArr=new Array({$USERNAMESTR});
var grpIdArr=new Array({$GROUPIDSTR});
var grpNameArr=new Array({$GROUPNAMESTR});

sharing_changed();


//Sharing functions
function sharing_changed()
{ldelim}
    var selectedValue = document.getElementById('sharing').value;
    if(selectedValue != 'share')
    {ldelim}
        document.getElementById('sharing_share_div').style.display = 'none';
    {rdelim}
    else
    {ldelim}
        document.getElementById('sharing_share_div').style.display = 'block';
        setSharingObjects();
        showSharingMemberTypes();
    {rdelim}
{rdelim}

function showSharingMemberTypes()
{ldelim}
	var selectedOption=document.getElementById('sharingMemberType').value;
	//Completely clear the select box
	document.getElementById('sharingAvailList').options.length = 0;

	if(selectedOption == 'groups')
	{ldelim}
		constructSelectOptions('groups',grpIdArr,grpNameArr);
	{rdelim}
	else if(selectedOption == 'roles')
	{ldelim}
		constructSelectOptions('roles',roleIdArr,roleNameArr);
	{rdelim}
	else if(selectedOption == 'rs')
	{ldelim}

		constructSelectOptions('rs',roleIdArr,roleNameArr);
	{rdelim}
	else if(selectedOption == 'users')
	{ldelim}
		constructSelectOptions('users',userIdArr,userNameArr);
	{rdelim}
{rdelim}

function constructSelectOptions(selectedMemberType,idArr,nameArr)
{ldelim}
	var i;
	var findStr=document.getElementById('sharingFindStr').value;
	if(findStr.replace(/^\s+/g, '').replace(/\s+$/g, '').length !=0)
	{ldelim}
		var k=0;
		for(i=0; i<nameArr.length; i++)
		{ldelim}
			if(nameArr[i].indexOf(findStr) ==0)
			{ldelim}
				constructedOptionName[k]=nameArr[i];
				constructedOptionValue[k]=idArr[i];
				k++;
			{rdelim}
		{rdelim}
	{rdelim}
	else
	{ldelim}
		constructedOptionValue = idArr;
		constructedOptionName = nameArr;
	{rdelim}

	//Constructing the selectoptions
	var j;
	var nowNamePrefix;
	for(j=0;j<constructedOptionName.length;j++)
	{ldelim}
		if(selectedMemberType == 'roles')
		{ldelim}
			nowNamePrefix = 'Roles::'
		{rdelim}
		else if(selectedMemberType == 'rs')
		{ldelim}
			nowNamePrefix = 'RoleAndSubordinates::'
		{rdelim}
		else if(selectedMemberType == 'groups')
		{ldelim}
			nowNamePrefix = 'Group::'
		{rdelim}
		else if(selectedMemberType == 'users')
		{ldelim}
			nowNamePrefix = 'User::'
		{rdelim}

		var nowName = nowNamePrefix + constructedOptionName[j];
		var nowId = selectedMemberType + '::'  + constructedOptionValue[j]
		document.getElementById('sharingAvailList').options[j] = new Option(nowName,nowId);
	{rdelim}
	//clearing the array
	constructedOptionValue = new Array();
    constructedOptionName = new Array();
{rdelim}

function sharingAddColumn()
{ldelim}
    for (i=0;i<selectedColumnsObj.length;i++)
    {ldelim}
        selectedColumnsObj.options[i].selected=false
    {rdelim}

    for (i=0;i<availListObj.length;i++)
    {ldelim}
        if (availListObj.options[i].selected==true)
        {ldelim}
        	var rowFound=false;
        	var existingObj=null;
            for (j=0;j<selectedColumnsObj.length;j++)
            {ldelim}
                if (selectedColumnsObj.options[j].value==availListObj.options[i].value)
                {ldelim}
                    rowFound=true
                    existingObj=selectedColumnsObj.options[j]
                    break
                {rdelim}
            {rdelim}

            if (rowFound!=true)
            {ldelim}
                var newColObj=document.createElement("OPTION")
                newColObj.value=availListObj.options[i].value
                if (browser_ie) newColObj.innerText=availListObj.options[i].innerText
                else if (browser_nn4 || browser_nn6) newColObj.text=availListObj.options[i].text
                selectedColumnsObj.appendChild(newColObj)
                availListObj.options[i].selected=false
                newColObj.selected=true
                rowFound=false
            {rdelim}
            else
            {ldelim}
                if(existingObj != null) existingObj.selected=true
            {rdelim}
        {rdelim}
    {rdelim}
{rdelim}

function sharingDelColumn()
{ldelim}
    for (i=selectedColumnsObj.options.length;i>0;i--)
    {ldelim}
    	if (selectedColumnsObj.options.selectedIndex>=0)
            selectedColumnsObj.remove(selectedColumnsObj.options.selectedIndex)
    {rdelim}
{rdelim}

function setSharingObjects()
{ldelim}
    availListObj=getObj("sharingAvailList")
    selectedColumnsObj=getObj("sharingSelectedColumns")
{rdelim}

//Sharing Ends

function CheckSharing()
{ldelim}
    if(document.getElementById('sharing').value == 'share')
    {ldelim}
        var selColStr = '';
        var selColObj = document.getElementById('sharingSelectedColumns');
        
        for(i = 0; i < selColObj.options.length; i++)
        {ldelim}
            selColStr += selColObj.options[i].value + ';';
        {rdelim}

        if(selColStr == '')
        {ldelim}
            alert('{$MOD.LBL_SHARING_ERROR}');
            document.getElementById('sharingAvailList').focus();
            return false;
        {rdelim}
        document.getElementById('sharingSelectedColumnsString').value = selColStr;
    {rdelim}

    return true;
{rdelim}
</script>
