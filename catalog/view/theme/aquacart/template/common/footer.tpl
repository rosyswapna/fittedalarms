
<script>

$(document).ready(function(){

$(".inline").colorbox({inline:true, width:"50%"});


$("#frm_callback").submit(function(e) {
     var self = this;
     e.preventDefault();
 	  var callback = $("#callback").val();
	  var product = $("#product").val();
	  var description = "From : Request A Call Back \r\n Preffered Call Back Time :"+callback+ "\r\n"+"  Product :"+product;
		$("#description").val(description);
      self.submit();
     });
    // return false; //is superfluous, but I put it here as a fallback

		
});
</script>
<script>
function openWin()
{
var url="http://www.onlinechatcenters.com/chat/20937?SESSID=u9247cjjsm3ova8phnj09kmme2&ref=http%3A%2F%2Fwww.fittedhomealarms.co.uk%2F&data=%26nbsp%3B";
myWindow=window.open(url,'','width=800,height=600');
myWindow.focus();
}
</script>

<!--parameters From crm web forms start here-->
<?php if(isset($_GET['from'])){ ?>

  <?php if(isset($_GET['error'])){ ?>
  <script type="text/javascript">
    alert("<?php echo $_GET['from']?>:<?php echo $_GET['error'];?>");
  </script>
  <?php } ?>

  <?php if(isset($_GET['success']) && $_GET['success'] == 'ok'){ ?>
  <script type="text/javascript">


    alert("<?php echo $_GET['from']?> : Success");

  </script>
  <?php } ?>

<?php } ?>
<!--From drm web forms ends here-->


<div class="footer_container">
<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="30">&nbsp;</td>
    <td width="200px">
      <div class="footersubs">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><span class="footer_head">Shopping</span></td>
            </tr>
          <tr>
            <td height="10px"></td>
            </tr>
          <?php foreach ($categories as $category) { ?>
          <tr>
            <td class="footer_sub_heads"> 
              <a href="<?php echo $category['href']; ?>"<?php if ($category['category_id'] == $category_id) { ?> class="active"<?php } ?>>
                <?php echo $category['name']; ?>
                </a>
              </td>
            </tr>
          <?php }?>
          <?php foreach ($informations as $information) { ?>
          <tr>
            <td class="footer_sub_heads"><a href="<?php echo $information['description']; ?>"><?php echo $information['title']; ?></a></td>
            </tr>
          <?php }?>
          </table>
        </div>
    </td>
    <td width="170px">
      <div class="footersubs_company">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><span class="footer_head">Company</span></td>
            </tr>
          <tr>
            <td height="20px"></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=module/aboutus">About Us</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/jobs">Jobs</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/termscondition">Terms &amp; Conditions</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/cookies">Cookies Policy</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=module/testimonial">Testimonials</a></td>
            </tr>
          </table>
        </div>
    </td>
    <td width="260px">
      <div class="footersubs_support">
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td><span class="footer_head">Customer Support</span></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=product/compare">Compare Alarms</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a class='inline' href="#inline_content1">Request Callback</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/contact">Contact Us</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/faq">FAQs</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/sitemap">Sitemap</a></td>
            </tr>
          <tr>
            <td class="footer_sub_heads"><a href="index.php?route=information/areascovered">Areas Covered</a></td>
            </tr>
          </table>
      </div>
    </td>
    <td width="350" style="padding-right:50px;"> <?php if ($tagcloud) {
        echo $tagcloud;
    } else {
        echo $text_notags;
    } ?>	
    </td>
  </tr>
  <tr>
    <td colspan="4"><div style="clear:both"></div>
<div class="sharer"><!-- AddThis Button BEGIN -->
<div class="addthis_toolbox addthis_default_style ">
<a class="addthis_button_facebook_like" fb:like:layout="button_count"></a>
<a class="addthis_button_tweet"></a>
<a class="addthis_button_google_plusone" g:plusone:size="medium"></a>
<a class="addthis_button_pinterest_pinit"></a>
<a class="addthis_counter addthis_pill_style"></a>
<!--<a class="addthis_counter addthis_pill_style"></a>-->
</div>
<script type="text/javascript" src="http://s7.addthis.com/js/250/addthis_widget.js#pubid=xa-4fcfa5ab11a3e867"></script>
<!-- AddThis Button END --></div></td>
    </tr>
  <tr>
    <td colspan="4">&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td colspan="5" style="padding-left:25px;padding-top:5px;"><img src="image/data/cards_logos_org.jpg"/> 
    <flashrichtext version="1">
    <textformat font="Verdana" size="11" color="734012" bold="false" italic="false" underline="false" url="" target="" align="left" leftMargin="0" rightMargin="0" topMargin="10px" indent="0" leading="2" blockIndent="0" kerning="false" letterSpacing="0" display="block">
    <script type="text/javascript" src="https://sealserver.trustwave.com/seal.js?style=invert&amp;code=6cd20bda9dab41bb8a21c6b155314c3f"></script>
    </textformat>
    </flashrichtext>
    <div style="clear:both"></div></td>
    </tr>
  </table>
  <br /><br />
	<table style="background-image:url(../../../../../../image/data/ftrbgg.png); width:100%; height:47px;margin-top:0px;">
      <tr>
        <td colspan="5" style="margin-left:auto; margin-right:auto; text-align:center; padding-top:0px;font-size:11px;font-family:Tahoma;color:#333333;">
        	We use some non-essential cookies to improve your online experience. By using this site you consent to this use in our Cookies policy<br />
    		Copyright © 2013. Fitted Home Alarms. All rights reserved.
        </td>
      </tr>
    </table>
    <br /><br />
</div>
<?php 
  if(isset($this->request->get['route'])){ 
      $currenturl=$this->request->get['route']; 
  }else{ 
    $currenturl=""; 
  }
  if($currenturl!="checkout/checkout"){ ?>

<div id="right_corner_livechat">
  <a href="#" onclick="openWin()"><img src="http://www.onlinechatcenters.com/status-20937"></a><br/>
  <!--<div id="right_corner_phone"><img src="image/data/Phone_Ringing.gif" height=60px; width=75px;><br/>
  <div id="text"><a class='inline' href="#inline_content1" style="color:rgb(236, 98, 23);">Request A call back within 60 mins</a></div>
  </div>-->
</div>

<?php echo $column_left_end;?>


<div class="callbackin">
  <a class='inline' href="#inline_content1" style="color:rgb(236, 98, 23);">
    <img width="40" height="40" src="image/data/Phone_Ringing.gif"></img>
  </a>
</div>


<div class="facebookus">
  <a href="https://www.facebook.com/fittedhomealarmsltd" target="_new">
   <img src="image/data/fb.png" width="32" height="32">
  </a>
</div>



<?php }?>
 
<!--<div id="right_corner_fb"><a href="https://www.facebook.com/fittedhomealarmsltd" target="_new"><img src="image/data/social_facebook_button_blue.png"></a><br/><div id="text">Got a Question ? <br/>FACEBOOK us !</div>
</div>-->

<div style='display:none'>

 


  <div id="map_zoom" style="padding-left:100px;"><img src="image/data/maps.jpg" height="500"></div>
    <div id='inline_content1' style='padding:10px; background:#fff;'>
      <div>
        <h1 style ="color: rgb(215, 131, 43);font-weight: normal;font-size: 20px;border-bottom: 1px solid rgb(241, 211, 182);margin-bottom: 10px;padding-bottom: 5px; margin-top: 15px">Request A Call Back</h1>
          <table border="0" cellpadding="0" cellspacing="0" width="100%">
            <tbody><tr>
              <td width="60%">
          <form id ="frm_callback"name="Request A Call Back" action="http://<?php echo $_SERVER["SERVER_NAME"] ?>/crm/modules/Webforms/capture.php" method="post" accept-charset="utf-8">
          		<input type="hidden" name="publicid" value="9bf7f030983a37e0d3401eb8c063aa2a"></input>
          		<input type="hidden" name="name" value="Request A Call Back"></input>
          		
              <table align="center" border="0" cellpadding="0" cellspacing="0" width="85%">
                <tbody><tr>
                  <td colspan="2" height="30"><div id="valid1"></div></td>
                  </tr>

                <tr>
                  <td class="texttablebody" height="30" width="50%">First Name *</td>
                  <td height="30" width="50%">
          		 <input type="text" value="" name="lastname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
                  </td>
                </tr>

                 <tr>
                  <td class="texttablebody" height="30" width="50%">Last Name *</td>
                  <td height="30" width="50%">
               <input type="text" value="" name="firstname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
                  </td>
                </tr>

               <tr>
                  <td class="texttablebody" height="30" width="50%">Post Code *</td>
                  <td height="30" width="50%">
          			<input type="text" value="" name="code"  required="true" style="border:#D4D4D4 dotted 1px;"  ></input>
          		</td>
                </tr>
                <tr>
                  <td class="texttablebody" height="30" width="50%">Email *</td>
                  <td height="30" width="50%">
          			<input type="text" value="" name="email" style="border:#D4D4D4 dotted 1px;"  required="true"></input></td>
                </tr>


                <tr>
                  <td class="texttablebody" height="30" width="50%">Preffered Call Back Time *</td>
                  <td height="30" width="50%">
                    <input name="callback" id="callback" style="border:#D4D4D4 dotted 1px;" type="text"></td>
                </tr>
                <tr>
                  <td class="texttablebody" height="30" width="50%">Product *</td>
                  <td height="30" width="50%">
                    <select name="product" id="product" style="border:#D4D4D4 dotted 1px;width:125px;">
                              <option value="Home Alarms">Home Alarms</option>
                              <option value="Safes">Safes</option>
                              <option value="CCTVs">CCTVs</option>
                              </select></td>
                </tr>
                <tr>
                  <td class="texttablebody" height="30" width="50%">Contact Number *</td>
                  <td height="30" width="50%">
          		  <input type="text" value="" name="phone"  required="true" style="border:#D4D4D4 dotted 1px;"  ></input>
          		</td>
                </tr>
                <tr>
                  <td height="30" width="50%">&nbsp;</td>
                  <td height="30" width="50%">&nbsp;</td>
                </tr>
                <tr>
                  <td colspan="2" height="30" align="center" valign="middle">
                  <div class="buttons">
          		<input type="submit" class="button" id="button_submit" value="Submit" ></input>
                  <input type="hidden" id="callback_check" name="callback_check" value="callback" />
          		<div  style="width:0px; overflow:hidden;">
          			<input type="text" value="" name="description" id="description"  style="width:0px;" ></input>
          			<select style="width:0px;" name="leadsource[]" >
          				<option value="Web Site">Web Site</option>
          			</select>
          		</div>
                  </div></td>
                  </tr>
              </tbody></table>
              </form>
              </td>
              <td align="center" valign="top" width="50%"><table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tbody><tr>
                  <td><b>Areas Covered</b></td>
                </tr>
                <tr>
                  <td>
                  <b>Our installation team currently cover the following counties :</b> Bedfordshire, Berkshire, Buckinghamshire, Cambridgeshire, East Sussex, Essex, Gloucestershire, Greater London, Hampshire, Hertfordshire, Kent, Leicestershire, Northamptonshire, Oxfordshire, Surrey, Warwickshire, West Midlands, West Sussex and Wiltshire.
                  </td>
                </tr>
                <tr>
                  <td align="center" valign="middle"><a class="inline cboxElement" href="#map_zoom"><img src="image/data/maps.jpg" height="130" width="131"></a></td>
                </tr>
              </tbody></table></td>
            </tr>
          </tbody></table>



      </div> 
</div>
