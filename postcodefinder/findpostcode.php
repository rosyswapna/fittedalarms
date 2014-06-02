<html>
<head>
<style type="text/css">
<!--
.nodalserv {
	float: left;
	padding: 0px;
	width: 600px;
	overflow: auto;
	height: 350px;
	font-family: Arial, Helvetica, sans-serif;
	font-size: 12px;
	margin: 10px;
}
.nodalserv li {
	overflow: auto;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #FFFFFF;
	margin: 0px;
	padding-top: 8px;
	padding-right: 125px;
	padding-bottom: 8px;
	padding-left: 10px;
	background-color: #FFE2C6;
	position: relative;
	color: #884400;
}
body {
	padding: 10px;
}
.nodalserv h2 {
	overflow: auto;
	font-family: Calibri;
	font-size: 16px;
	margin-top: 15px;
	margin-bottom: 10px;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #FFC993;
	color: #CC6600;
	text-transform: uppercase;
}
.nodalserv li a {
	overflow: auto;
	margin: 0px;
	position: absolute;
	top: 0px;
	right: 0px;
	bottom: 0px;
	float: left;
	color: #884400;
	font-weight: bold;
	padding-top: 8px;
	padding-right: 5px;
	padding-bottom: 5px;
	padding-left: 5px;
	left: 0px;
	text-align: right;
}
.nodalserv li:hover {
	overflow: auto;
	border-bottom-width: 1px;
	border-bottom-style: solid;
	border-bottom-color: #FFFFFF;
	background-color: #FFCB97;
	position: relative;
	color: #552B00;
}
-->
</style>
</head>
<body>
<ul class="nodalserv">
<h2>Matching Address(s)</h2>
<?php
define ('CRAFTY_KEY',	'fa8b2-3949e-d66a9-008ae');
define ('CRAFTY_URL',	'http://pcls1.craftyclicks.co.uk/xml/rapidaddress');

$postcode =$_GET['post'];
// try 2 response styles
$response_style = 'data_formatted';
//$response_style = 'paf_compact';

$url = CRAFTY_URL.'?key='.CRAFTY_KEY.'&postcode='.$postcode.'&response='.$response_style;

if ($response_style == 'data_formatted') {
	// optional, default is 2, sets number of address lines
	$url.='&lines=3';
}

$xml_data = simplexml_load_file ($url);
//print_r($xml_data);

if ($response_style == 'paf_compact') {
	print_xml_data_compact_paf($xml_data);
} else {
	print_xml_data_formatted($xml_data);
}

die(0);

function print_xml_data_formatted($xml_data) {
	$result = $xml_data->address_data_formatted;
	//print_r($result);echo count($result);exit();
	if(count($result)!='0'){
	foreach ($result->delivery_point as $del_point) {
	echo '<li>';
		print_one_item($del_point->line_1);
		print_one_item($del_point->line_2);		
		print_one_item($result->town);
		print_one_item($result->postal_county);
		print_one_item($result->postcode);
		echo '<a href="javascript:setAddress(\''.$del_point->line_1.'\',\''.$del_point->line_2.'\',\''.$result->town.'\',\''.$result->postal_county.'\',\''.$result->postcode.'\');">&laquo; Select Address</a>';
			echo '</li>';
	}
	}else{
		echo "No Records Found";
	}
}

function print_one_item($txt) {
	if ('' != $txt) {
		echo $txt.', ';
	}
}
?>
</ul>
</body>
</html>