<script type="text/javascript" language="javascript">
jQuery(document).ready(function($) {
$('#accordion').dcAccordion({
eventType: 'hover',
autoClose: true,
saveState: true,
disableLink: false,
showCount: false,
speed: 'fast'
});
});
</script>
<div class="kdo-box">
    <?php foreach ($categories as $category) { ?>
    <div class="kdo-box-heading"> <a href="<?php echo $category['href']; ?>"<?php if ($category['category_id'] == $category_id) { ?> class="active"<?php } ?>><?php echo $category['name']; ?></a></div>

  <div class="kdo-box-content">
    <ul id="accordion" class="kdo-category">
      
      <li>
        <a href="<?php echo $category['href']; ?>"<?php if ($category['category_id'] == $category_id) { ?> class="active"<?php } ?>><?php echo $category['name']; ?></a>
        <?php if ($category['children']) { ?>
        <ul>
          <?php foreach ($category['children'] as $child) { ?>
              <li>
                <a href="<?php echo $child['href']; ?>"<?php if ($child['category_id'] == $child_id) { ?> class="active" <?php } ?>> - <?php echo $child['name']; ?></a>
                    <?php if($child['sister_id']){ ?>
                      <ul>
                      <?php foreach($child['sister_id'] as $sisters) { ?>
                        <li>   
                        <a href="<?php echo $sisters['href']; ?>"<?php if ($sisters['category_id'] == $sisters_id) { ?> class="active"<?php } ?>> - <?php echo $sisters['name']; ?></a>
                        </li>
                      <?php } ?>
                      </ul>
                <?php } ?>
              </li>
          <?php } ?>
        </ul>
        <?php } ?>
      </li>
     
    </ul>
  </div><br /><?php } ?>

 <?php foreach ($categories as $category) { ?>
  <table width="170" border="0" cellspacing="0" cellpadding="0" style="border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;background-color:#D5D5D5">
  <tr>
    <td bgcolor="#949494">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#949494">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#949494">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#949494">&nbsp;</td>
  </tr>
  <tr>
    <td bgcolor="#949494">&nbsp;</td>
  </tr>
</table>
<br/>
 <?php }?> 
</div>
<br />

