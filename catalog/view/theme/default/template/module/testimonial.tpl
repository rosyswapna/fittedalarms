<style type="text/css">
.paginate{ padding:0px 6px;margin:5px 0 5px 0; color:#666666;font-size:12px; border:1px solid #D2D2D2; text-decoration:none;}
.current {padding:0px 6px; border:1px solid #D2D2D2; font-size:12px;color:#FFFFFF; background-color:#C0C0C0;text-decoration:none;}
.inactive { color:#999999;}
</style>
<!--news ticker-->
<style type="text/css">
#pscroller2{
width: 170px;
height: 65px;
border: 0px solid #ccc;
background:#FFFFCC;
border-bottom-left-radius:3px;
border-bottom-right-radius:3px;
border-top-left-radius:3px;
border-top-right-radius:3px;
font-family: Tahoma;
font-size: 12px;
line-height: 14px;
color: rgb(51, 51, 51);
}
.textbody{
margin-top:5px;
color:#9F0000;
background:#FFFFFF;
font-family: Tahoma;
font-size: 14px;
font-weight: normal;
color: rgb(153, 51, 0);
}
.textbody1{
	margin-top:5px;
color:#000000;
font-size:12px;
font-family: calibri;
background:#FFFFFF;
font-weight:normal;
}

#pscroller2 a{
text-decoration: none;
color:#333;
}
</style>

<script type="text/javascript">
var pausecontent2=new Array()
var i=0;
function escapeHtml(unsafe) {
   return unsafe
        .replace(/&/g, "&amp;")
        .replace(/</g, "&lt;")
        .replace(/>/g, "&gt;")
        .replace(/"/g, "&quot;")
        .replace(/'/g, "&#039;")
        .replace(/«/g, " ")
        .replace(/»/g, " ");
}
  var url="";
  var content="";
  var name="";
<?php foreach ($testimonials as $testimonial) { ?>
   url="<?php echo $showall_url;?>";
 content="\"<?php echo $testimonial['description']; ?>\"<br/><span class=\"textbody\"><?php echo $testimonial['name']; ?><br/></span><span class=\"textbody1\"><?php echo $testimonial['city'];?></span>";
 
//url=escapeHtml(url);
//content=escapeHtml(content);
  pausecontent2[i]='<a href="'+url+'">'+content+'</a>';

i++
<?php }?>
</script>

<script type="text/javascript">
function pausescroller(content, divId, divClass, delay){
this.content=content //message array content
this.tickerid=divId //ID of ticker div to display information
this.delay=delay //Delay between msg change, in miliseconds.
this.mouseoverBol=0 //Boolean to indicate whether mouse is currently over scroller (and pause it if it is)
this.hiddendivpointer=1 //index of message array for hidden div
document.write('<div id="'+divId+'" class="'+divClass+'" style="position: relative; overflow: hidden"><div class="innerDiv" style="position: absolute; width: 100%" id="'+divId+'1">'+content[0]+'</div><div class="innerDiv" style="position: absolute; width: 100%; visibility: hidden" id="'+divId+'2">'+content[1]+'</div></div>')
var scrollerinstance=this
if (window.addEventListener) //run onload in DOM2 browsers
window.addEventListener("load", function(){scrollerinstance.initialize()}, false)
else if (window.attachEvent) //run onload in IE5.5+
window.attachEvent("onload", function(){scrollerinstance.initialize()})
else if (document.getElementById) //if legacy DOM browsers, just start scroller after 0.5 sec
setTimeout(function(){scrollerinstance.initialize()}, 500)
}

// -------------------------------------------------------------------
// initialize()- Initialize scroller method.
// -Get div objects, set initial positions, start up down animation
// -------------------------------------------------------------------

pausescroller.prototype.initialize=function(){
this.tickerdiv=document.getElementById(this.tickerid)
this.visiblediv=document.getElementById(this.tickerid+"1")
this.hiddendiv=document.getElementById(this.tickerid+"2")
this.visibledivtop=parseInt(pausescroller.getCSSpadding(this.tickerdiv))
//set width of inner DIVs to outer DIV's width minus padding (padding assumed to be top padding x 2)
this.visiblediv.style.width=this.hiddendiv.style.width=this.tickerdiv.offsetWidth-(this.visibledivtop*2)+"px"
this.getinline(this.visiblediv, this.hiddendiv)
this.hiddendiv.style.visibility="visible"
var scrollerinstance=this
document.getElementById(this.tickerid).onmouseover=function(){scrollerinstance.mouseoverBol=1}
document.getElementById(this.tickerid).onmouseout=function(){scrollerinstance.mouseoverBol=0}
if (window.attachEvent) //Clean up loose references in IE
window.attachEvent("onunload", function(){scrollerinstance.tickerdiv.onmouseover=scrollerinstance.tickerdiv.onmouseout=null})
setTimeout(function(){scrollerinstance.animateup()}, this.delay)
}


// -------------------------------------------------------------------
// animateup()- Move the two inner divs of the scroller up and in sync
// -------------------------------------------------------------------

pausescroller.prototype.animateup=function(){
var scrollerinstance=this
if (parseInt(this.hiddendiv.style.top)>(this.visibledivtop+5)){
this.visiblediv.style.top=parseInt(this.visiblediv.style.top)-5+"px"
this.hiddendiv.style.top=parseInt(this.hiddendiv.style.top)-5+"px"
setTimeout(function(){scrollerinstance.animateup()}, 50)
}
else{
this.getinline(this.hiddendiv, this.visiblediv)
this.swapdivs()
setTimeout(function(){scrollerinstance.setmessage()}, this.delay)
}
}

// -------------------------------------------------------------------
// swapdivs()- Swap between which is the visible and which is the hidden div
// -------------------------------------------------------------------

pausescroller.prototype.swapdivs=function(){
var tempcontainer=this.visiblediv
this.visiblediv=this.hiddendiv
this.hiddendiv=tempcontainer
}

pausescroller.prototype.getinline=function(div1, div2){
div1.style.top=this.visibledivtop+"px"
div2.style.top=Math.max(div1.parentNode.offsetHeight, div1.offsetHeight)+"px"
}

// -------------------------------------------------------------------
// setmessage()- Populate the hidden div with the next message before it's visible
// -------------------------------------------------------------------

pausescroller.prototype.setmessage=function(){
var scrollerinstance=this
if (this.mouseoverBol==1) //if mouse is currently over scoller, do nothing (pause it)
setTimeout(function(){scrollerinstance.setmessage()}, 100)
else{
var i=this.hiddendivpointer
var ceiling=this.content.length
this.hiddendivpointer=(i+1>ceiling-1)? 0 : i+1
this.hiddendiv.innerHTML=this.content[this.hiddendivpointer]
this.animateup()
}
}

pausescroller.getCSSpadding=function(tickerobj){ //get CSS padding value, if any
if (tickerobj.currentStyle)
return tickerobj.currentStyle["paddingTop"]
else if (window.getComputedStyle) //if DOM2
return window.getComputedStyle(tickerobj, "").getPropertyValue("padding-top")
else
return 0
}

</script>
  <div class="box">
<div style="width:190px; float:right;border:#DD9628 solid 1px;height:145px;	border-bottom-left-radius:5px;border-bottom-right-radius:5px;border-top-left-radius:5px;border-top-right-radius:5px;">
  <div class="box-heading"><?php if ($testimonial_title=="") echo "<br>"; else echo $testimonial_title; ?></div>
  <div class="box-content">
    <div class="box-product" style="overflow:hidden;">

    <table cellpadding="2" cellspacing="0" style="width: 100%;">
       <tr>
       <td>
      <script type="text/javascript">
      new pausescroller(pausecontent2, "pscroller2", "someclass", 2000)
      </script>
       </td>
      </tr>
      </table>
    </div>
  </div>
  <div class="button" align="right"><a href="<?php echo $showall_url;?>"><?php echo $show_all; ?></a></div>

</div>

</div>
