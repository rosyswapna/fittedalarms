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
<script>
function ExportTemplates()
{ldelim}
	if(typeof(document.massdelete.selected_id) == 'undefined')
		return false;
        x = document.massdelete.selected_id.length;
        idstring = "";

        if ( x == undefined)
        {ldelim}

                if (document.massdelete.selected_id.checked)
                {ldelim}
                        idstring = document.massdelete.selected_id.value;
                        
                        window.location.href = "index.php?module=EMAILMaker&action=EMAILMakerAjax&file=ExportEmailTemplate&templates="+idstring;
		     	xx=1;
                {rdelim}
                else
                {ldelim}
                        alert("{$APP.SELECT_ATLEAST_ONE}");
                        return false;
                {rdelim}
        {rdelim}
        else
        {ldelim}
                xx = 0;
                for(i = 0; i < x ; i++)
                {ldelim}
                        if(document.massdelete.selected_id[i].checked)
                        {ldelim}
                                idstring = document.massdelete.selected_id[i].value +";"+idstring
                        xx++
                        {rdelim}
                {rdelim}
                if (xx != 0)
                {ldelim}
                        document.massdelete.idlist.value=idstring;
                        
                        window.location.href = "index.php?module=EMAILMaker&action=EMAILMakerAjax&file=ExportEMAILTemplate&templates="+idstring;
                {rdelim}
                else
                {ldelim}
                        alert("{$APP.SELECT_ATLEAST_ONE}");
                        return false;
                {rdelim}
       {rdelim}

{rdelim}

function massDelete()
{ldelim}
	if(typeof(document.massdelete.selected_id) == 'undefined')
		return false;
        x = document.massdelete.selected_id.length;
        idstring = "";

        if ( x == undefined)
        {ldelim}

                if (document.massdelete.selected_id.checked)
               {ldelim}
                        document.massdelete.idlist.value=document.massdelete.selected_id.value+';';
			xx=1;
                {rdelim}
                else
                {ldelim}
                        alert("{$APP.SELECT_ATLEAST_ONE}");
                        return false;
                {rdelim}
        {rdelim}
        else
        {ldelim}
                xx = 0;
                for(i = 0; i < x ; i++)
                {ldelim}
                        if(document.massdelete.selected_id[i].checked)
                        {ldelim}
                                idstring = document.massdelete.selected_id[i].value +";"+idstring
                        xx++
                        {rdelim}
                {rdelim}
                if (xx != 0)
                {ldelim}
                        document.massdelete.idlist.value=idstring;
                {rdelim}
               else
                {ldelim}
                        alert("{$APP.SELECT_ATLEAST_ONE}");
                        return false;
                {rdelim}
       {rdelim}
		if(confirm("{$APP.DELETE_CONFIRMATION}"+xx+"{$APP.RECORDS}"))
		{ldelim}
	        	document.massdelete.action.value= "DeleteEmailTemplate";
		{rdelim}
		else
		{ldelim}
			return false;
		{rdelim}

{rdelim}
</script>
{include file='modules/EMAILMaker/Buttons_List.tpl'}  
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">   
<tr>
    {*<td valign="top"><img src="{'showPanelTopLeft.gif'|@vtiger_imageurl:$THEME}"></td>*}
    <td class="showPanelBg" style="padding: 0 10px 10px 10px;" valign="top" width="100%">
    <form  name="massdelete" method="POST" onsubmit="VtigerJS_DialogBox.block();">
    <input name="idlist" type="hidden">
    <input name="module" type="hidden" value="EMAILMaker">
    <input name="parenttab" type="hidden" value="Tools">
    <input name="action" type="hidden" value="">
    <table border=0 cellspacing=0 cellpadding=10 width=100% >
    <tr><td>
        <table border=0 cellspacing=0 cellpadding=5 width=100% class="listTableTopButtons">
        <tr>
            <td class="small" width="150px">{if $DELETE eq "permitted"}<input type="submit" value="{$MOD.LBL_DELETE}" onclick="return massDelete();" class="crmButton delete small">{/if}</td>
            <td>{$APP.LBL_MODULE}:
            <select name="filter_module" id="filter_module" class="small">
			 {html_options  options=$SHOWMODULES selected=$SHOWMODULE}
            </select>
            <input name="submit" type="submit" class="crmbutton small create" onClick="document.massdelete.action.value='index';" value=" {$APP.LBL_SELECT_BUTTON_LABEL} ">&nbsp;
            </td>
            <td class=small align=right>{if $EDIT eq "permitted"}<input class="crmButton create small" type="submit" value="{$MOD.LBL_ADD_TEMPLATE}" name="profile"  onclick="this.form.action.value='SelectEmailTemplates'; this.form.parenttab.value='Tools'">&nbsp;&nbsp;{/if}</td>
        </tr>
        </table>

        <table border=0 cellspacing=0 cellpadding=5 width=100% class="listTable">
        <tr>
            <td width=2% class="colHeader small">#</td>
            <td width=3% class="colHeader small">{$MOD.LBL_LIST_SELECT}</td>
            <td width=20% class="colHeader small">{$MOD.LBL_EMAIL_NAME}</td>
            <td width=20% class="colHeader small">{$MOD.LBL_MODULENAMES}</td>
            <td width=45% class="colHeader small">{$MOD.LBL_DESCRIPTION}</td>
            {if $EDIT eq "permitted"}<td width=5% class="colHeader small">{$MOD.LBL_ACTION}</td>{/if}
        </tr>
        {foreach item=template name=mailmerge from=$EMAILTEMPLATES}
        <tr>
            <td class="listTableRow small" valign=top>{$smarty.foreach.mailmerge.iteration}</td>
            <td class="listTableRow small" valign=top><input type="checkbox" class=small name="selected_id" value="{$template.templateid}"></td>
            <td class="listTableRow small" valign=top><b>{$template.templatename}</b></a></td>
            <td class="listTableRow small" valign=top><b>{$template.module}</b></a></td>
            <td class="listTableRow small" valign=top>{$template.description}&nbsp;</td>
            {if $EDIT eq "permitted"}<td class="listTableRow small" valign=top nowrap>{$template.edit}</td>{/if}
        </tr>
        {foreachelse}
       <tr>
            <td style="background-color:#efefef;height:340px" align="center" colspan="6">
                <div style="border: 3px solid rgb(153, 153, 153); background-color: rgb(255, 255, 255); width: 45%; position: relative; z-index: 10000000;">
                    <table border="0" cellpadding="5" cellspacing="0" width="98%">
                    <tr><td rowspan="2" width="25%"><img src="{'empty.jpg'|@vtiger_imageurl:$THEME}" height="60" width="61"></td>
                        <td style="border-bottom: 1px solid rgb(204, 204, 204);" nowrap="nowrap" width="75%" align="left">
                            <span class="genHeaderSmall">{$APP.LBL_NO} {$MOD.LBL_TEMPLATE} {$APP.LBL_FOUND}</span>
                        </td>
                    </tr>
                    <tr>
                        <td class="small" align="left" nowrap="nowrap">{$APP.LBL_YOU_CAN_CREATE} {$APP.LBL_A} {$MOD.LBL_TEMPLATE} {$APP.LBL_NOW}. {$APP.LBL_CLICK_THE_LINK}:<br>
                            &nbsp;&nbsp;-<a href="index.php?module=EMAILMaker&action=EditEmailTemplate&parenttab=Tools">{$APP.LBL_CREATE} {$APP.LBL_A} {$MOD.LBL_TEMPLATE}</a><br>
                        </td>
                    </tr>
                    </table>
                </div>
            </td>
        </tr>
        {/foreach}
        </table>
        <br>
        
    </td>
    </tr>
    <tr><td align="center" class="small" style="color: rgb(153, 153, 153);"><small>{$MOD.LBL_BUY_INFO}</small> <br><br>{$MOD.EMAIL_MAKER} {$VERSION} {$MOD.COPYRIGHT}</td></tr>
    </table>
</form>
