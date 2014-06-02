<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">

  <?php echo $column_left; ?><?php echo $column_right; ?>

  <div id="content">

    <?php echo $content_top; ?>

    <div class="breadcrumb">
      <?php foreach ($breadcrumbs as $breadcrumb) { ?>
        <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
      <?php } ?>
    </div>

    <div class="notfound">
      <h1><?php echo $heading_title; ?></h1>
    </div>

    <div class="notfound_text"><?php echo $text_error; ?></div>

    <div style="margin:10px;">
      <div class="buttons"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
   
 
    <?php echo $content_bottom; ?>

  </div>

</div>

<?php echo $footer; ?>