<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?>
<script>

$(document).ready(function(){



$("#frm_get_quote").submit(function(e) {
     var self = this;
     e.preventDefault();
 	  var callback = $("#callback").val();
	  var product = $("#product").val();
	  var comments = $("#comments").val();
	  var description = "From : Get A Quote \r\nComments : "+comments + "\r\n   Preffered Call Back Time : "+callback+ "\r\n"+"    Product : "+product;
		$("#description").val(description);
      	self.submit();
		//return false;
     });
    return false; //is superfluous, but I put it here as a fallback

		
});



</script>
<div class="aboutus" style="margin-top:-15px;"><br />
  <h1><?php echo $heading_title; ?></h1>
  <div id="text">Fitted Home Alarms are specialist security installers for residential homes operating in South and Central England.<br /><br />
<table width="95%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2" class="headadd">We offer the following services:</td>
      </tr>
      <tr>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">Professional no non sense  advice on home security </td>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">Home Security Surveys</td>
      </tr>
      <tr>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">Professional Burglar Alarm Fitting</td>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">Installation of Fire Safes and  Security <em>Safe</em></td>
      </tr>
      <tr>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">CCTV System Installations</td>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">Annual Alarm Servicing</td>
      </tr>
      <tr>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text">Alarm Programming and Training</td>
        <td width="50%" height="30" align="left" valign="top" class="aboutus_text"><a href="index.php?route=module/cctvinstallation">Installation Only Services</a></td>
      </tr>
      <tr>
        <td width="50%" height="30" align="left" valign="middle"><img src="image/data/map-main-about.jpg" width="322" height="200" /></td>
        <td width="50%" height="30" align="left" valign="middle"><img src="image/data/turnaround.jpg" width="322" height="200" /></td>
      </tr>
      <tr>
        <td height="30" class="aboutus_body">
        We currently operate in Bedfordshire, Berkshire, Buckinghamshire,    Cambridgeshire, East Sussex, Gloucestershire, Greater London, Hampshire,    Hertfordshire, Kent, Leicestershire, Northamptonshire, Oxfordshire,   Surrey,  Warwickshire, West Midlands, West Sussex and Wiltshire.</td>
        <td height="30" class="aboutus_body">
        We are one of the fastest growing home security companies in England. We    are a quick turnaround company. We aim to do all our installations   within 5  days of alarm order. And for your peace of mind, we all our   installations with  warranty. All our alarms are priced keeping   customers affordability in mind. </td>
      </tr>
      <tr>
        <td height="30">&nbsp;</td>
        <td height="30">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="headadd">With our home alarms and CCTV systems:</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">No hidden charges. </td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">No contract traps. </td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">No monthly fees. </td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">Our customers own the product  completely. </td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">Our alarms are fitted by manufacturer trained specialist engineers. </td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">We do not employ any sales professionals or use any high pressure sales  tactics. </td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">We strive in providing excellent and sound advice on security  requirements.</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">All our installation services come with warranty for your peace of  mind. Anything goes wrong, rest assured, <br />
we will be there to fix it.</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">All our installers are CRB checked for the protection of our clients.</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">We source all the security equipments as cheap as we can and try to  pass on our savings to our customers.</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">We pride in being one of the most competitive priced security  installers in the country.</td>
      </tr>
      <tr>
        <td height="30" colspan="2" class="aboutussmallbody">99% of our customers would  recommend us again. (Based on Customer Satisfaction Survey from May to August  2012)</td>
      </tr>
      <tr>
        <td height="30" colspan="2">&nbsp;</td>
      </tr>

      <tr>
        <td colspan="2" >
        <div class="callrightnow"><a style="color:#FFFFFF" href="index.php?route=information/contact"><img width="46" height="47" src="image/data/callusicon.png"></img>
      Call us today to speak to one of our specialist installers and discuss you home security systems.
  <img width="46" height="47" style="float:right" src="image/data/arrow-double.png"></img></a></div>
        </td>
      </tr>
      <tr>
        <td height="30" colspan="2">&nbsp;</td>
      </tr>
    </table>
  </div>


</div>
</div>
   <?php echo $footer; ?>
