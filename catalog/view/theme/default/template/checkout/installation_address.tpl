

  <input type="radio" name="installation_address" value="existing" id="installation-address-existing" checked="checked" />
  <label for="installation-address-existing"><?php echo $text_address_billing; ?></label>
  

  <p>
    <input type="radio" name="installation_address" value="new" id="installation-address-new" />
    <label for="installation-address-new"><?php echo $text_address_installation; ?></label>
  </p>



<div id="installation-new" style="display: <?php echo ($billing_addresses ? 'none' : 'block'); ?>;">
  <table class="form">
    <tr>
      <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
      <td><input type="text" name="firstname" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
      <td><input type="text" name="lastname" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
   <!-- <tr>
      <td><?php echo $entry_company; ?></td>
      <td>--><input type="hidden" name="company" value="none" class="large-field" /><!--</td>
    </tr>-->
    <?php //if ($company_id_display) { ?>
<!--    <tr>
      <td><?php //if ($company_id_required) { ?>
        <span class="required">*</span>
        <?php //} ?>
        <?php echo $entry_company_id; ?></td>
      <td>--><input type="hidden" name="company_id" value="none" class="large-field" /><!--</td>
    </tr>-->
    <?php //} ?>
    <?php if ($tax_id_display) { ?>
    <tr>
      <td><?php if ($tax_id_required) { ?>
        <span class="required">*</span>
        <?php } ?>
        <?php echo $entry_tax_id; ?></td>
      <td><input type="text" name="tax_id" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
    <?php } ?>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_address_1; ?></td>
      <td><input type="text" name="address_1" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
    <tr>
      <td><?php echo $entry_address_2; ?></td>
      <td><input type="text" name="address_2" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_city; ?></td>
      <td><input type="text" name="city" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
    <tr>
      <td><span id="installation-postcode-required" class="required">*</span> <?php echo $entry_postcode; ?></td>
      <td><input type="text" name="postcode" value="" class="large-field"  style="border:#D4D4D4 dotted 1px;"/></td>
    </tr>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_country; ?></td>
      <td><select name="country_id" class="large-field"  style="border:#D4D4D4 dotted 1px;">
          <option value=""><?php echo $text_select; ?></option>
          <?php foreach ($countries as $country) { ?>
          <?php if ($country['country_id'] == $country_id) { ?>
          <option value="<?php echo $country['country_id']; ?>" selected="selected"><?php echo $country['name']; ?></option>
          <?php } else { ?>
          <option value="<?php echo $country['country_id']; ?>"><?php echo $country['name']; ?></option>
          <?php } ?>
          <?php } ?>
        </select></td>
    </tr>
    <tr>
      <td><span class="required">*</span> <?php echo $entry_zone; ?></td>
      <td><select name="zone_id" class="large-field" style="border:#D4D4D4 dotted 1px;">
        </select></td>
    </tr>
  </table>

</div>

<br />

<div class="continue">
  <div class="right">
    <input type="button" value="<?php echo $button_continue; ?>" id="button-installation-address" class="button" />
  </div>
</div>


<script type="text/javascript"><!--
$(document).ready(function(){
  
  var rd = $('#installation-address input[name=\'installation_address\']').value;
  if (rd == 'new') {
      $('#installation-new').show();
  } else {
      $('#installation-new').hide();
  }
});
$('#installation-address input[name=\'installation_address\']').live('change', function() {

	if (this.value == 'new') {
		$('#installation-new').show();
	} else {
		$('#installation-new').hide();
	}
});
//--></script> 
<script type="text/javascript"><!--
$('#installation-address select[name=\'country_id\']').bind('change', function() {
	if (this.value == '') return;
	$.ajax({
		url: 'index.php?route=checkout/checkout/country&country_id=' + this.value,
		dataType: 'json',
		beforeSend: function() {
			$('#installation-address select[name=\'country_id\']').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('.wait').remove();
		},			
		success: function(json) {
			if (json['postcode_required'] == '1') {
				$('#installation-postcode-required').show();
			} else {
				$('#installation-postcode-required').hide();
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
			
			$('#installation-address select[name=\'zone_id\']').html(html);
		},
		error: function(xhr, ajaxOptions, thrownError) {
			alert(thrownError + "\r\n" + xhr.statusText + "\r\n" + xhr.responseText);
		}
	});
});

$('#installation-address select[name=\'country_id\']').trigger('change');
//--></script>