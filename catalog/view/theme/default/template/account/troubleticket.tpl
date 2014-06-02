<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;"><?php echo $column_left; ?><?php echo $column_right; ?>
<div id="content"><?php echo $content_top; ?>
  <div class="breadcrumb">
    <?php foreach ($breadcrumbs as $breadcrumb) { ?>
    <?php echo $breadcrumb['separator']; ?><a href="<?php echo $breadcrumb['href']; ?>"><?php echo $breadcrumb['text']; ?></a>
    <?php } ?>
  </div>
  <h2><?php echo $heading_title; ?></h2>
<form name="Troubleticketing" action="<?php echo $crm_link;?>" method="post" accept-charset="utf-8">
		<input type="hidden" name="publicid" value="cc652bef0eca5987c95057ab02429078"></input>
		<input type="hidden" name="name" value="Troubleticketing"></input>
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td height="30" colspan="2" class="texttablebody">&nbsp;</td>
    </tr>
  <tr>
    <td width="19%" height="30" class="texttablebody">Title</td>
    <td width="81%" height="30"><input type="text" value="" name="ticket_title"  required="true"  style="border:#D4D4D4 dotted 1px;"/></input></td>
  </tr>
  <tr>
    <td width="19%" height="30" class="texttablebody">Priority</td>
    <td width="81%" height="30"><select name="ticketpriorities[]" required="true" style="border:#D4D4D4 dotted 1px;width:125px;">
      <option value="Low">Low</option>
      <option value="Normal">Normal</option>
      <option value="High">High</option>
      <option value="Urgent">Urgent</option>
    </select></td>
  </tr>
  <tr>
    <td width="19%" height="30" class="texttablebody">Category</td>
    <td width="81%" height="30"><select name="ticketcategories[]" required="true" style="border:#D4D4D4 dotted 1px;width:125px;">
      <option value="Big Problem">Big Problem</option>
      <option value="Small Problem">Small Problem</option>
      <option value="Other Problem">Other Problem</option>
    </select></td>
  </tr>
  <tr>
    <td width="19%" height="30" class="texttablebody">Description</td>
    <td width="81%" height="30"><input type="text" value="" name="description"  style="border:#D4D4D4 dotted 1px;"/></input></td>
  </tr>
  <tr>
    <td width="19%" height="30" class="texttablebody">Status</td>
    <td width="81%" height="30"><select name="ticketstatus[]" required="true" style="border:#D4D4D4 dotted 1px;width:125px;">
      <option value="Open">Open</option>
      <option value="In Progress">In Progress</option>
      <option value="Wait For Response">Wait For Response</option>
      <option value="Closed">Closed</option>
    </select></td>
  </tr>
  <tr>
    <td height="30" colspan="2" align="left" valign="middle">
    <input  type="submit" class="button" id="button_submit" value="Submit" /></input></td>
    </tr>
  <tr>
    <td height="30" colspan="2" align="center" valign="middle">&nbsp;</td>
  </tr>
   </table>
 
<!--    
    <div class="buttons">
      <div class="left"><a href="<?php echo $back; ?>" class="button"><?php echo $button_back; ?></a></div>
      <div class="right"><input type="submit" value="<?php echo $button_continue; ?>" class="button" /></div>
    </div>-->
  </form>
  <?php echo $content_bottom; ?></div></div>
<?php echo $footer; ?>