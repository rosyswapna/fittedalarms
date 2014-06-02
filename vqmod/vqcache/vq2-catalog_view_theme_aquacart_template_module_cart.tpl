<div id="cart">
  
								<span style="float:left;margin-top:9px;margin-left:192px;z-index:11;position:absolute;">
								
									<a href="<?php echo $account; ?>" style="color: rgb(85,85,85);font-size:12px;">
										<?php //echo $text_account; ?>My Account
									</a>
								</span>
							
						
					
  <div class="heading">
<style type="text/css">
#header #cart .heading h4 {margin:-10px 0px 3px 0 !important;}
#header #cart .heading {margin:10px 40px 0 0 !important}
#header #cart.active .heading {padding-top:0 !important}
</style>
  <?php if ($this->cart->hasProducts()) { ?>
  <img style="margin:0 -65px -28px;padding-left:5px;" src="image/data/full_cart.png" height="40px;" widht="40px;">
  <?php } else { ?>
  <img style="margin:0 -65px -28px;padding-left:5px;" src="image/data/empty_cart.png" height="40px;" widht="40px;">
  <?php } ?>
    <h4><?php echo $heading_title; ?></h4>
    <a><span id="cart-total"><?php echo $text_items; ?></span></a></div>
    <div class="content">
      <?php if ($products || $vouchers) { ?>
        <div class="mini-cart-info">
          <table>
            <?php  //foreach ($productsfts as $productsft)
            foreach ($productsfts as $productsft) { ?>
            <tr>
              <td class="texttablebody">
                <a href="<?php echo $productsft['href']; ?>" ><span class="texttablebody"><?php echo $productsft['parent_product_id'];?><strong><?php echo $productsft['name']; ?></strong></span>
                </a>
        
                <?php if (!$productsft['stock']) { ?>
                <span class="stock">***</span>
                <?php } ?>

                <div>
                  <?php foreach ($productsft['option'] as $option) { ?>
                  - <small><?php echo $option['name']; ?>: <?php echo $option['value']; ?></small><br />
                  <?php } ?>
                </div>

                <?php if ($productsft['reward']) { ?>
                   <small><?php echo $productsft['reward']; ?></small>
                <?php } ?>

                <?php if (!empty($productsft['addon'])){?>
                   <table width="150" border="0" cellspacing="0" cellpadding="0">
                      <tr height="10">
                        <td></td>
                      </tr>
                      <tr><td bgcolor="#EAC984" colspan="4" class="headstyle">And selected add ons</td></tr>

                      <?php $product_addons=$productsft['addon'];  foreach($product_addons as $product_addon){?>
                    
                      <tr>
                        <td align="left" valign="middle"><!--<a href="<?php echo $product_addon['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>--></td>
                          <td align="left" valign="middle"> <?php echo $product_addon['name'];?></td>
                          <td height="25" align="left" valign="middle">    
                           <input type="text" name="addonquantity[<?php echo $productsft['key_product']; ?>][<?php echo $product_addon['product_id'];?>]" value="<?php echo $product_addon['quantity'];?>" size="1"  readonly/>
                        </td>
                        <td height="25" align="left" valign="middle"><?php echo $product_addon['price'];?></td>
                      </tr>

                      <?php  }?>
                    </table>
                  <?php }?>

                </td>
                <td>
                  <input type="text" name="quantity[<?php echo $productsft['key_product']; ?>]" value="<?php echo $productsft['quantity']; ?>" size="1" readonly/> &nbsp;
                  <!--<a href="<?php echo $productsft['remove']; ?>"><img src="catalog/view/theme/default/image/remove.png" alt="<?php echo $button_remove; ?>" title="<?php echo $button_remove; ?>" /></a>-->
                </td>
                <td class="texttablebody"><?php echo $productsft['price']; ?></td>
            </tr>
      <?php } ?>
    </table>
    </div>

    <div class="checkout"><a class="button" href="<?php echo $cart; ?>"><?php echo $text_cart; ?></a> &nbsp; <a class="button button_accent" href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a></div>
    <?php } else { ?>
    <div class="empty"><?php echo $text_empty; ?></div>
    <?php } ?>
    
    <div class="cart-arrow"></div>
  </div>
</div>