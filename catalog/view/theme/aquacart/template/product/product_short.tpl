<?php //echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;">
<div id="content" class="inside_page">
<?php //echo $content_top; ?>
  
 

  <h1  class="pr_name"><?php echo $heading_title; ?></h1>
  <div class="product_des"><?php echo $description; ?></div>
  <div class="product-info" style="z-index:100;">
  
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
        <div class="image"><div class="image_inside">
          <a class='inline' href="#product_zoom" title="<?php echo $heading_title; ?>">
            <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" width="200" height="200"/>
          </a>
        </div>
        <?php if ($special) { ?><div class="special_promo"></div><?php } ?>
      </div>


      <!--
      <div class="image"><div class="image_inside"><a href="<?php echo $popup; ?>" title="<?php echo $heading_title; ?>" class='cloud-zoom' id='zoom1' rel="tint: '#ffffff',tintOpacity:0.5 ,smoothMove:3,zoomWidth:280, zoomHeight:280, adjustY:-6, adjustX:<?php echo ($this->language->get('direction')=='rtl' ? '-710' : '25');?>"><img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" width="200" height="200"/></a></div><?php if ($special) { ?><div class="special_promo"></div><?php } ?></div>
      
      <div class="zoom_btn">
            <a id="zoomer" class="colorbox" href="<?php echo $popup; ?>">Zoom</a>        
      </div>
      -->
      <?php } else{?>
          <img src="/image/no_image.png" alt="<?php echo $addon['name']; ?>" width="200" height="200"/>
        <?php }?>

        <div style='display:none'>
          <div id='product_zoom' style='padding:10px; background:#FFFFFF;border-radius:15px;border:2px solid #E9A03F;text-align:center;'>
            <img src="<?php echo $popup; ?>" width="500px;" height="500px;"/>
          </div>
        </div>


      <?php if ($images) { ?>
      <div class="image-additional">
        <a href='<?php echo $popup; ?>' class='cloud-zoom-gallery' title='<?php echo $heading_title; ?>' rel="useZoom: 'zoom1', smallImage: '<?php echo $thumb; ?>' "><img class="zoom-tiny-image" src="<?php echo $thumb; ?>" alt = "<?php echo $heading_title; ?>"/></a>  
        <?php foreach ($images as $image) { ?>
        <a href='<?php echo $image['popup']; ?>' class='cloud-zoom-gallery' title='<?php echo $heading_title; ?>' rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' "><img class="zoom-tiny-image" src="<?php echo $image['thumb']; ?>" alt = "<?php echo $heading_title; ?>"/></a>
        <?php } ?>
      </div>

      <!--Display feature images-->
      <?php } if($features){?> 
      <span class="feature_image">
        <div style="max-width:210px;">
            <?php $count=0; foreach($features as $feature){?>
            <div style="float:left;">
              
              <img src="/image/<?php echo $feature['image']; ?>" alt = "<?php //echo $feature['name']; ?>" style=""/> 
              
            </div>
            <?php if($count=='4'){echo "</tr><tr>"; $count=0;} $count++; }?>

         
       </div>
        </span>
	    <?php }?>

</div>
<?php } ?>

    <div class="right"> 
     
    
      <div class="divider_bgr h10"></div> 
     <?php if ($price) { ?>
      <div class="price">
      	<span class="txt_price"><?php echo $text_price; ?></span>
        <?php if (!$special) { ?>
        <?php echo $price; ?>
        <?php } else { ?>
        <span class="price-old"><?php echo $price; ?></span> <span class="price-new"><?php echo $special; ?></span>
        <?php } ?>
        <br />
        <?php if ($tax) { ?>
        <span class="price-tax"><?php echo $text_tax; ?> <?php echo $tax; ?></span><br />
        <?php } ?>
        <?php if ($points) { ?>
        <span class="reward"><small><?php echo $text_points; ?> <?php echo $points; ?></small></span><br />
        <?php } ?>
        <?php if ($discounts) { ?>
        <br />
        <div class="discount">
          <?php foreach ($discounts as $discount) { ?>
          <?php echo sprintf($text_discount, $discount['quantity'], $discount['price']); ?><br />
          <?php } ?>
        </div>
        <?php } ?>
      </div>
      <?php } ?> 

      <div class="description">
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span>&nbsp; <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span>&nbsp; <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span>&nbsp; <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span>&nbsp; <?php echo $stock; ?></div>
      <?php if ($options) { ?>
      <div class="options">
        <h2><?php echo $text_option; ?></h2>
        <div class="divider_bgr h10 mb10"></div> 
        <?php foreach ($options as $option) { ?>
        <?php if ($option['type'] == 'select') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <select name="option[<?php echo $option['product_option_id']; ?>]">
            <option value=""><?php echo $text_select; ?></option>
            <?php foreach ($option['option_value'] as $option_value) { ?>
            <option value="<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
            </option>
            <?php } ?>
          </select>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'radio') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'checkbox') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <?php foreach ($option['option_value'] as $option_value) { ?>
          <input type="checkbox" name="option[<?php echo $option['product_option_id']; ?>][]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" />
          <label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
            <?php if ($option_value['price']) { ?>
            (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
            <?php } ?>
          </label>
          <br />
          <?php } ?>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'image') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
            <table class="option-image">
              <?php foreach ($option['option_value'] as $option_value) { ?>
              <tr>
                <td style="width: 1px;"><input type="radio" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option_value['product_option_value_id']; ?>" id="option-value-<?php echo $option_value['product_option_value_id']; ?>" /></td>
                <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><img src="<?php echo $option_value['image']; ?>" alt="<?php echo $option_value['name'] . ($option_value['price'] ? ' ' . $option_value['price_prefix'] . $option_value['price'] : ''); ?>" /></label></td>
                <td><label for="option-value-<?php echo $option_value['product_option_value_id']; ?>"><?php echo $option_value['name']; ?>
                    <?php if ($option_value['price']) { ?>
                    (<?php echo $option_value['price_prefix']; ?><?php echo $option_value['price']; ?>)
                    <?php } ?>
                  </label></td>
              </tr>
              <?php } ?>
            </table>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'text') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'textarea') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <textarea name="option[<?php echo $option['product_option_id']; ?>]" cols="40" rows="5"><?php echo $option['option_value']; ?></textarea>
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'file') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <a id="button-option-<?php echo $option['product_option_id']; ?>" class="button"><?php echo $button_upload; ?></a>
          <input type="hidden" name="option[<?php echo $option['product_option_id']; ?>]" value="" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'date') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="date" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'datetime') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="datetime" />
        </div>
        <br />
        <?php } ?>
        <?php if ($option['type'] == 'time') { ?>
        <div id="option-<?php echo $option['product_option_id']; ?>" class="option">
          <b><?php if ($option['required']) { ?>
          <span class="required">*</span>
          <?php } ?> <?php echo $option['name']; ?>:</b>
          <input type="text" name="option[<?php echo $option['product_option_id']; ?>]" value="<?php echo $option['option_value']; ?>" class="time" />
        </div>
        <br />
        <?php } ?>
        <?php } ?>
      </div>
      <?php } ?>
      <div class="cart">
        <div><?php // echo $text_qty; ?>
<!--          <b class="sub_prod_count" onclick="subProductCount()"></b>
          <input type="text" name="quantity" id="quantity" class='qty_input' size="2" value="<?php echo $minimum; ?>" />
          <b class="add_prod_count" onclick="addProductCount()"></b>-->
          <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          <?php if($product_type == 2){}else{?>
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="button" />
          <?php }?>
          </div>
          <span class="cart_clearer"></span>
          <!--&nbsp;<a onclick="addToWishList('<?php echo $product_id; ?>');" class="icon_wishlist wishlist_link"><?php echo $button_wishlist; ?></a> &nbsp;&nbsp;-->
          <a onclick="addToCompare('<?php echo $product_id; ?>');" class="icon_compare compare_link"><?php echo $button_compare; ?></a>
        <?php if ($minimum > 1) { ?>
        <div class="minimum"><?php echo $text_minimum; ?></div>
        <?php } ?>
        
      </div>

      <div class="divider_bgr h10"></div> 
      
     <!-- <?php if ($review_status) { ?>
      <div class="review">
        <div><img src="catalog/view/theme/aquacart/image/stars-<?php echo $rating; ?>.png" alt="<?php echo $reviews; ?>" />&nbsp;&nbsp;(<a onclick="$('a[href=\'#tab-review\']').trigger('click');" class='rev_count'><?php echo $reviews; ?></a>)&nbsp;&nbsp;&nbsp;<span class="divider">|</span>&nbsp;&nbsp;&nbsp;<a onclick="$('a[href=\'#tab-review\']').trigger('click');" class="icon_comment"><?php echo $text_write; ?></a></div>
	  </div>    
      <?php } ?>-->
          
         


<?php //echo $footer; ?>