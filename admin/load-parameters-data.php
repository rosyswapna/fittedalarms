<?php
/***************************************************************************************************
* Copyright(c) @2012 ANTERP SOLUTIONS. All rights reserved.
* Website				http://www.anterp.com
* Authors		    	tclim
* Date Created     		Feb 25, 2012 7:00:28 PM
* 
* Additional License	This software require you to buy from ANTERP SOLUTIONS. 
* 						You have no right to redistribute this program.
* 
* Description			Data Sync Suites developed and distributed by ANTERP SOLUTIONS.
*  
 **************************************************************************************************/

	//Time Out Setting
	// Set 0 = No timeout (Caution - it will cause unexpected usage if you set to unlimited timeout)
	set_time_limit(0);
	 
	 // Configuration
	require_once('config.php');
	
	//Setting Load Config URL
	$url = HTTP_SERVER . '../sync-opencart-vtiger-load-data.php';
	
	$type = 'POST';
	 
	if (isset ($_GET['type'])) {
		$type = trim($_GET['type']);
	} else if (isset ($_POST['type'])) {
		$type = trim($_POST['type']);
	}	
 	
 	//Calling the asynchronously process...Do not return anything
 	curl_request_async($url, $type);
 	
 	// $type must equal 'GET' or 'POST'
  function curl_request_async($url, $type='POST')
  {
  	  $post_string = '';
      $parts=parse_url($url);

      $fp = fsockopen($parts['host'],
          isset($parts['port'])?$parts['port']:80, $errno, $errstr, 30);

      // Data goes in the path for a GET request
      if('GET' == $type) $parts['path'] .= '?'.$post_string;

      $out = "$type ".$parts['path']." HTTP/1.1\r\n";
      $out.= "Host: ".$parts['host']."\r\n";
      $out.= "Content-Type: application/x-www-form-urlencoded\r\n";
      $out.= "Content-Length: ".strlen($post_string)."\r\n";
      $out.= "Connection: Close\r\n\r\n";
      // Data goes in the request body for a POST request
      if ('POST' == $type && isset($post_string)) $out.= $post_string;

      fwrite($fp, $out);
      fclose($fp);
  }

?>