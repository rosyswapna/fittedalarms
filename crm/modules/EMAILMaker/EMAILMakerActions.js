/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
var msgnum = 0;
var control_emails = "";

function getSelectedEmailTemplates(select_name)
{
    var selectedColStr = "";
    var selectedColumnsObj=getObj(select_name);
    if (selectedColumnsObj)
    {
        for (i=0;i<selectedColumnsObj.options.length;i++)
        {
        	 if(selectedColumnsObj.options[i].selected)
        	 {
                 selectedColStr += selectedColumnsObj.options[i].value + ";";
             }
        }
    }
    return selectedColStr;
}

function getSelectedEmailTemplate(select_name)
{
    var selectedColumnsObj=getObj(select_name);
    var selectedColStr = "";
    for (i=0;i<selectedColumnsObj.options.length;i++)
    {
    	 if(selectedColumnsObj.options[i].selected)
    	 {
             selectedColStr = selectedColumnsObj.options[i].value ;
         }
    }
    
    return selectedColStr;
}

function sendEMakerMail(module,idstrings)
{
    var smodule = document.DetailView.module.value;
	var record = document.DetailView.record.value;
	
	$("vtbusy_info").style.display="inline";
    new Ajax.Request(
            'index.php',
            {queue: {position: 'end', scope: 'command'},
                    method: 'post',
                    postBody: "module=EMAILMaker&return_module="+module+"&action=EMAILMakerAjax&file=mailSelect&idlist="+idstrings,
                    onComplete: function(response) 
                    {
                        if(response.responseText == "Mail Ids not permitted" || response.responseText == "No Mail Ids")
    					{
                            ele = Math.floor(new Date().getTime() / 1000);
                            openPopUp('xComposeEmail'+ele,this,'index.php?module=EMAILMaker&action=EMAILMakerAjax&file=EditView&pmodule='+module+'&pid='+idstrings+'&sendmail=true&commontemplateid='+getSelectedEmailTemplates("use_common_email_template"),'createemailWin'+ele,1100,850,'menubar=no,toolbar=no,location=no,status=no,resizable=no'); 
						}	
    					else{
                            getObj('sendemakermail_cont').innerHTML=response.responseText;
                            var EMAKERMail = document.getElementById('sendemakermail_cont');
                            var EMAKERMailHandle = document.getElementById('sendemakermail_cont_handle');
                            Drag.init(EMAKERMailHandle,EMAKERMail);
                        }
                        $("vtbusy_info").style.display="none"; 						  
                    }
            }
    );
}

function validate_sendEMAKERmail(idlist,module)
{
    var smodule = document.DetailView.module.value;
	var record = document.DetailView.record.value;
	var j=0;
	var chk_emails = document.SendEMAKERMail.elements.length;
	var oFsendmail = document.SendEMAKERMail.elements
    var field_lists = "";
    
	email_type = new Array();
	for(var i=0 ;i < chk_emails ;i++)
	{
		if(oFsendmail[i].type != 'button')
		{
			if(oFsendmail[i].checked != false)
			{
				email_type [j++]= oFsendmail[i].value;
			}
		}
	}
	
	$("vtbusy_info").style.display="inline";
    
    if(email_type != '') field_lists = email_type.join(':');
    
    ele = Math.floor(new Date().getTime() / 1000);
    
    popup_url = 'index.php?module=EMAILMaker&action=EMAILMakerAjax&file=EditView&pid='+record+'&pmodule='+module+'&idlist='+idlist+'&field_lists='+field_lists+'&sendmail=true&commontemplateid='+getSelectedEmailTemplates("use_common_email_template"); 
    

    if (document.getElementById("use_email_pdf_template"))
    {
        var pdftemplate = document.getElementById("use_email_pdf_template").value;
        var pdftemplate_language = document.getElementById("email_pdf_template_language").value;
        popup_url += '&pdftemplateid='+pdftemplate+'&language='+pdftemplate_language;
    }
    
    
    openPopUp('xComposeEmail'+ele,this,popup_url,'createemailWin'+ele,1100,850,'menubar=no,toolbar=no,location=no,status=no,resizable=no'); 
    $("vtbusy_info").style.display="none"; 	

    fninvsh('roleLayEMAILMaker');
	return true;

}

function getSelectedEMAILPDFTemplates(type)
{
    var selectedColumnsObj=getObj("use_email_pdf_template_"+type);
    var selectedColStr = "";
    for (i=0;i<selectedColumnsObj.options.length;i++)
    {
    	 if(selectedColumnsObj.options[i].selected)
    	 {
             selectedColStr += selectedColumnsObj.options[i].value + ";";
         }
    }
    
    return selectedColStr;
}

function _defEmailMakerTimer(){
	var EmailMakerTimer = null;
	var EMAKER_POLLTIME = 5000;	//vtigercrm polls the asterisk server for incoming calls after every 3 seconds for now
	var EMAKER_INCOMING_DIV_TIMEOUT = 15;	//the incoming call div is present for this number of seconds
	function EmailMakerCallback() {
		var url = "module=EMAILMaker&action=EMAILMakerAjax&file=EMAILMakerMessesages&mode=ajax&ajax=true";
		new Ajax.Request(
			'index.php',
			{
				queue: {position: 'end', scope: 'command'},
				method: 'post',
				postBody:url,
				onComplete: function(response){
					popupText = trim(response.responseText);
					if(popupText != '' && popupText != 'failure'){
						var div = popupText;
						Popup_vtiger = _defPopup2();
						Popup_vtiger.content = div;
						Popup_vtiger.displayPopup(Popup_vtiger.content,EMAKER_INCOMING_DIV_TIMEOUT);
					}
				}
			}
		);
	}

	function EmailMakerRegisterCallback(timeout) {
		if(timeout == null) timeout = EMAKER_POLLTIME;
		if(EmailMakerTimer == null) {
			EmailMakerCallback();
			EmailMakerTimer = setInterval(EmailMakerCallback, timeout);
		}
	}

	return {
		registerCallback: EmailMakerRegisterCallback,
		pollTimer: EMAKER_POLLTIME
	};
}

//EmailMakerTimer = _defEmailMakerTimer();

//EmailMakerTimer.registerCallback(EmailMakerTimer.pollTimer);



function _defPopup2(){
	var maxheight = 75;	//maximum height of the popup
	var incrementHeight = 2; //incremental height of the popup
	var remainOnScreen = ""; //the time for which the popup remains on screen
	var randomID = Math.floor(Math.random()*10001);

	var popupDiv = document.createElement('div');
	var parentDiv = document.getElementById('notificationDiv');
	parentDiv.appendChild(popupDiv);
	popupDiv.id = randomID;
	popupDiv.className = "lvtCol";
	popupDiv.style.float="right"; 
	popupDiv.style.paddingRight="5px";
	popupDiv.style.overflow="hidden";
	popupDiv.style.right="0px";
	popupDiv.style.bottom="0px";
	popupDiv.style.borderColor="rgb(141, 141, 141)";
	popupDiv.style.borderTop="1px black solid";
	popupDiv.style.borderBottom="1px black solid";
	popupDiv.style.padding="2px";
	popupDiv.style.zIndex=10;
	popupDiv.style.fontWeight="normal";
	popupDiv.align="left";	//the popup to be displayed on screen
	var node;
	
    function getID(){
    
        return popupDiv.id;
    }
    
	function CreatePopup(node, time){
		parentDiv.style.display = "block";
		if(time != undefined && time != ""){
			remainOnScreen = time * 1000;
		}
		popupDiv.innerHTML = node; 
		popupDiv.style.display = "block";
		popupDiv.style.display = "";
		var dimension = getDimension(popupDiv);
		maxheight = dimension.y;
		
		popupDiv.style.height = "0px";
		ShowPopup(); 
	}
	
	function ShowPopup(){
 
        popupDiv.style.height = "80px"; 
	}
	
	function HidePopup(){

        var height = popupDiv.style.height.substring(0,popupDiv.style.height.indexOf("px"));
		if (parseInt(height) > 0) { 
			height = parseInt(height) - incrementHeight;
			if(height<0){
				height=0;
			}
			popupDiv.style.height = height+"px";
			setTimeout(HidePopup, 1); 
		} else { 
			ResetPopup();
		} 

	}
	
	function ResetPopup(){
		popupDiv.innerHTML = "";
		popupDiv.style.height = "0px"; 
		popupDiv.style.display = "none";
	}
	
	return {
		displayPopup: CreatePopup,
        getPopupID: getID,
		content: node
	};
}

function HideEmailPopup(popupid)
{
    popup_div = document.getElementById(popupid);
    
    var height = popup_div.style.height.substring(0,popup_div.style.height.indexOf("px"));
	if (parseInt(height) > 0) { 
		height = parseInt(height) - 2;
		if(height<0){
			height=0;
		}
		popup_div.style.height = height+"px";
		setTimeout("HideEmailPopup('"+popupid+"')", 1); 
	} else { 
		popup_div.innerHTML = "";
	    popup_div.style.height = "0px"; 
       	popup_div.style.display = "none";
	} 
}

    
function startEmailProcessed(esentid)
{
    if (control_emails != "") clearTimeout(control_emails);
   
    Popup_vtiger = _defPopup2();
    
    popupid = Popup_vtiger.getPopupID();

    var url = "module=EMAILMaker&action=EMAILMakerAjax&file=EMAILMsg&mode=ajax&ajax=true&type=show&esentid="+esentid;

	new Ajax.Request(
		'index.php',
		{
			queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody:url,
			onComplete: function(response){ 
				popupText = trim(response.responseText);

                if (popupText != "")
                {
                    var pdata = popupText.split("@");
    
                    if (pdata[1] != "undefined")
                    {
                        Popup_vtiger.content = pdata[1];
                    	Popup_vtiger.displayPopup(Popup_vtiger.content,"");
                        
                        setTimeout("sentEmailAjax('"+popupid+"','"+esentid+"')", 3000);
                    }
                }
			}
		}
	);
    
}

function sentEmailAjax(popupid,esentid)
{
    var url = "module=EMAILMaker&action=EMAILMakerAjax&file=EMAILMsg&mode=ajax&ajax=true&type=show&esentid="+esentid;

	new Ajax.Request(
		'index.php',
		{
			queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody:url,
			onComplete: function(response){ 
				popupText = trim(response.responseText);

                if (popupText != "")
                {
                    var pdata = popupText.split("@");
    
                    if (pdata[1] == "undefined")
                    {
                        HideEmailPopup(popupid);
                    }
                    else
                    {
                        document.getElementById(popupid).innerHTML = pdata[1]; 
                        
                        if (pdata[0] != "END")
                        {
                            setTimeout("sentEmailAjax('"+popupid+"','"+esentid+"')", 3000);
                        } 
                        else
                        {
                            setTimeout("HideEmailPopup('"+popupid+"')", 8000); 
                            control_emails = setTimeout("controlEmails()", 10000); 
                        }
                    }
                }
			}
		}
	);
}

function controlEmails()
{
    if (Ajax)
    {
        var url = "module=EMAILMaker&action=EMAILMakerAjax&file=EMAILMsg&mode=ajax&ajax=true&type=control";
    
    	new Ajax.Request(
    		'index.php',
    		{
    			queue: {position: 'end', scope: 'command'},
    			method: 'post',
    			postBody:url,
    			onComplete: function(response){ 
    				popupText = trim(response.responseText);
    
                    if (popupText != "NO")
                    {
                        esentid = popupText * 1;
                        if (esentid > 0) startEmailProcessed(esentid);
    
                    } 
                    else
                    {
                        control_emails = setTimeout("controlEmails()", 10000); 
                    }
    			}
    		}
    	);
    }    
}

function addPDFMakerTemplates(type)
{
    var add_pdf_div = document.getElementById("add_pdf_template_attachment_btn_" + type);
    var pdf_div = document.getElementById("pdf_template_attachment_" + type);
    
    add_pdf_div.style.display = "none";
    pdf_div.style.display = "block";
}

function removePDFMakerTemplates(type)
{
    var add_pdf_div = document.getElementById("add_pdf_template_attachment_btn_" + type);
    var pdf_div = document.getElementById("pdf_template_attachment_" + type);
    
    add_pdf_div.style.display = "block";
    pdf_div.style.display = "none";
}

function openPopUpForSent(esentid) 
{ 
    openPopUp('xSentEmails'+esentid,this,'index.php?module=EMAILMaker&action=EMAILMakerAjax&file=EMAILPopUp&esentid='+esentid,'sentemailWin'+esentid,420,300,'menubar=no,toolbar=no,location=no,status=no,resizable=yes,scrollbars=yes');
}

controlEmails();
