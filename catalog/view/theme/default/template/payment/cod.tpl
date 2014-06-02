<!--<div class="continue">
  <div class="right">
    <input type="button" value="<?php echo $button_confirm; ?>" id="button-confirm" class="button" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-confirm').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/cod/confirm',
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
</script> 
-->
<div class="continue">
  <div class="right">
    <input type="button" value="Proceed To Payment" id="button-proceed-to-payment" class="button" />
  </div>
</div>
<script type="text/javascript"><!--
$('#button-proceed-to-payment').bind('click', function() {
	$.ajax({ 
		type: 'get',
		url: 'index.php?route=payment/cod/confirm',
		beforeSend: function() {
			$('#button-proceed-to-payment').attr('disabled', true);
			$('#button-proceed-to-payment').after('<span class="wait">&nbsp;<img src="catalog/view/theme/default/image/loading.gif" alt="" /></span>');
		},
		complete: function() {
			$('#button-proceed-to-payment').attr('disabled', false);
			$('.wait').remove();
		},	
		success: function() {
			location = '<?php echo $continue; ?>';
		}		
	});
});
//--></script> 
