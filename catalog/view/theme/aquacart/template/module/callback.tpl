<?php echo $header; ?>
<div class="call_back">
<h1><?php echo $heading_title; ?></h1>
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">
    <form id="form1" name="form1" method="post" action="<?php echo $action; ?>">
    <table width="85%" border="0" align="center" cellpadding="0" cellspacing="0">
      <tr>
        <td height="30" colspan="2">    <?php if ($error_enquiry) { ?>
              <span class="validate_error"><?php echo $error_enquiry; ?></span>
              <?php } ?>
              <?php if ($error_email) { ?>
              <span class="validate_error"><?php echo $error_email; ?></span>
              <?php } ?></td>
        </tr>
      <tr>
        <td width="50%" height="30" class="texttablebody"><?php echo $entry_name;?></td>
        <td width="50%" height="30">
         <input type="text" name="name" id="name" style="border:#D4D4D4 dotted 1px;" />
        </td>
      </tr>
      <tr>
        <td width="50%" height="30" class="texttablebody"><?php echo $entry_postcode;?></td>
        <td width="50%" height="30">
          <input type="text" name="postcode" id="postcode"  style="border:#D4D4D4 dotted 1px;"/></td>
      </tr>
      <tr>
        <td width="50%" height="30" class="texttablebody"><?php echo $entry_email;?></td>
        <td width="50%" height="30">
          <input type="text" name="email" id="email"  style="border:#D4D4D4 dotted 1px;"/></td>
      </tr>
      <tr>
        <td width="50%" height="30" class="texttablebody"><?php echo $entry_call_back;?></td>
        <td width="50%" height="30">
          <input type="text" name="callback" id="callback" style="border:#D4D4D4 dotted 1px;" /></td>
      </tr>
      <tr>
        <td width="50%" height="30" class="texttablebody"><?php echo $entry_product;?></td>
        <td width="50%" height="30">
          <select name="product" id="product" style="border:#D4D4D4 dotted 1px;width:100px;">
          <?php foreach ($categories as $category) { ?>
          <option value="<?php echo $category['category_id']?>"><?php if ($category['category_id'] == $category_id) { ?> class="active"<?php } ?>
        <?php echo $category['name']; ?></option>
          <?php }?>
          </select></td>
      </tr>
      <tr>
        <td width="50%" height="30" class="texttablebody"><?php echo $entry_contact;?></td>
        <td width="50%" height="30">
          <input type="text" name="number" id="number"  style="border:#D4D4D4 dotted 1px;" /></td>
      </tr>
      <tr>
        <td width="50%" height="30">&nbsp;</td>
        <td width="50%" height="30">&nbsp;</td>
      </tr>
      <tr>
        <td height="30" colspan="2" align="center" valign="middle">
        <div class="buttons">
        <input type="submit" name="button" class="button" id="button" value="Send" />
        </div></td>
        </tr>
    </table>
    </form>
    </td>
    <td width="50%" align="center" valign="top"><table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td>Areas Covered</td>
      </tr>
      <tr>
        <td><img src="image/data/maps.jpg" width="131" height="130" />
        
        </td>
      </tr>
      <tr>
        <td align="center" valign="middle">Our installation team currently cover the following counties : Bedfordshire, Berkshire, Buckinghamshire, Cambridgeshire, East Sussex, Essex, Gloucestershire, Greater London, Hampshire, Hertfordshire, Kent, Leicestershire, Northamptonshire, Oxfordshire, Surrey, Warwickshire, West Midlands, West Sussex and Wiltshire.</td>
      </tr>
    </table></td>
  </tr>
</table>

</div>
<?php echo $footer; ?>