<div id="carousel<?php echo $module; ?>">
  <ul class="jcarousel-skin-opencart">
    <?php foreach ($banners as $banner) { ?>
    <li><a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" title="<?php echo $banner['title']; ?>" /></a></li>
    <?php } ?>
  </ul>
</div>
<script type="text/javascript"><!--
$('#carousel<?php echo $module; ?> ul').jcarousel({
	vertical: false,
<?php if($this->language->get('direction')=='rtl'){?>
	rtl: true, 
<?php }?>	
	visible: <?php echo $limit; ?>,
	scroll: <?php echo $scroll; ?>,
	easing: 'easeInOutExpo',
	animation: 800
});
//--></script>