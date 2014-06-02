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
    <div class="kdo-box-heading"> 
        <a href="<?php echo $category['href']; ?>"<?php if ($category['category_id'] == $category_id) { ?> class="active"<?php } ?>>
        <?php echo $category['name']; ?>
        </a>
    </div>
  <div class="kdo-box-content">
    <ul id="accordion" class="kdo-category">
        <?php if ($category['children']) { ?> <?php foreach ($category['children'] as $child) { ?>
      <li>
                <a href="<?php echo $child['href']; ?>"<?php if ($child['category_id'] == $child_id) { ?> class="active" <?php } ?>><?php echo $child['name']; ?></a>
      

                    <?php if($child['sister_id']){ ?>
                      <ul>
                      <?php foreach($child['sister_id'] as $sisters) { ?>
                        <li>   
                        <a href="<?php echo $sisters['href']; ?>"<?php if ($sisters['category_id'] == $sisters_id) { ?> class="active"<?php } ?>>  <?php echo substr($sisters['name'],0,22); ?></a>
                        </li>
                      <?php } ?>
                      </ul>
                <?php } ?>
           
          <?php } ?>
       
      
      </li>
       <?php } ?>
    </ul>
  </div> <br /><?php } ?> 

<div class="kdo-box-heading"> 
      <a href="#" class="active">CCTVs</a>
    </div>
<div class="kdo-box-content">
    <ul id="accordion" class="kdo-category">
      <li>
       <a href="index.php?route=module/quote" >Bespoke CCTv Systems</a>
       </li>
       <li>
       <a href="index.php?route=module/cctvinstallation">Installation Only Service</a>
       </li>
    </ul>
  </div></div>