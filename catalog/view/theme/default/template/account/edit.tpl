<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
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
  <form action="<?php echo $action; ?>" method="post" enctype="multipart/form-data">
    <h1><?php echo $text_your_details; ?></h1><br />

    <div class="content">
      <table class="form">
        <tr>
          <td><span class="required">*</span> <?php echo $entry_firstname; ?></td>
          <td><input type="text" name="firstname" value="<?php echo $firstname; ?>"  style="border:#D4D4D4 dotted 1px;" />
            <?php if ($error_firstname) { ?>
            <span class="error"><?php echo $error_firstname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_lastname; ?></td>
          <td><input type="text" name="lastname" value="<?php echo $lastname; ?>"  style="border:#D4D4D4 dotted 1px;"/>
            <?php if ($error_lastname) { ?>
            <span class="error"><?php echo $error_lastname; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_email; ?></td>
          <td><input type="text" name="email" value="<?php echo $email; ?>"  style="border:#D4D4D4 dotted 1px;width:150px;"/>
            <?php if ($error_email) { ?>
            <span class="error"><?php echo $error_email; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><span class="required">*</span> <?php echo $entry_telephone; ?></td>
          <td><input type="text" name="telephone" value="<?php echo $telephone; ?>"  style="border:#D4D4D4 dotted 1px;"/>
            <?php if ($error_telephone) { ?>
            <span class="error"><?php echo $error_telephone; ?></span>
            <?php } ?></td>
        </tr>
                <tr>
          <td><span class="required">*</span> <?php echo $entry_mobile; ?></td>
          <td><input type="text" name="mobile" value="<?php echo $mobile; ?>"  style="border:#D4D4D4 dotted 1px;"/>
            <?php if ($error_mobile) { ?>
            <span class="error"><?php echo $error_mobile; ?></span>
            <?php } ?></td>
        </tr>
        <tr>
          <td><?php echo $entry_fax; ?></td>
          <td><input type="text" name="fax" value="<?php echo $fax; ?>"  style="border:#D4D4D4 dotted 1px;"/></td>
        </tr>
      </table>
    </div>
    <div class="buttons">
      <div class="left" style="margin-left:165px;"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="left" style="margin-left:15px;">
        <input type="submit" value="<?php echo $button_continue; ?>" class="button" />
      </div>
    </div>
  </form>
  <?php echo $content_bottom; ?></div>
  </div>
<?php echo $footer; ?>