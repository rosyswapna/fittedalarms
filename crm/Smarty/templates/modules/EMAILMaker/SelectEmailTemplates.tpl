{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
{* ITS4YOU TT0093 VlMe N *}
<script language="JAVASCRIPT" type="text/javascript" src="include/js/smoothscroll.js"></script>
<script>
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
	        	document.massdelete.action.value= "DeleteEMAILTemplate";
		{rdelim}
		else
		{ldelim}
			return false;
		{rdelim}

{rdelim}
</script>
<br>
<table align="center" border="0" cellpadding="0" cellspacing="0" width="98%">   
<tr>
    {*<td valign="top"><img src="{'showPanelTopLeft.gif'|@vtiger_imageurl:$THEME}"></td>*}
    <td class="showPanelBg" style="padding: 10px;" valign="top" width="100%">
    <form  name="massdelete" method="POST" onsubmit="VtigerJS_DialogBox.block();">
    <input name="idlist" type="hidden">
    <input name="module" type="hidden" value="EMAILMaker">
    <input name="parenttab" type="hidden" value="Tools">
    <input name="action" type="hidden" value="">
    <table border=0 cellspacing=0 cellpadding=5 width=100% class="settingsSelUITopLine">
    <tr>
        <td class=heading2 align="left" valign=bottom><b><a href="index.php?module=EMAILMaker&action=ListEmailTemplates&parenttab=Tools">{$MOD.LBL_TEMPLATE_GENERATOR}</a></b>  &gt; {$MOD.LBL_TEMPLATES_LIST}</td>
    </tr>
    <tr>
        <td valign=top class="small">{$MOD.LBL_TEMPLATE_GENERATOR_DESCRIPTION}</td>
    </tr>
    </table>

<br>
    <table border=0 cellspacing=0 cellpadding=10 width=100% >
    <tr><td>
        <table border=0 cellspacing=0 cellpadding=5 width=100% class="tableHeading">
        <tr>
            <td class="big"><strong>{$MOD.LBL_SELECT_TEMPLATES}</strong></td>
            <td class="small" align=right>&nbsp;</td>
        </tr>
        </table>
        </form>
        
        <div style="float:left;border:1px solid #000000;margin:5px;">
    	 <div class="tableHeading" style="border-bottom:1px solid #000000;padding:5px;text-align:center;font-weight:bold">
         <a href="index.php?module=EMAILMaker&action=EditEmailTemplate&parenttab=Tools">Blank</a>
         </div>
         <a href="index.php?module=EMAILMaker&action=EditEmailTemplate&parenttab=Tools"><img src="modules/EMAILMaker/templates/blank.png" border="0"></a>
    	</div>
    	 
        {foreach item=templatename key=templatenameid from=$EMAILTEMPLATES}
            <div style="float:left;border:1px solid #000000;margin:5px;">
        	<div class="tableHeading" style="border-bottom:1px solid #000000;padding:5px;text-align:center;font-weight:bold" border="1">
            <a href="index.php?module=EMAILMaker&action=EditEmailTemplate&parenttab=Tools&template={$templatename}">{$templatename}</a>
            </div>
            <a href="index.php?module=EMAILMaker&action=EditEmailTemplate&parenttab=Tools&template={$templatename}"><img src="modules/EMAILMaker/templates/{$templatename}/image.png" border="0"></a>
        	</div>
        {/foreach}
    </td>
    </tr>
    <tr><td align="center" class="small" style="color: rgb(153, 153, 153);">{$MOD.EMAIL_MAKER} {$VERSION} {$MOD.COPYRIGHT}</td></tr>
    </table>
