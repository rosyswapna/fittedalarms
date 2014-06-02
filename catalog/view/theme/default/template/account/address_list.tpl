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
  <h1><?php echo $text_address_book; ?></h1><br />

  <?php foreach ($addresses as $result) { ?>
  <div class="content">
    <table style="width: 100%;">
      <tr>
        <td bgcolor="#EBEBEB"><strong>Current Address :</strong><br />
<?php echo $result['address']; ?></td>
        <td align="left" valign="bottom" style="text-align: right; "><a href="<?php echo $result['update']; ?>" class="button" style="margin-left:15px;"><?php echo $button_edit; ?></a> &nbsp; <a href="<?php echo $result['delete']; ?>" class="button" style="margin-left:15px;"><?php echo $button_delete; ?></a></td>
      </tr>
    </table>
  </div>
  <?php } ?>
  <div class="buttons">
    <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
    <div class="left" style="margin-left:15px;"><a href="<?php echo $insert; ?>" class="button"><?php echo $button_new_address; ?></a></div>
  </div>
  <?php echo $content_bottom; ?></div>
  </div>
<?php echo $footer; ?>