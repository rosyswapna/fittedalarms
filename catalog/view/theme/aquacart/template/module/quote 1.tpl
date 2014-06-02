<?php echo $header; ?>
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
<div class="getquote">
  <h1><?php echo $heading_title; ?></h1>
  <div id="text">Simply complete the form below (we’ve tried to keep the questions to a minimum) and we will be in touch shortly. Don’t worry, we won't share your details with any other third party. We hate spam as much as you do!</div>

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
        <td class="texttablebody" height="30" width="50%">Your Name *</td>
        <td height="30" width="50%">
		 <input type="text" value="" name="lastname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
        </td>
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
        <td class="texttablebody" height="30" width="50%">Product *</td>
        <td height="30" width="50%">
          <select name="product" id="product" style="border:#D4D4D4 dotted 1px;width:100px;">
                    <option value="Home Alarms">        Home Alarms</option>
                    <option value="Safes">        Safes</option>
                    <option value="CCTVs">        CCTVs</option>
                    </select></td>
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
        <td height="30" width="50%">&nbsp;</td>
        <td height="30" width="50%">&nbsp;</td>
      </tr>
      <tr>
        <td colspan="2" height="30" align="center" valign="middle">
        <div class="buttons">
		<input type="submit" class="button" id="button_submit" value="Submit" ></input>
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
    <td width="50%" align="center" valign="top"><a href="image/data/maps.jpg"><img src="image/data/maps.jpg" width="220" height="183" /></a>
    <div id="textblock"><strong>
      Please note:
    </strong>
        We currently only operate in the following counties:  Bedfordshire, Berkshire, Buckinghamshire, Cambridgeshire, East Sussex, Essex, Gloucestershire, Greater London, Hampshire, Hertfordshire, Kent, Leicestershire, Northamptonshire, Oxfordshire, Surrey, Warwickshire, West Midlands, West Sussex and Wiltshire.
    </div></td>
  </tr>
</table>
</div>
   <?php echo $footer; ?>
