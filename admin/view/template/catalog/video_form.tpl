<?php echo $header; ?>

<div id="content">
	<div class="breadcrumb">
	    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
	    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
	    <?php } ?>
  	</div>

	<?php if ($error_warning) { ?>
	<div class="warning"><?php echo $error_warning; ?></div>
	<?php } ?>

	<div class="box">
		<div class="heading">
	      <h1><img src="view/image/video.png" alt="" /> <?php echo $heading_title; ?></h1>
	      <div class="buttons"><a onclick="$('#form').submit();" class="button"><?php echo $button_save; ?></a><a href="<?php echo $cancel; ?>" class="button"><?php echo $button_cancel; ?></a></div>
	    </div>

	    <div class="content">
	    	<div id="tabs" class="htabs">
	    		<a href="#tab-general"><?php echo $tab_general; ?></a>
	    		<a href="#tab-data"><?php echo $tab_data; ?></a>
	    	</div>
	    	<form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data" id="form">
	    	<div id="tab-general">
	    		<div id="languages" class="htabs">
	    			<?php foreach ($languages as $language) { ?>
		            <a href="#language<?php echo $language['language_id']; ?>"><img src="view/image/flags/<?php echo $language['image']; ?>" title="<?php echo $language['name']; ?>" /> <?php echo $language['name']; ?></a>
		            <?php } ?>
	    		</div>

	    		<?php foreach ($languages as $language) { ?>
          		<div id="language<?php echo $language['language_id']; ?>">
          			<table class="form">
						<tr>
							<td><span class="required">*</span> <?php echo $entry_name; ?></td>
							<td><input type="text" name="video_description[<?php echo $language['language_id']; ?>][name]" size="100" value="<?php echo isset($video_description[$language['language_id']]) ? $video_description[$language['language_id']]['name'] : ''; ?>" />
							<?php if (isset($error_name[$language['language_id']])) { ?>
							<span class="error"><?php echo $error_name[$language['language_id']]; ?></span>
							<?php } ?></td>
						</tr>
						<tr>
							<td><?php echo $entry_description; ?></td>
							<td><textarea name="video_description[<?php echo $language['language_id']; ?>][description]" cols="97" rows="5"><?php echo isset($video_description[$language['language_id']]) ? $video_description[$language['language_id']]['description'] : ''; ?></textarea></td>
						</tr>
					</table>
          		</div>
          		<?php } ?>

	    	</div>

	    	<div id="tab-data">
	    		<table class="form">
		            <tr>
		              <td><span class="required">*</span> <?php echo $entry_url; ?></td>
		              <td><input type="text" name="video_url" value="<?php echo $video_url; ?>" />
		                <?php if ($error_url) { ?>
		                <span class="error"><?php echo $error_url; ?></span>
		                <?php } ?></td>
		            </tr>

		            <!--
		            <tr>
		              <td><?php echo $entry_product; ?></td>
		              <td><input type="text" name="product_id" value="<?php echo $product_id; ?>" />
		              </td>
		            </tr>
		            -->

		        </table>
	    	</div>

	    	</form>

	    </div>

	</div>

</div>

<script type="text/javascript"><!--
$('#tabs a').tabs();
$('#languages a').tabs();
//--></script>

<?php echo $footer; ?>