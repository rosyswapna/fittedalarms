{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
<script type="text/javascript" language="Javascript">
function validateFile(form) 
	{ldelim}

	if(!emptyCheck("userfile","File Location","any"))
		{ldelim}
                
			form.userfile.focus();
		        return false;
		{rdelim}


    	if(! upload_filter("userfile", "xml") )
		{ldelim}
        
                	form.userfile.focus();
	                return false;
	
		{rdelim}
	
		return true;
	{rdelim}
</script>
<!-- header - level 2 tabs -->
{include file='modules/EMAILMaker/Buttons_List.tpl'}	

<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%" class="small">
   <tr>
	<td valign="top"><img src="{'showPanelTopLeft.gif'|@vtiger_imageurl:$THEME}"/></td>
	<td class="showPanelBg" valign="top" width="100%">

		<!-- Import UI Starts -->
		<table  cellpadding="0" cellspacing="0" width="100%" border=0>
		   <tr>
			<td width="75%" valign=top>
				<form enctype="multipart/form-data" name="Import" method="POST" action="index.php" onsubmit="VtigerJS_DialogBox.block();">
				<input type="hidden" name="module" value="{$MODULE}">
				<input type="hidden" name="step" value="1">
				<input type="hidden" name="action" value="EMAILMakerAjax">
				<input type="hidden" name="file" value="Import">
				<input type="hidden" name="return_module" value="{$RETURN_MODULE}">
				<input type="hidden" name="return_id" value="{$RETURN_ID}">
				<input type="hidden" name="return_action" value="{$RETURN_ACTION}">
				<input type="hidden" name="parenttab" value="{$CATEGORY}">

				<!-- IMPORT LEADS STARTS HERE  -->
				<br />
				<table align="center" cellpadding="5" cellspacing="0" width="80%" class="mailClient importLeadUI small" border="0">
				   <tr>
					<td colspan="2" height="50" valign="middle" align="left" class="mailClientBg  genHeaderSmall">{$MOD.LBL_EMAILMAKER_IMPORT}</td>
				   </tr>
				   <tr >
					<td colspan="2" align="left" valign="top" style="padding-left:40px;">
					<br>
						{*<span class="genHeaderGray">{$MOD.LBL_STEP_1}</span>&nbsp;*}
						<span class="genHeaderSmall">{$MOD.LBL_SELECT_XML}</span> 
					</td>
				   </tr>
				   <tr >
					<td colspan="2" align="left" valign="top" style="padding-left:40px;">
						{$MOD.LBL_SELECT_XML_TEXT}
					</td>
				   </tr>
				   <tr ><td align="left" valign="top" colspan="2">&nbsp;</td></tr>
				   <tr >
					<td align="right" valign="top" width="25%" class=small><b>{$MOD.LBL_FILE_LOCATION} </b></td>
					<td align="left" valign="top" width="75%">
						<input type="file" name="userfile" size="65" class=small onchange="validateFilename(this);" />&nbsp;
						<input type="hidden" name="userfile_hidden" value=""/><br />
					</td>
				   </tr>
				   <tr ><td colspan="2" height="50">&nbsp;</td></tr>
				    <tr >
						<td colspan="2" align="right" style="padding-right:40px;" class="reportCreateBottom">
							<input title="{$MOD.LBL_NEXT}" accessKey="" class="crmButton small save" type="submit" name="button" value="  {$MOD.LBL_NEXT} &rsaquo; "  onclick="this.form.action.value='EMAILMakerAjax'; return validateFile(this.form);">
						&nbsp;
 <input title="{$APP.LBL_CANCEL_BUTTON_LABEL}" accessKey="" class="crmButton small cancel" type="button" name="button" value="{$APP.LBL_CANCEL_BUTTON_LABEL}" onclick="window.history.back()">

						</td>
				   </tr>
				 </table>
				<br>
				</form>
				<!-- IMPORT LEADS ENDS HERE -->
			</td>
		   </tr>
		</table>

	</td>
	<td valign="top"><img src="{'showPanelTopRight.gif'|@vtiger_imageurl:$THEME}" /></td>
   </tr>
</table>
<br>
