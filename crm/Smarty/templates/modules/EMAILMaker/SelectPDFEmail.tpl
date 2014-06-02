{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
<!-- BEGIN: main -->
<form name="SendEMAKERPDFMail">
<div id="roleLay3" style="z-index:12;display:block;width:350px;" class="layerPopup">
	<table border=0 cellspacing=0 cellpadding=5 width=100% class=layerHeadingULine>
		<tr>
			<td width="90%" align="left" class="genHeaderSmall" id="EMAILPDFListViewDivHandle" style="cursor:move;">{$MOD.SELECT_EMAIL}
				{if $ONE_RECORD neq 'true'}
				({$MOD.LBL_MULTIPLE} {$APP[$FROM_MODULE]})
				{/if}
				&nbsp;
			</td>
			<td width="10%" align="right">
				<a href="javascript:fninvsh('roleLay3');"><img title="{$APP.LBL_CLOSE}" alt="{$APP.LBL_CLOSE}" src="{'close.gif'|@vtiger_imageurl:$THEME}" border="0"  align="absmiddle" /></a>
			</td>
		</tr>
	</table>
	<table border=0 cellspacing=0 cellpadding=5 width=95% align=center> 
		<tr><td class="small">
			<table border=0 cellspacing=0 cellpadding=5 width=100% align=center bgcolor=white>
				<tr>
					<td align="left">
                        <big><b>{$EMOD.LBL_PDFMAKER_TEMPLATES}:</b></big><br><br>
                        {$PDF_TEMPLATE_OUTPUT}
                        <br><br>
                        {if $PDF_TEMPLATE_OUTPUT neq ""}
                            {$PDF_LANGUAGE_OUTPUT}
                            <br><br>
                        {/if}    
                        {if $FOR_LISTVIEW eq 'true'}
                            <big><b>{$EMOD.LBL_SELECT_TEMPLATES}:</b></big><br><br>
                     		<select name="use_common_email_pdf_template" id="use_common_email_pdf_template" class="detailedViewTextBox" style="width:90%;">
                              {foreach name="tplForeach" from="$EMAIL_TEMPLATES" item="templates_label" key="templates_prefix"}
                                {if $smarty.foreach.tplForeach.first}
                                    <option value="{$templates_prefix}" selected="selected">{$templates_label}</option>
                                {else}
                                    <option value="{$templates_prefix}">{$templates_label}</option>
                                {/if}
                              {/foreach}
                            </select>        
                        {/if}
                        <br><br>
                        <big><b>{$EMOD.LBL_SEND_TO_EMAILS}:</b></big><br>
                        
                        <table border="0" cellpadding="5" cellspacing="0" width="90%">
                        {foreach name=fields key=fieldid item=elements from=$MAILDATA}
                            {if $ONE_RECORD eq 'true'}
                                <tr><td colspan="2"><b>{$elements.data.name}</b> {if $elements.type neq ''}<small>({$elements.type})</small> {/if} </td></tr>
                                {foreach name=emails key=emailname item=emaildata from=$elements.data.emails}
                                     {if $emaildata.value neq ''} 
                                         <tr>
                                         <td align="center"><input type="checkbox" value="{$elements.crmid}@{$emaildata.fieldid}" name="semail"  /></td>
                                         <td align="left">{$emaildata.label}: <i>{$emaildata.value}</i> </td>
                                         </tr>
                                     {/if}
                                {/foreach}
                            {else}
                                {if $elements.type neq ''}<tr><td colspan="2"><b>{$elements.type}</b></td></tr>{/if}
                                {foreach name=emails key=emailname item=emaildata from=$elements.data.emails}
                                    <tr>
                                         <td align="center"><input type="checkbox" value="0@{$emaildata.fieldid}@{$elements.fieldid}" name="semail"  /></td>
                                         <td align="left">{$emaildata.label}</td>
                                    </tr>
                                {/foreach}
                            {/if}
                            
                            <tr><td colspan="2" style="height:10px;"></td></tr>
                        {/foreach}
                        </table>

					</td>	
				</tr>
			</table>
		</td></tr>
	</table>
	<table border=0 cellspacing=0 cellpadding=5 width=100% class="layerPopupTransport">
		<tr><td align=center class="small">
			<input type="button" name="{$APP.LBL_SELECT_BUTTON_LABEL}" value=" {$APP.LBL_SELECT_BUTTON_LABEL} " class="crmbutton small create" onClick="if(getSelectedEMAILPDFTemplates()=='') alert('{$PDFMAKER_MOD.SELECT_TEMPLATE}'); else validate_sendEMAKERPDFListmail('{$IDLIST}','{$FROM_MODULE}');"/>&nbsp;&nbsp;
			<input type="button" name="{$APP.LBL_CANCEL_BUTTON_LABEL}" value=" {$APP.LBL_CANCEL_BUTTON_LABEL} " class="crmbutton small cancel" onclick="fninvsh('roleLay3');" />
		</td></tr>
	</table>
</div>
</form>