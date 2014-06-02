<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="inside_page">
<?php echo $content_top; ?>
  
  <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
      <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
  </div>

  <h1  class="pr_name"><?php echo $heading_title; ?></h1>
  <div class="product_des"><?php echo $description; ?></div>
  <div class="product-info" style="z-index:100;">
  
    <?php if ($thumb || $images) { ?>
    <div class="left">
      <?php if ($thumb) { ?>
        <div class="image"><div class="image_inside">
          <a class='inline_product' href="#product_zoom" title="<?php echo $heading_title; ?>">
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
            <div id='product_zoom' style='padding:10px; background:#FFFFFF;border-radius:15px;border:2px solid #E9A03F;text-align:center;' >
                <a><img src="<?php echo $popup; ?>" width="500px;" height="500px;"/></a>
            </div>

             <?php  if ($images) { 
              foreach ($images as $key=>$image) { ?>

                <a class='inline_product' href="#product_image<?php echo $key;?>" title="<?php echo $heading_title; ?>"></a>
                <a id="product_image<?php echo $key;?>" class="group1">
                  <img src="<?php echo $image['thumb']; ?>" width="500px;" height="500px;"/>
                </a>

            <?php } }?>

        </div>

        


      <?php if ($images) { ?>
      <div class="image-additional">

        <?php foreach ($images as $image) { ?>
        <a href='<?php echo $image['popup']; ?>' class='inline' title='<?php echo $heading_title; ?>' rel="useZoom: 'zoom1', smallImage: '<?php echo $image['thumb']; ?>' "><img class="zoom-tiny-image" src="<?php echo $image['thumb']; ?>" alt = "<?php echo $heading_title; ?>"/></a>
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
          <input type="button" value="<?php echo $button_cart; ?>" id="button-cart" class="addtocart" />
          
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
          
         <div class="share"><!-- AddThis Button BEGIN -->
         <div class="addthis_default_style"><a class="addthis_button_compact"><?php echo $text_share; ?></a> <a class="addthis_button_email"></a><a class="addthis_button_print"></a> <a class="addthis_button_facebook"></a> <a class="addthis_button_twitter"></a></div>
          </div>
          <script type="text/javascript" src="//s7.addthis.com/js/250/addthis_widget.js"></script> 
          <!-- AddThis Button END --> 
    </div>
  </div>   <!-- div class right end -->

  <!--<div id="tabs" class="htabs">
    <a href="#tab-description"><?php echo $tab_description; ?></a>
    <?php if ($attribute_groups) { ?>
      <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
    <?php } ?>
    <?php if ($review_status) { ?>
      <a href="#tab-review"><?php echo $tab_review; ?></a>
    <?php } ?>
  </div>-->

  <!-- add on add start-->
  <div id="addon-cart">
  <input type="hidden" value=1 id="addoncounter"/>
    <table width="100%" border="0" id="preq">
      <tbody>
        <tr class="addon-cart-head" height="30px">
          

          <td width="58%" bgcolor="#E9E9E9">&nbsp;&nbsp;Add Ons</td>

          <td width="19%" bgcolor="#E9E9E9">&nbsp;&nbsp;Number</td>

          <td width="17%" bgcolor="#E9E9E9">&nbsp;&nbsp;Amount</td>
        </tr>

       
      
      </tbody>
    </table>
  </div>
  <!-- add on add end-->

  <div id="tabs" class="htabs">
            <?php if ($addons) { ?>
              <a href="#tab-addon"><?php echo "Add ons"; ?> (<?php echo count($addons); ?>)</a>
            <?php } ?>
              <?php if ($moreinfo) { ?><a href="#tab-info">More Info</a><?php }?>
            <?php if ($attribute_groups) { ?>
              <a href="#tab-attribute"><?php echo $tab_attribute; ?></a>
            <?php } ?>
            <?php if ($recommendedfors) { ?>
              <a href="#tab-recommend">Recommended for</a>
            <?php }?>
            <?php if ($review_status) { ?>
              <a href="#tab-review"><?php echo $tab_review; ?></a>
            <?php } ?>
            <?php if ($downloads) { ?>
              <a href="#tab-download">Downloads</a>
            <?php }?>
             <?php if ($video) { ?>
              <a href="#tab-video">Videos</a>
            <?php }?>
            <?php if ($faqs) { ?>
              <a href="#tab-faq">FAQs</a>
            <?php }?>
  </div>
 
  <?php if ($attribute_groups) { ?>
  <div id="tab-attribute" class="tab-content">
    <table class="attribute">
      <?php foreach ($attribute_groups as $attribute_group) { ?>
      <thead>
        <tr>
          <td colspan="2"><?php echo $attribute_group['name']; ?></td>
        </tr>
      </thead>
      <tbody>
        <?php foreach ($attribute_group['attribute'] as $attribute) { ?>
        <tr>
          <td><?php echo $attribute['name']; ?></td>
          <td><?php echo $attribute['text']; ?></td>
        </tr>
        <?php } ?>
      </tbody>
      <?php } ?>
    </table>
  </div>
  <?php } ?>
  <?php if ($review_status) { ?>
  <div id="tab-review" class="tab-content">
    <div id="review"></div>
    <h2 id="review-title"><?php echo $text_write; ?></h2>
    <div class='r_label'><?php echo $entry_name; ?></div>
    <input type="text" name="name" value="" class='ie_left'/>
    <div class='r_label'><?php echo $entry_review; ?></div>
    <textarea name="text" cols="40" rows="8" style="width: 98%;" class='ie_left'></textarea>
    <span style="font-size: 11px;"><?php echo $text_note; ?></span><br />
    <br />
    <b class='r_label'><?php echo $entry_rating; ?></b> <span><?php echo $entry_bad; ?></span>&nbsp;
    <input type="radio" name="rating" value="1" />
    &nbsp;
    <input type="radio" name="rating" value="2" />
    &nbsp;
    <input type="radio" name="rating" value="3" />
    &nbsp;
    <input type="radio" name="rating" value="4" />
    &nbsp;
    <input type="radio" name="rating" value="5" />
    &nbsp; <span><?php echo $entry_good; ?></span><br />
    <br />
    <div class='r_label'><?php echo $entry_captcha; ?></div>
    <input type="text" name="captcha" value=""  class='ie_left'/>
    <br />
    <img src="index.php?route=product/product/captcha" alt="" id="captcha" /><br />
    <br />
    <div class="buttons">
      <div class="right"><a id="button-review" class="button"><?php echo $button_continue; ?></a></div>
    </div>
  </div>
  <?php } ?>

   <!--<div id="tab-description" class="tab-content"><?php echo $description; ?></div>-->
   <?php if ($moreinfo) { ?>
   <div id="tab-info" class="tab-content">
   <?php echo $moreinfo; ?>
   </div>
   <?php }?>
   <?php if ($addons) { ?>
    <div id="tab-addon" class="tab-content" style="/*width:650px;*/">

      <div class="box-product ">

       <?php foreach ($addons as $addon) { ?>

       

         <div class="bubbleInfo" >
            <div style="float:left;">
              <input type="checkbox" name="addon_sel" id="addon_sel<?php echo $addon['product_id']; ?>" value="<?php echo $addon['product_id']; ?>" >
            </div>
            <div style="padding-left:20px;">
              <a href="<?php echo $addon['href']; ?>" class="colorbox">
                <div class="image">

                  <?php if ($addon['thumb']) { ?>
                    <img src="<?php echo $addon['thumb']; ?>" alt="<?php echo $addon['name']; ?>" width="90%"/>
                  <?php } else{?>
                  <img src="/image/no_image.png" alt="<?php echo $addon['name']; ?>" width="90%"/>
                  <?php }?>
                </div>

                <div class="name" id="addon_name" ><?php echo $addon['name']; ?></div>
               </a>
                    <!--<div class="name trigger">
                          <div alt="123" style="width:90px;height:15px;background:#111">
                             <div style="width:<?php echo ($addon['percent']*100);?>%;height:15px;background:#f23"></div>
                         </div>
                    </div>
                    <div class="popup" style="color:#f23;opacity: 0.5; top: 180px; left: -33px; display: none;"> 
          <?php echo ($addon['percent']*100);?>% of People Who buy <? echo $heading_title; ?> buy this product
                            <div id="text-page">
                                <br>
            
                            </div>
                    </div>-->
              <?php if ($addon['price']) { ?>
                <div class="price">
                  <?php if (!$addon['special']) { ?>
                  <?php echo $addon['price']; ?>
                  <?php } else { ?>
                  <span class="price-old"><?php echo $addon['price']; ?></span> <span class="price-new"><?php echo $addon['special']; ?></span>
                  <?php } ?>
                </div>
            <?php } ?>
              <?php if ($addon['rating']) { ?>
                <div class="rating"><img src="catalog/view/theme/default/image/stars-<?php echo $addon['rating']; ?>.png" alt="<?php echo $addon['reviews']; ?>" /></div>
            <?php } ?>
               <!-- <a  onclick="#" class="button">
                      <span><?php echo $button_cart; ?></span>
                      </a>-->
                    
                      <?php if(array_key_exists($product_id,$this->session->data['cart'])){?>
                      <input type="button" value="Add to Cart" name="add-to-cart" class="button" addonid="<?php echo $addon['product_id']; ?>" />
                    

                      <?php }else{?>

                       <input type="button" value="Add" name="button-addon-cart" class="button" addonid="<?php echo $addon['product_id']; ?>" id="button-addon-cart<?php echo $addon['product_id']; ?>"/>
                      <?php }?>
                       
                      
                      <input type="hidden" name="product_id" size="2" value="<?php echo $product_id; ?>" />
          </div>
      </div>
     <?php } ?>
    </div>
    </div>
     <?php }?>
    <?php if($recommendedfors){?>
    <div id="tab-recommend" class="tab-content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <?php foreach ($recommendedfors as $recommendedfor){?>
      <tr> 
        <td class="textbody" height="25px;"> <?php echo $recommendedfor['recommendations']; ?></td>
      </tr>
      <?php }?>
    </table>
    </div>
    <?php }?>
      <?php if($downloads){?>
    <div id="tab-download" class="tab-content">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <?php foreach ($downloads as $download) { ?>
      <tr>
      <td><?php echo $download['mask']; ?>
      </td>
      </tr>
      <tr> 
        <td height="50px;">
            <a href="download/<?php echo $download['filename']; ?>" target="_blank"><img src="image/data/download_pdf.jpg" alt="<?php echo $download['filename']; ?>" height="35px;"/></a>
        </td>
      </tr>
      <?php } ?>
    </table>
    </div>
      <?php } ?>

    <?php if ($video) { ?>
      <div id="tab-video" class="tab-content">
         <div align="center"><?php echo $text_video; ?><br>
            <object width="425" height="350">
              <param name="movie" value="<?php echo $video; ?>"></param>
              <param name="wmode" value="transparent"></param>
              <!--<embed src="<?php echo $video; ?>" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350"></embed>-->
              
              <iframe width="425" height="350" src="<?php echo $video; ?>" frameborder="0" allowfullscreen></iframe>
            </object>
      

            
        </div>
      </div>
    <?php } ?>

    <?php if ($faqs) { ?>
    <div id="tab-faq" class="tab-content">
    <?php foreach ($faqs as $faq){?>
      <div class="faq">
      <p><span class="question"><?php echo $faq['question']; ?></span></p>
      <p class="answer" style="display:none;"><?php echo $faq['answer']; ?></p>
      <?php echo "<br>";?>
      </div>
      <?php }?> 
    </div>
      <?php } ?>



<!--________________add on popup- start________________-->
<div style='display:none'>
  <div id='addon_view'>
    hai 
  </div>
</div>
<!--________________add on popup- end_______________________-->



      <script>
      $(document).ready(function(){

        
         

        
             $(".question").click(function(){
                     //alert($(this).parent().next().html());
                     $(this).parent().next().toggle();
             });



             
      });
      </script>
      <script type="text/javascript">
          $("input:button[name='add-to-cart']").click(function(){
              var addonid=$(this).attr('addonid');
              var productid=$("input:hidden[name='product_id']").val();
              
              addToCartadon(addonid,productid,1);
    
          });
      </script>

      <script type="text/javascript">
        var count = $("#addoncounter").val();
        $("input:button[name='button-addon-cart']").click(function(){

          var obj = $(this);

          var action = $(this).val();

          var val=$(this).attr('addonid');
          
          
          if(action == "Add"){

             $.ajax({
                url: 'index.php?route=product/product/addon_cart',
                type: 'post',
                data: 'addon_id='+val,
                dataType: 'json',
                success: function(json) {
                  if(json['addon_name'] && json['addon_price']){
                    var name = json['addon_name'];
                    var qty = json['addon_quantity'];
                    var price = Number(json['addon_price']);

                    var increment = 'javascript:increment('+val+','+price+')';
                    var decrement = 'javascript:decrement('+val+','+price+')';
                   
                    $("#preq tbody").append('<tr bgcolor="#F3F3F3" id="'+val+'"><td>&nbsp;&nbsp;'+name+'</td><td>&nbsp;&nbsp;<input type="text" size="2" value="1" id="txtqty'+val+'" name="txtqty['+val+']" readonly style="float:left;font-size: 12px;padding: 5px;border-radius: 2px;border: 1px solid #B7B7B7;background-color: #FFF;text-align: center;" /><div style="width:16px; float:left; margin-left:3px"><a href="'+increment+'"><img src="/image/add-icon.png"></a><a  href="'+decrement+'"><img src="/image/subtract.png"></a></div></td><td>&nbsp;&nbsp;<input type="text" size="5" value="'+price+'" id="txtprice'+val+'" readonly style="float:left;font-size: 12px;padding: 5px;border-radius: 2px;border: 1px solid #B7B7B7;background-color: #FFF;text-align: center;"/></td></tr>');
                    $("#addon_sel"+val).prop('checked',true);
                    count++;
                    obj.val("Remove");
                  }
                }
            });

          }else if(action == "Remove"){
            $('#preq tr#'+val).remove();
            $("#addon_sel"+val).prop('checked',false);
            obj.val("Add");
            count--;
          }

          if(count > 0){
            $("#addon-cart").show();
          }


        });


  function increment(key,unit_price)
  {
    var price = $("#txtprice"+key).val();
    var qty = $("#txtqty"+key).val();
    $("#txtprice"+key).val(Number(price)+Number(unit_price));
    $("#txtqty"+key).val(Number(qty)+1);
  }

  function decrement(key,unit_price)
  {
    var price = $("#txtprice"+key).val();
    var qty = $("#txtqty"+key).val();
    $("#txtprice"+key).val(Number(price)-Number(unit_price));
    $("#txtqty"+key).val(Number(qty)-1);

    if($("#txtqty"+key).val() == 0){
      $('#preq tr#'+key).remove();
        $("#addon_sel"+key).prop('checked',false);
        $("#button-addon-cart"+key).val("Add");
    }
  }
        
      </script>




  
  <!--<?php if ($products) { ?>
  
<?php if(!isset($GLOBALS["sliding_products"]) || ($GLOBALS["sliding_products"]==0)){ ?>
 
  <h1 class="general_heading"><span><?php echo $tab_related; ?></span></h1>
       
  <div class="products_container cleared" style='margin-bottom: -10px;'>
    <?php foreach ($products as $product) { ?><div class='product_holder'>
		<div class='product_holder_inside'>	

	    <?php if ($product['special']) { ?>
	    <?php echo '<div class="special_promo"></div>'; ?>
	    <?php } ?> 
	            
	        <?php if ($product['thumb']) { ?>
	        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
	        <?php } ?>
	        <div class="pr_info">
		        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		        <?php if ($product['price']) { ?>
		        <div class="price">
		          <?php if (!$product['special']) { ?>
		          <?php echo $product['price']; ?>
		          <?php } else { ?>
		          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
		          <?php } ?>
		        </div>
		        <?php } ?>
		        <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
			</div>
	   </div>
	</div><?php } ?>    
  </div>

<?php }else{ ?>

<script type="text/javascript" src="catalog/view/javascript/jquery/jquery.jcarousel.min.js"></script>


  <h1 class="general_heading"><span><?php echo $tab_related; ?></span>
    <?php if(count($products)>4){ ?>
  	<div class="jcarousel_arrows">
  		<b id="mycarousel_related-prev" class="custom-prev"></b>
        <b id="mycarousel_related-next" class="custom-next"></b>
    </div>
    <?php } ?>
  </h1>
  <div class="products_container cleared"  style='margin-bottom: -10px;'>
  <div id="related_slider" class="jcarousel-custom">
  <ul class="jcarousel-skin-opencart">
    <?php foreach ($products as $product) { ?><li><div class='product_holder'>
		<div class='product_holder_inside'>	

	    <?php if ($product['special']) { ?>
	    <?php echo '<div class="special_promo"></div>'; ?>
	    <?php } ?> 
	            
	        <?php if ($product['thumb']) { ?>
	        <div class="image"><a href="<?php echo $product['href']; ?>"><img src="<?php echo $product['thumb']; ?>" alt="<?php echo $product['name']; ?>" /></a></div>
	        <?php } ?>
	        <div class="pr_info">
		        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>
		        <?php if ($product['price']) { ?>
		        <div class="price">
		          <?php if (!$product['special']) { ?>
		          <?php echo $product['price']; ?>
		          <?php } else { ?>
		          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
		          <?php } ?>
		        </div>
		        <?php } ?>
		        <div class="cart"><a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo $button_cart; ?></span></a></div>
			</div>
	   </div>
	</div></li><?php } ?>
  </ul>
</div>
</div>

<script type="text/javascript"><!--

function mycarousel_related_initCallback(carousel) {
	
    $('#mycarousel_related-next').bind('click', function() {
        if(!$(this).hasClass('custom-next_disabled')){
        	carousel.next();
        }
        return false;
    });

    $('#mycarousel_related-prev').bind('click', function() {
    	if(!$(this).hasClass('custom-prev_disabled')){
        	carousel.prev();
    	}
        return false;
    });
};

function lastItemReached_related(carousel, li_object, index, state_action){
	if(index == <?php echo count($products);?>){
		$('#mycarousel_related-next').addClass('custom-next_disabled');
	}else {
		$('#mycarousel_related-next').removeClass('custom-next_disabled');
	}
}

function firstItemReached_related(carousel, li_object, index, state_action){
	if(index == 1){
		$('#mycarousel_related-prev').addClass('custom-prev_disabled');
	}else {
		$('#mycarousel_related-prev').removeClass('custom-prev_disabled');
	}
}

$('#related_slider ul').jcarousel({
	scroll: 4,
	easing: 'easeInOutExpo',
	animation: 800,
<?php if($this->language->get('direction')=='rtl'){?>
	rtl: true, 
<?php }?>
	initCallback: mycarousel_related_initCallback,
	buttonNextHTML: null,
    buttonPrevHTML: null,
    itemLastInCallback: {
    	  onBeforeAnimation: lastItemReached_related
    },
	itemFirstInCallback: {
		onBeforeAnimation: firstItemReached_related
	}
});
//--></script>

	<?php } ?>  
  
  
<?php } ?> 
  
  
  
  
  
 <!-- <?php if ($tags) { ?>
  <div class="tags"><?php echo $text_tags; ?> &nbsp;
    <?php for ($i = 0; $i < count($tags); $i++) { ?>
    <?php if ($i < (count($tags) - 1)) { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>,
    <?php } else { ?>
    <a href="<?php echo $tags[$i]['href']; ?>"><?php echo $tags[$i]['tag']; ?></a>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>-->
  <?php echo $content_bottom; ?>
</div>
<script type="text/javascript"><!--
$('.colorbox').colorbox({
	overlayClose: true,
	opacity: 0.4
});
//--></script> 
<script type="text/javascript"><!--
$('#button-cart').bind('click', function() {

	$.ajax({
		url: 'index.php?route=checkout/cart/add',
		type: 'post',
		data: $('.product-info input[type=\'text\'], .product-info input[type=\'hidden\'], .product-info input[type=\'radio\']:checked, .product-info input[type=\'checkbox\']:checked, .product-info select, .product-info textarea'),
		dataType: 'json',
		success: function(json) {
			$('.success, .warning, .attention, information, .error').remove();
			
			if (json['error']) {
				if (json['error']['option']) {
					for (i in json['error']['option']) {
						$('#option-' + i).after('<span class="error">' + json['error']['option'][i] + '</span>');
					}
				}
			} 
			
			if (json['success']) {
				/*$('#notification').html('<div class="success" style="display: none;">' + json['success'] + '<img src="catalog/view/theme/aquacart/image/close.png" alt="" class="close" /></div>');
					
				$('.success').fadeIn('slow');
					
				$('#cart-total').html(json['total']);
				
				$('html, body').animate({ scrollTop: 0 }, 'slow'); */
			}	
		}
	});
			if ($("input:checkbox[name='addon_sel']").is(":checked")){
			
       var val = $("input:checkbox[name='addon_sel']:checked").each(function(){
        // alert($(this).val());
		 var addonid=$(this).val();
		 var productid=$("input:hidden[name='product_id']").val();
     var quantity = $("#txtqty"+addonid).val();
		 addToCartadon(addonid,productid,quantity);
    });
		}
	
});
//--></script>
<?php if ($options) { ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/ajaxupload.js"></script>
<?php foreach ($options as $option) { ?>
<?php if ($option['type'] == 'file') { ?>
<script type="text/javascript"><!--
new AjaxUpload('#button-option-<?php echo $option['product_option_id']; ?>', {
	action: 'index.php?route=product/product/upload',
	name: 'file',
	autoSubmit: true,
	responseType: 'json',
	onSubmit: function(file, extension) {
		$('#button-option-<?php echo $option['product_option_id']; ?>').after('<img src="catalog/view/theme/aquacart/image/loading.gif" class="loading" style="padding-left: 5px;" />');
	},
	onComplete: function(file, json) {
		$('.error').remove();
		
		if (json.success) {
			alert(json.success);
			
			$('input[name=\'option[<?php echo $option['product_option_id']; ?>]\']').attr('value', json.file);
		}
		
		if (json.error) {
			$('#option-<?php echo $option['product_option_id']; ?>').after('<span class="error">' + json.error + '</span>');
		}
		
		$('.loading').remove();	
	}
});
//--></script>
<?php } ?>
<?php } ?>
<?php } ?>
<script type="text/javascript"><!--
$('#review .pagination a').live('click', function() {
	$('#review').slideUp('slow');
		
	$('#review').load(this.href);
	
	$('#review').slideDown('slow');
	
	return false;
});			

$('#review').load('index.php?route=product/product/review&product_id=<?php echo $product_id; ?>');

$('#button-review').bind('click', function() {
	$.ajax({
		url: 'index.php?route=product/product/write&product_id=<?php echo $product_id; ?>',
		type: 'post',
		dataType: 'json',
		data: 'name=' + encodeURIComponent($('input[name=\'name\']').val()) + '&text=' + encodeURIComponent($('textarea[name=\'text\']').val()) + '&rating=' + encodeURIComponent($('input[name=\'rating\']:checked').val() ? $('input[name=\'rating\']:checked').val() : '') + '&captcha=' + encodeURIComponent($('input[name=\'captcha\']').val()),
		beforeSend: function() {
			$('.success, .warning').remove();
			$('#button-review').attr('disabled', true);
			$('#review-title').after('<div class="attention"><img src="catalog/view/theme/aquacart/image/loading.gif" alt="" /> <?php echo $text_wait; ?></div>');
		},
		complete: function() {
			$('#button-review').attr('disabled', false);
			$('.attention').remove();
		},
		success: function(data) {
			if (data.error) {
				$('#review-title').after('<div class="warning">' + data.error + '</div>');
			}
			
			if (data.success) {
				$('#review-title').after('<div class="success">' + data.success + '</div>');
								
				$('input[name=\'name\']').val('');
				$('textarea[name=\'text\']').val('');
				$('input[name=\'rating\']:checked').attr('checked', '');
				$('input[name=\'captcha\']').val('');
			}
		}
	});
});
//--></script> 
<script type="text/javascript"><!--
$('#tabs a').tabs();
//--></script> 
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-timepicker-addon.js"></script> 
<script type="text/javascript"><!--
if ($.browser.msie && $.browser.version == 6) {
	$('.date, .datetime, .time').bgIframe();
}

$('.date').datepicker({dateFormat: 'yy-mm-dd'});
$('.datetime').datetimepicker({
	dateFormat: 'yy-mm-dd',
	timeFormat: 'h:m'
});
$('.time').timepicker({timeFormat: 'h:m'});
//--></script> 



<script type="text/javascript"><!--

$(".inline_product").colorbox({inline:true,width:'50%',rel:'inline_product'});

//--></script> 


</div>


<!--zoom product-->

<script>
  $(document).ready(function(){
    //Examples of how to assign the Colorbox event to elements

    $('.colorbox').live('click', function() {
  $.colorbox({href:$(this).attr('href'), open:true});
  return false;
}

    $(".ajax").click(function(){

          var url = $(this).attr('href');
          //alert(url);
          $(this).colorbox({ajax:true, href:url});
    });
    
  });
</script>
<!--zoom product-->



<?php echo $footer; ?>