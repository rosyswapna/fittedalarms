<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;"><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h2><?php echo $heading_title; ?></h2>
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h1><?php echo $text_password; ?></h1><br />
	
    <div class="content">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_password; ?></td>
          <td><input type="password" name="password" value="<?php echo $password; ?>"  style="border:#D4D4D4 dotted 1px;"/>
            <?php if ($error_password) { ?>
            <span class="error"><?php echo $error_password; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_confirm; ?></td>
          <td><input type="password" name="confirm" value="<?php echo $confirm; ?>"  style="border:#D4D4D4 dotted 1px;"/>
            <?php if ($error_confirm) { ?>
            <span class="error"><?php echo $error_confirm; ?></span>
            <?php } ?></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left" style="margin-left:165px;"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="left" style="margin-left:15px;"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
  </div>
<?php echo $footer; ?>