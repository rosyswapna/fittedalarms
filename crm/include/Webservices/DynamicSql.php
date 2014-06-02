<?php
/**
 * vtiger CRM Public License Version 1.0
 */

/***************************************************************************************************
* Copyright(c) @2011 ANTERP SOLUTIONS. All rights reserved.
* Website			http://www.anterp.com
* Authors		    	tclim
* Date Created     		Aug 08, 2011 4:38:48 PM
* 
* Additional License		This software require you to buy from ANTERP SOLUTIONS. 
* 				You have no right to redistribute this program.
* 
* Description			Data Sync Suites developed and distributed by ANTERP SOLUTIONS.
*  
 **************************************************************************************************/
		
		function vtws_dynamic_sql($table_name, $action, $element, $user){
		
//		$sql = 'INSERT INTO vtiger_vendorcontactrel';
//	    $vendorId = "370";
//	    $contactId = "371";
//    
//		$element = array('vendorid'=>$vendorId, 
//		 		'contactid'=>$contactId
//		 		);
		
//		$user = new Users();
//		$userId = $user->retrieve_user_id($username);
		
		return sql($table_name, $action, $element);
//		if($token == null){
//			throw new WebServiceException(WebServiceErrorCode::$INVALIDTOKEN,"Specified token is invalid or expired");
//		}
//		
//		$accessKey = vtws_getUserAccessKey($userId);
//		if($accessKey == null){
//			throw new WebServiceException(WebServiceErrorCode::$ACCESSKEYUNDEFINED,"Access key for the user is undefined");
//		}
//		
//		$accessCrypt = md5($token.$accessKey);
//		if(strcmp($accessCrypt,$pwd)!==0){
//			throw new WebServiceException(WebServiceErrorCode::$INVALIDUSERPWD,"Invalid username or password");
//		}
//		$user = $user->retrieveCurrentUserInfoFromFile($userId);
//		if($user->status != 'Inactive'){
//			return $user;
//		}
//		throw new WebServiceException(WebServiceErrorCode::$AUTHREQUIRED,'Given user is inactive');
	}
	
	function sql($table_name, $action, $element) {
		global $adb, $log;

		$sql = "";
		$sqlDelete = "";
		$columnStr = "";
		$hasDeletedField = false;
		$isSeq = false;
		$lastModifiedTime = time();
		
		
		if (preg_match("/_seq/", $table_name)) {
			$isSeq = true;
		} // end if
		
		//To generate sql statements
		switch (strtolower($action)) {
			case "insert" :
				$sql = "INSERT INTO " . $table_name . " ";
				//Column String			
				$columnStr = 'SET '.implode('=?,',array_keys($element)).' =? ';
				break;
			case "update" :
				$sql = "UPDATE " . $table_name . " ";
				//Column String			
				if ($isSeq) {
					$columnStr = 'SET id = id + 1 ';
				} else {
					$columnStr = 'SET '.implode('=?,',array_keys($element)).' =? ';
				}
									
				break;
			case "delete" :
				$sql = "DELETE FROM " . $table_name . " ";				
				//Column String			
				$columnStr = 'WHERE '.implode('=? AND ',array_keys($element)).' =? ';
				break;			
			case "sql" :
				$sql = $element['custom_sql'];				
				$arrTemp = $element['where_clause'];
				
				//Generate sql escape string to avoid SQL INJECTION	
				foreach ($arrTemp as $key => $value) {					
						$sql .= " " . $key . " '". $adb->sql_escape_string($value) . "'";					
				}
				//Append the order by statement
				$sql .= " " . $element['order_by'];
				
				break;
			case "inventory" :
				$_params = '';
				
				$arrTemp = $element['where_clause'];
				foreach ($arrTemp as $key => $value) {					
						$_params .= " " . $key . " '". $adb->sql_escape_string($value) . "'";					
				}
				
				//Append the order by statement
				$_order_by = "";
				if (isset($element['order_by']))
					$_order_by = " " . $element['order_by'];
				
				$sql = "SELECT rel.*, 'Services' as line_item_type, prod.servicecategory as category,prod.servicename as productname, prod.service_usageunit as unit FROM vtiger_inventoryproductrel rel INNER JOIN vtiger_service prod ON prod.serviceid = rel.productid INNER JOIN vtiger_crmentity crm ON crm.crmid = prod.serviceid AND crm.deleted = 0 " . $_params . $_order_by;
				$sql .= " UNION ";
				$sql .= "SELECT rel.*, 'Products' as line_item_type, prod.productcategory as category,prod.productname as productname, prod.usageunit as unit FROM vtiger_inventoryproductrel rel INNER JOIN vtiger_products prod ON prod.productid = rel.productid INNER JOIN vtiger_crmentity crm ON crm.crmid = prod.productid AND crm.deleted = 0 " . $_params . $_order_by;
				break;	
			case 'purchase_order_details':
				$_params = '';
				
				$arrTemp = $element['where_clause'];
				foreach ($arrTemp as $key => $value) {					
						$_params .= " " . $key . " '". $adb->sql_escape_string($value) . "'";					
				}
				
				//Append the order by statement
				$_order_by = "";
				if (isset($element['order_by']))
					$_order_by = " " . $element['order_by'];
					
				$sql = "select case when vtiger_products.productid != '' then vtiger_products.productname else vtiger_service.servicename end as productname, case when vtiger_products.productid != '' then 'Products' else 'Services' end as entitytype, case when vtiger_products.productid != '' then vtiger_products.unit_price else vtiger_service.unit_price end as unit_price, case when vtiger_products.productid != '' then vtiger_products.qtyinstock else 'NA' end as qtyinstock, vtiger_inventoryproductrel.*  from vtiger_inventoryproductrel left join vtiger_products on vtiger_products.productid=vtiger_inventoryproductrel.productid  left join vtiger_service on vtiger_service.serviceid=vtiger_inventoryproductrel.productid " . $_params . $_order_by;
				break;
			case "sync" :
				$sql = $element['custom_sql'];				
				$arrTemp = $element['where_clause'];
				
				if ($table_name == 'vtiger_currency_info') {
					$hasDeletedField = true;
				}
				
				//Generate sql escape string to avoid SQL INJECTION	
				foreach ($arrTemp as $key => $value) {
					$sql .= " " . $key . " '". $adb->sql_escape_string($value) . "'";
					$lastModifiedTime = $value;
				}
				
				//Checking if vtiger have deleted field 
				if ($hasDeletedField) {
					//We need to construct for Delete SQL					
					$sqlDelete .= $sql . " AND deleted = 1";
					
					//We need to contruct for Active SQL
					//This SQL must be append after the sqlDelete				
					$sql .= " AND deleted = 0";
				}
				 
				//Append the order by statement
				$sqlDelete .= " " . $element['order_by'];
				$sql .= " " . $element['order_by'];
				
				break;	
			default:
				$sql = "SELECT * FROM " . $table_name . " ";			
				//Column String			
				$columnStr = 'WHERE '.implode('=? AND ',array_keys($element)).' =? ';				
		}
		
		if ((strtolower($action)) == 'sql' || strtolower($action) == 'inventory' || strtolower($action) == 'purchase_order_details') {
			
			$log->debug("Sql Query : " . $sql);
							
			$result = $adb->query($sql);
			
			$log->debug("Sql Result : " . $result);
			
			return prepareArrayList($result);
	
		} else if ((strtolower($action)) == 'sync') {
			
			$log->debug("Sql Sync : " . $sql);
							
			$result = $adb->query($sql);
			
			$log->debug("Sql Sync Result : " . $result);
			
			$resultMergeUpdate = prepareArrayList($result);
			
			$log->debug("Sql Sync Total Record : " . count($resultMergeUpdate));
			
			if (count($resultMergeUpdate) > 0) {
				$log->debug("Sql Sync modifiedtime : " . $resultMergeUpdate[0]['modifiedtime']);
				$lastModifiedTime = $resultMergeUpdate[0]['modifiedtime'];
			}
			
			$lastModifiedTime = strtotime($lastModifiedTime);
			
			$resultMergeDelete = array();
			
			//if there are Deleted			
			if ($hasDeletedField) {

				$resultDelete = $adb->query($sqlDelete);
				
				$log->debug("Sql Sync Deleted Result : " . $resultDelete);
				
				$resultMergeUpdate = prepareArrayList($resultDelete);
			}
			
			//Combine the Merge Array
			$resultMerge = array('updated' => $resultMergeUpdate, 'deleted' => $resultMergeDelete, 'lastModifiedTime' => $lastModifiedTime);
			
			return $resultMerge;
	
		} else {
			
			$log->debug("Dynamic Sql Query : " . $sql);
				
			if ($isSeq) {
		 		$adb->query($sql . " " . $columnStr);
		 		$result = $adb->query("SELECT id FROM " . $table_name);
			} else {
		 
				$params = array_values($element);	
				
				$log->debug("Dynamic Sql : " . $sql . " " . $columnStr);
				$log->debug("Parameters : " . $params);
						
				$result = $adb->pquery($sql . " " . $columnStr, $params);
				
				if ((strtolower($action)) == 'insert') {
					$id = $adb->getLastInsertID($table_name);
					$output = array("id"=>$id);
					$arrOutput[0] = $output;
					return $arrOutput; 
				}
			}			
		}
				
		$log->debug("Dynamic Sql Return Result : " . $result);
		
		return prepareArrayList($result);
	}
	
	function prepareArrayList($result) {
		$output = array();
		$arrOutput = array();
		$rec = 0;
		foreach($result as $value) {				
			if(is_array($value)) {
				foreach ($value as $key2 => $value2) {
					
					if (!is_numeric($key2))	{	
						$output[$key2] = $value2;
					}						
				}
				$arrOutput[$rec] = $output;
				$rec++;
			}
		}
		return $arrOutput;
	}
?>
