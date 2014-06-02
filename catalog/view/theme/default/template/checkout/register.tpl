<div class="right" style="height:auto;">
<div style="width:450px;border:#CE6700 solid 1px;padding:0 0 5px 0;border-radius:10px;">
<div class="login_head"><?php echo $text_new_customer; ?></div>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="45%" height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_firstname; ?></td>
    <td width="55%" height="25"><input type="text" name="firstname" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_lastname; ?></td>
    <td height="25"><input type="text" name="lastname" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_email; ?></td>
    <td height="25"><input type="text" name="email" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_telephone; ?></td>
    <td height="25"><input type="text" name="telephone" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
    <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_mobile; ?></td>
    <td height="25"><input type="text" name="mobile" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  <!--
  <tr>
    <td height="25" class="register_titles"><?php echo $entry_fax; ?>&nbsp;</td>
    <td height="25"><input type="text" name="fax" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  -->

 <!--
  <tr>
    <td height="25" class="register_titles"><span id="payment-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?>&nbsp;</td>
    <td height="25"><input type="text" name="postcode" id="postcode" value="<?php echo $postcode; ?>" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br />
     <img src="/image/data/find-address.jpg" alt="Find Address" width="111" height="28" id="SearchAddress" style="margin-left:10px; cursor:pointer"/>
    </td>
  </tr>
-->
  <tr>
    <td height="25" class="register_titles">&nbsp;&nbsp;&nbsp;<?php echo $entry_postcode; ?><br /></td>
    <td height="25">
      <input type="text" name="postcode" id="postcode"  value="<?php echo $postcode; ?>" style="border:#D4D4D4 dotted 1px;width:70px;"/>
      <img src="/image/data/find-address.jpg" alt="Find Address" width="90" height="24" id="SearchAddress" style="margin-left:5px; cursor:pointer;vertical-align:middle"/><br />
    </td>
  </tr>
  <tr>
    <td height="25" colspan="2" class="register_titles">
    &nbsp;&nbsp;&nbsp;<input type="checkbox" name"chk-manual" id="chk-manual"/> Enter Address Manually
    </td>
  </tr>

  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_address_1; ?><br />
&nbsp;</td>
    <td height="25"><input type="text" name="address_1" id="address_1" value="" class="large-field" style="border:#D4D4D4 dotted 1px;" disabled="disabled" /><br /></td>
  </tr>
  <tr>
    <td height="25" class="register_titles">&nbsp;&nbsp;&nbsp;<?php echo $entry_address_2; ?><br />
&nbsp;</td>
    <td height="25"><input type="text" name="address_2" id="address_2" value="" class="large-field" style="border:#D4D4D4 dotted 1px;" disabled="disabled"/><br /></td>
  </tr>
  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_city; ?>&nbsp;</td>
    <td height="25"><input type="text" name="city" id="city" value="" class="large-field" style="border:#D4D4D4 dotted 1px;" disabled="disabled"/><br /></td>
  </tr>


  

  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_zone; ?><br/></td>
    <td height="25"><select name="zone_id" class="large-field" style="border:#D4D4D4 dotted 1px;">
</select><br />&nbsp;</td>
  </tr>

  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_country; ?>&nbsp;</td>
    <td height="25"><select name="country_id" class="large-field" style="border:#D4D4D4 dotted 1px;">
  <option value=""><?php echo $text_select; ?></option>
  <?php foreach ($countries as $country) { ?>
  <?php if ($country['country_id'] == $country_id) { ?>
  <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
  <?php } else { ?>
  <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
  <?php } ?>
  <?php } ?>
</select><br />&nbsp;</td>
  </tr>
  
  <tr>
    <td height="25" class="register_titles"><span class="required">*</span> <?php echo $entry_password; ?>&nbsp;</td>
    <td height="25"><input type="password" name="password" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  <tr>
    <td height="25" class="register_titles">
  <span class="required">*</span> <?php echo $entry_confirm; ?>
	</td>
    <td height="25"><input type="password" name="confirm" value="" class="large-field" style="border:#D4D4D4 dotted 1px;"/><br /></td>
  </tr>
  <tr>
    <td height="25" colspan="2" style="padding-left:10px;"> <input type="checkbox" name="newsletter" value="1" id="newsletter" style="border:#D4D4D4 dotted 1px;"/>&nbsp;&nbsp;<label for="newsletter"><?php echo $entry_newsletter; ?></label></td>
    </tr>
  <div style="clear: both; padding-top: 15px; border-top: 1px solid #EEEEEE;">
  <?php if ($shipping_required) { ?><tr>
    <td height="25" colspan="2" style="padding-left:10px;"><input type="checkbox" name="shipping_address" value="1" id="shipping" checked="checked" style="border:#D4D4D4 dotted 1px;"/>&nbsp;&nbsp;<label for="shipping"><?php echo $entry_shipping; ?></label></td>
    </tr><?php } ?>
</div>
  <tr>
    <td height="25" colspan="2"><?php if ($text_agree) { ?>
  <div class="continue">
    <div class="right"><?php echo $text_agree; ?>
      <input type="checkbox" name="agree" value="1" />
      <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="button" />
      </div>
  </div>
  <?php } else { ?>
  <div class="continue">
    <div class="right">
      <input type="button" value="<?php echo $button_continue; ?>" id="button-register" class="button" />
      </div>
  </div>
  <?php } ?>&nbsp;</td>
    </tr>

</table>
</div>

<!-- <h2><?php echo $text_your_details; ?></h2>
<h2><?php echo $text_your_password; ?></h2>-->
<!--</div>
<div class="right">
  <h2><?php echo $text_your_address; ?></h2>
  <?php echo $entry_company; ?><br />-->
  <input type="hidden" name="company" value="none" class="large-field" style="border:#D4D4D4 dotted 1px;"/>
  <!--<br />
  <br />-->
  <!--<div style="display: <?php echo (count($customer_groups) > 1 ? 'table-row' : 'none'); ?>;">-->
 <!-- <?php echo $entry_customer_group; ?><br />-->
  <?php foreach ($customer_groups as $customer_group) { ?>
  <?php if ($customer_group['customer_group_id'] == $customer_group_id) { ?>
  <input type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" checked="checked"  style="display:none"/>
  <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" style="display:none"><?php echo $customer_group['name']; ?></label>

  <?php } else { ?>
  <input  style="display:none" type="radio" name="customer_group_id" value="<?php echo $customer_group['customer_group_id']; ?>" id="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" />
  <label for="customer_group_id<?php echo $customer_group['customer_group_id']; ?>" style="display:none"><?php echo $customer_group['name']; ?></label>
  <?php } ?>
  <?php } ?>
 <!-- <br />
</div>-->
<div id="company-id"  style="display:none"><span id="company-id-required" class="required">*</span> <?php echo $entry_company_id; ?><input type="hidden" name="company_id" value="none" class="large-field" />
</div>
<div id="tax-id-display" style="display:none"><span id="tax-id-required" class="required">*</span> <?php echo $entry_tax_id; ?><input type="hidden" name="tax_id" value="none" class="large-field" />
 </div>
</div>
<!--<div style="clear: both; padding-top: 15px; border-top: 1px solid #EEEEEE;">
</div>-->

<script type="text/javascript"><!--
$('#payment-address input[name=\'customer_group_id\']:checked').live('change', function() {
	var customer_group = [];
	
<?php foreach ($customer_groups as $customer_group) { ?>
	customer_group[<?php echo $customer_group['customer_group_id']; ?>] = [];
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_display'] = '<?php echo $customer_group['company_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['company_id_required'] = '<?php echo $customer_group['company_id_required']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_display'] = '<?php echo $customer_group['tax_id_display']; ?>';
	customer_group[<?php echo $customer_group['customer_group_id']; ?>]['tax_id_required'] = '<?php echo $customer_group['tax_id_required']; ?>';
<?php } ?>	

	if (customer_group[this.value]) {
		if (customer_group[this.value]['company_id_display'] == '1') {
			$('#company-id-display').show();
		} else {
			$('#company-id-display').hide();
		}
		
		if (customer_group[this.value]['company_id_required'] == '1') {
			$('#company-id-required').show();
		} else {
			$('#company-id-required').hide();
		}
		
		if (customer_group[this.value]['tax_id_display'] == '1') {
			$('#tax-id-display').show();
		} else {
			$('#tax-id-display').hide();
		}
		
		if (customer_group[this.value]['tax_id_required'] == '1') {
			$('#tax-id-required').show();
		} else {
			$('#tax-id-required').hide();
		}	
	}
});

$('#payment-address input[name=\'customer_group_id\']:checked').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('#payment-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#payment-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#payment-postcode-required').show();
			} else {
				$('#payment-postcode-required').hide();
			}
			
			html = '<option value=""><?php echo $text_select; ?></option>';
			
			if (json['zone'] != '') {

				for (i = 0; i < json['zone'].length; i++) {
        			html += '<option value="' + json['zone'][i]['zone_id'] + '"';
	    			
					if (json['zone'][i]['zone_id'] == '<?php echo $zone_id; ?>') {
	      				html += ' selected="selected"';
	    			}
	
	    			html += '>' + json['zone'][i]['name'] + '</option>';
				}
			} else {
				html += '<option value="0" selected="selected"><?php echo $text_none; ?></option>';
			}
			
			$('#payment-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#payment-address select[name=\'country_id\']').trigger('change');
//--></script> 
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	width: 640,
	height: 480
});
//--></script> 
<script type="text/javascript">
//var af = jQuery.noConflict();
	$(document).ready(function () {
		$('#SearchAddress').bind('click', function () {
			//alert('aaa');
			//alert($('#postcode').val());
			if($('#postcode').val()!=""){
			$(this).colorbox({
				href: 'postcodefinder/findpostcode.php?post=' + encodeURI($('#postcode').val()),
				onComplete: function () {
					if ($('#closeMe').html() == '') {
						failedAddress();
					}
				}
			});
			}else{
				alert('Please fill postcode');
			}
		});
	});

	function setAddress(address1,address2,city, county) {
		$('#address_1').val(address1);
		$('#address_2').val(address2);
		$('#city').val(city);
		$('#county').val(county);
		$('#address').show();
		$.colorbox.close();
	}

	function failedAddress() {
		af.colorbox.close();
		alert('Sorry. Unable to process the request. You can also enter the details manually.');
		af('#address').show();
		af('#search').hide();
	}



  $("#chk-manual").click(function(){

    if($(this).attr('checked')){
      $('#address_1').removeAttr('disabled');
      $('#address_2').removeAttr('disabled');
      $('#city').removeAttr('disabled');
      $('#address_1').focus();
    }else{
      $('#address_1').attr('disabled','disabled');
      $('#address_2').attr('disabled','disabled');
      $('#city').attr('disabled','disabled');
      $('#postcode').focus();
    }
  });
</script>