{*<!--
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
-->*}
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
    <meta http-equiv="Content-Type" content="text/html; charset={$APP.LBL_CHARSET}">
    <title>{$MOD.TITLE_COMPOSE_MAIL}</title>
    <link REL="SHORTCUT ICON" HREF="include/images/vtigercrm_icon.ico">	
    <style type="text/css">@import url("themes/{$THEME}/style.css");</style>
  </head>
  <body class="small" marginwidth=0 marginheight=0 leftmargin=0 topmargin=0 bottommargin=0 rightmargin=0>
<script language="JavaScript" type="text/javascript" src="include/js/json.js"></script>
<script language="JavaScript" type="text/javascript" src="include/js/general.js"></script>
<script language="javascript" type="text/javascript" src="include/scriptaculous/prototype.js"></script>   
<table width="100%" border="0" cellspacing="0" cellpadding="0" class="mailClient mailClientBg">
	<tr>
		<td>
			<table width="100%" border="0" cellpadding="0" cellspacing="0">
				<tr>
					<td class="moduleName" width="80%" style="padding-left:10px;">{$MOD.LBL_MODULE_NAME}</td>
					<td  width=30% nowrap class="componentName" align=right></td>
				</tr>
			</table>
            <div id="info_div">
    			<center>
                    <table width="50%" cellpadding="5" cellspacing="0" border="0"  class="homePageMatrixHdr">
        				<tr>
        					<td style="padding:10px;" >
        						<form name="basicSearch" action="index.php" onsubmit="callSearch('Basic');return false;">
        						<table width="100%" cellpadding="5" cellspacing="0">
        						<tr>
        							<td class="dvtCellLabel" align="center" style="line-height:30px;">
                                    <big>{$STRING1}</big><br><small>{$STRING2}</small>
                                    </td>
        						</tr>
        						</table>
        						</form>
        					</td>
        				</tr>
                    </table>
                </center>
                <div id="status" style="padding-bottom:17px;"><center><img src="{$IMAGE_PATH}status.gif"></center></div>
            </div>
            <div id="ListViewContents">
                <center>
                    <table width="50%" border="0" cellspacing="0" cellpadding="0" class="small">
                       	<tr>
                    	    <td style="padding:10px;">
                    		    <div style="overflow:auto;height:348px;">
                            		<table style="background-color: rgb(204, 204, 204);" class="small" border="0" cellpadding="5" cellspacing="1" width="100%">
                            		<tbody>
                            		<tr><td class="lvtCol" id="process_title">{$MOD.LBL_EMAILS_DISTRIBUTION}</td></tr>
                            		<tr bgcolor=white onMouseOver="this.className='lvtColDataHover'" onMouseOut="this.className='lvtColData'"><td id="process_content">{$PROCESS_CONTENT}</td></tr>
                            		</tbody>
                            	    </table>
                    			</div>
                    	    </td>
                    	</tr>
                    </table>
                </center>
                <table width="100%" align="center" class="reportCreateBottom">
                <tr>
                	<td align="right" style="padding: 5px;">&nbsp;</td><td width="35%">&nbsp;</td>
                </tr>
                </table>
            </div>
		</td>
	</tr>
</table>
<script>
{literal}
function sentEmailPopUpAjax(esentid)
{
    var url = "module=EMAILMaker&action=EMAILMakerAjax&file=processedEmail&mode=ajax&ajax=true&style=1&esentid="+esentid;

	new Ajax.Request(
		'index.php',
		{
			queue: {position: 'end', scope: 'command'},
			method: 'post',
			postBody:url,
			onComplete: function(response){ 
				popupText = trim(response.responseText);

                var pdata = popupText.split("|@|");
                
                if (pdata[1] == "undefined")
                {
                    window.self.close();
                }
                else
                {
                    document.getElementById('process_title').innerHTML = pdata[1]; 
                    document.getElementById('process_content').innerHTML = pdata[2]; 
                    
                    if (pdata[0] == "END") 
                    {
                        setTimeout("window.self.close()", 8000);
                        
                        document.getElementById('status').style.display = "none"; 
                    }
                    else if (pdata[0] == "END_ERRORS")
                    {
                         document.getElementById('info_div').style.display = "none";    
                    } 
                    else
                    {
                         sentEmailPopUpAjax(esentid); 
                    }
                }
			}
		}
	);
} 
{/literal}
sentEmailPopUpAjax('{$ESENTID}');
</script>   

  </body>
</html>
