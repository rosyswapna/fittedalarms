<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
  <?php echo $column_left; ?>
  <div class="expressinstall" style="margin-top:-15px;"><br />
    <h1><?php echo $heading_title; ?></h1>
    <table width="100%" border="0" cellspacing="0" cellpadding="0">
      <tr>
        <td width="69%" align="center" valign="middle" style="padding-left:25px;">
          

            <?php if($services){?>

            <ul class="expressin">

              <?php foreach($services as $service){?>

              <li>
              
                <h3><?php echo $service['name'];?></h3>
                <h4>Express Installation <span>service</span></h4>
                <h5><?php echo $service['price_text'];?><span>only</span></h5>
                <h6 class="addcarting">
                  <img width="20" height="21" src="../image/data/cart_small.png"></img>
                  <span class="button-cart" value="<?php echo $service['product_id'];?>">BUY NOW</span>
              </h6>
              
            </li>

              <?php }?>

            </ul>

            <?php }?>
          <!--<ul class="expressin">

            <li>
              <a href="#">
                <h3>24</br><span>Hours</span></h3>
                <h4>Express Installation <span>service</span></h4>
                <h5>£99<span>only</span></h5>
                <h6 class="addcarting" style="width:135px">
                  <img width="20" height="21" src="../image/data/cart_small.png"></img><span>Add to Cart</span></h6>
              </a>
            </li>

            <li style="margin-right:0px">
              <a href="#">
                <h3>48</br><span>Hours</span></h3>
                <h4>Express Installation<span> service</span></h4>
                <h5>£49<span>only</span></h5>
                <h6 class="addcarting" style="width:135px">
                  <img width="20" height="21" src="../image/data/cart_small.png"></img><span>Add to Cart</span>
                </h6>
              </a>
            </li>

            <li>
              <a href="#">
                <h3><span>Evening</span></h3>
                <h4>Installation</br><span>service</span></h4>
                <h5>£39<span>only</span></h5>
                <h6 class="addcarting" style="width:135px">
                  <img width="20" height="21" src="../image/data/cart_small.png"></img><span>Add to Cart</span>
                </h6>
              </a>
            </li>
            <li style="margin-right:0px">
              <a href="#">
                <h3><span>Weekend</span></h3>
                <h4>Installation<span></br>service</span></h4>
                <h5>£39<span>only</span></h5>
                <h6 class="addcarting" style="width:135px">
                  <img width="20" height="21" src="../image/data/cart_small.png"></img><span>Add to Cart</span>
                </h6>
              </a>
            </li>
          </ul>-->


        </td>
        <td width="31%"><img src="../image/data/howitworks.jpg" width="209" height="492" /></td>
      </tr>
      <tr>
        <td class="expressintext">* Please call to confirm express  installation service is available for your area at the time of your order.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">24 Hours express installation  service costs an additional <strong>£99.00</strong> on top of the product package you&rsquo;ve  chosen.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">48 Hours express installation  service costs an additional <strong>£49.00</strong> on top of the product package you&rsquo;ve  chosen.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">We do evening installations on  weekdays (Monday – Friday, after 5.30   pm) to save you having to take days off  from work to get alarms   installed. This service costs an additional <strong>£39.00</strong> on top of the product packages  you&rsquo;ve chosen.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">We do evening installations on  weekends (Saturday) to save you having   to take days off from work on a weekday.  This service costs an   additional <strong>£39.00</strong> on top of the product packages you&rsquo;ve chosen.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">Before paying for Express  Installation Service, please call to confirm   express installation service is  available for your area at the time of   your order.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">Due to the urgency of the work  that needs completion; we can only   provide a window (eg: Next day between 2pm  and 5pm) within which we can   do the installation works.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td class="expressintext">Standard installation is carried  out 3 to 5 working days after the date of purchasing.</td>
        <td>&nbsp;</td>
      </tr>
      <tr>
        <td>&nbsp;</td>
        <td>&nbsp;</td>
      </tr>
    </table>
  </div>
</div>
<?php echo $footer; ?>

<script>

$(document).ready(function(){

  $('.button-cart').bind('click', function() {
    var value = $(this).attr('value');

    $.ajax({
      url: 'index.php?route=checkout/cart/add_service',
      type: 'post',
      data: 'service=' + value,
      dataType: 'json',
      success: function(json) {
        if(json['service_charge']){
          window.location='index.php?route=checkout/cart';
        }
      }
    });
    
  });

  
});



</script>