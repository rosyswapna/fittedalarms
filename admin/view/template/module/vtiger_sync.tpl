<?php echo $header; ?>
<div id="content">
<div class="breadcrumb">
  <?php foreach ($breadcrumbs as $breadcrumb) { ?>
  <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
  <?php } ?>
</div>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<div class="box">
  <div class="heading">
    <h1><img src="view/image/module.png" alt="" /> <?php echo $heading_title; ?></h1>
    <div class="buttons"><a onclick="$('#form').submit();" class="button"><span><?php echo $button_save; ?></span></a><a onclick="location = '<?php echo $cancel; ?>';" class="button"><span><?php echo $button_cancel; ?></span></a></div>
  </div>
  <div class="content">
  <div id="tabs" class="htabs"><a href="#vtiger_sync_tab_general"><?php echo $text_vtiger_sync_tab_general; ?></a><a href="#vtiger_sync_tab_vtiger"><?php echo $text_vtiger_sync_tab_vtiger; ?></a><a href="#vtiger_sync_tab_account"><?php echo $text_vtiger_sync_tab_account; ?></a><a href="#vtiger_sync_tab_invoice"><?php echo $text_vtiger_sync_tab_invoice; ?></a></div>
    <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	     <div id="vtiger_sync_tab_general">
	        <table class="form">
	         <tr>
	          <td><?php echo $entry_vtiger_sync_status; ?></td>
	          <td><select name="vtiger_sync_status">
	              <?php if ($vtiger_sync_status) { ?>
	              <option value="1" selected="selected"><?php echo $text_enabled; ?></option>
	              <option value="0"><?php echo $text_disabled; ?></option>
	              <?php } else { ?>
	              <option value="1"><?php echo $text_enabled; ?></option>
	              <option value="0" selected="selected"><?php echo $text_disabled; ?></option>
	              <?php } ?>
	            </select></td>
	        </tr>
	        <tr>
	          <td><?php echo $entry_vtiger_sync_debug_mode; ?></td>
	          <td><select name="vtiger_sync_debug_mode">
	              <?php if ($vtiger_sync_debug_mode) { ?>
	              <option value="1" selected="selected"><?php echo $text_yes; ?></option>
	              <option value="0"><?php echo $text_no; ?></option>
	              <?php } else { ?>
	              <option value="1"><?php echo $text_yes; ?></option>
	              <option value="0" selected="selected"><?php echo $text_no; ?></option>
	              <?php } ?>
	            </select>&nbsp;<?php echo $text_vtiger_sync_debug_mode; ?></td>
	        </tr>
	        <tr>
	          <td><?php echo $entry_vtiger_sync_auto_assigned; ?></td>
	          <td><select name="vtiger_sync_auto_assigned">
	              <?php if ($vtiger_sync_auto_assigned) { ?>
	              <option value="1" selected="selected"><?php echo $text_yes; ?></option>
	              <option value="0"><?php echo $text_no; ?></option>
	              <?php } else { ?>
	              <option value="1"><?php echo $text_yes; ?></option>
	              <option value="0" selected="selected"><?php echo $text_no; ?></option>
	              <?php } ?>
	            </select>&nbsp;<?php echo $text_vtiger_sync_auto_assigned; ?></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_url; ?></td>
	          <td><input type="text" name="vtiger_sync_url" value="<?php echo $vtiger_sync_url; ?>" size="50"/>
	          <?php echo $entry_vtiger_sync_eg; ?>
	            <?php if ($error_vtiger_sync_url) { ?>
	            <span class="error"><?php echo $error_vtiger_sync_url; ?></span>
	            <?php } ?></td>
	        </tr>         
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_user_id; ?></td>
	          <td><input type="text" name="vtiger_sync_user_id" value="<?php echo $vtiger_sync_user_id; ?>" size="50"/>
	            <?php if ($error_vtiger_sync_user_id) { ?>
	            <span class="error"><?php echo $error_vtiger_sync_user_id; ?></span>
	            <?php } ?></td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_accesskey; ?></td>
	          <td><input type="text" name="vtiger_sync_accesskey" value="<?php echo $vtiger_sync_accesskey; ?>" size="50"/>
	            <?php if ($error_vtiger_sync_accesskey) { ?>
	            <span class="error"><?php echo $error_vtiger_sync_accesskey; ?></span>
	            <?php } ?></td>
	        </tr> 
	        <tr>
	          <td valign="top"><span class="required">*</span> <?php echo $entry_vtiger_sync_invoice_status; ?></td>
	          <td>
	          		<?php foreach ($order_statuses as $order_status) { ?>                  
		                  <?php if (in_array($order_status['order_status_id'], (array)$vtiger_sync_invoice_status)) { ?>
			                  <input type="checkbox" name="vtiger_sync_invoice_status[]" value="<?php echo $order_status['order_status_id']; ?>" checked="checked" />
			                  <?php echo $order_status['name']; ?><br/>
			                  <?php } else { ?>
			                  <input type="checkbox" name="vtiger_sync_invoice_status[]" value="<?php echo $order_status['order_status_id']; ?>" />
			                  <?php echo $order_status['name']; ?><br/>
		                  <?php } ?>		                  
	                  <?php } ?>
	          </td>
	        </tr>
	        
	         <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_delivered_status; ?></td>
	          <td><select name="vtiger_sync_delivered_status">
	           	  <?php foreach ($order_statuses as $order_status) { ?>           	   
	             	<?php if (in_array($order_status['order_status_id'], (array)$vtiger_sync_delivered_status)) { ?>
	              		<option value="<?php echo $order_status['order_status_id']; ?>" selected="selected"><?php echo $order_status['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $order_status['order_status_id']; ?>"><?php echo $order_status['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>
	        <tr>
	          <td>&nbsp;</td>
	          <td><?php echo $heading_title . " " . $text_vtiger_sync_powered_by; ?></td>
	        </tr>                    
      	</table>      
       </div>
       <div id="vtiger_sync_tab_vtiger">
          <table class="form">
           <tr>
	          <td>&nbsp;</td>	          
	          <td><a id="async" name="async" href="#" title="<?php echo $text_vtiger_sync_load_params_data; ?>"><img border="0" src="view/image/data-sync.png" width="48" height="48" /><div><br/><b><?php echo $text_vtiger_sync_load_params_data; ?></b></div></a><div id="syncMessage"></div></td>
	        </tr>
           <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_gl_account; ?></td>
	          <td><select name="vtiger_sync_gl_account">
	           	  <?php foreach ($glaccts as $glacct) { ?>           	   
	             	<?php if (in_array($glacct['name'], (array)$vtiger_sync_gl_account)) { ?>
	              		<option value="<?php echo $glacct['name']; ?>" selected="selected"><?php echo $glacct['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $glacct['name']; ?>"><?php echo $glacct['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_user_role; ?></td>
	          <td><select name="vtiger_sync_user_role">
	           	  <?php foreach ($sync_roles as $sync_role) { ?>           	   
	             	<?php if (in_array($sync_role['ref_key'], (array)$vtiger_sync_user_role)) { ?>
	              		<option value="<?php echo $sync_role['ref_key']; ?>" selected="selected"><?php echo $sync_role['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $sync_role['ref_key']; ?>"><?php echo $sync_role['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_product_id; ?></td>
	          <td><select name="vtiger_sync_product_id">
	           	  <?php foreach ($vtiger_productcf as $productcf) { ?>           	   
	             	<?php if (in_array($productcf['ref_key'], (array)$vtiger_sync_product_id)) { ?>
	              		<option value="<?php echo $productcf['ref_key']; ?>" selected="selected"><?php echo $productcf['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $productcf['ref_key']; ?>"><?php echo $productcf['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>
	        
          </table>
        </div>
        <div id="vtiger_sync_tab_account">
          <table class="form">
           <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_account_customer_id; ?></td>
	          <td><select name="vtiger_sync_account_customer_id">
	           	  <?php foreach ($vtiger_accountscf as $vaccount) { ?>           	   
	             	<?php if (in_array($vaccount['ref_key'], (array)$vtiger_sync_account_customer_id)) { ?>
	              		<option value="<?php echo $vaccount['ref_key']; ?>" selected="selected"><?php echo $vaccount['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $vaccount['ref_key']; ?>"><?php echo $vaccount['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>	
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_contact_id; ?></td>
	          <td><select name="vtiger_sync_contact_id">
	           	  <?php foreach ($vtiger_contactscf as $vcontact) { ?>           	   
	             	<?php if (in_array($vcontact['ref_key'], (array)$vtiger_sync_contact_id)) { ?>
	              		<option value="<?php echo $vcontact['ref_key']; ?>" selected="selected"><?php echo $vcontact['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $vcontact['ref_key']; ?>"><?php echo $vcontact['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>	        
          </table>
        </div>
        <div id="vtiger_sync_tab_invoice">
          <table class="form">
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_default_invoice_status; ?></td>
	          <td><select name="vtiger_sync_default_invoice_status">
	           	  <?php foreach ($invoicestatuses as $invoicestatus) { ?>           	   
	             	<?php if (in_array($invoicestatus['name'], (array)$vtiger_sync_default_invoice_status)) { ?>
	              		<option value="<?php echo $invoicestatus['name']; ?>" selected="selected"><?php echo $invoicestatus['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $invoicestatus['name']; ?>"><?php echo $invoicestatus['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>
	        <tr>
	          <td><?php echo $entry_vtiger_sync_default_invoice_product_attribute; ?></td>
	          <td><select name="vtiger_sync_default_invoice_product_attribute">
	           	  <?php foreach ($vtiger_invoicecfs as $vtiger_invoicecf) { ?>           	   
	             	<?php if (in_array($vtiger_invoicecf['ref_key'], (array)$vtiger_sync_default_invoice_product_attribute)) { ?>
	              		<option value="<?php echo $vtiger_invoicecf['ref_key']; ?>" selected="selected"><?php echo $vtiger_invoicecf['name']; ?></option>
	              	<?php } else { ?>
	              		<option value="<?php echo $vtiger_invoicecf['ref_key']; ?>"><?php echo $vtiger_invoicecf['name']; ?></option>
	              	<?php } ?>
	              <?php } ?>              
	            </select>            
	          </td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_shipping_handling_charge_tax; ?></td>
	          <td><select name="vtiger_sync_shipping_handling_charge_tax">
	              <?php if ($vtiger_sync_shipping_handling_charge_tax =='YES') { ?>
	              <option value="YES" selected="selected"><?php echo $text_yes; ?></option>
	              <option value="NO"><?php echo $text_no; ?></option>
	              <?php } else { ?>
	              <option value="YES"><?php echo $text_yes; ?></option>
	              <option value="NO" selected="selected"><?php echo $text_no; ?></option>
	              <?php } ?>
	            </select>
	          </td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_tax_mode; ?></td>
	          <td><select name="vtiger_sync_tax_mode">
	              <?php if ($vtiger_sync_tax_mode == 'individual') { ?>
	              <option value="individual" selected="selected"><?php echo $text_individual; ?></option>
	              <option value="group"><?php echo $text_group; ?></option>
	              <?php } else { ?>
	              <option value="individual"><?php echo $text_individual; ?></option>
	              <option value="group" selected="selected"><?php echo $text_group; ?></option>
	              <?php } ?>
	            </select>
	          </td>
	        </tr>
	        <tr>
	          <td><span class="required">*</span> <?php echo $entry_vtiger_sync_discount_type_final; ?></td>
	          <td><select name="vtiger_sync_discount_type_final">
	              <option value="amount" selected="selected"><?php echo $text_amount; ?></option>
	            </select>
	          </td>
	        </tr>
          </table>
        </div>
    </form>
  </div>
</div>
<script type="text/javascript"><!--
$(function(){
    $("#async").click(function(){
 		var params = 'go=loaddata&type=POST';	
 		$.ajax({
        type: "POST",
        data: params,
        url: "load-parameters-data.php",
        dataType: "json",
	        success: function(data) {
	               $("#syncMessage").html("<div id='syncMessage'><img src='view/image/ajax-loader.gif' /> Loading Parameters Data. Please wait...</div>").fadeIn().delay(2000).fadeOut(2000);	 
	        }			 
	     });			 
	 		return false;
	    });
	});
//--></script>
<script type="text/javascript"><!--
$('#tabs a').tabs(); 
//--></script> 
<script type="text/javascript"><!--

$('#form').bind('submit', function() {
	var module = new Array(); 

	$('#module tbody').each(function(index, element) {
		module[index] = $(element).attr('id').substr(10);
	});
	
	$('input[name=\'vtiger_sync_module\']').attr('value', module.join(','));
});
//--></script>
