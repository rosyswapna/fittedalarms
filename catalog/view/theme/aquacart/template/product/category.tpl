<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content" class="inside_page"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>

  <div class="category-info">
    <h1><?php echo $heading_title; ?></h1>

    <?php echo (isset($GLOBALS['category_banner']) ? $GLOBALS['category_banner'] : '');?>

    <?php if ($thumb) { ?>
    <div class="image"><img src="<?php echo $thumb; ?>" alt="<?php echo $heading_title; ?>" /></div>
    <?php } ?>
        
    <?php if ($description) { ?>
    <?php echo $description; ?>
    <?php } ?>
  </div>



  <?php if ($categories) { ?>
  <h2 class="ref_search"><?php echo $text_refine; ?></h2>
  <div class="category-list">
    <?php if (count($categories) <= 5) { ?>
    <ul>
      <?php foreach ($categories as $category) { ?>
      <li><a href="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></a></li>
      <?php } ?>
    </ul>
    <?php } else { ?>
    <?php for ($i = 0; $i < count($categories);) { ?>
    <ul>
      <?php $j = $i + ceil(count($categories) / 4); ?>
      <?php for (; $i < $j; $i++) { ?>
      <?php if (isset($categories[$i])) { ?>
      <li><a href="<?php echo $categories[$i]['href']; ?>"><?php echo $categories[$i]['name']; ?></a></li>
      <?php } ?>
      <?php } ?>
    </ul>
    <?php } ?>
    <?php } ?>
  </div>
  <?php } ?>
  <?php if ($products) { ?>
  <div class="product-filter">
    <div class="display"><a onclick="display('list');" class="list_view_link"><?php echo $text_list; ?></a>   <a onclick="display('grid');" class="grid_view_link_active"><?php echo $text_grid; ?></a></div>
    <div class="product-compare"><a href="<?php echo $compare; ?>" id="compare-total" class="icon_compare"><?php echo $text_compare; ?></a></div>
    <div class="limit"><b><?php echo $text_limit; ?></b>
      <select onchange="location = this.value;">

<?php 
// Swapping the $limits Array values for 4 items in a row! 
function swap_limits_values($limits){
		$new_limits = $limits;
		foreach($limits as $i=>$limit_item){
			if($limit_item['value']==25){
				$new_limits[$i]['text'] = 32;
				$new_limits[$i]['value'] = 32;
				$new_limits[$i]['href'] = substr($limit_item['href'], 0, -2).'32';
			}elseif($limit_item['value']==50){
				$new_limits[$i]['text'] = 64;
				$new_limits[$i]['value'] = 64;
				$new_limits[$i]['href'] = substr($limit_item['href'], 0, -2).'64';
			}elseif($limit_item['value']==75){
				unset($new_limits[$i]);
			}
		}
		return $new_limits;
}

$limits = swap_limits_values($limits);
?> 
 

      	
        <?php foreach ($limits as $limits) { ?>
        <?php if ($limits['value'] == $limit) { ?>
        <option value="<?php echo $limits['href']; ?>" selected="selected"><?php echo $limits['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $limits['href']; ?>"><?php echo $limits['text']; ?></option>
        <?php } ?>
        <?php } ?>  
      </select>
    </div>
    <div class="sort"><b><?php echo $text_sort; ?></b>
      <select onchange="location = this.value;">
        <?php foreach ($sorts as $sorts) { ?>
        <?php if ($sorts['value'] == $sort . '-' . $order) { ?>
        <option value="<?php echo $sorts['href']; ?>" selected="selected"><?php echo $sorts['text']; ?></option>
        <?php } else { ?>
        <option value="<?php echo $sorts['href']; ?>"><?php echo $sorts['text']; ?></option>
        <?php } ?>
        <?php } ?>
      </select>
    </div>
  </div>
  <div class="product-grid">

  <?php foreach ($products as $product) {  

  ?>

  <div class="product_holder" style="height:260px;">  
     <div class="product_holder_inside">
       <?php if ($product['special']) { ?>
    	 <?php echo '<div class="special_promo"></div>'; ?>
    	 <?php } ?> 
     
        <div class="image">
        <a href="<?php echo $product['href']; ?>">
        <?php if ($product['thumb']) { ?>
        	<img src="<?php echo $product['thumb']; ?>" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" />
        <?php }else{?>
        	<img src="/image/no_image.png" title="<?php echo $product['name']; ?>" alt="<?php echo $product['name']; ?>" 
        	width="140px" height="140px" />
        <?php } ?>
        </a>
        </div>


        <div class="name"><a href="<?php echo $product['href']; ?>"><?php echo $product['name']; ?></a></div>

        <div class="description"><?php echo $product['description']; ?></div>

        <?php if ($product['price']) { ?>
        <div class="price">
          <?php if (!$product['special']) { ?>
          <?php echo $product['price']; ?>
          <?php } else { ?>
          <span class="price-old"><?php echo $product['price']; ?></span> <span class="price-new"><?php echo $product['special']; ?></span>
          <?php } ?>
          <?php if ($product['tax']) { ?>
          <br />
          <span class="price-tax"><?php echo $text_tax; ?> <?php echo $product['tax']; ?></span>
          <?php } ?>
        </div>
        <?php } ?>

        <?php if ($product['rating']) { ?>
    	  <div class="rating"><img src="catalog/view/theme/aquacart/image/stars-<?php echo $product['rating']; ?>.png" alt="<?php echo $product['reviews']; ?>" /></div>
        <?php } ?>

        <div class="cart" >
          <a class='button' onclick="addToCart('<?php echo $product['product_id']; ?>');"><span><?php echo "View Details";//echo $button_cart; ?></span></a><br/><br/>
          <span>
            <a class="icon_compare compare_link" onclick="addToCompare('<?php echo $product['product_id']; ?>');"></a>
            <a onclick="addToCompare('<?php echo $product['product_id']; ?>');" style="font-size:10px;"><?php echo $button_compare; ?></a>
            </span>
        
        </div>

        <?php if($product['features']){?>
          <div class="features">
            <a class='features' onclick="showHideDiv('#feature<?php echo $product['product_id']; ?>')">
            <span>Features</span></a>
          </div>
          <div id="feature<?php echo $product['product_id']; ?>"  class="feature_list_div">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <?php foreach($product['features'] as $feature){ ?>
              <tr>
                <td height="15" align="center" valign="middle">&nbsp;</td>
                <td height="15" align="left" valign="middle" class="featureslist"> - <?php echo substr($feature['packages'],0,30);?></td>
              </tr>
              <?php }?>
            </table>
          </div>
        <?php }?>


        <div class="wishlist"><a onclick="addToWishList('<?php echo $product['product_id']; ?>');" class="icon_wishlist"><?php echo $button_wishlist; ?></a></div>
        <div class="compare"><a onclick="addToCompare('<?php echo $product['product_id']; ?>');" class="icon_compare"><?php echo $button_compare; ?></a></div>
       </div>

    </div>
    <?php } ?>
  </div>
  <div class="pagination"><?php 
  	// Swapping the pagination Arrows 
	function swap_pagination_arrows($pagination){
			$pagination = str_replace("|&lt;","&laquo;", $pagination);
			$pagination = str_replace("&gt;|","&raquo;", $pagination);
			$pagination = str_replace("&lt;","&lsaquo;", $pagination);
			$pagination = str_replace("&gt;","&rsaquo;", $pagination);
			return $pagination;
	} 
  echo swap_pagination_arrows($pagination); ?></div>
  <?php } ?>
  <?php if (!$categories && !$products) { ?>
  <div class="content"><?php echo $text_empty; ?></div>
  <div class="buttons">
    <div class="right"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  <?php } ?>
  <?php echo $content_bottom; ?>
 </div>
 <script>
function showHideDiv(id){
  $(id).toggle();
}
</script>


<script type="text/javascript"><!--
function display(view) {
	if (view == 'list') {
		$('.product-grid').attr('class', 'product-list');
		
		$('.product-list > div.product_holder > div.product_holder_inside').each(function(index, element) {

			html = '';
			if ($(element).children().hasClass("special_promo")){
				html += '<div class="special_promo"></div>'
			};
						
			html += '<div class="right">';
			html += '  <div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '  <div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '  <div class="compare">' + $(element).find('.compare').html() + '</div>';
			html += '</div>';			
			
			html += '<div class="left">';
			
			var image = $(element).find('.image').html();
			
			if (image != null) { 
				html += '<div class="image">' + image + '</div>';
			}
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
					
			html += '  <div class="name">' + $(element).find('.name').html() + '</div>';
			html += '  <div class="description">' + $(element).find('.description').html() + '</div>';
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
				
			html += '</div>';

						
			$(element).html(html);
		});		
		
		$('.display').html('<a onclick="display(\'list\');" class="list_view_link"><?php echo $text_list; ?></a>   <a onclick="display(\'grid\');" class="grid_view_link_active"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'list');
	} else {
		$('.product-list').attr('class', 'product-grid');
		
		$('.product-grid > div.product_holder > div.product_holder_inside').each(function(index, element) {
			html = '';
			
			var image = $(element).find('.image').html();
			
			if ($(element).children().hasClass("special_promo")){
				html += '<div class="special_promo"></div>'
			};
			
			if (image != null) {
				html += '<div class="image">' + image + '</div>';
			}
			
			html += '<div class="name">' + $(element).find('.name').html() + '</div>';
			html += '<div class="description">' + $(element).find('.description').html() + '</div>';
			
			var price = $(element).find('.price').html();
			
			if (price != null) {
				html += '<div class="price">' + price  + '</div>';
			}
			
			var rating = $(element).find('.rating').html();
			
			if (rating != null) {
				html += '<div class="rating">' + rating + '</div>';
			}
						
			html += '<div class="cart">' + $(element).find('.cart').html() + '</div>';
			html += '<div class="wishlist">' + $(element).find('.wishlist').html() + '</div>';
			html += '<div class="compare">' + $(element).find('.compare').html() + '</div>';
			
			$(element).html(html);
		});	
					
		$('.display').html('<a onclick="display(\'list\');" class="list_view_link_active"><?php echo $text_list; ?></a>   <a onclick="display(\'grid\');" class="grid_view_link"><?php echo $text_grid; ?></a>');
		
		$.totalStorage('display', 'grid');
	}
}

view = $.totalStorage('display');

if (view) {
	display(view);
} else {
	display('grid');
}
//--></script> 
</div>
<?php echo $footer; ?>