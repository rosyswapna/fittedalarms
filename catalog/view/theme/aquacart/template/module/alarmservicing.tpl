<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?>
<div class="alarmservicing" style="margin-top:-15px;">
<br />
  <h1><?php echo $heading_title; ?></h1>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td class="headadd">Why service your Burglar Alarm?</td>
  </tr>
  <tr>
    <td class="">If you have an alarm that needs servicing we can offer you solutions at one off costs to you, even if the alarm was not installed by us. We can also repair or replace parts of the system to get it up and running. We can repair and service any of the systems from the following manufacturers: Yale, Visonic, Infinite Prime and Commpact. 
</td>
  </tr>

  <tr><td height="10"></td></tr>

  <tr>
    <td class="">You can also choose one of our maintenance packages at the time of purchasing an alarm from us.
    </td>
  </tr>

  <tr><td height="10"></td></tr>

  <tr>
    <td class="alarmservicing_text">Regular servicing helps to maintain  the performance of an alarm system.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Fitted Home Alarms provide alarm  maintenance service for residential properties.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Regular servicing of an alarm system  ensures the system's reliability and durability.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Most alarms needs service once a  year.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">It is sensible and cost effective to  have regular alarm services done than to have breakdown repairs.</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td>

    <?php if($services){?>

    <ul class="servicing" >

    <?php foreach($services as $service){?>

    <li>
    
    <h4><?php echo $service['name'];?></br><span>Alarm service</span></h4>
    <h5><?php echo $service['price_text'];?><span>only</span></h5>
    <h6 class="addcarting">
     <img width="20" height="21" src="../image/data/cart_small.png"></img>
    
     <span class="button-cart" value="<?php echo $service['product_id'];?>">BUY NOW</span><?php  
        $features = $service['features'];
        if($features){ ?>
        
        <span style="padding-left:110px;"> 
          <a style="margin-top:-30px;"  class='features'  onclick="showHideDiv('#feature<?php echo $service['product_id']; ?>')"><span>Features</span>
          </a>
        </span>  
         
          <div id="feature<?php echo $service['product_id']; ?>"  class="service_features">
            <table width="100%" border="0" cellspacing="0" cellpadding="0">
                <?php foreach($features as $feature){ ?>
                <tr>
                  <td height="15" align="center" valign="middle">&nbsp;</td>
                  <td height="15" align="left" valign="middle" class="featureslist"> - <span style="font-size:9px; text-transform:capitalize;"><?php echo substr($feature['name'],0,90);?></span></td>
                  <td height="15" align="center" valign="middle">&nbsp;</td>
                </tr>
                <tr>
                  <td height="15" align="center" valign="middle">&nbsp;</td>
                  
                </tr>
                <?php }?>
            </table>
          </div>
        <?php }?>
 </h6>
      
        
<script>
function showHideDiv(id){
  $(id).toggle();
}
</script>


   
   
    </li>
    <?php }?>

    <!--<li>
    <a href="#">
    <h4>Visonic Wireless</br><span>ALARM SERVICE</span></h4>
    <h5>£120<span>only</span></h5>
    <h6 class="addcarting"><img width="20" height="21" src="../image/data/cart_small.png"></img><span>BUY NOW</span></h6>
    </a>
    </li>
    <li style="margin-right:0px">
    <a href="#">
    <h4>Infinite Prime Wireless</br><span>Alarm service</span></h4>
    <h5>£120<span>only</span></h5>
    <h6 class="addcarting"><img width="20" height="21" src="../image/data/cart_small.png"></img><span>BUY NOW</span></h6>
    </a>
    </li>-->


    </ul>

    <?php }?>
    </td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td class="headadd">Our Alarm Service  Package involves the following:</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Check history of alarm system since  last maintenance service</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Visual inspection of all major alarm  components including cabling &amp;   connections where accessible for signs of  deterioration or damage</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Check and walk test all detectors</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Check satisfactory operation of  manually operated devices e.g. panic buttons</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Check and test remote signalling  equipment (where appropriate)</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Make adjustments as necessary</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Repair minor faults where necessary  (additional costs may apply)</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Retrain the users on the use of the  alarm system (if required)</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Return the alarm system to  operational status</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td class="">Any complaints or existing faults should be mentioned to the engineer and please make sure it is recorded in the paper work at the time of alarm service. Replacing any broken or faulty parts will incur additional charges, if it is outside our warranty period. </td>
  </tr>

  <tr><td height="10"></td></tr>

  <tr>
    <td class="headadd">We recommend you arrange an alarm service if  your burglar alarm is showing any of the <br>
    following signs.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">PIR sensors and Door Sensor LED lights  flash for prolonged period.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">False Alarm Activations and difficulty  in disarming when activated.</td>
  </tr>
  <tr>
    <td class="alarmservicing_text">Low battery warning and faulty display  at Control Panel (This option is only available in certain models)</td>
  </tr>

   <tr>
    <td class="alarmservicing_text">Any other problems with operation of the alarm system.</td>
  </tr>
   <tr>
    <td class="alarmservicing_text">If the alarm is visibly damaged or any parts have fallen off.</td>
  </tr>

  <tr>
    <td>&nbsp;</td>
  </tr>

  <tr>
    <td class="headadd">We also offer a range of maintenance packages tailored to your requirements at affordable rates. You can choose any of these packages when placing the order.</td>
  </tr>

  <tr>
    <td>
      <table width="100%" border="0">
          <tr>
            <td width="100%">
              <p class="headadd" style="border:none;"><h1>Alarm Maintenance only £9.99 per month</h1></p>
              
              <p >Prices include cost of batteries and VAT.</p>
              <p >Alarm comes with 1 year warranty for products and installation.</p>

            </td>
            </tr>
          <tr>
            <td width="100%">
              <p class="headadd" style="border:none;"><h1>Alarm Maintenance  with Extended Warranty £12.99 per month</h1></p> 
              
              <p>Prices include cost of replacing any faulty parts, cost of batteries and VAT. </p>
              <p>Extended warranty for product and installation. All parts repaired or replaced at no additional cost to you</p>
            </td>
          </tr>
          <tr>
            <td>
              <p class="headadd" style="border:none;"><h1>Alarm Monitoring and Annual Maintenance: £15.99 per month</h1></p>
              
              <p >Prices include monthly monitoring charges, cost of batteries and VAT.</p>
              <p > Monitoring services from Custodian Monitoring Services.</p>
              <p >Alarm comes with 1 year warranty for products and installation.</p>

            </td>
            </tr>
          <tr>
            <td>
              <p class="headadd" style="border:none;"><h1>Alarm Monitoring and Annual Maintenance with Extended Warranty: £18.99 per month</h1></p>
              
              <p >Prices include monthly monitoring charges, cost of replacing any faulty parts, cost of batteries and VAT. </p>
              <p >Monitoring services from Custodian Monitoring Services.</p>
              <p >Extended warranty for product and installation. All parts repaired or replaced at no additional cost to you.</p>
            </td>
          </tr>
      </table>
    </td>
  </tr>


  <tr>
    <td>
    <div class="callrightnow">
      <a style="color:#FFFFFF" href="index.php?route=information/contact">
   	 <img width="46" height="47" src="image/data/callusicon.png"></img>Any questions,
do not hesitate to contact us
 	 <img width="46" height="47" style="float:right" src="image/data/arrow-double.png"></img>
	  </a>
  </div></td>
  </tr>
  </table>


</div></div>
<?php echo $footer; ?>


   
<script>

$(document).ready(function(){

$('.button-cart').bind('click', function() {
  var value = $(this).attr('value');
  $.ajax({
      url: 'index.php?route=checkout/cart/add_alarm_servicing',
      type: 'post',
      data:'product_id='+value,
      success:function(json){
        window.location='index.php?route=checkout/cart';
      },
      failure:function(){
        alert("Invalid Service");
      }
  });

});



$("#frm_get_quote").submit(function(e) {
     var self = this;
     e.preventDefault();
 	  var callback = $("#callback").val();
	  var product = $("#product").val();
	  var comments = $("#comments").val();
	  var description = "From : Get A Quote \r\nComments : "+comments + "\r\n   Preffered Call Back Time : "+callback+ "\r\n"+"    Product : "+product;
		$("#description").val(description);
      	self.submit();
		//return false;
     });
    return false; //is superfluous, but I put it here as a fallback

		
});



</script>