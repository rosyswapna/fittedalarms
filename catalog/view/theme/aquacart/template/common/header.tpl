<?php if (isset($_SERVER['HTTP_USER_AGENT']) && !strpos($_SERVER['HTTP_USER_AGENT'], 'MSIE 6')) echo '<?xml version="1.0" encoding="UTF-8"?>'. "\n"; ?>
<!DOCTYPE html>
<html><head>
<title><?php echo $title; ?></title>
<base href="<?php echo $base; ?>" />
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1">
<?php if ($description) { ?>
<meta name="description" content="<?php echo $description; ?>" />
<?php } ?>
<?php if ($keywords) { ?>
<meta name="keywords" content="<?php echo $keywords; ?>" />
<?php } ?>
<?php if ($icon) { ?>
<link href="<?php echo $icon; ?>" rel="icon" />
<?php } ?>
<?php foreach ($links as $link) { ?>
<link href="<?php echo $link['href']; ?>" rel="<?php echo $link['rel']; ?>" />
<?php } ?>
<link href="http://fittedalarms.acubedemo.com/image/data/favicon.png" rel="icon" />
<link rel="stylesheet" type="text/css" href="catalog/view/theme/aquacart/stylesheet/stylesheet.css" />
<?php if($direction=='rtl'){?>
   <link rel="stylesheet" type="text/css" href="catalog/view/theme/aquacart/stylesheet/rtl_stylesheet.css" />
<?php }?>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/aquacart/stylesheet/carousel.css" media="screen" />
<?php foreach ($styles as $style) { ?>
<link rel="<?php echo $style['rel']; ?>" type="text/css" href="<?php echo $style['href']; ?>" media="<?php echo $style['media']; ?>" />
<?php } ?>
<script type="text/javascript" src="catalog/view/javascript/jquery/jquery-1.7.1.min.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/jquery-ui-1.8.16.custom.min.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/ui/themes/ui-lightness/jquery-ui-1.8.16.custom.css" />
<script type="text/javascript" src="catalog/view/javascript/jquery/ui/external/jquery.cookie.js"></script>
<script type="text/javascript" src="catalog/view/javascript/jquery/colorbox/jquery.colorbox.js"></script>
<link rel="stylesheet" type="text/css" href="catalog/view/javascript/jquery/colorbox/colorbox.css" media="screen" />
<script type="text/javascript" src="catalog/view/javascript/jquery/tabs.js"></script>
<script type="text/javascript" src="catalog/view/javascript/common.js"></script>
<script type="text/javascript" src="catalog/view/theme/aquacart/javascript/aquacart_custom.js"></script>
<script type="text/javascript" src="catalog/view/theme/aquacart/javascript/cloud_zoom.js"></script>

<link href='https://fonts.googleapis.com/css?family=Droid+Sans:400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Lato:300,400,700' rel='stylesheet' type='text/css'>
<link href='https://fonts.googleapis.com/css?family=Pontano+Sans' rel='stylesheet' type='text/css'>


<?php foreach ($scripts as $script) { ?>
<script type="text/javascript" src="<?php echo $script; ?>"></script>
<?php } ?>
<!--[if lt IE 9]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/aquacart/stylesheet/ie8.css" />
<![endif]-->
<!--[if IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/aquacart/stylesheet/ie7.css" />
<![endif]-->
<!--[if lt IE 7]>
<link rel="stylesheet" type="text/css" href="catalog/view/theme/default/stylesheet/ie6.css" />
<script type="text/javascript" src="catalog/view/javascript/DD_belatedPNG_0.0.8a-min.js"></script>
<script type="text/javascript">
DD_belatedPNG.fix('#logo img');
</script>
<![endif]-->





<!-- Custom Styles :: Start -->
<?php
$styler = isset($GLOBALS["styler"]) ? $GLOBALS["styler"] : NULL;
$store_settings = isset($GLOBALS["store_settings"]) ? $GLOBALS["store_settings"] : NULL;

$bgrs_dir = 'admin/view/image/bgrs/'; 
?>

<?php if(isset($styler)){ ?>
 <?php if($styler['nav_font_picker']!='Lato'){ ?>
 	<link href='https://fonts.googleapis.com/css?family=<?php echo str_replace(' ', '+', $styler['nav_font_picker']);?>' rel='stylesheet' type='text/css'>
 	<style>
 		#menu {font-family: '<?php echo $styler['nav_font_picker'];?>';}
 	</style>
 <?php }?>
<?php } ?>

<?php if(isset($styler)){ ?>
 <?php if($styler['nav_fontsize_picker']!='16px'){ ?>
 	<style>
		#menu > ul > li > a { /*font-size: <?php echo $styler['nav_fontsize_picker'];?>;*/}
		#menu > ul > li ul > li > a  { font-size: <?php echo ((int)(substr($styler['nav_fontsize_picker'],0,2)) - 2).'px';?>;}
	</style>
 <?php }?>
<?php } ?>

<?php if(isset($styler)){ ?>
 <?php if($styler['title_font_picker']!='Pontano Sans'){ ?>
  	<link href='https://fonts.googleapis.com/css?family=<?php echo str_replace(' ', '+', $styler['title_font_picker']);?>' rel='stylesheet' type='text/css'>
  	<style>
		h1, h2, h3, .welcome, .box-heading, .general_heading, #footer h3, #column-left .general_heading, #column-right .general_heading  { font-family: <?php echo $styler['title_font_picker'];?>;}
	</style>
 <?php }?>
<?php } ?>

<?php if(isset($styler)){ ?>
 <?php if($styler['button_font_picker']!='Droid Sans'){ ?>
  	<link href='https://fonts.googleapis.com/css?family=<?php echo str_replace(' ', '+', $styler['title_font_picker']);?>' rel='stylesheet' type='text/css'>
  	<style>
		.button { font-family: <?php echo $styler['title_font_picker'];?>;}
	</style>
 <?php }?>
<?php } ?>

<?php if(isset($styler)){ ?>
 <?php if($styler['body_font_picker']!='Droid Sans'){ ?>
 	<style>
 		body {font-family: '<?php echo $styler['body_font_picker'];?>';}
 	</style>
 <?php }?>
<?php } ?>


<?php if(isset($styler)){ ?>
 <?php if($styler['footer_style']=='dark'){ ?>
	<script type="text/javascript">
		$(document).ready(function(){
			$('#footer').addClass('footer_dark');
		});
	</script>
 <?php }?>
<?php } ?>

<style>

<?php if(isset($styler)){ ?>

 <?php if($styler['menu_color']!='00d0dd' && $styler['menu_color']!='00D0DD'){ ?>
		
		.basic_menu #menu > ul > li > a:hover { background: #<?php echo $styler['menu_color'];?>;}
		.basic_menu #menu > ul > li:hover > a { background: #<?php echo $styler['menu_color'];?>;}
		.custom_menu #menu { background-color: #fff/*<?php echo $styler['menu_color'];?>;*/;border:#B6B6B6 solid 1px;border-radius:5px;margin-bottom:10px;}
		.custom_menu #menu > ul > li > a { /*background-color: #fff<?php echo $styler['menu_color'];?>;*/;}
 <?php } ?>


 <?php if($styler['main_color']!='00d0dd' && $styler['main_color']!='00D0DD'){ ?>
		
		a:hover { color: #<?php echo $styler['main_color'];?>;}
		a.button:hover, input.button:hover, #checkout input.button:hover { background-color: #<?php echo $styler['main_color'];?>;}
		
		.breadcrumb a:hover { color: #<?php echo $styler['main_color'];?>;}
		.buttons .right .button:hover { background-color: #<?php echo $styler['main_color'];?>;}
		.product_holder .name a:hover { color: #<?php echo $styler['main_color'];?>;}
		.product-info .description a:hover { color: #<?php echo $styler['main_color'];?>;}
		.product-info .cart .button { background-color: #<?php echo $styler['main_color'];?>;}
		.product-info a.icon_plus:hover { color: #<?php echo $styler['main_color'];?>;}
		.product-info .review a.rev_count:hover { color: #<?php echo $styler['main_color'];?>;}
		#language a:hover  { color: #<?php echo $styler['main_color'];?>;}
		#currency a:hover  { color: #<?php echo $styler['main_color'];?>;}
		#header #welcome a:hover { color: #<?php echo $styler['main_color'];?>;}
		#header .links a:hover { color: #<?php echo $styler['main_color'];?>;}
		#footer a:hover { color: #<?php echo $styler['main_color'];?>;}

		.camera_prevThumbs:hover, .camera_nextThumbs:hover, .camera_prev:hover, .camera_next:hover, .camera_commands:hover, .camera_thumbs_cont:hover { background: #<?php echo $styler['main_color'];?>;}
		.camera_wrap .camera_pag .camera_pag_ul li.cameracurrent > span  { background: #<?php echo $styler['main_color'];?>;}

		.jcarousel-skin-opencart .jcarousel-next-horizontal:hover, .custom-next:hover {	background-color: #<?php echo $styler['main_color'];?>;}
		.jcarousel-skin-opencart .jcarousel-prev-horizontal:hover, .custom-prev:hover {	background-color: #<?php echo $styler['main_color'];?>;}
		.jcarousel-skin-opencart .jcarousel-next-disabled-horizontal:hover, .custom-next_disabled:hover  { background-color: #ccc;}
		.jcarousel-skin-opencart .jcarousel-prev-disabled-horizontal:hover, .custom-prev_disabled:hover  { background-color: #ccc;}

		.pagination .links a:hover  { background-color: #<?php echo $styler['main_color'];?>;}
		.product-filter .display a:hover  { color: #<?php echo $styler['main_color'];?>;}		
		.product-compare a:hover  { color: #<?php echo $styler['main_color'];?>;}
		.product-list .compare a:hover, .product-list .wishlist a:hover  { color: #<?php echo $styler['main_color'];?>;}
		
		a.icon_compare:hover {color: #<?php echo $styler['main_color'];?>;}
		a.icon_wishlist:hover {color: #<?php echo $styler['main_color'];?>;}
		a.icon_comment:hover {color: #<?php echo $styler['main_color'];?>;}
		
 <?php } ?>

 
 <?php if(isset($styler['bgr_image']) && $styler['bgr_image']!='1.png' && $styler['bgr_image']!='none'){ ?>
	body{ 
		background-image: url(<?php echo $bgrs_dir.$styler['bgr_image'];?>);
	}	
 <?php }elseif($styler['bgr_image']!='1.png'){ ?>
	body{ 
		background: #<?php echo $styler['bgr_color'];?>;
	}	
 <?php } ?>
 
<?php } ?> 
 
<?php if(isset($store_settings)){ ?> 

 <?php if(isset($store_settings['header_links']) && $store_settings['header_links']){ ?>	
	#header .links {display: block;}	
 <?php } ?> 

 <?php if(isset($store_settings['wishlist_link']) && ($store_settings['wishlist_link']==0)){ ?>	
	.wishlist, .wishlist_link {display: none !important;}	
 <?php } ?> 
 
 <?php if(isset($store_settings['compare_link']) && ($store_settings['compare_link']==0)){ ?>	
	.compare, .compare_link, .product-compare {display: none;}	
 <?php } ?> 
 
 <?php if((isset($store_settings['compare_link']) && ($store_settings['compare_link'] == 0)) && (isset($store_settings['wishlist_link']) && ($store_settings['wishlist_link']==0))){ ?> 
 	.cart_clearer {display: none;}
 <?php } ?> 	
<?php } ?>  
</style>

<?php if(isset($store_settings)){ ?>
<script type="text/javascript">
	fading_effects = <?php echo $store_settings['fading_effects'];?>;
</script>
<?php } ?> 
<!-- Custom Styles :: End -->

 








<?php echo $google_analytics; ?>
</head>
<body>

<div id="container">
<?php $current_url=$_SERVER['REQUEST_URI'];?>
<?php //if($current_url=="/"||$current_url=="/index.php?route=common/home"){ echo "home"; }?>
<div id="header">
<div id="search">
	 <div class="search_inside">
		    <!--<input type="text" name="search" placeholder="<?php echo $text_search; ?>" value="" />-->
        <input type="text" value="" placeholder="Search" name="search" style="border-top-left-radius: 6px; border-bottom-left-radius: 6px; border:1px solid rgb(119, 119, 119); height:18px;"></input>
		    <div class="button-search"></div>
	    </div>
	  </div>
      
  <?php if ($logo) { ?>
  <div id="logo"><a href="<?php echo $home; ?>"><img src="<?php echo $logo; ?>" title="<?php echo $name; ?>" alt="<?php echo $name; ?>" /></a></div>
  <?php } ?>

	  <div id="welcome">
	  </div>
	 


  <div id='header_btm'>
  		  <div class="links" id="header_links">
  		  	<a href="<?php echo $home; ?>"><?php echo $text_home; ?></a>
  		  	<a href="<?php echo $wishlist; ?>" id="wishlist-total" class="wishlist_link"><?php echo $text_wishlist; ?></a> 
  		  	<a href="<?php echo $account; ?>"><?php echo $text_account; ?></a>
  		  	<a href="<?php echo $shopping_cart; ?>"><?php echo $text_shopping_cart; ?></a>
  		  	<a href="<?php echo $checkout; ?>"><?php echo $text_checkout; ?></a>
  		  </div>
	  	<?php echo $cart; ?>

  	<!--<?php echo $language; ?>-->
  	<!--<?php echo $currency; ?>-->
  </div>
 
</div>

<?php if ($categories) { ?>
<div id="menu-holder" class="<?php echo (isset($styler['menu_style']) && ($styler['menu_style']!='')) ? $styler['menu_style']."_menu" : '' ;?>">
<div id="menu" style="/*border: 1px solid rgb(256, 256, 256);border-radius:8px;*/">
  <ul class="ft_mainmenu">
  	<li></li>
    <li><a href="<?php echo $home; ?>">
        <span class='home_icon' style="width:20px;height:25px;padding-top:15px;"></span>
    <!--<img src="/image/data/home.png" width="16px"; height:"40px;" />&nbsp;&nbsp;Home-->
    </a> </li>

    <li><a href="index.php?route=module/aboutus" style="font-size:12px;">ABOUT US</a></li><!--<a href="index.php?route=module/aboutus">ABOUT US</a>-->
    <li><a class='inline' href="#inline_content" style="font-size:12px;">PRODUCTS</a></li>
    <li><a href="index.php?route=module/alarmservicing" style="font-size:12px;">ALARM SERVICING</a></li><!--<a href="index.php?route=module/alarmservicing">ALARM SERVICING</a>-->
    <li><a href="index.php?route=module/quote" style="font-size:12px;">GET A QUOTE</a></li><!--<a href="index.php?route=module/quote">GET A QUOTE</a>-->
    <li><a href="http://blog.fittedhomealarms.co.uk/" target="_blank" style="font-size:12px;">BLOG</a></li>
    <li><a class='inline' href="#inline_content2" style="font-size:12px;">HELP</a></li>
    <!--<li class="ft_submenu"><a href="#">HELP</a>
        <ul style="display:none;">
        <li><a href="#">Videos</a></li>
        <li><a href="#">Downloads</a></li>
        <li><a href="index.php?route=information/faq">FAQs</a></li><!--<a href="index.php?route=information/faq">FAQs</a>
        </ul>
    </li>-->
    <li><a href="index.php?route=information/contact" style="font-size:12px;">CONTACT US</a></li><!--<a href="index.php?route=information/contact">CONTACT US</a>-->
<?php if ($logged) { ?>
      <li><a href="<?php echo $logout; ?>" style="font-size:12px;">Logout</a></li>
      <?php } ?>
  </ul>
</div>
</div>
<?php } ?>

<!-- PHONE::Start -->

<?php if ($categories) { ?>
<div id="menu-phone" class="shown-phone" style="display: none;">
  <div id="menu-phone-button"><?php echo (($this->language->get('text_menu')!='text_menu') ? $this->language->get('text_menu') : 'Menu');?></div>
  <select id="menu-phone-select" onChange="location = this.value">
  	<option value=""></option>
    <?php foreach ($categories as $category) { ?>
    <option value="<?php echo $category['href']; ?>"><?php echo $category['name']; ?></option>
    <?php } ?>
  </select>
</div>

<script type="text/javascript">
	// Bind the Phone menu dropdown
	$('#menu-phone-button').bind('click', function() {
		$("#menu-phone-select").css({'opacity':'1'});
	});
</script>
<?php } ?>

<!-- PHONE::End -->

<div id="notification"></div>
<div style='display:none'>
<div id='inline_content' style='padding:10px; background:#FFFFFF;border-radius:15px;'>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td height="120">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="145" align="center" valign="middle">
        <div class="product_head">
        <a href="index.php?route=product/category&path=59">
        <img src="image/data/domestic_alarm_icon.png" width="131" height="110"><br>
		<span style="color: rgb(236, 98, 23);">ALARMS</span>
		</a>
		</div>
		</td>
      </tr>
    </table>
    </td>
    <td height="120">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle">
        <div  class="product_head">
        <a href="index.php?route=product/category&path=60">
        <img src="image/data/Safe-icon.png" width="131" height="110"><br>
        <span style="color: rgb(236, 98, 23);">SAFES</span>
        </a>
        </div>
        </td>
      </tr>
    </table>
    </td>
    <td height="120">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle">
         <div class="product_head">
         <a href="index.php?route=product/category&path=61">
         <img src="image/data/cctv_icon.png" width="131" height="110"><br>
    	<span style="color: rgb(236, 98, 23);"> CCTVs</span></a>
    	</div>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>
<div id='inline_content2' style='padding:10px; background:#FFFFFF;border-radius:15px;'>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
   <tr>
    <td height="120">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td height="145" align="center" valign="middle">
        <div class="product_head">
        <a href="index.php?route=information/video">
        <img src="image/data/videos.jpg" height="110"><br>
		<span style="color: rgb(236, 98, 23);">VIDEOS</span>
		</a>
		</div>
		</td>
      </tr>
    </table>
    </td>
    <td height="120">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle">
        <div  class="product_head">
        <a href="index.php?route=information/download">
        <img src="image/data/downoads.jpg" height="110"><br>
        <span style="color: rgb(236, 98, 23);">DOWNLOADS</span>
        </a>
        </div>
        </td>
      </tr>
    </table>
    </td>
    <td height="120">
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td align="center" valign="middle">
         <div class="product_head">
         <a href="index.php?route=information/faq">
         <img src="image/data/faq.jpg" height="110"><br>
    	<span style="color: rgb(236, 98, 23);"> FAQ'S</span></a>
    	</div>
        </td>
      </tr>
    </table>
    </td>
  </tr>
</table>
</div>
</div>

  

<script>
			$(document).ready(function(){
				//Examples of how to assign the Colorbox event to elements
	
				$(".inline").colorbox({inline:true, width:"50%"});
       
				
			});
		</script>