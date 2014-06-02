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
	 <
      
 
	 
 
</div>







 