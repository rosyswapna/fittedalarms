<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
 <div class="breadcrumb">
  <!--   <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>-->
  </div>

<script>

$(document).ready(function(){



$("#frm_contact").submit(function(e) {
     var self = this;
     e.preventDefault();
 	  var callback = $("#callback").val();
	  var product = $("#product").val();
	  var comments = $("#comments").val();
	  var description = "From : Contact us \r\nComments : "+comments + "\r\n   Preffered Call Back Time : "+callback;
		$("#description").val(description);
      	self.submit();
		//return false;
     });
    return false; //is superfluous, but I put it here as a fallback

		
});



</script>

 <div class="contact">
  <h1><?php echo $heading_title; ?></h1>
  <div id="text">Simply complete the form below (we’ve tried to keep the questions to a minimum) and we will be in touch shortly. Don’t worry, we won't share your details with any other third party. We hate spam as much as you do!</div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">
    <form id ="frm_contact"name="Contact us" action="http://<?php echo $_SERVER["SERVER_NAME"] ?>/crm/modules/Webforms/capture.php" method="post" accept-charset="utf-8">
		<input type="hidden" name="publicid" value="b8051cb070f69dbff213b17c89c7fff2"></input>
		<input type="hidden" name="name" value="Contact us"></input>
		
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="85%">
      <tbody>
		<tr>
			<td colspan="2" class="contact_sub_head" height="30"><strong>Contact us Using the form</strong> <div id="valid1"></div></td>
	  	</tr>
      <tr>
        <td class="texttablebody" height="30" width="50%">First Name *</td>
        <td height="30" width="50%">
		 <input type="text" value="" name="firstname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
        </td>
      </tr>
      <tr>
        <td class="texttablebody" height="30" width="50%">Last Name *</td>
        <td height="30" width="50%">
     <input type="text" value="" name="lastname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
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
        <td class="texttablebody" height="30" width="50%">Comments </td>
        <td height="30" width="50%">
			<textarea  name="comments" id="comments"  style="border:#D4D4D4 dotted 1px;max-width:200px;max-height:150px;"></textarea>
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
    </form></td>
    <td width="50%" align="center" valign="top">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
         <td height="30" class="contact_sub_head"><strong><?php echo $text_contact_sub_head1; ?></strong></td>
        </tr>
      <tr>
        <td height="30"><p>
      Fitted Home Alarms Ltd<br />
      1 Twyford Place<br />
       Lincolns Inn Office Village<br />
       Lincoln Road<br />
       High Wycombe<br />
       Buckinghamshire<br />
       HP12 3RE
    </p></td>
        </tr>
      <tr>
        <td height="30"><p>
      Phone :  <strong>0800 193 8727    
<br />
                020 3137 8727
    </strong><br />
    Mail : 
    <a href="mailto:sales@fittedhomealarms.co.uk"><strong>
      sales@fittedhomealarms.co.uk
    </strong></a></p></td>
        </tr>
    </table></td>
  </tr>
</table>
</div>
  <?php echo $content_bottom; ?></div>
  </div>
<?php echo $footer; ?>
