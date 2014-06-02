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
<form name="SendEMAKERMail">
<input name="excludedRecords2" type="hidden" id="excludedRecords2" value="{$EXE_REC}">
<input name='viewid2' id="viewid2" type='hidden' value='{$VIEWID}'>
<div id="roleLayEMAILMaker" style="z-index:12;display:block;width:300px;" class="layerPopup">
	<table border=0 cellspacing=0 cellpadding=5 width=100% class=layerHeadingULine>
		<tr>
			<td width="90%" align="left" class="genHeaderSmall" id="sendemakermail_cont_handle" style="cursor:move;">{$MOD.SELECT_EMAIL}
				{if $ONE_RECORD neq 'true'}
				({$MOD.LBL_MULTIPLE} {$APP[$FROM_MODULE]})
				{/if}
				&nbsp;
			</td>
			<td width="10%" align="right">
				<a href="javascript:fninvsh('roleLayEMAILMaker');"><img title="{$APP.LBL_CLOSE}" alt="{$APP.LBL_CLOSE}" src="{'close.gif'|@vtiger_imageurl:$THEME}" border="0"  align="absmiddle" /></a>
			</td>
		</tr>
	</table>
	<table border=0 cellspacing=0 cellpadding=5 width=95% align=center> 
		<tr><td class="small">
			<table border=0 cellspacing=0 cellpadding=5 width=100% align=center bgcolor=white>
				<tr>
					<td align="left">
                        <table border="0" cellpadding="5" cellspacing="0" width="90%">
                        {foreach name=fields key=fieldid item=elements from=$MAILDATA}
                            {if $ONE_RECORD eq 'true'}
                                <tr><td colspan="2"><b>{$elements.data.name}</b> {if $elements.type neq ''}<small>({$elements.type})</small> {/if} </td></tr>
                                {foreach name=emails key=emailname item=emaildata from=$elements.data.emails}
                                     {if $emaildata.value neq ''} 
                                         <tr>
                                         <td align="center"><input type="checkbox" value="{$elements.crmid}@{$emaildata.fieldid}" name="semail" {if $HAVE_ONE_EMAIL eq "true"}checked {/if}/></td>
                                         <td align="left">{$emaildata.label}: <i>{$emaildata.value}</i> </td>
                                         </tr>
                                     {/if}
                                {/foreach}
                            {else}
                                {if $elements.type neq ''}<tr><td colspan="2"><b>{$elements.type}</b></td></tr>{/if}
                                {foreach name=emails key=emailname item=emaildata from=$elements.data.emails}
                                    <tr>
                                         <td align="center"><input type="checkbox" value="0@{$emaildata.fieldid}@{$elements.fieldid}" name="semail" {if $HAVE_ONE_EMAIL eq "true"}checked {/if}/></td>
                                         <td align="left">{$emaildata.label}</td>
                                    </tr>
                                {/foreach}
                            {/if}
                            <tr><td colspan="2" style="height:10px;"></td></tr>
                        {/foreach}
                        </table>
                        {$PDF_DATA}
  					</td>	
				</tr>
			</table>
		</td></tr>
	</table>
	<table border=0 cellspacing=0 cellpadding=5 width=100% class="layerPopupTransport">
		<tr><td align=center class="small">
			<input type="button" name="{$APP.LBL_SELECT_BUTTON_LABEL}" value=" {$APP.LBL_SELECT_BUTTON_LABEL} " class="crmbutton small create" onClick="validate_sendEMAKERmail('{$IDLIST}','{$FROM_MODULE}');"/>&nbsp;&nbsp;
			<input type="button" name="{$APP.LBL_CANCEL_BUTTON_LABEL}" value=" {$APP.LBL_CANCEL_BUTTON_LABEL} " class="crmbutton small cancel" onclick="fninvsh('roleLayEMAILMaker');" />
		</td></tr>
	</table>
</div>
</form>