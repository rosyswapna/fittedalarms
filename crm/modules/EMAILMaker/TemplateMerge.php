<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
require_once('include/utils/CommonUtils.php');
require_once('modules/EMAILMaker/ConvertEMAIL.php');
global $default_charset;

if(isset($_REQUEST['templateid']) && $_REQUEST['templateid'] !='')
{
	$templatedetails = getEMAKERTemplateDetails($_REQUEST['templateid'],$_REQUEST['email_type'],$_REQUEST['pmodule'],$_REQUEST['pid']);
}
?>
<form name="frmrepstr" onsubmit="VtigerJS_DialogBox.block();">
<input type="hidden" name="subject" value="<?php echo $templatedetails[2];?>"></input>
<textarea name="repstr" style="visibility:hidden">
<?php echo htmlentities($templatedetails[1], ENT_NOQUOTES, $default_charset); ?>
</textarea>
</form>
<script type="text/javascript">
//my changes
if(typeof window.opener.document.getElementById('subject') != 'undefined' &&
	window.opener.document.getElementById('subject') != null){
	window.opener.document.getElementById('subject').value = window.document.frmrepstr.subject.value;
	window.opener.document.getElementById('description').value = window.document.frmrepstr.repstr.value;
	window.opener.oCKeditor.setData(window.document.frmrepstr.repstr.value);
}
window.close();
</script>

<?PHP
function getEMAKERTemplateDetails($templateid, $email_type, $pmodule, $pid)
{
        global $adb,$log;
        $log->debug("Entering into getTemplateDetails($templateid) method ...");
        $returndata =  Array();
        
        if ($email_type == "emailmaker")
        {
            $result = $adb->pquery("select * from vtiger_emakertemplates where templateid=?", array($templateid));
            $returndata[] = $templateid;
            
            $subject = $adb->query_result($result,0,'subject');
            $body = $adb->query_result($result,0,'body');

            if ($pid != "") 
            {
                $Email_Content = new EMAILContent();
                $Email_Content->setContent($subject."|@{[&]}@|".$body, "", $pmodule, $pid);
                $convert_content = $Email_Content->getContent(false); 
            
                list($subject,$body) = explode("|@{[&]}@|",$convert_content);
            }
            
            $returndata[] = $body;
            $returndata[] = $subject;
        }
        else
        {
            $result = $adb->pquery("select * from vtiger_emailtemplates where templateid=?", array($templateid));
            $returndata[] = $templateid;
            $returndata[] = $adb->query_result($result,0,'body');
            $returndata[] = $adb->query_result($result,0,'subject');
        }
        
        $log->debug("Exiting from getTemplateDetails($templateid) method ...");
        return $returndata;
}
?>