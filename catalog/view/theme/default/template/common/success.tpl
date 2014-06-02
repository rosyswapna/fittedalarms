<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;"><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h2><?php echo $heading_title; ?></h2><br />

  <?php echo $text_message; ?><br />
  <!-- <?php if(!empty($current_order_fts)){?>

  <div class="cart_box" id="printdiv" style="height:auto;">
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="25" class="heads"><strong>Sl no</strong></td>
    <td height="25" class="heads"><strong>Name</strong></td>
    <td height="25" class="heads"><strong>Qty</strong></td>
    <td height="25" class="heads"><strong>Price</strong></td>
    </tr>
 <?php $order_total='';
 $total_price='';
 $i=1;
  foreach($current_order_fts as $current_order_ft){ ?><tr>
    <td height="25" class="texttablebody"><?php echo $i;?></td>
    <td height="25" align="left" valign="middle" class="texttablebody"><?php echo $current_order_ft['name'];?><br />
    <?php $totaladdon="0"; if(!empty($current_order_ft["order_products_addons"])){ ?>
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr><td bgcolor="#EAC984" colspan="4" class="headstyle">And selected add ons</td></tr>
        <?php 
        // echo "<pre>"; print_r($current_order_ft["order_products_addons"]); echo "</pre>";
         foreach($current_order_ft["order_products_addons"] as $order_products_addon){// print_r($order_products_addon);?><tr>
          <td width="50%"><?php echo $order_products_addon['name'];?></td>
          <td width="25%"><?php echo $order_products_addon['quantity'];?></td>
          <td width="25%"><?php echo $order_products_addon['price'];?></td>
        </tr>        <?php  $addonprice=$order_products_addon['quantity']*$order_products_addon['price'];
         $totaladdon+=$addonprice;?><?php }?>

      </table>
      <?php }?>
      </td>
    <td height="25" class="texttablebody"><?php echo $current_order_ft['qty'];?></td>
    <td height="25" class="texttablebody">£<?php echo $current_order_ft['price'];?></td>
    </tr><?php $order_total=$current_order_ft['totalprice']+$totaladdon;?>
 <?php $i++;  $total_price+=$order_total;}
?>
  <tr>
   <td height="25">&nbsp;</td>
   <td height="25">&nbsp;</td>
   <td height="25" class="texttablebody"><strong>Total</strong></td>
   <td height="25" class="texttablebody"><strong>£<?php echo $total_price;?></strong></td>
   </tr>

</table>
</div><br /><br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<br />
<?php }?>-->
<?php if(isset($order_info)){ ?>
<div id="order-details">
  
    <table width="100%" >
      <thead>
      <tr>
        <td colspan="2">Order Details</td>
      </tr>
      </thead>

      <tbody>
      <tr>
        <td >
          Order ID : <?php echo $order_info['order_id'];?><br/>
          Date Added : <?php echo $order_info['date_added'];?><br/>
          Payment Method : <?php echo $order_info['payment_method'];?>
        </td>
        <td>
          Email : <?php echo $order_info['email'];?><br/>
          Telephone : <?php echo $order_info['telephone'];?><br/>
         
        </td>
      </tr>
      </tbody>
    </table>

    <table width="100%">
      <thead>
      <tr><td>Payment Address</td></tr>
      </thead>
      <tbody>
      <tr><td><?php echo $order_info['payment_address'];?></td></tr>
      </tbody>
    </table>

    <table width="100%">
      <thead>
      <tr><td>Installation Address</td></tr>
      </thead>
      <tbody>
      <tr><td><?php echo $order_info['installation_address'];?></td></tr>
      </tbody>
    </table>

    <?php if($order_info['products']){?>
    <table width="100%" border="1">
      <thead>
      <tr>
        <td >Product</td>
        <td>Model</td>
        <td>Quantity</td>
        <td>Price</td>
        <td>Total</td>
      </tr>
      </thead>

      <tbody>
      <?php foreach($order_info['products'] as $product){?>
      <tr>
        <td><?php echo $product['name']; ?></td>
        <td><?php echo $product['model']; ?></td>
        <td><?php echo $product['quantity']; ?></td>
        <td><?php echo $product['price']; ?></td>
        <td><?php echo $product['total']; ?></td>
      </tr>
      <?php }?>

       <?php if($order_info['installation_charge']){?>

      <tr>
        <td colspan="4" style="text-align:right;font-weight:bold;">Installation Charge</td>
        <td><?php echo $order_info['installation_charge']; ?></td>
      </tr>

      <?php }?>

      <?php if($monthly_charge){?>

      <tr>
        <td colspan="4" style="text-align:right;font-weight:bold;">Monthly Charge</td>
        <td><?php echo $monthly_charge; ?></td>
      </tr>

      <?php }?>



      <?php if($totals){
        foreach ($totals as $total) {
      ?>

      <tr>
        <td colspan="4" style="text-align:right;font-weight:bold;"><?php echo $total['title']; ?></td>
        <td><?php echo $total['text']; ?></td>
      </tr>

      <?php
        }

      }?>

      
      </tbody>

    </table>
    <?php }?>


   
 
</div>
 <?php }?>


  <div class="buttons">
<div class="right">  <?php if(isset($this->session->data['current_order_id']) and isset($button_invoice)){?><a onclick="openWin();"  class="button"><span><?php echo $button_invoice; ?></span></a><?php }?>&nbsp;&nbsp;<a href="<?php echo $continue; ?>" class="button"><span><?php echo $button_continue; ?></span></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
  </div>
<?php echo $footer; ?>

<script>
function openWin()
{
var url="<?php echo $invoice; ?>";
myWindow=window.open(url,'','width=800,height=600');
myWindow.focus();
}
</script>