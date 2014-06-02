<div style="background:url(../../../../../../image/data/slshow_bg.png) no-repeat; padding-top:12px;border: 1px solid rgb(256, 256, 256);border-radius:8px;margin-bottom: 10px; z-index:1015;">



<!--div pin for slide up and down div content start here-->
<div style="height:58px;width:913px; margin-left:9px; margin-right:auto;border-top-right-radius:10px;
<?php if($current_url=="/"||$current_url=="/index.php?route=common/home"){ ?><?php  }else{?>border-bottom-left-radius:10px;border-bottom-right-radius:10px;<?php }?>" >
<div style="border-top-left-radius:10px;border-top-right-radius:10px;background: #fff url('/image/data/2ndmenu-825x58.png') no-repeat; background-size:914px 60px;">
  <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" style="padding-top:1px;">
    <tr height="50px" >
      <td align="left" width="185">
        <div class="mouse_over_pin" target="1" style="background: url('/image/data/inst.png') no-repeat; border-right: #fec780 dashed 1px; border-length: 45px;"> 
		  <span class="bannerstatic_text_upper">Installation</span><br/>
          <span class="bannerstatic_text_lower">with warranty</span>
        </div>
      </td>
      <td align="left" width="180">
        <div class="mouse_over_pin" target="2" style="background: url('/image/data/inst3.png') no-repeat; border-right: #fec780 dashed 1px; border-length: 45px;">
          <span class="bannerstatic_text_upper">No Hidden</span><br/>
          <span class="bannerstatic_text_lower">Charges</span>
        </div>
      </td>
      <td align="left" width="160">
        <div class="mouse_over_pin" target="3" style="background: url('/image/data/inst2.png') no-repeat; border-right: #fec780 dashed 1px; border-length: 45px;">
          <span class="bannerstatic_text_upper">Quick </span><br/>
          <span class="bannerstatic_text_lower">Fitting</span>
        </div>
      </td>
      <td align="left" width="160">
        <div class="mouse_over_pin" target="4" style="background: url('/image/data/inst4.png') no-repeat; border-right: #fec780 dashed 1px; border-length: 45px;">
          <span class="bannerstatic_text_upper">Certified</span><br/>
          <span class="bannerstatic_text_lower">Installers</span>
        </div>
      </td>
      <td align="left" width="229">
        <div class="mouse_over_pin" target="5" style="background: url('/image/data/inst5.png') no-repeat;">
          <span class="bannerstatic_text_upper">All Prices include</span><br>
          <span class="bannerstatic_text_lower">Fitting Charges &amp; Taxes</span>
        </div>
      </td>
    </tr>
  </table>

</div>
</div>

<!--div pin for slide up and down div content end here-->


<!--slide up and down div content start here-->

<div style="z-index:15000;position:absolute;">

  <div id="mouseover_div1" class="mouse_over_content">
    <div class="mouseover_div">
      <h1>INSTALLATION WITH WARRANTY</h1><br>
      <p>All our installation services come with warranty for your peace of mind. Anything goes wrong, rest assured, we will be there to fix it. All our alarms are fitted with 1 year onsite warranty for products and installation. And our CCTV systems come with 2 year onsite warranty. We keep it simple and easy to understand: Your warranty covers you for everything except in circumstances when someone tampers with and physically breaks the alarm.</p>
    </div>  
  </div>

  <div id="mouseover_div2" class="mouse_over_content">
       <div class="mouseover_div">
          <h1>NO HIDDEN CHARGES</h1><br>
           <p> Our pricing is simple and straight forward. Once you pay for your system and its installation, it is completely owned by you. There are no hidden charges, no monitoring charges, no contract traps, and no monthly fees. All our prices are published on the website and rate cards carried around by our engineers. All Price include fitting charges & VAT. 
            </p>
       </div>   
  </div>

  <div id="mouseover_div3" class="mouse_over_content">
      <div class="mouseover_div">
          <h1>QUICK FITTING</h1><br>
          <p> We are a quick turnaround company. We aim to do all our alarm installations within 5 days of your order. You also have the option of getting installations done within 24 hours of order, in evenings or weekends for a small additional fee. We do not have any salespeople visiting you in any expensive cars. We help you choose the alarms over the phone, and our team members can help you decide on right alarm system and the number of sensors you require as well. Our installation services start with a home security survey, followed by discussing position of products and any accessories (Our engineers carry stock of all major alarms and accessories we install). Once we finalise your requirements, the engineers will install the product, and finish by training you and your family members the operation of the system, along with leaving you all the necessary paper works and collecting any outstanding payments (We accept all major debit card and credit card payments, cheque and cash).</p>
      </div>   
  </div>

  <div id="mouseover_div4" class="mouse_over_content">
      <div class="mouseover_div">
        <h1>CERTIFIED INSTALLERS</h1><br>
          <p>All our installers are CRB checked for your protection and are manufacturer trained specialist engineers. So if you are getting a Yale alarm from us, the engineer will be a Yale trained engineer. We do not outsource any part of our services to you. All our installations are carried out by one of our field engineers. </p>
      </div>   
  </div>

  <div id="mouseover_div5" class="mouse_over_content">
    <div class="mouseover_div">
         <h1>ALL PRICES INCLUDE FITTING AND VAT</h1><br>
           <p>Our pricing is simple and straight forward. You pay what it says on the website. Prices are clearly displayed and it is all inclusive. Every product, and its accessories, the prices you see includes fitting and VAT. All our prices are published on the website and rate cards carried around by our engineers.</p>
    </div>   
  </div>

</div>
<!--slide up and down div content end here-->





<div class="slideshow" style="height:215px;border-bottom-left-radius:10px;border-bottom-right-radius:10px;">
  <div id="nivoslider<?php echo $module; ?>" class="nivoSlider" style="width: 914px; height: 200px; margin-left:8px;margin-right:auto; ">
    <?php foreach ($banners as $banner) { ?>
    <?php if ($banner['link']) { ?>
    <a href="<?php echo $banner['link']; ?>"><img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" /></a>
    <?php } else { ?>
    <img src="<?php echo $banner['image']; ?>" alt="<?php echo $banner['title']; ?>" width="100%" height="100%"/>
    <?php } ?>
    <?php } ?>
  </div>
</div>
<script type="text/javascript">
	$(document).ready(function() 
	{
			//var filter = $slide_startSlide;
		
			$('#nivoslider<?php echo $module; ?>').nivoSlider({
			effect:'<?php  echo$display_soption; ?>', // Specify sets like: 'fold,fade,sliceDown'
			slices: <?php echo $slide_slices; ?>, // For slice animations
			boxCols: <?php echo $slide_boxCols; ?>, // For box animations
			boxRows: <?php echo $slide_boxRows; ?>, // For box animations
			animSpeed: <?php echo $slide_animSpeed; ?>, // Slide transition speed
			pauseTime: <?php echo $slide_pauseTime; ?>, // How long each slide will show
			startSlide: <?php echo $slide_startSlide; ?>
			
	   })
	});
</script>
</div>




<script>
$(document).ready(function(){


//slide up and down on mouse events start
  $(".mouse_over_pin").mouseenter(function() {
      var target =$(this).attr('target');             
      $('#mouseover_div'+target).slideDown();     
  }).mouseleave(function () { 
    var target =$(this).attr('target');
    $('#mouseover_div'+target).slideUp("slow");
    $('#mouseover_div'+target).hide();
  
  });
//slide up and down on mouse events end



  $('.ft_submenu').mouseover(function(){
      $(".ft_submenu ul").toggle();
  });
  $('.ft_submenu').mouseout(function(){
      $(".ft_submenu ul").toggle();
  });


});
</script>