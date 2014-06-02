<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php if ($success) { ?>
<div class="success"><?php echo $success; ?></div>
<?php } ?>
<?php if ($error_warning) { ?>
<div class="warning"><?php echo $error_warning; ?></div>
<?php } ?>
<?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h2><?php echo $heading_title; ?></h2>
  <div class="login-content">
    <div class="left">
      <h1><?php echo $text_new_customer; ?></h1><br />

      <div class="content" style="width:300px;">
        <p><b><?php echo $text_register; ?></b></p>
        <p><?php echo $text_register_account; ?></p><br />

        <a href="<?php echo $register; ?>" class="button"><?php echo $button_continue; ?></a></div>
    </div>
    <div class="right">
      <h1><?php echo $text_returning_customer; ?></h1><br />

      <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
        <div class="content">
          <p><?php echo $text_i_am_returning_customer; ?></p>
          <b><?php echo $entry_email; ?></b><br />
          <input name="email" type="text" style="border:#D4D4D4 dotted 1px;width:150px;" value="<?php echo $email; ?>"/>
          <br />
          <br />
          <b><?php echo $entry_password; ?></b><br />
          <input name="password" type="password" style="border:#D4D4D4 dotted 1px;" value="<?php echo $password; ?>"/>
          <br />
          <a href="<?php echo $forgotten; ?>"><?php echo $text_forgotten; ?></a><br />
          <br />
          <input type="submit" value="<?php echo $button_login; ?>" class="button" style="border:#D4D4D4 dotted 1px;"/>
          <?php if ($redirect) { ?>
          <input type="hidden" name="redirect" value="<?php echo $redirect; ?>" style="border:#D4D4D4 dotted 1px;"/>
          <?php } ?>
        </div>
      </form>
    </div>
  </div>
  <?php echo $content_bottom; ?></div>
<script type="text/javascript"><!--
$('#login input').keydown(function(e) {
	if (e.keyCode == 13) {
		$('#login').submit();
	}
});
//--></script> 
</div>
<?php echo $footer; ?>