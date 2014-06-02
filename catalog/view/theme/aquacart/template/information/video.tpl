<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
	<?php  echo $column_left; ?><?php echo $column_right; ?>
	<div id="content" class="video">

		<?php echo $content_top; ?>

		<div class="breadcrumb">
			<?php foreach ($breadcrumbs as $breadcrumb) { ?>
			<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
			<?php } ?>
		</div>

		<h1><?php echo $heading_title; ?></h1>

		<div class="content">
			<?php if($videos){?>
			<div class="box">
				<?php foreach ($videos as $video) { ?>
					<div class="video_holder">
						<p class="name"><?php echo $video['name'];?></p>
						<iframe width="250" height="250"  src="<?php echo $video['video_url']; ?>" frameborder="0" allowfullscreen></iframe>
					</div>
				<?php }?>
			</div>
			<?php }else{?>
			No Videos
			<?php }?>
		</div>

		<?php echo $content_bottom; ?>

	</div>
</div>
<?php echo $footer; ?>