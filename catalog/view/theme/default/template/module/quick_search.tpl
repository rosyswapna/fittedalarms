

<div>
  <div id="quick-search-head">
      <span><?php //echo $heading_title; ?>quick<br/>search</span><img src="image/data/search.png" width="40" height="40">
    <!--<span  id="search_img" style="display:none;"><img src="image/data/search.png" width="30" height="30"></span>
    <span  id="search_text" style="display:none;"><?php echo $heading_title; ?></span>-->
  </div>
  <!--<div id="quick-search-head"></div>-->
  <div  id="quick-search-content" >
   	<ul class="box-quick_search">

   		<?php if(isset($brand_list)){
        foreach ($brand_list as $brand) {
      ?>
        <li>
          <a href="" class="active"><?php echo $brand['group']?></a>
          <ul>
            <?php foreach ($brand['brands'] as $val) {?>
              <li>
                <?php if (in_array($val['filter_id'], $filters)) { ?>
                    <input type="checkbox" value="m<?php echo $val['manufacturer_id']; ?>" id="brand<?php echo $val['manufacturer_id']; ?>"  checked/>
                <?php }else{?>
                  <input type="checkbox" value="m<?php echo $val['manufacturer_id']; ?>" id="brand<?php echo $val['manufacturer_id']; ?>"/>
                <?php }?>
                <label for="filter<?php echo $val['manufacturer_id']; ?>"><?php echo $val['manufacturer_name']; ?></label>
              </li>
            <?php }?>
          </ul>
        </li>
         
      <?php  
        }
       }?>


       <?php if(isset($feature_list)){
        foreach ($feature_list as $feature) {
      ?>
        <li>
          <a href="" class="active"><?php echo $feature['group']?></a>
          <ul>
          <!--
            <?php foreach ($feature['features'] as $val) {  ?>
              <li>
                <?php if (in_array($val['filter_id'], $filters)) { ?>
                    <input type="checkbox" value="f<?php echo $val['feature_id']; ?>" id="brand<?php echo $val['feature_id']; ?>"  checked/>
                <?php }else{?>
                  <input type="checkbox" value="f<?php echo $val['feature_id']; ?>" id="brand<?php echo $val['feature_id']; ?>"/>
                <?php }?>
                <label for="filter<?php echo $val['feature_id']; ?>"><?php echo $val['feature_description']; ?></label>
              </li>
            <?php }?>
            -->

            <li>
              <input type="checkbox" value="f2" id="brand2" <?php echo (in_array('f2', $filters))?"checked":"";?>/>
              <label for="filter2">Telecommunicating</label>
            </li>

            <li>
              <input type="checkbox" value="f15" id="brand15" <?php echo (in_array('f15', $filters))?"checked":"";?>/>
              <label for="filter15">Pet Friendly</label>
            </li>

            <li>
              <input type="checkbox" value="f17" id="brand17" <?php echo (in_array('f17', $filters))?"checked":"";?>/>
              <label for="filter17">GSM Communication</label>
            </li>

            <li>
              <input type="checkbox" value="f3" id="brand3" <?php echo (in_array('f3', $filters))?"checked":"";?>/>
              <label for="filter3">Zone controllable</label>
            </li>

            <li>
              <input type="checkbox" value="f9" id="brand9" <?php echo (in_array('f9', $filters))?"checked":"";?>/>
              <label for="filter9">   British Standard</label>
            </li>

          </ul>
        </li>
         
      <?php  
        }
       }?>


       <?php if(isset($price_range_list)){
        foreach ($price_range_list as $price_range) {
      ?>
        <li>
          <a href="" class="active"><?php echo $price_range['group']?></a>
          <ul>
            <?php foreach ($price_range['price_range'] as $val) { ?>
              <li>
                <?php if (in_array($val['filter_id'], $filters)) { ?>
                    <input type="checkbox" value="<?php echo $val['filter_id']; ?>" id="<?php echo $val['filter_id']; ?>"  checked />
                <?php }else{?>
                  <input type="checkbox" value="<?php echo $val['filter_id']; ?>" id="<?php echo $val['filter_id']; ?>" />
                <?php }?>
                <label for="filter<?php echo $val['filter_id']; ?>"><?php echo $val['description']; ?></label>
              </li>
            <?php }?>
          </ul>
        </li>
         
      <?php  
        }
       }?>




   	</ul>

  </div>
</div>

<script type="text/javascript"><!--

//$('.box-quick_search a').click(function() {
	//$(this).addClass('active');
//});

$(document).ready(function(){
  var hidden = $("#quick-search-content").is(":hidden");
  /*
  if(hidden){
       $("#search_img").show();
      $("#search_text").hide();
    }else{$("#search_text").show();
      $("#search_img").hide();
     
    }
    */
});

$('.box-quick_search input[type=\'checkbox\']').bind('click', function() {
	filter = [];
  
	
	$('.box-quick_search input[type=\'checkbox\']:checked').each(function(element) {
		filter.push(this.value);
	});
	
	location = '<?php echo $action; ?>&filter=' + filter.join(',');
});



  $("#quick-search-head").click(function(){

   // var hidden = $("#quick-search-content").is(":hidden");
   // $(".box-quick_search li a").hide();
    $("#quick-search-content").slideToggle(300,function(){
     /* if(hidden){
        $("#search_text").show();
        $(".box-quick_search li a").show();
        $("#search_img").hide();
      }else{
        $("#search_text").hide();
        $(".box-quick_search li a").hide();
        $("#search_img").show();
        
      }*/
   });

  });



 $('.box-quick_search input[type=\'checkbox\']:checked').each(function(element) {
    $("#quick-search-content").show();
  });


//--></script> 





