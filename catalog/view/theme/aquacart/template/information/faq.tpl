<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.4.3/jquery.min.js"></script>
<script type="text/javascript">
var tj = jQuery.noConflict();
function goToByScroll(id){
tj('html,body').animate({scrollTop: tj("#section"+id).offset().top},800);
}

tj(document).ready(function(){

	// hide #back-top first
	tj("#back-top").hide();
	
	// fade in #back-top
	tj(function () {
		tj(window).scroll(function () {
			if (tj(this).scrollTop() > 100) {
				tj('#back-top').fadeIn();
			} else {
				tj('#back-top').fadeOut();
			}
		});

		// scroll body to 0px on click
		tj('#back-top a').click(function () {
			tj('body,html').animate({
				scrollTop: 0
			}, 800);
			return false;
		});
	});

});

</script>

<!-- InstanceEndEditable -->
<link href="style/index_style.css" rel="stylesheet" type="text/css" />
<link href="style/style.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/jquery-1.6.1.min.js"></script>

<script src="js/main.js" type="text/javascript"></script>
<script type="text/javascript" src="lib/jquery.jcarousel.min.js"></script>
<link rel="stylesheet" type="text/css" href="skins/tango/skin.css" />
<script type="text/javascript">
jQuery(document).ready(function() { jQuery('#mycarousel').jcarousel(); });
</script>
<link rel="stylesheet" href="style/colorbox.css" />
<script src="colorbox/jquery.colorbox.js"></script>
<script type="text/javascript">
 var km = jQuery.noConflict();
 km(document).ready(function () {
							  
	km('img.f3').click(function () {
	km('div.featuretoggle').slideToggle('medium');
    });
	
	km('img.f4').click(function () {
	km('div.featuretoggle1').slideToggle('medium');
    });
	
	km('img.f5').click(function () {
	km('div.featuretoggle2').slideToggle('medium');
    });
	
	km('img.f6').click(function () {
	km('div.featuretoggle3').slideToggle('medium');
    });
	
	km('img.f7').click(function () {
	km('div.featuretoggle4').slideToggle('medium');
    });
	
	km('img.f8').click(function () {
	km('div.featuretoggle5').slideToggle('medium');
    });
	
	km('img.f9').click(function () {
	km('div.featuretoggle12').slideToggle('medium');
    });
	
	km('img.f10').click(function () {
	km('div.featuretoggle13').slideToggle('medium');
    });
	
	km('img.f11').click(function () {
	km('div.featuretoggle14').slideToggle('medium');
    });
	
	km('h6.automat').click(function () {
	km('div.detailss').slideToggle('medium');
    });
	
	km('h3.question1').click(function () {
	km('div.answer1').slideToggle('medium');
    });
	
	km('h3.question2').click(function () {
	km('div.answer2').slideToggle('medium');
    });
	
	km('h3.question3').click(function () {
	km('div.answer3').slideToggle('medium');
    });
	
	km('h3.question4').click(function () {
	km('div.answer4').slideToggle('medium');
    });
	
	km('h3.question5').click(function () {
	km('div.answer5').slideToggle('medium');
    });
	
	km('h3.question6').click(function () {
	km('div.answer6').slideToggle('medium');
    });
	
	km('h3.question7').click(function () {
	km('div.answer7').slideToggle('medium');
    });
	
	km('h3.question8').click(function () {
	km('div.answer8').slideToggle('medium');
    });
	
	km('h3.question9').click(function () {
	km('div.answer9').slideToggle('medium');
    });
	
	km('h3.question10').click(function () {
	km('div.answer10').slideToggle('medium');
    });
	
	km('h3.question11').click(function () {
	km('div.answer11').slideToggle('medium');
    });
	
	km('h3.question12').click(function () {
	km('div.answer12').slideToggle('medium');
    });
	
	km('h3.question13').click(function () {
	km('div.answer13').slideToggle('medium');
    });
	
	km('h3.question14').click(function () {
	km('div.answer14').slideToggle('medium');
    });
	
	km('h3.question15').click(function () {
	km('div.answer15').slideToggle('medium');
    });
	
	km('h3.question16').click(function () {
	km('div.answer16').slideToggle('medium');
    });
	
	km('h3.question17').click(function () {
	km('div.answer17').slideToggle('medium');
    });
	
	km('h3.question18').click(function () {
	km('div.answer18').slideToggle('medium');
    });
	
	km('h3.question19').click(function () {
	km('div.answer19').slideToggle('medium');
    });
	
	km('h3.question20').click(function () {
	km('div.answer20').slideToggle('medium');
    });	
});
function clearcarts()
{
document.form1.clearcart.value="1"; 
document.form1.submit();
}

var tj = jQuery.noConflict();
tj(document).ready(function(){
tj(".inline").colorbox({inline:true, width:"570"});
tj(".callb").colorbox({iframe:true, width:"870", height:"480"});
});

function DoAction (id, name) {
//alert(name);
tj(name).slideToggle('slow');
tj.each([1,2,3], function(index, value) { 
if('ul.the_menu'+value != name)
{		
if(tj('ul.the_menu'+value ).is(":visible"))
{
tj('ul.the_menu'+value).slideToggle('slow');
}
}
});


} 
</script>
<style type="text/css">
<!--
body {
	background-color: #E9A03F;
}
-->
</style>
<!-- InstanceBeginEditable name="head" -->
><?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?>
<div class="expressinstall" style="margin-top:-15px;"><br />
  <h1><?php echo $heading_title; ?></h1>
  <table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="69%" align="center" valign="middle" style="padding-left:25px;">
<div class="faq">
<div style="clear:both"></div>
<ul>
<li onclick="goToByScroll('1')">Yale</li>
<li onclick="goToByScroll('2')">Visonic</li>
<li onclick="goToByScroll('3')" id="section1">Infinite Prime</li>
</ul>
<div style="clear:both"></div>
<h2>FAQ Yale Alarms</h2>
<h3 class="question1">I  have a Yale Pet PIR, however why is my cat sometimes triggering the alarm when  set?&nbsp;</h3>
<div class="answer answer1"><p>Please note limitations when using the pet-friendly PIR’s. The weight of the  pet and the pet climbing the height so that it will get detected. So if pet  climbs a table or sofa it may get detected. Our experts will position the  sensor in best suitable place.</p></div>
<h3 class="question2">How  long will the siren sound for when the alarm is triggered?&nbsp;</h3>
<div class="answer answer2"><p>The siren will sound when triggered for a pre-selected time of 4 or 10 minutes,  chosen by you. The system will automatically be re-armed again after this time  period has elapsed.</p></div>
<h3 class="question3">What  is the output of the wall-mounted siren in decibels?&nbsp;</h3>
<div class="answer answer3"><p>The technical specification is 110 decibels.</p></div>
<h3 class="question4">Can  I use more than one external siren on my Control-panel alarm?&nbsp;</h3>
<div class="answer answer4"><p>It is possible to have several sirens, yes. However, only one unit can be programmed with a siren-based alarm. Separate sirens can be purchased by calling us on 0800 193 8727 or from our installers at the time of installation and ‘dummy’ boxes are also available..</p></div>
<h3 class="question5">How  is the external siren powered?&nbsp;</h3>
<div class="answer answer5"><p>The siren uses standard, non-rechargeable, D-type alkaline batteries. It is not  solar powered.</p></div>
<h3 class="question6">How  and when will I need to change the batteries in the siren?&nbsp;</h3>
<div class="answer answer6"><p>Siren batteries should be refreshed every 2-3 years. The unit will ’beep’ five  times when arming the system to inform you that the battery power is too low.  It is required to disable the siren tamper when swapping out batteries. Further  details are to be found in the manual.</p></div>
<h3 class="question7">How  many telephone numbers can be stored on the Premium alarm control panel?&nbsp;</h3>
<div class="answer answer7"><p>A maximum of three contact numbers can be stored.</p></div>
<h3 class="question8">Do  Yale control panels have built-in sirens?&nbsp;</h3>
<div class="answer answer8"><p>Yes, in addition to the external siren unit you have the option of enabling or  disabling the internal panel siren.</p></div>
<h3 class="question9">Why  does my control panel ‘beep’ every 30 seconds and with the amber warning light  lit?&nbsp;</h3>
<div class="answer answer9"><p>A power fail or ‘tamper’ condition is present within the system. Check all  devices are firmly screw-mounted and that the DC adaptor is connected. If  necessary, try re-seating the control panel on the wall mounting back plate  with the panel in programming mode.</p></div>
<h3 class="question10">The  control panel displays only the date and time, so how will I know if the alarm  is set?&nbsp;</h3>
<div class="answer answer10"><p>If the alarm is set in ‘Home’ mode, the panel display will always display  ‘Home’. In ‘Away’ mode, however, the ‘Alarm On’ status will disappear after 5  minutes to show only the time and date.</p></div>
<h3 class="question11">I  have a shed / garage, will I be able to use a detector in this location?&nbsp;</h3>
<div class="answer answer11"><p>There will not be a problem in using a detector in this location.</p></div>
<h3 class="question12">I have pets at home. Is it likely they  trigger my alarm, if so how can I overcome this problem?</h3>
<div class="answer answer12"><p>&nbsp;You  can use pet friendly sensors.  Alternatively, a magnetic door contact could be used in place of a PIR for this  purpose.</p></div>
<h3 class="question13">Why  does the alarm not trigger when I walk in front of a PIR?&nbsp;</h3>
<div class="answer answer13"><p>Yale PIR’s have a built-in 60 second sleep timer, to prolong the battery life.  Arm your system before vacating all areas occupied by PIR detectors for a  maximum period of 60 seconds, before re-entering the area and retesting. Please  bear in mind, that faster reaction is obtained when movement is detected by  walking across the field of view of a PIR lens, rather than simply standing in  front of it.</p></div>
<h3 class="question14">What  is the maximum movement detection range of a PIR?&nbsp;</h3>
<div class="answer answer14"><p>The PIR’s will respond to movement of up to 15 metres away.</p></div>
<h3 class="question15">Should  the red light flash on my PIR?&nbsp;</h3>
<div class="answer answer15"><p>The red PIR lights will not always flash, to conserve the battery life. If you  are in any doubt of the operation of a PIR, vacate the area for up to 60  seconds, and test using the ‘walk test’ facility.</p></div>
<h3 class="question16">Can  I test my new alarm without irritating the neighbours?&nbsp;</h3>
<div class="answer answer16"><p>The control-panel based system has a useful ‘walk test’ feature. This allows  radio range testing of the various devices, without having to audibly test your  alarm so as not to cause nuisance to your neighbours.</p></div>
<h3 class="question17">Are  all Yale alarms completely wire-free?&nbsp;</h3>
<div class="answer answer17"><p>All of the detectors are completely wire-free, there are no mains wiring  required to install your system. The control panel-based alarms, however,  connect to the mains power supply via the DC transformer lead provided in the  kit.</p></div>
<h3 class="question18">I  wish to expand my existing Yale alarm. How many detectors can I use in total,  and&nbsp;where can I purchase additional accessories from?&nbsp;</h3>
<div class="answer answer18"><p>Yale alarm systems will accommodate a maximum of 20 devices</p></div>
<h3 class="question19">How often will I have to change the  batteries in my alarm system?&nbsp;</h3>
<div class="answer answer19"><p>Batteries should be replaced every 2-3 years. Each detector, siren, control  panel will inform you when this is required.</p></div>
<h3 class="question20">I  have a large household with many family members, young and old, entering and  exiting the property at varying times of day. How can I overcome this?&nbsp;</h3>
<div class="answer answer20"><p>It is recommended that several keyfobs are programmed in. The individual  members of the household can carry their<span  id="section2"> own</span> keyfob around, allowing simple  arming and disarming of the system as desired.</p></div>
<h2>Visonic FAQ</h2>
<h3>What is  the output of the wall-mounted siren in decibels? </h3>
<p>The technical  specification is 110 decibels.</p>
<h3>How long  will the siren sound for when the alarm is triggered? </h3>
<p>The siren  will sound when triggered for a pre-selected time of upto 15minutes, chosen by  you. The system will automatically be re-armed again after this time period has  elapsed.</p>
<h3>Can I use  more than one external siren on my Control-panel alarm? </h3>
<p>It is  possible to have two sirens, yes. . Separate sirens can be purchased by calling  us on 0800 193 8727 or from our installers at the time of installation and  ‘dummy’ boxes are also available..</p>
<h3>How is the  external siren powered? </h3>
<p>The siren  uses   Lithium 3.6v Bell Box Battery.</p>
<h3>How and  when will I need to change the batteries in the siren? </h3>
<p>Siren  batteries should be refreshed every 3-4 years. </p>
<h3>How many  telephone numbers can be stored on the Visonic powermax control panel? </h3>
<p>A maximum  of  four numbers can be stored.</p>
<h3>I have a  shed / garage, will I be able to use a detector in this location? </h3>
<p>There will  not be a problem in using a detector in this location provided its not faraway  from the control panel.</p>
<h3>I have pets at home. Is it likely they trigger  my alarm, if so how can I overcome this problem?</h3>
<p>You can use pet friendly sensors.  Alternatively, a magnetic door contacts or curtain sensors could be used in  place of a PIR for this purpose.</p>
<h3>Why does  the alarm not trigger when I walk in front of a PIR? </h3>
<p>All  Visonic PIR’s have a built-in 60 second sleep timer, to prolong the battery life.  Arm your system before vacating all areas occupied by PIR detectors for a  maximum period of 60 seconds, before re-entering the area and retesting. Please  bear in mind, that faster reaction is obtained when movement is detected by  walking across the field of view of a PIR lens, rather than simply standing in  front of it.</p>
<h3>What is  the maximum movement detection range of a VisonicPIR? </h3>
<p>The  Visonic PIR’s will respond to movement of up to 15 metres away.</p>
<h3>Should the  red light flash on my PIR? </h3>
<p>The red  PIR lights will not always flash, to conserve the battery life. If you are in  any doubt of the operation of a PIR, vacate the area for up to 60 seconds, and  test using the ‘walk test’ facility.</p>
<h3>Can I test  my new alarm without irritating the neighbours? </h3>
<p>The Visonic  Powermax and all other visonic control-panel based systems has a useful ‘walk  test’ feature. This allows radio range testing of the various devices, without  having to audibly test your alarm so as not to cause nuisance to your  neighbours.</p>
<h3>Are all Visonic  alarms completely wire-free? </h3>
<p>All of the  detectors are completely wire-free, For control panel mains wiring is required  and telehone line is also needed.</p>
<h3>I wish to  expand my existing Visonic alarm. How many detectors can I use in total, and  where can I purchase additional accessories from? </h3>
<p>Visonic  alarm systems will accommodate a maximum of  28 devices.</p>
<h3>How often  will I have to change the batteries in my alarm system? </h3>
<p>Batteries  should be replaced every 2-3 years. Each detector, siren, control panel will  inform you when this is required.</p>
<h3>I have a  large household with many family members, young and old, entering and exiting  the property at varying times of day. How can I overcome this? </h3>
<p>It is  recommended that several keyfobs or tags are programmed in. The individual  members of the household can <span  id="section3">carry</span> their own keyfob/tag around, allowing simple  arming and disarming of the system as desired.</p>
<h2>FAQ  Infinite Prime Alarms</h2>
<h3>What is  the output of the wall-mounted siren in decibels? </h3>
<p>The  technical specification is 108 decibels.</p>
<h3>How long  will the siren sound for when the alarm is triggered? </h3>
<p>The siren  will sound when triggered for a pre-selected time of upto 15minutes, chosen by  you. The system will automatically be re-armed again after this time period has  elapsed.</p>
<h3>Can I use  more than one external siren on my Infinite prime alarm ?</h3>
<p>No,It is  possible to have only one active wireless sirenbox for Infinte prime alarm.</p>
<h3>How is the  external siren powered? </h3>
<p>The siren  uses 12v dc supply and it got a back up battery also..</p>
<h3>How many  telephone numbers can be stored on the Infinite Prime control panel? </h3>
<p>A maximum  of  four numbers can be stored.</p>
<h3>I have a  shed / garage, will I be able to use a detector in this location? </h3>
<p>There will  not be a problem in using a detector in this location provided its not faraway  from the control panel.</p>
<h3> I have pets at home. Is it likely they trigger  my alarm, if so how can I overcome this problem?</h3>
<p>You can use pet friendly sensors.  Alternatively, a magnetic door contacts or shock and vibration detectors  could be used in place of a PIR for this  purpose.</p>
<h3>Why does  the alarm not trigger when I walk in front of a PIR? </h3>
<p>All  Infinite Prime PIR’s have a built-in 60 second sleep timer, to prolong the  battery life. Arm your system before vacating all areas occupied by PIR  detectors for a maximum period of 60 seconds, before re-entering the area and  retesting. Please bear in mind, that faster reaction is obtained when movement  is detected by walking across the field of view of a PIR lens, rather than  simply standing in front of it.</p>
<h3>What is  the maximum movement detection range of a Infinite Prime PIR? </h3>
<p>The  Infinite Prime PIR’s will respond to movement of up to 15 metres away.</p>
<h3>Should the  red light flash on my PIR? </h3>
<p>The red  PIR lights will not always flash, to conserve the battery life. If you are in  any doubt of the operation of a PIR, vacate the area for up to 60 seconds, and  test using the ‘walk test’ facility.</p>
<h3>Can I test  my new alarm without irritating the neighbours? </h3>
<p>The  Infinite Prime  control-panel based  systems has a useful ‘walk test’ feature. This allows radio range testing of  the various devices, without having to audibly test your alarm so as not to  cause nuisance to your neighbours.</p>
<h3>Are all  Infinite Prime alarms completely wire-free? </h3>
<p>All of the  detectors are completely wire-free, For control panel mains wiring is required  and telephone line is also needed and siren box requires a 12 v supply.</p>
<h3>I wish to  expand my existing Infinite Prime alarm. How many detectors can I use in total,  and where can I purchase additional accessories from? </h3>
<p>Infinite  Prime alarm systems will accommodate a maximum of 32 devices.</p>
<h3>How often  will I have to change the batteries in my alarm system? </h3>
<p>Batteries  should be replaced every 2-3 years. Each detector, siren, control panel will  inform you when this is required.</p>
<h3>I have a  large household with many family members, young and old, entering and exiting  the property at varying times of day. How can I overcome this? </h3>
<p>It is  recommended that several keyfobs  are  programmed in. The individual members of the household can carry their own  keyfob around, allowing simple arming and disarming of the system as  desired.Also you can have a keypad near to the door so that each user can arm  and disarm the system.</p>

</div>
    </td>
    <td width="31%" align="center" valign="top"><img src="../image/data/howitworks.jpg" width="209" height="492" /></td>
  </tr>
  </table>
</div>
</div>
<?php echo $footer; ?>