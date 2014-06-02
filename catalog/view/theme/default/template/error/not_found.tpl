<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb"><br />
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    
<?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <!--
  <div class="notfound">
  <h1><?php echo $heading_title; ?></h1>
  </div>
  <div class="notfound_text"><?php echo $text_error; ?>z</div>
  <div class="notfound">
    <div class="buttons"><a href="<?php echo $continue; ?>" class="button"><?php echo $button_continue; ?></a></div>
  </div>
  -->
  <div class="not_found_error" style="text-align:center;line-height:25px;">
    <h1 style="color: #FF0000;">404 Error</h1><br/>
    <p style="font-size:16px;font-weight:bold;"> We're Sorry</p> 
    <span style="font-size:14px;">Something has gone wrong . We are investigating the cause and are working to fix it as <br/>
    soon as we can<br/>
    We are very sorry for the inconvenience.<br/>
    <a href="<?php echo $support;?>"  style="color: rgb(236, 98, 23);font-weight:bold;">Click Here for Support</a><br/>
    <a href="<?php echo $continue; ?>"  style="color: rgb(236, 98, 23);font-weight:bold;"> < Back to the home page </a>
    </span>  
  </div>


  <?php echo $content_bottom; ?></div>
  </div>
<?php echo $footer; ?>