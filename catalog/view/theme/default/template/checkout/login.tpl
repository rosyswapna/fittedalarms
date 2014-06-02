<div id="login" class="left">
<div class="registered">
  <div class="login_head"><?php echo $text_returning_customer; ?></div>
  
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="17%" class="login_titles">Username</td>
    <td height="20" colspan="2" class="login_titles"><input type="text" name="email" value="" style="border:#D4D4D4 dotted 1px;"/></td>
  </tr>
  <tr>
    <td class="login_titles">Password</td>
    <td width="17%" height="20" class="login_titles"><input type="password" name="password" value="" style="border:#D4D4D4 dotted 1px;"/></td>
    <td width="66%" class="login_titles"><a href="<?php echo $forgotten; ?>"><span class="bodyred"><?php echo $text_forgotten; ?></span></a></td>
  </tr>

  <tr>
    <td style="padding-top:5px;">&nbsp;</td>
    <td height="20" colspan="2" style="padding-top:5px;"><input type="button" value="<?php echo $button_login; ?>" id="button-login" class="button" /></td>
  </tr>
  </table>
  </div><br />

 <!-- <p><?php echo $text_checkout; ?></p>-->
  <label for="register" style="display:none;">
    <?php if ($account == 'register') { ?>
    <input type="radio" name="account" value="register" id="register" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="account" value="register" id="register" />
    <?php } ?>
    <b><?php echo $text_register; ?></b></label>
  <?php if ($guest_checkout) { ?>
  <label for="guest" style="display:none;">
    <?php if ($account == 'guest') { ?>
    <input type="radio" name="account" value="guest" id="guest" checked="checked" />
    <?php } else { ?>
    <input type="radio" name="account" value="guest" id="guest" />
    <?php } ?>
    <b><?php echo $text_guest; ?></b></label>
    <?php } ?>
 <!-- <br />
  <p><?php echo $text_register_account; ?></p>
  <input type="button" value="<?php echo $button_continue; ?>" id="button-account" class="button" />-->
  <br />
  <br />
</div>