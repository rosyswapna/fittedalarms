<?php echo $header; ?>
<div style="background:#ffffff;padding:10px 10px 10px 10px;border-radius:10px;margin-top:10px;margin-bottom:15px;display:inline-block;width:910px;">
<?php echo $column_left; ?>
<script>

$(document).ready(function(){



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
<div class="getquote">
  <h1><?php echo $heading_title; ?></h1>
  <div id="text">Simply complete the form below (we’ve tried to keep the questions to a minimum) and we will be in touch shortly. Don’t worry, we won't share your details with any other third party. We hate spam as much as you do!</div>

<table width="100%" border="0" cellspacing="0" cellpadding="0">
  <tr>
    <td width="50%">
<form id ="frm_get_quote"name="Get a Quote" action="http://<?php echo $_SERVER["SERVER_NAME"] ?>/crm/modules/Webforms/capture.php" method="post" accept-charset="utf-8">
		<input type="hidden" name="publicid" value="1b4f80b3e54c8d2bf6b325987952e45f"></input>
		<input type="hidden" name="name" value="Get a Quote"></input>
		
    <table align="center" border="0" cellpadding="0" cellspacing="0" width="85%">
      <tbody><tr>
        <td colspan="2" height="30"><div id="valid1"></div></td>
        </tr>

        <tr>
        <td class="texttablebody" height="30" width="50%">First Name *</td>
        <td height="30" width="50%">
     <input type="text" value="" name="firstname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
        </td>
      </tr>

      <tr>
        <td class="texttablebody" height="30" width="50%">Last Name *</td>
        <td height="30" width="50%">
		 <input type="text" value="" name="lastname"  required="true" style="border:#D4D4D4 dotted 1px;" ></input>
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
        <td class="texttablebody" height="30" width="50%">Phone *</td>
        <td height="30" width="50%">
		  <input type="text" value="" name="phone"  required="true" style="border:#D4D4D4 dotted 1px;"  ></input>
		</td>
      </tr>

      <tr>
        <td class="texttablebody" height="30" width="50%">Product *</td>
        <td height="30" width="50%">
          <select name="product" id="product" style="border:#D4D4D4 dotted 1px;width:125px;">
                    <option value="Home Alarms">        Home Alarms</option>
                    <option value="Safes">        Safes</option>
                    <option value="CCTVs">        CCTVs</option>
                    </select></td>
      </tr>



      <tr>
        <td class="texttablebody" height="30" width="50%">Comments </td>
        <td height="30" width="50%">
			<textarea  name="comments" id="comments" style="border:#D4D4D4 dotted 1px;max-width:200px;max-height:150px;" ></textarea>
        </td>
      </tr>


      <tr>
        <td class="texttablebody" height="30" width="50%">Preffered Call Back Time *</td>
        <td height="30" width="50%">
          <input name="callback" id="callback" style="border:#D4D4D4 dotted 1px;" type="text"></td>
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
    <td width="50%" align="center" valign="top"><a class="inline cboxElement" href="#map_zoom"></br></br></br>

      <img src="image/data/maps.jpg" width="270" height="240" /></a>
    <div id="textblock">
        
    </div></td>
  </tr>
</table>
<p>We currently only operate in the following counties: Bedfordshire, Berkshire, Buckinghamshire, Cambridgeshire, East Sussex, Essex, Gloucestershire, Greater London, Hampshire, Hertfordshire, Kent, Leicestershire, Northamptonshire, Oxfordshire, Surrey, Warwickshire, West Midlands, West Sussex and Wiltshire.</p>
<p>&nbsp;</p>
<strong>
      Please note:
    </strong>We have engineers covering the following cities and the area in between. Abingdon, Acton, Alcester, Aldershot, Alton, Amersham, Amesbury, Ampthill, Andover, Arlesey, Arunde, Ashby Woulds, Ashby-de-la-Zouch, Ashford, Atherstone, Aylesbury, Banbury, Barking, Barnes, Barnet, Basingstoke, Battle, Beaconsfield, Beckenham, Bedford, Bedworth, Berkeley, Berkhamsted, Bexhill-on-Sea, Bexley, Bicester, Biggleswade, Billericay, Bilston, Bishop's Stortford, Bishop's Waltham, Blackwater and Hawley, Bletchley and Fenny Stratford, Bognor Regis, Brackley, Bradford-on-Avon, Bradley Stoke, Braintree, Braunstone Town, Brentford, Brentwood, Brightlingsea,  Broadstairs and St Peter's, Bromley, Bromyard and Winslow, Buckingham, Buntingford, Burford, Burgess Hill, Burnham-on-Crouch, Burton Latimer, Bushey, Calne, Canvey Island, Carterton, Charlbury, Chatham, Chatteris, Chelmsford, Cheltenham, Chertsey, Chesham, Cheshunt, Chingford, Chippenham, Chipping Campden, Chipping Norton, Chipping Sodbury, Chorleywood, Cinderford, Cirencester, Coggeshall, Colchester, Coleford, Coleshill, Corby, Corringham, Corsham, Cranbrook, Crawley, Cricklade, Crowborough, Croydon, Dagenham, Dartford, Daventry, Deal, Desborough, Devizes, Didcot, Dorking, Dover, Dovercourt, Dudley, Dunstable, Dursley, Ealing, Earl Shilton, Earley, East Grinstead, East Ham, Eastbourne, Eastleigh, Edenbridge, Edgware, Edmonton, Elstree and Borehamwood, Emsworth, Enfield, Epping, Erith, Eton, Fairford, Fareham, Faringdon, Farnham, Faversham, Filton, Finchley, Fleet, Flitwick, Folkestone, Fordbridge, Fordingbridge, Fordwich, Frinton and Walton, Gillingham, Godalming, Godmanchester, Gosport, Gravesend, Grays, Great Dunmow, Guildford, Hailsham, Halesowen, Halstead, Harlow, Harpenden, Harrow, Harwich, Haslemere, Hastings, Hatfield, Havant, Haywards Heath, Heathfield, Hedge End, Hemel Hempstead, Hendon, Henley-in-Arden, Henley-on-Thames, Hertford, High Wycombe, Higham Ferrers, Highworth, Hinckley, Hitchin, Hoddesdon, Horley, Hornsey, Houghton Regis, Hungerford, Huntingdon, Hythe, Ilford, Irthlingborough, Kempston, Kenilworth, Kettering, Kingston-upon-Thames, Kington, Leatherhead, Lechlade, Ledbury, Leigh-on-Sea, Leighton-Linslade, Leominster, Letchworth, Lewes, Leyton, Littlehampton, Longtown, Loughborough, Loughton, Ludgershall, Luton, Lutterworth, Lydd, Lydney, Maidenhead, Maidstone, Maldon, Malmesbury, Manningtree, March, Margate, Market Bosworth, Market Harborough, Marlborough, Marlow, Melksham, Melton Mowbray, Mere, Midhurst, Minchinhampton, Minster, Mitcham, Mitcheldean, Moreton-in-Marsh, Nailsworth, New Alresford, New Milton, New Romney, Newbury, Newent, Newhaven, Newport Pagnell, Northampton, Northfleet, Northleach with Eastington, Nuneaton, Oldbury, Olney, Ongar, Oundle, Paddock Wood, Painswick, Patchway, Peacehaven, Petersfield, Petworth, Polegate, Potton, Princes Risborough, Queenborough-in-Sheppey, Ramsey, Ramsgate, Raunds, Rayleigh, Reading, Reigate, Richmond, Ringwood, Rochester, Rochford, Romford, Romsey, Ross-on-Wye, Rothwell, Rowley Regis, Royal Leamington Spa, Royal Tunbridge Wells, Royal Wootton Bassett, Royston, Rugby, Rushden, Rye, Saffron Walden, Sandhurst, Sandwich, Sandy, Sawbridgeworth, Seaford, Selsey, Sevenoaks, Shefford, Shepshed, Shipston-on-Stour, Shoreham-by-Sea, Slough, Smethwick, Snodland, Soham, Solihull, South Woodham Ferrers, Southall, Southam, Southborough, Southend-on-Sea, Southgate, Southminster, Southsea, Southwick, St Ives, St Mary Cray, St Neots, Staines-upon-Thames, Stevenage, Steyning, Stonehouse, Stony Stratford, Stotfold, Stourbridge, Stow-on-the-Wold, Stratford-upon-Avon, Strood, Stroud, Surbiton, Sutton Coldfield, Swanley, Swanscombe and Greenhithe, Swindon, Syston, Tadley, Telscombe, Tenterden, Tetbury, Tewkesbury, Thame, Thatcham, Thaxted, Thornbury, Thrapston, Tidworth, Tipton, Tisbury, Tonbridge, Tottenham, Totton and Eling, Towcester, Tring, Trowbridge, Twickenham, Uckfield, Uxbridge, Wadhurst, Wallingford, Walsall, Waltham Abbey, Waltham Cross, Walthamstow, Walton-on-Thames, Wantage, Ware, Warminster, Warwick, Watford, Watlington, Wellingborough, Wembley, Wendover, West Bromwich, West Ham, West Malling, West Mersea, West Tilbury, Westbury, Westerham, Weybridge, Whitchurch, Whitehill, Whitnash, Whittlesey, Wickham, Wickwar, Willenhall, Willesden, Wilton, Wimbledon, Winchcombe, Winchelsea, Windsor, Winslow, Wisbech, Witham, Witney, Wivenhoe, Woburn, Woburn Sands, Woking, Wokingham, Wolverton and Greenleys, Wood Green, Woodley, Woodstock, Worthing, Wotton-under-Edge, Yate and Yateley. 
</div>
</div>
   <?php echo $footer; ?>
