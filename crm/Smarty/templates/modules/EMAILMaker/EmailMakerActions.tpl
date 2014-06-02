{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
<table border=0 cellspacing=0 cellpadding=0 style="width:100%;">
  {if $CRM_TEMPLATES_EXIST eq '0'}
        <tr>
  		<td class="rightMailMergeContent"  style="width:100%;">
  		<select name="use_common_email_template" id="use_common_email_template" class="detailedViewTextBox" style="width:90%;" size="5">
            {foreach name="tplForeach" from="$CRM_TEMPLATES" item="templates_label" key="templates_prefix"}
                 <option value="{$templates_prefix}">{$templates_label}</option>
            {/foreach}
        </select>        
  		</td>
		</tr>
  {/if}
    	<tr>
          	<td class="rightMailMergeContent"  style="width:100%;">  			
        		<a href="javascript:;" onclick="fnvshobj(this,'sendemakermail_cont');sendEMakerMail('{$MODULE}','{$ID}');" class="webMnu"><img src="{'sendmail.png'|@vtiger_imageurl:$THEME}" hspace="5" align="absmiddle" border="0"/></a>
        		<a href="javascript:;" onclick="fnvshobj(this,'sendemakermail_cont');sendEMakerMail('{$MODULE}','{$ID}');" class="webMnu">{$APP.LBL_SENDMAIL_BUTTON_LABEL}</a>  
                <div id="sendemakermail_cont" style="z-index:100001;position:absolute;"></div>
            </td>
        </tr>
</table>

