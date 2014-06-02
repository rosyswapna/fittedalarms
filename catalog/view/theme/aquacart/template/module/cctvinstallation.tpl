<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?>
<script>


$(document).ready(function(){



$("#frm_get_quote").submit(function(e) {
	var captcha_org="";
	 var self = this;
     e.preventDefault();
$.get("http://fittedalarms.acubedemo.com/index.php?route=module/getcaptcha",function(data,status){
//$.get("http://fittedhomealarms.local/index.php?route=module/getcaptcha",function(data,status){
	//alert("Data: " + data + "\nStatus: " + status);
	captcha_org=data;
	  var callback = $("#callback").val();
	  var product = $("#product").val();
	  var comments = $("#comments").val();
	  var captcha = $("#captcha").val();
	   var roomnos = $("#roomnos").val();
	  var housetype = $("#housetype").val();
	  var makemodel = $("#makemodel").val();
	  var description = "From : CCtv Installation \r\nComments : "+comments + "\r\n   Preffered Call Back Time : "+callback+ "\r\n"+"    Product : "+product+ "\r\n   Number of rooms : "+roomnos+ "\r\n  House type : "+housetype+ "\r\n  Make and Model : "+makemodel;
		$("#description").val(description);
		captcha_org="-"+captcha_org+"-";
		captcha="-"+captcha+"-";
		
		if(captcha_org == captcha){
      	self.submit();
		return false;
		}else{
		alert("Captcha doesnt match");
		return false;	
		}
     });
    return false;
	});
	 
 	 //is superfluous, but I put it here as a fallback

		
});



</script>
<div class="getquote">
  <h1><?php echo $heading_title; ?></h1>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">
<form id ="frm_get_quote"name="Get a Quote" action="http://<?php echo $_SERVER["SERVER_NAME"] ?>/crm/modules/Webforms/capture.php" method="post" accept-charset="utf-8">
		<input type="hidden" name="publicid" value="1b4f80b3e54c8d2bf6b325987952e45f"></input>
		<input type="hidden" name="name" value="Get a Quote"></input>
		
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="85%">
      <tbody><tr>
        <td colspan="2" height="30"><div id="valid1"></div></td>
        </tr>
      <tr>
        <td class="texttablebody" height="30" width="50%">Name *</td>
        <td height="30" width="50%">
		 <input type="text" value="" name="lastname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
        </td>
      </tr>
      <tr>
        <td class="texttablebody" height="30">Address</td>
        <td height="30"><label for="address"></label>
          <textarea name="address" id="address"></textarea></td>
      </tr>
      <tr>
        <td class="texttablebody" height="30" width="50%">Company *</td>
        <td height="30" width="50%">
		<input type="text" value="" name="company"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
        </td>
      </tr>

      <tr>
        <td class="texttablebody" height="30" width="50%">Post Code *</td>
        <td height="30" width="50%">
			<input type="text" value="" name="code"  required="true" style="border:#D4D4D4 dotted 1px;"  ></input>
		</td>
      </tr>
      <tr>
        <td class="texttablebody" height="30" width="50%">Email *</td>
        <td height="30" width="50%">
			<input type="text" value="" name="email" style="border:#D4D4D4 dotted 1px;"  required="true"></input></td>
      </tr>
      <tr>
        <td class="texttablebody" height="30" width="50%">Phone *</td>
        <td height="30" width="50%">
		  <input type="text" value="" name="phone"  required="true" style="border:#D4D4D4 dotted 1px;"  ></input>
		</td>
      </tr>
      <tr>
        <td class="texttablebody" height="30">Number of Rooms</td>
        <td height="30">
          <select name="roomnos" id="roomnos" style="border:#D4D4D4 dotted 1px;width:50px;">
            <option value="1">1</option>
            <option value="2">2</option>
            <option value="3">3</option>
            <option value="4">4</option>
            <option value="5">5</option>
            <option value="6">6</option>
            <option value="7">7</option>
            <option value="8">8</option>
            <option value="9">9</option>
            <option value="10">10</option>
          </select></td>
      </tr>
      <tr>
        <td class="texttablebody" height="30">House type</td>
        <td height="30">
          <select name="housetype" id="housetype" style="border:#D4D4D4 dotted 1px;width:125px;">
            <option value="Flat">Flat</option>
            <option value="Appartment">Appartment</option>
            <option value="Semi detached">Semi detached</option>
            <option value="Detached">Detached</option>
            <option value="Cottage/bunglow">Cottage/bunglow</option>
          </select></td>
      </tr>

      <tr>
        <td class="texttablebody" height="30" width="50%">Product *</td>
        <td height="30" width="50%">
          <select name="product" id="product" style="border:#D4D4D4 dotted 1px;width:125px;">
                    <option value="Home Alarms">Home Alarms</option>
                    <option value="Safes">Safes</option>
                    <option value="CCTVs">CCTVs</option>
                    </select></td>
      </tr>
      <tr>
        <td class="texttablebody" height="30">Make and Model</td>
        <td height="30">
          <input type="text" name="makemodel" id="makemodel" /></td>
      </tr>



      <tr>
        <td class="texttablebody" height="30" width="50%">Comments </td>
        <td height="30" width="50%">
			<textarea  name="comments" id="comments"  ></textarea>
        </td>
      </tr>


      <tr>
        <td class="texttablebody" height="30" width="50%">Preffered Call Back Time *</td>
        <td height="30" width="50%">
          <input name="callback" id="callback" style="border:#D4D4D4 dotted 1px;" type="text"></td>
      </tr>
      <tr>
        <td height="30" width="50%"><span class="required">*</span> <?php echo $entry_captcha; ?></td>
        <td height="30" width="50%"> <input type="text" id="captcha" name="captcha" value="<?php echo $captcha; ?>" style="border:#D4D4D4 dotted 1px;" />
    <br />
    <img src="index.php?route=information/contact/captcha" alt="" />
    <?php if ($error_cctvinstallation_captcha) { ?>
    <span class="error"><?php echo $error_cctvinstallation_captcha; ?></span>
    <?php } ?></td>
      </tr>
      <tr>
        <td colspan="2" height="30" align="center" valign="middle">
        
        <div class="buttons">
		<input type="submit" class="button" id="button_submit" value="Submit"  /></input>
        <input type="hidden" id="callback_check" name="callback_check" value="callback" />
		<div  style="width:0px; overflow:hidden;">
			<input type="text" value="" name="description" id="description"  style="width:0px;" ></input>
			<select style="width:0px;" name="leadsource[]" >
				<option value="Web Site">Web Site</option>
			</select>
		</div>
        </div></td>
        </tr>
    </tbody></table>
    </form>
    </td>
    <td width="50%" align="center" valign="top"><a class="inline cboxElement" href="#map_zoom"><img src="image/data/maps.jpg" width="220" height="183" /></a>
    <div id="textblock"><strong>
      Please note:
    </strong>
        We currently only operate in the following counties:  Bedfordshire, Berkshire, Buckinghamshire, Cambridgeshire, East Sussex, Essex, Gloucestershire, Greater London, Hampshire, Hertfordshire, Kent, Leicestershire, Northamptonshire, Oxfordshire, Surrey, Warwickshire, West Midlands, West Sussex and Wiltshire.
    </div></td>
  </tr>
</table>
</div>
</div>
   <?php echo $footer; ?>
