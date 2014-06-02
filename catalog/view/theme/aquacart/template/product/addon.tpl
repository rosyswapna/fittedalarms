<div style="width:600px;height:auto;">
  <h1  class="pr_name"><?php echo $heading_title; ?></h1>
  <div class="product_des"><?php echo $description; ?></div>

  <div class="product-info" style="z-index:100;">

    <div class="left">
      <?php if ($thumb) { ?>
          <div class="image">
            <div class="image_inside">
              <img src="<?php echo $thumb; ?>" title="<?php echo $heading_title; ?>" alt="<?php echo $heading_title; ?>" id="image" width="200" height="200"/>
            </div>
          </div>
      <?php } else{?>
          <img src="/image/no_image.png" alt="<?php echo $addon['name']; ?>" width="200" height="200"/>
      <?php }?>
    </div>

    <div class="right"> 

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

        <div class="divider_bgr h10"></div>
      <?php } ?>


      <div class="description">
        <?php if ($manufacturer) { ?>
        <span><?php echo $text_manufacturer; ?></span>&nbsp; <a href="<?php echo $manufacturers; ?>"><?php echo $manufacturer; ?></a><br />
        <?php } ?>
        <span><?php echo $text_model; ?></span>&nbsp; <?php echo $model; ?><br />
        <?php if ($reward) { ?>
        <span><?php echo $text_reward; ?></span>&nbsp; <?php echo $reward; ?><br />
        <?php } ?>
        <span><?php echo $text_stock; ?></span>&nbsp; <?php echo $stock; ?>
      </div>

      <div class="divider_bgr h10"></div>

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
      <div class="divider_bgr h10"></div>
      <?php } ?>

      

    </div>

    



  </div>


</div>