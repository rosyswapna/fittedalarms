{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}        
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN"
"http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE8" >
<meta http-equiv="Content-Type" content="text/html; charset={$APP.LBL_CHARSET}">
<title>{$MOD.TITLE_COMPOSE_MAIL}</title>
<link REL="SHORTCUT ICON" HREF="include/images/vtigercrm_icon.ico">	
<style type="text/css">
@import url("themes/{$THEME}/style.css");
{literal}
.inputWrapper {
    overflow: hidden;
    position: relative;
}

.fileInput {
    cursor: pointer;
    height: 100%;
    position:absolute;
    top: 0;
    right: 0;
    /*This makes the button huge so that it can be clicked on*/
    font-size:50px;
}
.hidden {
    /*Opacity settings for all browsers*/
    opacity: 0;
    -moz-opacity: 0;
    filter:progid:DXImageTransform.Microsoft.Alpha(opacity=0)
}
{/literal}
</style>
<script language="javascript" type="text/javascript" src="include/scriptaculous/prototype.js"></script>
<script src="include/scriptaculous/scriptaculous.js" type="text/javascript"></script>
<script src="include/js/general.js" type="text/javascript"></script>
<script language="JavaScript" type="text/javascript" src="include/js/{php} echo $_SESSION['authenticated_user_language'];{/php}.lang.js?{php} echo $_SESSION['vtiger_version'];{/php}"></script>
<script type="text/javascript" src="include/ckeditor/ckeditor.js"></script>
<script type="text/javascript" src="modules/EMAILMaker/multifile.js"></script>
</head>
<body marginheight="0" marginwidth="0" topmargin="0" bottommargin="0" leftmargin="0" rightmargin="0">
{literal}
<form name="EditView" method="POST" ENCTYPE="multipart/form-data" action="index.php">
{/literal}
<input type="hidden" name="send_mail" >
<input type="hidden" name="contact_id" value="{$CONTACT_ID}">
<input type="hidden" name="user_id" value="{$USER_ID}">
<input type="hidden" name="filename" value="{$FILENAME}">
<input type="hidden" name="old_id" value="{$OLD_ID}">
<input type="hidden" name="module" value="{$MODULE}">
<input type="hidden" name="record" value="{$ID}">
<input type="hidden" name="mode" value="{$MODE}">
<input type="hidden" name="action">
<input type="hidden" name="popupaction" value="create">
<input type="hidden" name="hidden_toid" id="hidden_toid">
<input type="hidden" name="pid" value="{$PID}">
<input type="hidden" name="type" value="{$TYPE}">
{if $NO_RCPTS neq ""}{$NO_RCPTS}{/if}
<table class="small mailClient" border="0" cellpadding="0" cellspacing="0" width="100%">
<tbody>
   <tr>
	<td colspan=3 >
    	<!-- Email Header -->
    	<table border=0 cellspacing=0 cellpadding=0 width=100% class="mailClientWriteEmailHeader">
    	<tr>
    		<td>{$MOD.LBL_COMPOSE_EMAIL}</td>
    	</tr>
    	</table>
	</td>
</tr>
{foreach item=row from=$BLOCKS}
{foreach item=elements from=$row}
{if $elements.2.0 eq 'parent_id'}
<tr>
<td width="75%" style="border-bottom: 1px solid #C0C0C0;">
<table class="small mailClient" border="0" cellpadding="0" cellspacing="0" width="100%">
   <tr>
   <td class="dvtCellLabel" style="padding: 5px;" width="140px" align="right" nowrap >{$EMOD.LBL_EMAILS_SENT_FROM}:</td>
   <td colspan="2" class="cellText" style="border-left:0px; padding: 5px;">
   <select name="from_email" class="small">
   {html_options  options=$FROM_EMAILS}
   </select>
   </td>
   </tr>
   {if $EMAILS_TABLE eq ""}
       <tr>
           <td colspan="5">
               <div style="height:200px; overflow:scroll">
                   <table class="small mailClient" border=0 cellspacing=0 cellpadding=0 width=100%>
                   {if $TYPE eq "1"}
                            <tr>
                                <td class="dvtCellLabel" width="130px" align="right" valign="top" style="padding-top: 5px;"><font color="red">*</font><b>{$EMOD.LBL_EMAILS}</b>:</td>
                                <td class="cellText" valign="top" style="padding:0px;">
                                    <table id="table_emaillist"  cellpadding="2" cellspacing="0" width="100%" style="border:0px solid #C0C0C0;border-collapse:collapse">
                                    {foreach item="p_emails" key="p_id" from=$TO_MAIL}    
                        		         {$p_emails} 
                                    {/foreach} 
                                    </table>
                            	</td>
                            	<td class="cellText" style="padding: 5px;" width="130px;" align="left" valign="top" nowrap>
                            		<select name="parent_type">
                            			{foreach key=labelval item=selectval from=$elements.1.0}
                            				{if $selectval eq selected}
                            					{assign var=selectmodule value="selected"}
                            				{else}
                            					{assign var=selectmodule value=""}
                            				{/if}
                            				<option value="{$labelval}" {$selectmodule}>{$APP[$labelval]}</option>
                            			{/foreach}
                                        <option value="other">{$EMOD.LBL_OTHER}</option>
                            		</select>
                            		&nbsp;
                            		<span  class="mailClientCSSButton">
                            		<img src="{'select.gif'|@vtiger_imageurl:$THEME}" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='addEmailAdress("0", document.EditView.parent_type.value, "index.php?module=EMAILMaker&return_module="+ document.EditView.parent_type.value +"&action=Popup&html=Popup_picker&form=HelpDeskEditView&popuptype=set_return_emails&type=1","");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
                            		</span>
                            	</td>
                            </tr>
                   {else}
                       {foreach item="p_emails" key="p_id" from=$TO_MAIL}
                           <tr>
                        	<td class="dvtCellLabel" align="right" width="130px;"><input type="hidden" name="Control_Pids[]" value="{$p_id}"><b><span id="panem_{$p_id}">{$FROM_SORCE[$p_id]}</span></b>:
                            {*<input name="{$elements.2.0}" id="{$elements.2.0}" type="hidden" value="{$IDLISTS}">*}
                            </td>
                        	<td class="cellText" style="padding: 2px;" valign="top">
                                <table id="table_emaillist_{$p_id}" cellpadding="2" cellspacing="0" width="100%" style="border:0px solid #C0C0C0;border-collapse:collapse">
                                {if $p_emails neq ""}{$p_emails}{/if}
                                </table>                            
                        	</td>
                        	<td class="cellText" style="padding: 5px;" width="130px;" align="left" valign="top" nowrap>
                        		<select name="parent_type_{$p_id}">
                        			{foreach key=labelval item=selectval from=$elements.1.0}
                        				{if $selectval eq selected}
                        					{assign var=selectmodule value="selected"}
                        				{else}
                        					{assign var=selectmodule value=""}
                        				{/if}
                        				<option value="{$labelval}" {$selectmodule}>{$APP[$labelval]}</option>
                        			{/foreach}
                                    <option value="other">{$EMOD.LBL_OTHER}</option>
                        		</select>
                        		&nbsp;
                        		<span  class="mailClientCSSButton">
                        		<img src="{'select.gif'|@vtiger_imageurl:$THEME}" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='addEmailAdress("{$p_id}", document.EditView.parent_type_{$p_id}.value, "index.php?module=EMAILMaker&return_module="+ document.EditView.parent_type_{$p_id}.value + "&action=Popup&html=Popup_picker&form=HelpDeskEditView&popuptype=set_return_emails&pid={$p_id}","")' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
                        		</span></td>
                           </tr>
                       {/foreach}
                   {/if}  
                   </table>
               </div>
           </td>
       </tr>                
   {else}
       <tr><td colspan="5">
       <table border=0 cellspacing=0 cellpadding=0 width=100%>
       {foreach item="tds" from=$EMAILS_TABLE}
           <tr>
           {foreach item="parray" key="td_id" from=$tds}
                {if $parray.pid neq ""}
                    <td class="cellText" style="padding: 5px; border-left:1px solid #C1C1C1;font-size:12px;">
                        <b>{$parray.pname}</b>
                    </td>
                    <td class="cellText" align="right" style="padding: 5px; border-right:1px solid #C1C1C1;" nowrap>
                    
                        <select name="parent_type_{$parray.pid}">
                			{foreach key=labelval item=selectval from=$elements.1.0}
                				{if $selectval eq selected}
                					{assign var=selectmodule value="selected"}
                				{else}
                					{assign var=selectmodule value=""}
                				{/if}
                				<option value="{$labelval}" {$selectmodule}>{$APP[$labelval]}</option>
                			{/foreach}
                		</select>
                        <span  class="mailClientCSSButton">
                		<img src="{'select.gif'|@vtiger_imageurl:$THEME}" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" LANGUAGE=javascript onclick='addEmailAdress(document.EditView.parent_type_{$parray.pid}.value, "index.php?module=EMAILMaker&return_module="+ document.EditView.parent_type_{$parray.pid}.value +"&action=Popup&html=Popup_picker&form=HelpDeskEditView&popuptype=set_return_emails&pid={$parray.pid}","");' align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
                		</span>
                    </td>
                {else}
                     <td rowspan="2" colspan="2" style="border-right:1px solid #C1C1C1;border-left:1px solid #C1C1C1;border-bottom:1px solid #C1C1C1;">&nbsp;</td>    
                {/if}
           {/foreach}
           </tr>
           
           <tr>
           {foreach item="parray" key="td_id" from=$tds}
                {if $parray.pid neq ""}
                <td id="div_emaillist_{$parray.pid}" colspan="2" style="border-right:1px solid #C1C1C1;border-left:1px solid #C1C1C1;border-bottom:1px solid #C1C1C1;" valign="top">{if $parray.pdata neq ""}{$parray.pdata}{else}&nbsp;{/if}</td>
                {/if}
           {/foreach}
           </tr>
       {/foreach}
       </table>
       </td></tr>
   {/if}
{elseif $elements.2.0 eq 'subject'}
   <tr>
	<td class="dvtCellLabel" style="padding: 5px; border-bottom:0px;" width="120px" align="right" nowrap ><font color="red">*</font>{$elements.1.0}  :</td>
        {if $WEBMAIL eq 'true' or $RET_ERROR eq 1}
                <td colspan="2" class="cellText" style="border:0px; padding: 5px;"><input type="text" class="txtBox" name="{$elements.2.0}" value="{$SUBJECT}" id="{$elements.2.0}" style="width:99%;border:1px solid #bababa;"></td>
        {else}
                <td colspan="2" class="cellText" style="border:0px; padding: 5px;"><input type="text" class="txtBox" name="{$elements.2.0}" value="{$elements.3.0}" id="{$elements.2.0}" style="width:99%;border:1px solid #bababa;"></td>
        {/if}
   </tr>
{elseif $elements.2.0 eq 'filename'}
</table>
</td>
<td valign="top" style="border-left: 1px solid #C0C0C0;border-bottom: 1px solid #C0C0C0;">
   <table width="100%">
   <tr>
    <td class="dvtCellLabel" style="padding: 5px;" align="left" nowrap>
    <div style="padding-right:5px;float:left;">
    {$elements.1.0}  :
    <select id="attachment_type" name="attachment_type" onChange="changeAttachmentToEmail(this.value)">
    <option value="file" selected>{$EMOD.LBL_FILE}</option>
    <option value="document">{$APP.Document}</option>
    </select>
    </div>
    <div id="file_btn" class="inputWrapper mailClientCSSButton" style="width: 20px;float:left;padding:0px">
    <img src="{'select.gif'|@vtiger_imageurl:$THEME}" alt="{$APP.LBL_SELECT}" title="{$APP.LBL_SELECT}" align="absmiddle" style='cursor:hand;cursor:pointer'>&nbsp;
    <input id="my_file_element" type="file" name="{$elements.2.0}" tabindex="7">
    <input type="hidden" name="{$elements.2.0}_hidden" value="" />
    </div>
    </td>
   </tr>
   <tr>
   <td class="cellText" style="padding: 0px;border:0px;">
   <div style="padding:5px;height:180px;overflow:auto;">
        {if $SHOW_PDF_TEMPLATES eq 'true'}
        <div class="cellText" style="padding:5px;"><b>{$EMOD.LBL_PDFMAKER_TEMPLATES}:</b><input type="hidden" name="pdf_template_ids" value="{$PDF_TEMPLATE_IDS}"><input type="hidden" name="pdf_language" value="{$PDF_LANGUAGE}"></div>
        <table class="small" width="100%" cellpadding="0" cellspacing="0">   
        {foreach item="pdf_template_name" key="attach_id" from=$PDFMakerTemplates}	
            <tr><td class="cellText" style="padding:2px;">
            {$pdf_template_name}
            </td></tr>
        {/foreach}
        </table>
        <div class="cellText" style="padding:5px;"><b>{$EMOD.LBL_ATTACHMENTS}:</b></div>  
        {/if}
        <input name="del_file_list" type="hidden" value="">    
        <div id="files_list">
			
		</div>
		<script>
			var multi_selector = new MultiSelector( document.getElementById( 'files_list' ), 1000 );
			multi_selector.count = 0
			multi_selector.addElement( document.getElementById( 'my_file_element' ) );
		</script>
        
        
        <div id="attach_cont" class="addEventInnerBox" style="border:0px;overflow:auto;width:100%;position:relative;left:0px;top:0px;"></div>
   </div>
   </td>
   </tr>
   </table>
</td>
</tr>


  
   <tr>
	<td colspan="3" class="mailSubHeader" style="padding: 5px;" align="center">
		<input title="{$APP.LBL_SELECTEMAILTEMPLATE_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECTEMAILTEMPLATE_BUTTON_KEY}" class="crmbutton small edit" onclick="window.open('index.php?module=EMAILMaker&action=lookupemailtemplates&pid={$PID}&formodule={$select_module}','emailtemplate','top=100,left=200,height=600,width=800,resizable=yes,scrollbars=yes,menubar=no,addressbar=no,status=yes')" type="button" name="button" value=" {$APP.LBL_SELECTEMAILTEMPLATE_BUTTON_LABEL}  ">
		<input name="{$MOD.LBL_SEND}" value=" {$APP.LBL_SEND} " class="crmbutton small save" type="button" onclick="return email_validate(this.form,'send');">&nbsp;
		<input name="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" value=" {$APP.LBL_CANCEL_BUTTON_LABEL} " class="crmbutton small cancel" type="button" onClick="window.close()">
	</td>
    </tr>
	{elseif $elements.2.0 eq 'description'}
   <tr>
	<td colspan="3" align="center" valign="top" height="320">
        {if $WEBMAIL eq 'true' or $RET_ERROR eq 1}
		<input type="hidden" name="from_add" value="{$from_add}">
		<input type="hidden" name="att_module" value="Webmails">
		<input type="hidden" name="mailid" value="{$mailid}">
		<input type="hidden" name="mailbox" value="{$mailbox}">
                <textarea style="display: none;" class="detailedViewTextBox" id="description" name="description" cols="90" rows="8">{$DESCRIPTION}</textarea>
        {else}
                <textarea style="display: none;" class="detailedViewTextBox" id="description" name="description" cols="90" rows="16">{$elements.3.0}</textarea>        {/if}
	</td>
   </tr>
	{/if}
	{/foreach}
	{/foreach}

   <tr>
	<td colspan="3" class="mailSubHeader" style="padding: 5px;" align="center">
		<input title="{$APP.LBL_SELECTEMAILTEMPLATE_BUTTON_TITLE}" accessKey="{$APP.LBL_SELECTEMAILTEMPLATE_BUTTON_KEY}" class="crmbutton small edit" onclick="window.open('index.php?module=Users&action=lookupemailtemplates','emailtemplate','top=100,left=200,height=400,width=500,menubar=no,addressbar=no,status=yes')" type="button" name="button" value=" {$APP.LBL_SELECTEMAILTEMPLATE_BUTTON_LABEL}  ">
		<input name="{$MOD.LBL_SEND}" value=" {$APP.LBL_SEND} " class="crmbutton small save" type="button" onclick="return email_validate(this.form,'send');">&nbsp;
		<input name="{$APP.LBL_CANCEL_BUTTON_TITLE}" accessKey="{$APP.LBL_CANCEL_BUTTON_KEY}" value=" {$APP.LBL_CANCEL_BUTTON_LABEL} " class="crmbutton small cancel" type="button" onClick="window.close()">
	</td>
   </tr>
</tbody>
</table>
</form>

<script>
var cc_err_msg = '{$MOD.LBL_CC_EMAIL_ERROR}';
var no_rcpts_err_msg = '{$MOD.LBL_NO_RCPTS_EMAIL_ERROR}';
var bcc_err_msg = '{$MOD.LBL_BCC_EMAIL_ERROR}';
var conf_mail_srvr_err_msg = '{$MOD.LBL_CONF_MAILSERVER_ERROR}';
{literal}

function addEmailAdress(pid,parent_type, popup_link, email)
{
    if (parent_type == "other")
    {
        email_adress = prompt("{/literal}{$EMOD.LBL_SET_EMAIL_ADRESS}{literal}", email);
        
        if (email_adress)
        {
            var reg = /^([A-Za-z0-9_\-\.])+\@([A-Za-z0-9_\-\.])+\.([A-Za-z]{2,4})$/;

            if(reg.test(email_adress) == false) 
            {
               alert('{/literal}{$EMOD.LBL_INVALID_EMAIL_ADRESS}{literal}');
               addEmailAdress("other", "", email_adress)
               
               return false;
            }
            else
            {
                email_exists = window.document.getElementById('emailadress_'+pid+'_0_'+email_adress);
                if (!email_exists)
                {
                    var el_name = pid+'_email_'+email_adress;
                    
                    var selectbox = '<select name="ToEmails[]" id="to_email_' + el_name + '" style="font-size:10px;"><option value="normal_' + el_name + '">To:</option><option value="cc_' + el_name + '">Cc :</option><option value="bcc_' + el_name + '">Bcc :</option></select>';
                    
                    var clear_btn = '<img src="themes/images/clear_field.gif" alt="Clear" title="Clear" LANGUAGE=javascript onClick="clearEmailFromTable(\'26\',\'\',\'\',this); return false;" align="absmiddle" style="cursor:hand;cursor:pointer">';
                    
                    border_style = '1px solid #C0C0C0';
                    
                    var new_tr = window.document.getElementById('table_emaillist{/literal}{if $TYPE eq "1"}'{else}_'+pid{/if}{literal}).insertRow(0);
                    
                    new_tr.id = 'emailadress_'+pid+'_email_'+email_adress;
                    
                    var td1 = new_tr.insertCell(0);
                    var td2 = new_tr.insertCell(1);
                    var td3 = new_tr.insertCell(2);
                    
                    td1.innerHTML = selectbox;
                    td1.width = "10px";

                    td2.innerHTML = "{/literal}{$EMOD.LBL_OTHER}{literal} <i>&lt;" + email_adress + "&gt;</i>";
                    td2.style.fontSize = "10px"; 
                    td2.style.lineHeight = "12px";

                    td3.innerHTML = clear_btn;
                    td3.width = "10px";
                }
            }
        }
        
    }
    else
    {
        window.open(popup_link,"test","width=640,height=602,resizable=0,scrollbars=0,top=150,left=200");
    }
}  

function addDocumentIntoEmail(document_id, document_name)
{
    var list_target = document.getElementById("files_list")
	
    var table = document.createElement('table');
    table.id = "document_attachment_" + document_id;
    table.width = "100%";
    table.className = "small";
    table.cellpadding = "0";
    table.cellspacing = "0";
    
    var rowCount = table.rows.length;
    var row = table.insertRow(rowCount);

    var cell1 = row.insertCell(0);
    cell1.className = "cellText";
    cell1.innerHTML = document_name;
    
    var attachment_input = document.createElement( 'input' );
	attachment_input.name = 'documents[]';
    attachment_input.type = 'hidden';
	attachment_input.value = document_id;
    cell1.appendChild(attachment_input);

    var cell2 = row.insertCell(1);
    cell2.noWrap = true;
    cell2.width = "20px";
    cell2.align = "right";
    cell2.className = "cellText";
    cell2.innerHTML = "";
    
    a = document.createElement('a');
    a.innerText = alert_arr["LBL_DEL"];
    a.textContent = alert_arr["LBL_DEL"];
    a.href = 'javascript:;';
    a.onclick= function()
    {
		this.parentNode.parentNode.parentNode.parentNode.removeChild( this.parentNode.parentNode.parentNode);
		return false;
	};
     
    cell2.appendChild(a);

    list_target.appendChild( table );
} 
 
 
function changeAttachmentToEmail(attachment_type_val) 
{
    if (attachment_type_val == "document")
    {
            alert('{/literal}{$EMOD.LBL_DOCUMENT_NOT_AVAILABLE_IN_FREE}{literal}');
            document.getElementById("attachment_type").value = "file";
    }  
} 

function email_validate(oform,mode)
{
	if(trim(mode) == '')
	{
		return false;
	}
	
	if(oform.subject.value.replace(/^\s+/g, '').replace(/\s+$/g, '').length==0)
	{
		if(email_sub = prompt('You did not specify a subject from this email. If you would like to provide one, please type it now','(no-Subject)'))
		{
			oform.subject.value = email_sub;
		}else
		{
			return false;
		}
	}
    
    var control_pids = controlPids();
    if(!control_pids)
	{
		return false;
	}
    
	if(mode == 'send')
	{
		server_check()	
	}else if(mode == 'save')
	{
		oform.action.value='Save';
		oform.submit();
	}else
	{
		return false;
	}
}
//function to extract the mailaddress inside < > symbols.......for the bug fix #3752
function findAngleBracket(mailadd)
{
        var strlen = mailadd.length;
        var success = 0;
        var gt = 0;
        var lt = 0;
        var ret = '';
        for(i=0;i<strlen;i++){
                if(mailadd.charAt(i) == '<' && gt == 0){
                        lt = 1;
                }
                if(mailadd.charAt(i) == '>' && lt == 1){
                        gt = 1;
                }
                if(mailadd.charAt(i) != '<' && lt == 1 && gt == 0)
                        ret = ret + mailadd.charAt(i);

        }
        if(/^[a-z0-9]([a-z0-9_\-\.]*)@([a-z0-9_\-\.]*)(\.[a-z]{2,3}(\.[a-z]{2}){0,2})$/.test(ret)){
                return true;
        }
        else
                return false;

}
function server_check()
{
	var oform = window.document.EditView;
        new Ajax.Request(
        	'index.php',
                {queue: {position: 'end', scope: 'command'},
                	method: 'post',
                        postBody:"module=Emails&action=EmailsAjax&file=Save&ajax=true&server_check=true",
			onComplete: function(response) {
			if(response.responseText.indexOf('SUCCESS') > -1)
			{
				oform.send_mail.value='true';
				oform.action.value='Save';
                oform.module.value='EMAILMaker';
				oform.submit();
			}else
			{
				//alert('Please Configure Your Mail Server');
				alert(conf_mail_srvr_err_msg);
				return false;
			}
               	    }
                }
        );
}

function clearEmailFromTable(pid,entity_id,email_id,r)
{
   //email_element = document.getElementById('emaildiv_'+pid+'_'+entity_id+'_'+email_id);
   //email_element.parentNode.removeChild(email_element);   

   var i=r.parentNode.parentNode.rowIndex;
   {/literal}
   {if $TYPE eq "1"}
       document.getElementById('table_emaillist').deleteRow(i);
   {else} 
       document.getElementById('table_emaillist_'+pid).deleteRow(i);
   {/if} 
   {literal} 
}  

function controlPids()
{
    var error = 0;
    var HaveTo = new Array();
    var allSelectEls = document.getElementsByTagName("select"); 
    for(var i=0;i<allSelectEls.length;i++)
	{
        if(allSelectEls[i].getAttribute("name")!="ToEmails[]")continue;
        Control_Vals = allSelectEls[i].value.split("_");
        
        if (Control_Vals[0] == "normal")
        {
            HaveTo[Control_Vals[1]] = true;
        }
	}
    
    var allInputEls=document.getElementsByTagName("input");
	for(var i=0;i<allInputEls.length;i++)
	{
        if(allInputEls[i].getAttribute("name")!="Control_Pids[]")continue;
        var control = allInputEls[i].value;
 
        if (!HaveTo[control])
        {
            p_name = document.getElementById("panem_"+ control).innerHTML;
            alert("\"" + p_name + "\" {/literal}{$EMOD.LBL_HAVE_NOT_ADRESS_TO}{literal}");
            error++;    
        }  
	}

    if (error > 0) 
        return false;
    else
        return true;    
}                       
{/literal}

</script>
<script type="text/javascript" defer="1">
	var textAreaName = 'description';
	CKEDITOR.replace( textAreaName,	{ldelim}
		extraPlugins : 'uicolor',
		uiColor: '#dfdff1'
	{rdelim} ) ;
	var oCKeditor = CKEDITOR.instances[textAreaName];
</script>
</body>
</html>
