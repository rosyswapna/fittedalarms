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
<script>
function ExportTemplates()
{ldelim}
     window.location.href = "index.php?module=EMAILMaker&action=EMAILMakerAjax&file=ExportEmailTemplate&templates={$TEMPLATEID}";
{rdelim}
</script>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">
<tbody><tr>
        {*<td valign="top"><img src="{'showPanelTopLeft.gif'|@vtiger_imageurl:$THEME}"></td>*}
        <td class="showPanelBg" style="padding: 10px;" valign="top" width="100%">

				<!-- DISPLAY -->
				<table border=0 cellspacing=0 cellpadding=5 width=100%>
		    	<form method="post" action="index.php" name="etemplatedetailview" onsubmit="VtigerJS_DialogBox.block();">  
				<input type="hidden" name="action" value="">
				<input type="hidden" name="module" value="EMAILMaker">
                <input type="hidden" name="retur_module" value="EMAILMaker">
				<input type="hidden" name="return_action" value="">
				<input type="hidden" name="templateid" value="{$TEMPLATEID}">
				<input type="hidden" name="parenttab" value="{$PARENTTAB}">
				<input type="hidden" name="isDuplicate" value="false">
				<tr>
					<td valign=bottom><span class="dvHeaderText">{$MOD.LBL_VIEWING} &quot;{$FILENAME}&quot;</span></td>
				</tr>
				</table>
				<table border=0 cellspacing=0 cellpadding=10 width=100% >
				<tr>
				<td>
					<table border=0 cellspacing=0 cellpadding=5 width=100% class="tableHeading">
					<tr>
						<td class="big"><strong>{$MOD.LBL_PROPERTIES}</strong></td>
						<td class="small" align=right>&nbsp;&nbsp;
						  {if $EDIT eq 'permitted'}
                              <input class="crmButton edit small" type="submit" name="Button" value="{$APP.LBL_EDIT_BUTTON_LABEL}" onclick="this.form.action.value='EditEmailTemplate'; this.form.parenttab.value='Tools'">&nbsp;
						      <input class="crmbutton small create" type="submit" name="Duplicate" value="{$APP.LBL_DUPLICATE_BUTTON}" title="{$APP.LBL_DUPLICATE_BUTTON_TITLE}" accessKey="U"  onclick="this.form.isDuplicate.value='true'; this.form.action.value='EditEmailTemplate';">&nbsp;
                          {/if}
                          {if $DELETE eq 'permitted'}
					       	  <input class="crmbutton small delete" type="button"  name="Delete" value="{$APP.LBL_DELETE_BUTTON_LABEL}" title="{$APP.LBL_DELETE_BUTTON_TITLE}" accessKey="{$APP.LBL_DELETE_BUTTON_KEY}" onclick="this.form.return_action.value='index'; var confirmMsg = '{$APP.NTC_DELETE_CONFIRMATION}'; submitFormForActionWithConfirmation('etemplatedetailview', 'DeleteEmailTemplate', confirmMsg);" >&nbsp;
					   	  {/if}
                          &nbsp;
                        </td>
					</tr>
					</table>
					
					<table border=0 cellspacing=0 cellpadding=5 width=100% >
					<tr>
						<td width=20% class="small cellLabel"><strong>{$MOD.LBL_EMAIL_NAME}:</strong></td>
						<td width=80% class="small cellText"><strong>{$FILENAME}</strong></td>
				    </tr>
				    <tr>
						<td width=20% class="small cellLabel"><strong>{$MOD.LBL_EMAIL_SUBJECT}:</strong></td>
						<td width=80% class="small cellText"><strong>{$SUBJECT}</strong></td>
				    </tr>
					<tr>
						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_DESCRIPTION}:</strong></td>
						<td class="cellText small" valign=top>&nbsp;{$DESCRIPTION}</td>
					</tr>
                    {****************************************** email sorce module *********************************************}	
					<tr>
						<td valign=top class="small cellLabel"><strong>{$MOD.LBL_MODULENAMES}:</strong></td>
						<td class="cellText small" valign=top>{$MODULENAME}</td>
					</tr>
					{****************************************** email body *****************************************************}	
					<tr>
					  <td colspan="2" valign=top class="cellText small">
                      <table width="100%"  border="0" cellspacing="0" cellpadding="0" class="thickBorder">
                        <tr>
                          <td valign=top>
                          <table width="100%"  border="0" cellspacing="0" cellpadding="5" >
                              <tr>
                                <td colspan="2" valign="top" class="small" style="background-color:#cccccc"><strong>{$MOD.LBL_EMAIL_TEMPLATE}</strong></td>
                              </tr>
                             
                              <tr>
                                <td valign="top" class="cellLabel small">{$MOD.LBL_BODY}</td>
                                <td class="cellText small">{$BODY}</td>
                              </tr>
                              
                          </table>
                          </td>                          
                        </tr>                        
                      </table>
                      </td>
					  </tr>
					  
					  
					</table> 					
				</td>
				</tr><tr><td align="center" class="small" style="color: rgb(153, 153, 153);">{$MOD.EMAIL_MAKER} {$VERSION} {$MOD.COPYRIGHT}</td></tr>
				</table>

			</td>
			</tr>
			</table>
		</td>
	</tr>
	</form>
	</table>
		


</td>
   </tr>   
</tbody>
</table>
