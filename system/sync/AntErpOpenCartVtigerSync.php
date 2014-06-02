<?php
/***************************************************************************************************
* Copyright(c) @2011 ANTERP SOLUTIONS. All rights reserved.
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
 
 class AntErpOpenCartVtigerSync {
 	private $tid;
	private $user_id;
	private $sync_action_cd;
	private $sync_module_cd;
	private $sync_option_cd;
	private $from_sync_source;
	private $to_sync_source;
	private $sync_time;
	private $sync_time_to;
	private $store_id;
	
	private $source_user_id;
	private $dest_user_id;
	private $vtiger_user_id;
	private $vtiger_session_id;
	
	//User Sync Information
	private $user_sync_action_cd;
	private $user_sync_module_cd;
	private $user_sync_option_cd;
	private $user_source;
	private $user_destination;
	private $user_first_sync;
	private $user_last_sync;
	private $time_interval;
	private $debug_mode;
	
	//System Preferences
	private $sysPrefs = array();
	
	//Settings
	private $settings = array();
	
	function getTid() {
	  return $this->tid;
	}
	
	function setTid($obj) {
	  $this->tid = $obj;
	}
	
	function getUserId() {
	  return $this->user_id;
	}
	
	function setUserId($obj) {
	  $this->user_id = $obj;
	}
	
	function getSyncActionCd() {
	  return $this->sync_action_cd;
	}
	
	function setSyncActionCd($obj) {
	  $this->sync_action_cd = $obj;
	}
	
	function getSyncModuleCd() {
		return $this->sync_module_cd;
	}

	function setSyncModuleCd($obj) {
		$this->sync_module_cd = $obj;
	}

	function getSyncOptionCd() {
		return $this->sync_option_cd;
	}

	function setSyncOptionCd($obj) {
		$this->sync_option_cd = $obj;
	}
	
	function getFromSyncSource() {
	  return $this->from_sync_source;
	}
	
	function setFromSyncSource($obj) {
	  $this->from_sync_source = $obj;
	}
	
	function getToSyncSource() {
	  return $this->to_sync_source;
	}
	
	function setToSyncSource($obj) {
	  $this->to_sync_source = $obj;
	}
	
	function getSyncTime() {
	  	return $this->sync_time;
	}
	
	function setSyncTime($obj) {
	  	$this->sync_time = $obj;
	}
	
	function getSyncTimeTo() {
	  	return $this->sync_time_to;
	}
	
	function setSyncTimeTo($obj) {
	  	$this->sync_time_to = $obj;
	}
	
 function getStoreId() {
	  	return $this->store_id;
	}
	
	function setStoreId($obj) {
	  	$this->store_id = $obj;
	}
	
	function getSysPrefs() {
		return $this->sysPrefs;
	}

	function setSysPrefs($obj) {
		$this->sysPrefs = $obj;
	}
	
 function getSyncStatus() {
		return $this->sync_status;
	}

	function setSyncStatus($obj) {
		$this->sync_status = $obj;
	}
		
	function setSourceUserId($obj) {
		$this->source_user_id = $obj;
	}

	function getSourceUserId() {
		return $this->source_user_id;
	}
	
	function setDestUserId($obj) {
		$this->dest_user_id = $obj;
	}

	function getDestUserId() {
		return $this->dest_user_id;
	}

	function setVtigerUserId($obj) {
		$this->vtiger_user_id = $obj;
	}

	function getVtigerUserId() {
		return $this->vtiger_user_id;
	}
	
	function setVtigerSessionId($obj) {
		$this->vtiger_session_id = $obj;
	}

	function getVtigerSessionId() {
		return $this->vtiger_session_id;
	}
	
	//User Sync Information
	function getUserSyncModuleCd() {
		return $this->user_sync_module_cd;
	}

	function setUserSyncModuleCd($obj) {
		$this->user_sync_module_cd = $obj;
	}

	function getUserSyncOptionCd() {
		return $this->user_sync_option_cd;
	}

	function setUserSyncOptionCd($obj) {
		$this->user_sync_option_cd = $obj;
	}

	function getUserFirstSync() {
		return $this->user_first_sync;
	}

	function setUserFirstSync($obj) {
		$this->user_first_sync = $obj;
	}

	function getUserLastSync() {
		return $this->user_last_sync;
	}

	function setUserLastSync($obj) {
		$this->user_last_sync = $obj;
	}

	function getSettings() {
		return $this->settings;
	}

	function setSettings($obj) {
		$this->settings = $obj;
	}
	
	function getConfiguration() {
		return $this->configuration;
	}

	function setConfiguration($obj) {
		$this->configuration = $obj;
	}
	
	function getTimeInterval() {
		return $this->time_interval;
	}

	function setTimeInterval($obj) {
		$this->time_interval = $obj;
	}

	function getDebugMode() {
		return $this->debug_mode;
	}

	function setDebugMode($obj) {
		$this->debug_mode = $obj;
	}
	
	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->db = $registry->get('db');
		$this->request = $registry->get('request');
		$this->session = $registry->get('session');
				
	}
	
	public function getSyncConfig($module) {
		 
		$sync_config_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sync_config WHERE sync_module_cd = '" . $this->db->escape($module) . "'");
		
		if ($sync_config_query->num_rows) {
			$this->setSyncModuleCd($sync_config_query->row['sync_module_cd']);
			$this->setSyncOptionCd($sync_config_query->row['sync_option_cd']);
			$this->setFromSyncSource($sync_config_query->row['source']);
			$this->setToSyncSource($sync_config_query->row['destination']);
    	}
  	}
  	
	public function getLastSync($module) {
		
		$sync_result_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "sync_result WHERE sync_module_cd = '" . $this->db->escape($module) . "'");
		
		if ($sync_result_query->num_rows) {
			$this->setUserId($sync_result_query->row['user_id']);
			$this->setSyncTime(strtotime($sync_result_query->row['first_sync']));
			$this->setSyncTimeTo(strtotime($sync_result_query->row['last_sync']));	
    	}
  	}
  	
 	protected function getDefaultLanguageId() {
		$code = $this->config->get('config_language');		
		$result = $this->db->query("SELECT language_id FROM `".DB_PREFIX."language` WHERE code = '$code'");
		$languageId = 1;
		if ($result->rows) {
			foreach ($result->rows as $row) {
				$languageId = $row['language_id'];
				break;
			}
		}
		return $languageId;
	}
	
  	/**
	 * OpenCart Retrieve Sync Array
	 * $module			-	Module Name
	 * $stime			-	Sync Time
	 * $return			- 	Array Object
	 */
	public function openCartSync($module, $stime) {
		global $log;
		
		if ($this->config->get('vtiger_sync_debug_mode')) $log->write("================== Start OpenCart [$module] [$stime]==============================================");
		
		$result = array();
		$resultMergeUpdate = array();
		$resultMergeDelete = array();
			
		$synctime = date("Y-m-d H:i:s", $stime);
		$lastModifiedTime = date("Y-m-d H:i:s", $stime);
		$language_id = $this->getDefaultLanguageId();

		switch ($module) {
		    case "ProductCategory":		    	
		    	$sync_result_query = $this->db->query("SELECT cat_desc.*, 'B' as dflt_mb_flag FROM " . DB_PREFIX . "category_description cat_desc INNER JOIN " . DB_PREFIX . "category cat ON cat.category_id = cat_desc.category_id AND cat_desc.language_id = " . $language_id . " INNER JOIN " . DB_PREFIX . "category_to_store cat_store ON cat_store.category_id = cat.category_id AND cat_store.store_id = " . (int)$this->store_id . " WHERE date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC");
				$resultMergeUpdate = $this->ArrayResultSet($sync_result_query);
				$sync_result_date = $this->db->query("SELECT date_modified FROM " . DB_PREFIX . "category_description cat_desc INNER JOIN " . DB_PREFIX . "category cat ON cat.category_id = cat_desc.category_id AND cat_desc.language_id = " . $language_id . " INNER JOIN " . DB_PREFIX . "category_to_store cat_store ON cat_store.category_id = cat.category_id AND cat_store.store_id = " . (int)$this->store_id . " WHERE date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC LIMIT 0, 1");
				if ($sync_result_date->num_rows) {
					$lastModifiedTime = $sync_result_date->row['date_modified'];
				}
		        break;
		     case "ManufacturerCategory":
		    	$sync_result_query = $this->db->query("SELECT m.manufacturer_id as category_id, m.name, 'M' as dflt_mb_flag FROM `" . DB_PREFIX . "manufacturer` m INNER JOIN " . DB_PREFIX . "manufacturer_to_store m_to_store ON m_to_store.manufacturer_id = m.manufacturer_id WHERE store_id = " . (int)$this->store_id . " AND date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC");
				$resultMergeUpdate = $this->ArrayResultSet($sync_result_query);
				$sync_result_date = $this->db->query("SELECT m.date_modified FROM `" . DB_PREFIX . "manufacturer` m INNER JOIN " . DB_PREFIX . "manufacturer_to_store m_to_store ON m_to_store.manufacturer_id = m.manufacturer_id WHERE store_id = " . (int)$this->store_id . " AND date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC LIMIT 0, 1");
				if ($sync_result_date->num_rows) {
					$lastModifiedTime = $sync_result_date->row['date_modified'];
				}
		        break;
		      case "Currency":
		    	$sync_result_query = $this->db->query("SELECT * FROM `" . DB_PREFIX . "currency` WHERE date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC");
				$resultMergeUpdate = $this->ArrayResultSet($sync_result_query);
				$sync_result_date = $this->db->query("SELECT date_modified FROM `" . DB_PREFIX . "currency` WHERE date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC LIMIT 0, 1");
				if ($sync_result_date->num_rows) {
					$lastModifiedTime = $sync_result_date->row['date_modified'];
				}
		        break;      
		     case "Products":
		   		$sync_result_query = $this->db->query("SELECT product.*,pd.name,pd.description,pd.meta_keyword,cat_desc.name as productcategory, wcd.unit as units, wcd.title as units_desc, wc.value as uom, m.name as manufacturer_name FROM `" . DB_PREFIX . "product` product INNER JOIN " . DB_PREFIX . "product_to_category ptc ON ptc.product_id = product.product_id INNER JOIN " . DB_PREFIX . "weight_class_description wcd ON wcd.weight_class_id = product.weight_class_id INNER JOIN " . DB_PREFIX . "weight_class wc ON wc.weight_class_id = product.weight_class_id INNER JOIN " . DB_PREFIX . "category_description cat_desc ON cat_desc.category_id = ptc.category_id AND cat_desc.language_id = " . $language_id . " INNER JOIN " . DB_PREFIX . "product_description pd ON pd.product_id = product.product_id AND pd.language_id = " . $language_id . " INNER JOIN " . DB_PREFIX . "product_to_store prod_store ON prod_store.product_id = product.product_id AND prod_store.store_id = " . (int)$this->store_id . " LEFT JOIN " . DB_PREFIX . "manufacturer m ON product.manufacturer_id = m.manufacturer_id WHERE status = '1' AND product.date_modified > '" . $this->db->escape($synctime) . "' GROUP BY pd.name ORDER BY product.date_modified DESC");
				$resultMergeUpdate = $this->ArrayResultSet($sync_result_query);
				$sync_result_date = $this->db->query("SELECT date_modified FROM `" . DB_PREFIX . "product` product INNER JOIN " . DB_PREFIX . "product_description pd ON pd.product_id = product.product_id AND pd.language_id = " . $language_id . " INNER JOIN " . DB_PREFIX . "product_to_store prod_store ON prod_store.product_id = product.product_id AND prod_store.store_id = " . (int)$this->store_id . " WHERE status = '1' AND date_modified > '" . $this->db->escape($synctime) . "' ORDER BY date_modified DESC LIMIT 0, 1");
				if ($sync_result_date->num_rows) {
					$lastModifiedTime = $sync_result_date->row['date_modified'];
				}
		        break;
		   case "Accounts":
		   	    $sync_result_query = $this->db->query("SELECT cust.*, cust_group_desc.name as customer_group  FROM `" . DB_PREFIX . "customer` cust INNER JOIN `" . DB_PREFIX . "customer_group` cust_group ON cust.customer_group_id = cust_group.customer_group_id INNER JOIN `" . DB_PREFIX . "customer_group_description` cust_group_desc on  cust_group_desc.customer_group_id = cust_group.customer_group_id  AND cust_group_desc.language_id = " . $language_id . " WHERE cust.store_id = " . (int)$this->store_id . " AND cust.date_modified > '" . $this->db->escape($synctime) . "' ORDER BY cust.date_modified DESC");
		    	$resultMergeUpdate = $this->ArrayResultSet($sync_result_query);
				$sync_result_date = $this->db->query("SELECT cust.date_modified FROM `" . DB_PREFIX . "customer` cust WHERE cust.store_id = " . (int)$this->store_id . " AND cust.date_modified > '" . $this->db->escape($synctime) . "'  ORDER BY date_modified DESC LIMIT 0, 1");
				if ($sync_result_date->num_rows) {
					$lastModifiedTime = $sync_result_date->row['date_modified'];
				}
		        break;    
		    case "Invoice":	//Retrieve the transaction code according to opencart order status for Invoice)
		    	$sales_order_status_query = $this->db->query("SELECT value FROM `" . DB_PREFIX . "setting` WHERE `group` = 'vtiger_sync' AND `key` = 'vtiger_sync_invoice_status'");
				$transaction_code = '0';
				
				if ($sales_order_status_query->num_rows) {				
					$arrOrderStatus =  $sales_order_status_query->row['value'];
					
						if (strlen($arrOrderStatus) > 1)
						 	$arrOrderStatus = unserialize($arrOrderStatus);
					
					    for ($i=0;$i<count($arrOrderStatus);$i++) {								
							$transaction_code .= "," . $arrOrderStatus[$i];		
						}
				}
				
		   		$sync_result_query = $this->db->query("SELECT orders.*, cust_group_desc.name as customer_group FROM `" . DB_PREFIX . "order` orders INNER JOIN `" . DB_PREFIX . "customer_group` cust_group ON cust_group.customer_group_id = orders.customer_group_id INNER JOIN `" . DB_PREFIX . "customer_group_description` cust_group_desc on  cust_group_desc.customer_group_id = cust_group.customer_group_id  AND cust_group_desc.language_id = " . $language_id . " WHERE store_id = " . (int)$this->store_id . " AND invoice_no <> '0' AND order_status_id IN (" . $transaction_code . ") AND date_modified > '" . $this->db->escape($synctime) . "' ORDER BY date_modified DESC");
				$resultMergeUpdate = $this->ArrayResultSet($sync_result_query);
				$sync_result_date = $this->db->query("SELECT date_modified FROM `" . DB_PREFIX . "order` WHERE store_id = " . (int)$this->store_id . " AND invoice_no <> '0' AND order_status_id IN (" . $transaction_code . ") AND date_modified > '" . $this->db->escape($synctime) . "' ORDER BY date_modified DESC LIMIT 0, 1");
				if ($sync_result_date->num_rows) {					
					$lastModifiedTime = $sync_result_date->row['date_modified'];			
				}				
		        break;    
		}

		//Convert Last Modified Time into Unix_time
		$lastModifiedTime = strtotime($lastModifiedTime);

		//Combine the Merge Array
		$result = array('updated' => $resultMergeUpdate, 'deleted' => $resultMergeDelete, 'lastModifiedTime' => $lastModifiedTime);
	
		return $result;
	}
	
	/**
	 * Preparing Array List from ResultSet
	 * $result			-	ResultSet
	 * $return			- 	Array Object
	 */
	private function ArrayResultSet($result) {
		$arrOutput = array();
 
		foreach ($result->rows as $key => $value) {			
				$arrOutput[$key] = $value;						
		}
		
		return $arrOutput;
	}
	
	
	/**
	 * Function to Sync Category into Vtiger	 
	 * $arrVtiger 		-	Vtiger Array Object
	 * $arrOpenCart			-	Opencart Array Object
	 * @return 			-	Conflict Array Object
	 */
	function openCartSyncVtigerCategory($vtiger_url, $arrVtiger, $module, $store_id, $username, $userAccessKey, $arrOpenCart, $famodule) {
		global $conn, $log;
		
		$hasUpdateRec = false;
		$arrOpenCartUpdate = array();
		
		if (!empty($arrOpenCart["updated"]))
			$arrOpenCartUpdate = $arrOpenCart["updated"];
		
		if ($this->getSyncOptionCd() == '2WAY' || $this->getFromSyncSource() =='shoppingcart') {			
			$log->write("Sync OpenCart Category -> Vtiger New/Update Records ==> " . count($arrOpenCartUpdate));

			if (count($arrOpenCartUpdate) > 0) {
				$hasUpdateRec = true;
				$this->openCartToVtigerCategoryUpdate($vtiger_url, $arrOpenCartUpdate, $module, $store_id, $username, $userAccessKey);
			}
		}
		
		return $hasUpdateRec;
	}
	
	/**
	 * Function to Sync OpenCart and Vtiger
	 * $vtiger_url		-	Vtiger URL
	 * $arrOpenCart 	-	OpenCart Array Object
	 * $module			- 	Module Name
	 * $arrVtiger		-	Vtiger Array Object
	 * @return 			-	Conflict Array Object
	 */
	function openCartSyncVtigerOperation($arrOpenCart, $module, $vtiger_url, $store_id, $username, $userAccessKey, $arrVtiger, $famodule) {
		global $log;
		
		$hasUpdateRec = false;
		$arrOpenCartUpdate = array();
	 
		if (!empty($arrOpenCart["updated"]))
			$arrOpenCartUpdate = $arrOpenCart["updated"];
			
		if ($this->getSyncOptionCd() == '2WAY' || $this->getFromSyncSource() =='shoppingcart') {
			if ($this->config->get('vtiger_sync_debug_mode')) $log->write("Sync OpenCart " . $module . " -> Vtiger New/Update Records ==> " . count($arrOpenCartUpdate));

			if (count($arrOpenCartUpdate) > 0) {
				$hasUpdateRec = true;
					switch ($module) {
							case 'Currency':
									$this->openCartToVtigerCurrencyUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate);																	
									break;
							case 'Products':
									$this->openCartToVtigerProductUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate);
									break;
							case 'Accounts':
									$this->openCartToVtigerAccountUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate);
									break;	
							case 'Invoice':
									$this->openCartToVtigerInvoiceUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate);
									break;				
								
					}
			}
		}
		
		return $hasUpdateRec;
	}
	
 /**
	 * This function perform Insert/Update OpenCart Records into Vtiger
	 * $arrOpenCartUpdate		-	Contains New/Update records Only
	 */
	function openCartToVtigerAccountUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate) {			 
		global $conn, $log;
		
		$log->write("Vtiger Insert/Update Record in progress...");
		
		for ($j=0;$j<count($arrOpenCartUpdate);$j++) {
				$this->vtigerSyncOpenCartAccounts($vtiger_url, $module, $arrOpenCartUpdate[$j], $store_id, $username, $userAccessKey);
				
		}		
	}
	
	function vtigerSyncOpenCartAccounts($vtiger_url, $module, $customerInfo, $store_id, $username, $userAccessKey) {
			
		 	$_company_name = '';
			$customer_id =  $customerInfo['customer_id'];
			$accountId = '';
			$addressInfo = array();
			$addressInfo['pri_country_name'] = '';
			$addressInfo['sec_country_name'] = '';
			$addressInfo['pri_zone_name'] = '';
			$addressInfo['sec_zone_name'] = '';
			
			$addressInfo['pri_address_id'] = '';
			$addressInfo['pri_customer_id'] = '';
			$addressInfo['pri_company'] = '';
			$addressInfo['pri_firstname'] = '';
			$addressInfo['pri_lastname'] = '';
			$addressInfo['pri_address_1'] = '';
			$addressInfo['pri_address_2'] = '';
			$addressInfo['pri_postcode'] = '';
			$addressInfo['pri_city'] = '';
			$addressInfo['pri_country_id'] = '';
			$addressInfo['pri_zone_id'] = '';
			//Initial set the second address as the primary address
			$addressInfo['sec_address_id'] = '';
			$addressInfo['sec_customer_id'] = '';
			$addressInfo['sec_company'] = '';
			$addressInfo['sec_firstname'] = '';
			$addressInfo['sec_lastname'] = '';
			$addressInfo['sec_address_1'] = '';
			$addressInfo['sec_address_2'] = '';
			$addressInfo['sec_postcode'] = '';
			$addressInfo['sec_city'] = '';
			$addressInfo['sec_country_id'] = '';
			$addressInfo['sec_zone_id'] = '';
			
			$address_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "address addr WHERE addr.customer_id = '" . (int)$customer_id . "' ORDER BY address_id ASC LIMIT 0,2");
			    	
					foreach ($address_query->rows as $address_row) {						
			  			if ($customerInfo['address_id'] == $address_row['address_id']) {
			  				$_company_name = $address_row['company'];		      			
			      			$addressInfo['pri_address_id'] = $address_row['address_id'];
							$addressInfo['pri_customer_id'] = $address_row['customer_id'];
							$addressInfo['pri_company'] = $address_row['company'];
							$addressInfo['pri_firstname'] = $address_row['firstname'];
							$addressInfo['pri_lastname'] = $address_row['lastname'];
							$addressInfo['pri_address_1'] = $address_row['address_1'];
							$addressInfo['pri_address_2'] = $address_row['address_2'];	
							$addressInfo['pri_postcode'] = $address_row['postcode'];
							$addressInfo['pri_city'] = $address_row['city'];
							$addressInfo['pri_country_id'] = $address_row['country_id'];
							$addressInfo['pri_zone_id'] = $address_row['zone_id'];
							//Initial set the second address as the primary address
							$addressInfo['sec_address_id'] = $address_row['address_id'];
							$addressInfo['sec_customer_id'] = $address_row['customer_id'];
							$addressInfo['sec_company'] = $address_row['company'];
							$addressInfo['sec_firstname'] = $address_row['firstname'];
							$addressInfo['sec_lastname'] = $address_row['lastname'];
							$addressInfo['sec_address_1'] = $address_row['address_1'];
							$addressInfo['sec_address_2'] = $address_row['address_2'];	
							$addressInfo['sec_postcode'] = $address_row['postcode'];
							$addressInfo['sec_city'] = $address_row['city'];
							$addressInfo['sec_country_id'] = $address_row['country_id'];
							$addressInfo['sec_zone_id'] = $address_row['zone_id'];      			
			  			}
							$addressInfo['sec_address_id'] = $address_row['address_id'];
							$addressInfo['sec_customer_id'] = $address_row['customer_id'];
							$addressInfo['sec_company'] = $address_row['company'];
							$addressInfo['sec_firstname'] = $address_row['firstname'];
							$addressInfo['sec_lastname'] = $address_row['lastname'];
							$addressInfo['sec_address_1'] = $address_row['address_1'];
							$addressInfo['sec_address_2'] = $address_row['address_2'];	
							$addressInfo['sec_postcode'] = $address_row['postcode'];
							$addressInfo['sec_city'] = $address_row['city'];
							$addressInfo['sec_country_id'] = $address_row['country_id'];
							$addressInfo['sec_zone_id'] = $address_row['zone_id'];
					}
      	
					//Query country table and get the iso code
			      	$country_code1 = '';
					$country_code2 = '';
					$country_name1 = '';		
					$country_name2 = '';
					
			      	if (isset($addressInfo['pri_country_id'])) {      		
			      		$country_query1 = $this->db->query("SELECT iso_code_2,name FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$addressInfo['pri_country_id'] . "'");
							
						if ($country_query1->num_rows) {
							$country_code1 = $country_query1->row['iso_code_2'];
							$country_name1 = $country_query1->row['name'];
							$addressInfo['pri_country_name'] = $country_name1;						      			
						}
			      	}
					
					if (isset($addressInfo['sec_country_id'])) {
						$country_query2 = $this->db->query("SELECT iso_code_2,name FROM `" . DB_PREFIX . "country` WHERE country_id = '" . (int)$addressInfo['sec_country_id'] . "'");
						if ($country_query2->num_rows) {
							$country_code2 = $country_query2->row['iso_code_2'];
							$country_name2 = $country_query2->row['name'];
							$addressInfo['sec_country_name'] = $country_name2;	
						}
					}
					
					//Query state table and get the state code
					$state_cd1 = '';
					$state_cd2 = '';
					$state_name1 = '';		
					$state_name2 = '';
					
					if (isset($addressInfo['pri_zone_id'])) {	
						$zone_query1 = $this->db->query("SELECT code,name FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$addressInfo['pri_zone_id'] . "'");
									
						if ($zone_query1->num_rows) {
							$state_cd1 = $zone_query1->row['code'];
							$state_name1 = $zone_query1->row['name'];
							$addressInfo['pri_zone_name'] = $state_name1;
						}
					}
					
					if (isset($addressInfo['sec_zone_id'])) {
						$zone_query2 = $this->db->query("SELECT code,name FROM `" . DB_PREFIX . "zone` WHERE zone_id = '" . (int)$addressInfo['sec_zone_id'] . "'");
						
						if ($zone_query2->num_rows) {
							$state_cd2 = $zone_query2->row['code'];
							$state_name2 = $zone_query2->row['name'];
							$addressInfo['sec_zone_name'] = $state_name2;
						}
					}
					
					//Check if the company name is empty then replace with lastname and firstname
					if (trim($_company_name) =='') {
						$_company_name  = $customerInfo['firstname'] . " " . $customerInfo['lastname'];	
					}
					
			$debtor_ref =  $_company_name;		
		
			$vtiger_customer_id = $this->config->get('vtiger_sync_account_customer_id');
			
			// Retrieve Accounts
			//$queryAccount = "SELECT id FROM Accounts WHERE accountname = '$_company_name'";
			$queryAccount = "SELECT id FROM Accounts WHERE $vtiger_customer_id = '$customer_id'";
				
			$resultAccount = $this->doQuery($vtiger_url, $queryAccount);
			
			$accountInfo[$vtiger_customer_id] = $customer_id;
			
			//If record exists, perform update
			if($resultAccount) {
				
					$accountId = $resultAccount[0]['id'];
					
					//Retrieve Account information based on Account ID
					$accountInfo = $this->doRetrieve($vtiger_url, $accountId);
					
					//First Address 
					$accountInfo['bill_street'] = trim($addressInfo['pri_address_1'] . " " . $addressInfo['pri_address_2']);
					$accountInfo['bill_city'] = $addressInfo['pri_city'];
					$accountInfo['bill_state'] = $addressInfo['pri_zone_name'];
					$accountInfo['bill_code'] = $addressInfo['pri_postcode'];
					$accountInfo['bill_country'] = $addressInfo['pri_country_name']; 
					//Second Address
					$accountInfo['ship_street'] = trim($addressInfo['sec_address_1'] . " " . $addressInfo['sec_address_2']);
					$accountInfo['ship_city'] = $addressInfo['sec_city'];
					$accountInfo['ship_state'] = $addressInfo['sec_zone_name'];
					$accountInfo['ship_code'] = $addressInfo['sec_postcode'];
					$accountInfo['ship_country'] = $addressInfo['sec_country_name']; 
					
					$accountInfo['account_no'] = trim($debtor_ref);
					$accountInfo['accountname'] = trim($_company_name);
					$accountInfo['email1'] = $customerInfo['email'];
					$accountInfo['emailoptout'] = $this->getEmailOptInOut($customerInfo['newsletter']);
					$accountInfo['phone'] = $customerInfo['telephone'];
					//$accountInfo['otherphone'] = '';
					$accountInfo['fax'] = $customerInfo['fax'];
			
					//Update Account Information					
					$result = $this->doUpdate($vtiger_url, $accountInfo);
				 
			} else { //If record not exist, perform insert			

					//First Address 
					$accountInfo['bill_street'] = trim($addressInfo['pri_address_1'] . " " . $addressInfo['pri_address_2']);
					$accountInfo['bill_city'] = $addressInfo['pri_city'];
					$accountInfo['bill_state'] = $addressInfo['pri_zone_name'];
					$accountInfo['bill_code'] = $addressInfo['pri_postcode'];
					$accountInfo['bill_country'] = $addressInfo['pri_country_name']; 
					//Second Address
					$accountInfo['ship_street'] = trim($addressInfo['sec_address_1'] . " " . $addressInfo['sec_address_2']);
					$accountInfo['ship_city'] = $addressInfo['sec_city'];
					$accountInfo['ship_state'] = $addressInfo['sec_zone_name'];
					$accountInfo['ship_code'] = $addressInfo['sec_postcode'];
					$accountInfo['ship_country'] = $addressInfo['sec_country_name'];
					
					$accountInfo['account_no'] = trim($debtor_ref);
					$accountInfo['accountname'] = trim($_company_name);
					$accountInfo['email1'] = $customerInfo['email'];
					$accountInfo['emailoptout'] = $this->getEmailOptInOut($customerInfo['newsletter']);
					$accountInfo['phone'] = $customerInfo['telephone'];
					//$accountInfo['otherphone'] = '';
					$accountInfo['fax'] = $customerInfo['fax'];	

				    $modulename = 'Accounts';
					$result = $this->doCreate($vtiger_url, $modulename, $accountInfo);
					
			}//End Insert
			
			if($result) {				
				$tableId = $result['account_no'];
			}
				
			$this->trackerSyncUpdate($module, $tableId, $_company_name, $customer_id, $customerInfo['email'], false);
			
			//Insert/update Contacts
			$this->openCartToVtigerContactUpdate($vtiger_url, $module, $customerInfo, $store_id, $username, $accountId, $_company_name, $customer_id, $addressInfo);
	}
	
	
 function openCartToVtigerContactUpdate($vtiger_url, $module, $openCartContact, $store_id, $username, $accountId, $_company_name, $customer_id, $addressInfo) {
	
		if (count($openCartContact) > 0 ) {
			
					if (empty($accountId)) {
						$vtiger_customer_id = $this->config->get('vtiger_sync_account_customer_id');
						// Retrieve Accounts
						//$queryAccount = "SELECT id FROM Accounts WHERE accountname = '$_company_name'";
						$queryAccount = "SELECT id FROM Accounts WHERE $vtiger_customer_id = '$customer_id'";
							
						$resultAccount = $this->doQuery($vtiger_url, $queryAccount);
						
						//If record exists, perform update
						if($resultAccount) {
								$accountId = $resultAccount[0]['id'];
						}
					}
	 
					$vtiger_contact_id = $this->config->get('vtiger_sync_contact_id');
					
					//If record exists, perform update
					if(!empty($accountId)) {
			
							// Retrieve Contact
                            $queryContact = "SELECT id FROM Contacts WHERE account_id = " . $accountId . " AND firstname LIKE '" . $openCartContact['firstname'] . "' AND lastname = '" . $openCartContact['lastname'] . "'";
                            //$queryContact = "SELECT id FROM Contacts WHERE $vtiger_contact_id = '" . $customer_id . "'";
							$resultContact = $this->doQuery($vtiger_url, $queryContact);
							
							$contactInfo = array();
							$contactInfo[$vtiger_contact_id] = $customer_id;
							//If record exists, perform update
							if($resultContact) {
								$contactId = $resultContact[0]['id'];

								//Retrieve Contacts information based on Contact ID
								$contactInfo = $this->doRetrieve($vtiger_url, $contactId);

								$contactInfo['account_id'] = $accountId;	
								$contactInfo['account_name'] = $_company_name;
								$contactInfo['firstname'] = $openCartContact['firstname'];
								$contactInfo['lastname'] = $openCartContact['lastname'];								
								
								//Retrieve from Customer Info								
								$contactInfo['email'] = $openCartContact['email'];
								$contactInfo['emailoptout'] = $this->getEmailOptInOut($openCartContact['newsletter']);
								$contactInfo['phone'] = $openCartContact['telephone'];
								$contactInfo['fax'] = $openCartContact['fax'];
								
								//First Address 
								$contactInfo['mailingstreet'] = trim($addressInfo['pri_address_1'] . " " . $addressInfo['pri_address_2']);
								$contactInfo['mailingcity'] = $addressInfo['pri_city'];
								$contactInfo['mailingstate'] = $addressInfo['pri_zone_name'];
								$contactInfo['mailingcode'] = $addressInfo['pri_postcode'];
								$contactInfo['mailingcountry'] = $addressInfo['pri_country_name']; 
								//Second Address
								$contactInfo['otherstreet'] = trim($addressInfo['sec_address_1'] . " " . $addressInfo['sec_address_2']);
								$contactInfo['othercity'] = $addressInfo['sec_city'];
								$contactInfo['otherstate'] = $addressInfo['sec_zone_name'];
								$contactInfo['othercode'] = $addressInfo['sec_postcode'];
								$contactInfo['othercountry'] = $addressInfo['sec_country_name'];
							
								//Update Contacts Information
								$this->doUpdate($vtiger_url, $contactInfo);
								
							} else {
								//Insert into Contacts
							    $modulename = 'Contacts';
							    
							    $contactInfo['account_id'] = $accountId;							
								$contactInfo['account_name'] = $_company_name;					
								$contactInfo['firstname'] = $openCartContact['firstname'];
								$contactInfo['lastname'] = $openCartContact['lastname'];
								
								//Retrieve from Customer Info
								$contactInfo['email'] = $openCartContact['email'];
								$contactInfo['emailoptout'] = $this->getEmailOptInOut($openCartContact['newsletter']);
								$contactInfo['phone'] = $openCartContact['telephone'];
								$contactInfo['fax'] = $openCartContact['fax'];
							    
							    //First Address 
								$contactInfo['mailingstreet'] = trim($addressInfo['pri_address_1'] . " " . $addressInfo['pri_address_2']);
								$contactInfo['mailingcity'] = $addressInfo['pri_city'];
								$contactInfo['mailingstate'] = $addressInfo['pri_zone_name'];
								$contactInfo['mailingcode'] = $addressInfo['pri_postcode'];
								$contactInfo['mailingcountry'] = $addressInfo['pri_country_name']; 
								//Second Address
								$contactInfo['otherstreet'] = trim($addressInfo['sec_address_1'] . " " . $addressInfo['sec_address_2']);
								$contactInfo['othercity'] = $addressInfo['sec_city'];
								$contactInfo['otherstate'] = $addressInfo['sec_zone_name'];
								$contactInfo['othercode'] = $addressInfo['sec_postcode'];
								$contactInfo['othercountry'] = $addressInfo['sec_country_name'];
								
								$contactRec = $this->doCreate($vtiger_url, $modulename, $contactInfo);
							}
					}
			}
	}
	
	
 	/**
	 * This function perform Insert/Update OpenCart Records into Vtiger
	 * $arrOpenCartUpdate		-	Contains New/Update records Only
	 */
	function openCartToVtigerProductUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate) {
		global $conn, $log;
		
		$log->write("Vtiger Products Insert/Update Record in progress...");
		
		for ($j=0;$j<count($arrOpenCartUpdate);$j++) {
				$this->vtigerSyncOpenCartProducts($vtiger_url, $module, $arrOpenCartUpdate[$j], $store_id, $username, $userAccessKey);
				
		}		
	}
	
	function vtigerSyncOpenCartProducts($vtiger_url, $module, $obj, $store_id, $username, $userAccessKey) {
			global $log;
		
			$productId = '';
			$vendor_id = '';
			$currency_id = $this->config->get('config_currency');
			
		 	$tableId = $this->getDestTableId($module, $obj['product_id'], false);
			
			//Default Query
			$query = "SELECT id,product_no FROM Products ";
			if (!empty($tableId)) {
				$query .= "WHERE product_no = '" . $tableId . "'";
			} else {
				$query .= "WHERE productname = '" . $obj['name'] . "'";
			}
			
			$result = $this->doQuery($vtiger_url, $query);
			
			$vtiger_product_id = $this->config->get('vtiger_sync_product_id');
			
			$dataInfo[$vtiger_product_id] = $obj['product_id'];
			
			//If record exists, perform update
			if($result) {
				
				$productId = $this->getRecordId($result[0]['id']);
				$id = $result[0]['id'];
				$tableId = $result[0]['product_no'];
				$dataInfo = $this->doRetrieve($vtiger_url, $id);
				
				$dataInfo['productname'] = $obj['name'];
				$dataInfo['productcode'] = $obj['model'];
				$dataInfo['productcategory'] = $obj['productcategory'];
				$dataInfo['manufacturer'] = $obj['manufacturer_name'];
				$dataInfo['unit_price'] = $obj['price'];
				$dataInfo['weight'] = $obj['weight'];
				$dataInfo['sales_start_date'] = $obj['date_available'];
				$dataInfo['start_date'] = $obj['date_available'];
				$dataInfo['usageunit'] = $obj['units_desc'];
				$dataInfo['website'] = htmlentities(HTTP_SERVER . "index.php?route=product/product&product_id=" . $obj['product_id'], ENT_QUOTES, "UTF-8");
				$dataInfo['glacct'] = $this->config->get('vtiger_sync_gl_account');
				$dataInfo['vendor_id'] = $vendor_id;
				$dataInfo['currency_id'] = $currency_id;
				$dataInfo['description'] = $obj['description'];
				$dataInfo['discontinued'] = $obj['status'];
				
				//$dataInfo['reorderlevel'] = '0';
				$dataInfo['qtyinstock'] = $obj['quantity'];
				//$dataInfo['qtyindemand'] = '0';
				//$dataInfo['on_order'] = '0';				
				$dataInfo['available_stock'] = $obj['quantity'];
				$dataInfo['qty_per_unit'] = $obj['minimum'];
					
				//Update Information
				$this->doUpdate($vtiger_url, $dataInfo);
				
				$this->trackerSyncUpdate($module, $tableId, $obj['name'], $obj['product_id'], $obj['name'], false);
				
			} else { //If record not exist, perform insert

				$dataInfo['productname'] = $obj['name'];
				$dataInfo['productcode'] = $obj['model'];
				$dataInfo['productcategory'] = $obj['productcategory'];
				$dataInfo['manufacturer'] = $obj['manufacturer_name'];
				$dataInfo['unit_price'] = $obj['price'];
				$dataInfo['weight'] = $obj['weight'];
				$dataInfo['sales_start_date'] = $obj['date_available'];
				$dataInfo['sales_end_date'] = '';
				$dataInfo['start_date'] = $obj['date_available'];
				$dataInfo['expiry_date'] = '';
				$dataInfo['cost_factor'] = '';
				$dataInfo['commissionrate'] = '';
				$dataInfo['commissionmethod'] = '';
				$dataInfo['usageunit'] = $obj['units_desc'];
				$dataInfo['handler'] = $this->getVtigerUserId();
				$dataInfo['website'] = htmlentities(HTTP_SERVER . "index.php?route=product/product&product_id=" . $obj['product_id'], ENT_QUOTES, "UTF-8");
				$dataInfo['taxclass'] = '';
				$dataInfo['mfr_part_no'] = '';
				$dataInfo['glacct'] = $this->config->get('vtiger_sync_gl_account');
				$dataInfo['vendor_part_no'] = '';
				$dataInfo['serial_no'] = '';
				$dataInfo['productsheet'] = '';
				$dataInfo['vendor_id'] = '';
				$dataInfo['imagename'] = '';
				$dataInfo['currency_id'] = $currency_id;
				$dataInfo['description'] = $obj['description'];
				$dataInfo['discontinued'] = $obj['status'];
				$dataInfo['reorderlevel'] = '0';
				$dataInfo['qtyinstock'] = $obj['quantity'];
				$dataInfo['qtyindemand'] = '0';
				$dataInfo['on_order'] = '0';
				$dataInfo['available_stock'] = $obj['quantity'];
				$dataInfo['qty_per_unit'] = $obj['minimum'];
			
				$modulename = 'Products';				
				$resultProduct = $this->doCreate($vtiger_url, $modulename, $dataInfo);
				
				if($resultProduct) {				
					$productId = $this->getRecordId($resultProduct['id']);
					$tableId = $resultProduct['product_no'];
				}
				
				$this->trackerSyncUpdate($module, $tableId, $obj['name'], $obj['product_id'], $obj['name'], false);
			}
	}
	
 	function GetFileName($filename)
	{
	   $parts = Explode('/', $filename);
	    return $parts[count($parts) - 1];
	}
 
	
 /**
	 * This function perform Insert/Update OpenCart Records into Vtiger
	 * $arrOpenCartUpdate		-	Contains New/Update records Only
	 */
	function openCartToVtigerCurrencyUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate) {		
									  		  
		global $conn, $log;
		
		$log->write("Vtiger " . $module . " Insert/Update Record in progress...");
		
		for ($j=0;$j<count($arrOpenCartUpdate);$j++) {
				$this->vtigerSyncOpenCartCurrencies($vtiger_url, $module, $arrOpenCartUpdate[$j], $store_id, $username, $userAccessKey);
				
		}		
	}
	
	function vtigerSyncOpenCartCurrencies($vtiger_url, $module, $obj, $store_id, $username, $userAccessKey) {
		global $log;

		// Retrieve Record From Object
		$query = "SELECT id FROM Currency WHERE currency_code = '" . $obj['code'] . "'";
		$result = $this->doQuery($vtiger_url, $query);
		$table = '';
		$action = "sql";			
					
		$resultCurrencies = $this->doDynamicSql($vtiger_url, $table, $action,
									Array('custom_sql'=>"SELECT * FROM vtiger_currencies",
										  'where_clause'=> Array('WHERE currency_code = '=> $obj['code']),											  
										  'order_by'=>"ORDER BY currencyid DESC LIMIT 1"
									)	  
								);

		$currency_name = $obj['title'];
		$currency_symbol = $obj['symbol_left'];
		
		if (empty($currency_symbol)) {			
			$currency_symbol = $obj['symbol_right'];
		}
		
		if($resultCurrencies) {
		    $currency_name = $resultCurrencies[0]['currency_name'];
		    $currency_symbol = $resultCurrencies[0]['currency_symbol'];
		}
		
		//If record exists, perform update
		if($result) {
			
			$currencyId = $result[0]['id'];
			$dataInfo = $this->doRetrieve($vtiger_url, $currencyId);

			$dataInfo['currency_name'] = $currency_name;
			$dataInfo['currency_code'] = $obj['code'];
			$dataInfo['currency_symbol'] = $currency_symbol;
			$dataInfo['conversion_rate'] = $obj['value'];
			$dataInfo['currency_status'] = $this->getActiveStatus($obj['status']);
			$dataInfo['modifiedtime'] = date('Y-m-d H:i:s');
	
			//Update Information
			$this->doUpdate($vtiger_url, $dataInfo);
			
		} else { //If record not exist, perform insert
			
			$module = 'Currency';
			$this->doCreate($vtiger_url, $module,
			      Array(
			      		'currency_name'=>$currency_name,
						'currency_code'=>$obj['code'],
						'currency_symbol'=>$currency_symbol,
						'conversion_rate'=>$obj['value'],
						'currency_status'=>$this->getActiveStatus($obj['status']),
						'defaultid'=>'0',
						'deleted'=>'0',
						'modifiedtime'=>date('Y-m-d H:i:s')
						));
		}
	}
	
	
	/**
	 * This function perform Insert/Update OpenCart Records into Vtiger
	 * $arrOpenCartUpdate		-	Contains New/Update records Only
	 */
	function openCartToVtigerCategoryUpdate($vtiger_url, $arrOpenCartUpdate, $module, $store_id, $username, $userAccessKey) {
		global $conn, $log;
		
		$log->write("Vtiger Category Insert/Update Record in progress...");
		
		for ($j=0;$j<count($arrOpenCartUpdate);$j++) {
				$this->vtigerSyncOpenCartCategories($vtiger_url, $module, $arrOpenCartUpdate[$j], $store_id, $username, $userAccessKey);
				
		}		
	}
	
	function vtigerSyncOpenCartCategories($vtiger_url, $module, $obj, $store_id, $username, $userAccessKey) {
	
		// Retrieve Record From Object
		$table = 'vtiger_productcategory';
		$table_product = 'vtiger_products';
		$item_category_id = 'productcategoryid';
		$category_group = 'productcategory';
				
		$table_picklist = 'vtiger_picklist';
				
		$action = "sql";			
		$description = $obj['name'];
		$result = array();
		
		$tableId = $this->getDestTableId($module, $obj['category_id'], false);
		
		switch (trim($obj['dflt_mb_flag'])) {
			case "B" : //Product Category			
				$table = 'vtiger_productcategory';
				$table_product = 'vtiger_products';
				$item_category_id = 'productcategoryid';
				$category_group = 'productcategory';
				break;
			case "D" : //Services Category
				$table = 'vtiger_servicecategory';
				$table_product = 'vtiger_servicecategory';
				$item_category_id = 'servicecategoryid';
				$category_group = 'servicecategory';
				break;
			case "M" : //Manufacturer Category
				$table = 'vtiger_manufacturer';
				$table_product = 'vtiger_manufacturer';
				$item_category_id = 'manufacturerid';
				$category_group = 'manufacturer';
				break;	
		} //End Checking for Product Catagory	
				
		if (trim($tableId) != '' && trim($tableId) != '0') {
			$result = $this->doDynamicSql($vtiger_url, $table, $action,
									Array('custom_sql'=>'SELECT ' . $item_category_id . ',' . $category_group . ' FROM ' . $table,
										  'where_clause'=> Array('WHERE ' . $item_category_id . ' = '=> $tableId),											  
										  'order_by'=>'LIMIT 1'
									)	  
								);
		} else {			
			$result = $this->doDynamicSql($vtiger_url, $table, $action,
									Array('custom_sql'=>'SELECT ' . $item_category_id . ',' . $category_group . ' FROM ' . $table,
										  'where_clause'=> Array('WHERE ' . $category_group . ' = '=> $obj['name']),											  
										  'order_by'=>'LIMIT 1'
									)	  
								);
		}
		
		//If record exists, perform update
		if($result) {
			
			$tableId = $result[0][$item_category_id];
			$oldproductcategory = $result[0][$category_group];
	
			//Update Product Category Information
			$this->doDynamicSql($vtiger_url, $table, $action,
									Array('custom_sql'=>'UPDATE ' . $table . ' SET',
										  'where_clause'=> Array($category_group . ' = '=> $description,
										  						 'WHERE ' . $item_category_id . ' = '=> $tableId),											  
										  'order_by'=>''
									)	  
								);

			//Update Product Information								
			$this->doDynamicSql($vtiger_url, $table, $action,
									Array('custom_sql'=>'UPDATE ' . $table_product . ' SET',
										  'where_clause'=> Array($category_group . ' = '=> $description,
										  						 'WHERE ' . $category_group . ' = '=> $oldproductcategory),											  
										  'order_by'=>''
									)	  
								);
			
			
			$this->trackerSyncUpdate($module, $tableId, $description, $obj['category_id'], $description, false);
			
		} else { //If record not exist, perform insert
			$category_id = '';
			$picklistvalues_id = '';
			$product_category_id = '';
			
			$table_picklist_values = 'vtiger_picklistvalues_seq';
			$action = "update";
		
			//Update PickListValues Information
			$resultPickListValues = $this->doDynamicSql($vtiger_url, $table_picklist_values, $action, Array());			 
							
			if (isset($resultPickListValues[0]))	
				$picklistvalues_id = $resultPickListValues[0]['id'];																

			$table_product_category = $table . '_seq';
			$action = "update";
						
			$resultProductCategory = $this->doDynamicSql($vtiger_url, $table_product_category, $action, Array());

			if (isset($resultProductCategory[0]))
				$product_category_id = $resultProductCategory[0]['id'];
			
			//Insert Information
			$action = "insert";
			
			$this->doDynamicSql($vtiger_url, $table, $action,
				      Array($item_category_id=>$product_category_id, 
					 		$category_group=>$description,
					 		'presence'=> '1',
					 		'picklist_valueid'=>$picklistvalues_id
					 		));
					 		
			$action = "sql";
			$pick_list_id = '';
			$pick_list_role_id = '';
			
			//Select picklist
			$resultPickList = $this->doDynamicSql($vtiger_url, $table_picklist, $action,
						Array('custom_sql'=>'SELECT picklistid FROM ' . $table_picklist,
							  'where_clause'=> Array('WHERE name = '=> $category_group),											  
							  'order_by'=>'LIMIT 1'
						)	  
					);

			if (isset($resultPickList[0]))
				$pick_list_id = $resultPickList[0]['picklistid'];
			
			//Retrieve the default user role
			$pick_list_role_id = $this->config->get('vtiger_sync_user_role');
			$action = "sql";
			$sortid = '';
			
			//Select sort id
			$resultSortId = $this->doDynamicSql($vtiger_url, 'vtiger_role2picklist', $action,
						Array('custom_sql'=>'SELECT  MAX(sortid) as sortid FROM vtiger_role2picklist left join ' . $table . ' on '. $table . '.picklist_valueid=vtiger_role2picklist.picklistvalueid',
							  'where_clause'=> Array('WHERE roleid = '=> $pick_list_role_id,
							  						 'AND picklistid = '=> $pick_list_id),											  
							  'order_by'=>'LIMIT 1'
						)	  
					);

			
			if (isset($resultSortId[0])) {
				$sortid = $resultSortId[0]['sortid'];
				$sortid = $sortid + 1;
			}	
				
			
			//Insert Role2Picklist
			$action = "insert";
			
			$this->doDynamicSql($vtiger_url, 'vtiger_role2picklist', $action,
				      Array('roleid'=>$pick_list_role_id, 
					 		'picklistvalueid'=>$picklistvalues_id,
					 		'picklistid'=>$pick_list_id,
					 		'sortid'=>$sortid
					 		));
					 			
			$this->trackerSyncUpdate($module, $product_category_id, $description, $obj['category_id'], $description, false);
		}
	}	
	
	
 /**
	 * This function perform Insert/Update OpenCart Records into Vtiger
	 * $arrOpenCartUpdate		-	Contains New/Update records Only
	 */
	function openCartToVtigerInvoiceUpdate($vtiger_url, $module, $store_id, $username, $userAccessKey, $arrOpenCartUpdate) {
		global $conn, $log;
		
		$log->write("Vtiger " . $module . " Insert/Update Record in progress...");
		
		for ($j=0;$j<count($arrOpenCartUpdate);$j++) {
				$this->vtigerSyncOpenCartInvoices($vtiger_url, $module, $arrOpenCartUpdate[$j], $store_id, $username, $userAccessKey);
				
		}		
	}
	
     function vtigerSyncOpenCartInvoices($vtiger_url, $module, $obj, $store_id, $username, $userAccessKey) {
			global $log;
			
			$tableId = $this->getDestTableId($module, $obj['order_id'], false);
			$language_id = $this->getDefaultLanguageId();
			$product_attribute = $this->config->get('vtiger_sync_default_invoice_product_attribute');
			$currency_code = $this->config->get('config_currency');
			$customer_id = $obj['customer_id'];
			
			$customer_name = $obj['firstname'] . " " . $obj['lastname'];
			$subject = $customer_name . " - " . $obj['order_id'];
			
			$dataInfo = array();
			
			//To get the freight cost								
			$_freight_cost = 0;
			$_shipper_name = '';
			$_total = 0;
			$_sub_total = 0;
			$_adjustment = 0;
			$_adjustment_type = '+';
			$_coupon_discount = 0;
			$order_total_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_total WHERE order_id = '" . (int)$obj['order_id'] . "' ORDER BY sort_order ASC");
			
			foreach ($order_total_query->rows as $result) {									
				//To get the freight cost
				if ('shipping' == trim($result['code'])) {
					$_freight_cost = $result['value'];
					$_shipper_name = $result['title'];
				}
				//To get the total
				if ('total' == trim($result['code'])) {
					$_total = $result['value'];
				}
				//To get the sub total
				if ('sub_total' == trim($result['code'])) {
					$_sub_total = $result['value'];					
				}
				//To get the Coupon Discount
				if ('coupon' == trim($result['code'])) {
					$_coupon_discount = abs($result['value']);
					////Final Discount in Amount (Vtiger Only)
	  				$dataInfo['discount_type_final'] = $this->config->get('vtiger_sync_discount_type_final');
	  				$dataInfo['discount_amount'] = $_coupon_discount;				
				}
				//To get the Voucher for Birthday/Christmas/General
				if ('voucher' == trim($result['code'])) {
					$_adjustment = $_adjustment + abs($result['value']);
					$_adjustment_type = '-';					
					$dataInfo['adjustment'] = abs($_adjustment);
					$dataInfo['adjustmentType'] = $_adjustment_type;
				}
			}
						
			$query = "SELECT id,invoice_no FROM Invoice WHERE invoice_no = '" . $tableId . "'";
			$resultQuery = $this->doQuery($vtiger_url, $query);
			$accountId = '';
			$account_no = '';
				
			$vtiger_customer_id = $this->config->get('vtiger_sync_account_customer_id');
			
			// Retrieve Accounts
			//$queryAccount = "SELECT id,account_no FROM Accounts WHERE accountname LIKE '" . $customer_name . "'";			
			$queryAccount = "SELECT id,account_no FROM Accounts WHERE $vtiger_customer_id = '$customer_id'";
				
			$resultAccount = $this->doQuery($vtiger_url, $queryAccount);
			
			//If record exists, perform update
			if($resultAccount) {				
					$accountId = $resultAccount[0]['id'];
					$account_no = $resultAccount[0]['account_no'];
			}
			
			//If record exists, perform update
			if($resultQuery) {
				//Set the invoiceid				
				$dataInfo['invoiceid'] = $this->getRecordId($resultQuery[0]['id']);
				$tableId = $resultQuery[0]['invoice_no'];
				
			} else {
				$dataInfo['invoiceid'] = '';
				$dataInfo['salesorderid'] = '';
				$dataInfo['salesorder_no'] = '';
				$dataInfo['salesorder_name'] = '';
				$dataInfo['invoiceterms'] = '';
	  			$dataInfo['salescommission'] = '0.00';
  				$dataInfo['exciseduty'] = '0.00';
  				$dataInfo['invoicestatus'] = '';
  				$dataInfo['quoteid'] = '';
  				$dataInfo['vendorterms'] = '';
  				$dataInfo['contactid'] = '';
  				$dataInfo['vendorid'] = '';
			 	$dataInfo['currency_code'] = $currency_code;
  				$dataInfo['enable_recurring'] = '0';
  				$dataInfo['conversion_rate'] = '1';
  				$dataInfo['purchaseorder'] = '';
  				$dataInfo['subject'] = $subject;
  				$_adjustment_type = '-';
				$dataInfo['adjustment'] = '0';
				$dataInfo['adjustmentType'] = $_adjustment_type;  				 				
			}
			
				//Sync Invoice Details  				
  				$dataInfo['account_no'] = $account_no;
  				$dataInfo['invoice_no'] = $tableId;
  				$dataInfo['customerno'] = $obj['customer_id'];
  				$dataInfo['invoicedate'] = date("Y-m-d",strtotime($obj['date_added']));
  				$dataInfo['duedate'] = date("Y-m-d",strtotime($obj['date_modified']));
  				$dataInfo['invoicestatus'] = $this->config->get('vtiger_sync_default_invoice_status');
  				$dataInfo['salescommission'] = $obj['commission'];
  				$dataInfo['carrier'] =   $_shipper_name;
  				$dataInfo['shipping_handling_charge'] = $_freight_cost;
  				$dataInfo['shipping_handling_charge_tax'] = $this->config->get('vtiger_sync_shipping_handling_charge_tax');
  				$dataInfo['total'] = $_total;
  				$dataInfo['subtotal'] = $_sub_total;
				$dataInfo['accountid'] = $accountId;
				$dataInfo['description'] =  trim($obj['comment']); 
				$dataInfo['currency_code'] = $currency_code;
				$dataInfo['conversion_rate'] = $obj['currency_value'];				
				$dataInfo['firstname'] =  $obj['firstname'];
				$dataInfo['lastname'] =  $obj['lastname'];
				$dataInfo['taxtype'] = $this->config->get('vtiger_sync_tax_mode');  				
  				//$dataInfo['tax_group_name'] = $obj['tax_group_name'];	
  					
				$resultInventory = array();
				$rec = 0;
				//End		
				$order_product_query = $this->db->query("SELECT order_prod.*, prod.price as list_price, ((1 - (order_prod.price / prod.price)) * 100) as discount_percent, prod_desc.name as prod_desc_name FROM " . DB_PREFIX . "order_product order_prod INNER JOIN " . DB_PREFIX . "product prod ON prod.product_id = order_prod.product_id INNER JOIN " . DB_PREFIX . "product_description prod_desc ON order_prod.product_id = prod_desc.product_id AND language_id = '" . $language_id . "' WHERE order_prod.order_id = '" . (int)$obj['order_id'] . "'");
				
				$option_attribute_data = '';				
				
				//To construct Products
				foreach ($order_product_query->rows as $result) {					
					
					$options = $this->db->query("SELECT name as option_name,value as option_value FROM " . DB_PREFIX . "order_option WHERE order_id = '" . (int)$result['order_id'] . "' AND order_product_id = '" . (int)$result['order_product_id'] . "'");
					
					$option_data = '';													
					foreach ($options->rows as $option) {	
	          			$option_data .= "\n- " .$option['option_name'] . " : " . $option['option_value'];					          			
	        		}
	        		
					if (!empty($option_data)) {
		        		$option_attribute_data .= $result['prod_desc_name'] . $option_data . "\n\n";
	        		}
	        		
					$output = array();
					//Support default language only, sync the default language product description name
					//$output['productname'] = $result['name'];
					$output['product_name'] =  $result['prod_desc_name'];
					$output['product_code'] = $result['product_id'];
					$output['line_item_type'] = 'Products';		
					$output['qty'] = $result['quantity'];
					$output['comment'] = '';
					
					//if ($result['discount_percent'] <= 0) {
						$output['list_price'] = $result['price'];		
						$output['discount_percent'] = '0.00';
					//} else{
					//	$output['list_price'] = $result['list_price'];
					//	$output['discount_percent'] = $result['discount_percent'];
					//}
					 
					$resultInventory[$rec] = $output;
					$rec++;
				}
				
				$invoicecfarray = array();
     			if (!empty($product_attribute) && !empty($option_attribute_data)) {
	        		$invoicecfarray[$product_attribute] =  $option_attribute_data;	        	
	        		$dataInfo['invoice_product_attr'] = $invoicecfarray; 
        		}
				
				$dataInfo['products'] = (array)$resultInventory;

              	$resultId = $this->doSyncOperation($vtiger_url, 'syncinvoice', $subject, $dataInfo);

              	if($resultId) {				
					$tableId = $resultId['invoice_no'];
					//$tableId = $resultId[0]['invoice_no'];
					$this->trackerSyncUpdate($module, $tableId, $subject, $obj['order_id'], $subject, false);
				}
	}
	
	/**
	 * This function perform Insert/Update Last Sync Records
	 * $module			-	Module Name
	 * $update_action	-	Action
	 * $status			-	Transaction Status
	 * $firsttime		-	First Sync Time
	 * $lasttime		-	Last Sync Time
	 */
	public function lastSyncUpdate($module, $update_action, $status, $firsttime = null, $lasttime = null) {
		global $log;
		
		$firstDate = $lastDate  = null;
				
		if ($firsttime != null) {
			$firstDate = date("Y-m-d H:i:s", $firsttime);
		}
		
		if ($lasttime != null) {
			$lastDate  = date("Y-m-d H:i:s", $lasttime);
		}
		
		$query = $this->db->query("SELECT tid FROM " . DB_PREFIX . "sync_result WHERE user_id = '" . $this->db->escape($this->getUserId()) . "' AND sync_module_cd = '" . $this->db->escape($module) . "'");
		
		if ($query->num_rows == 0) { //Inser New Last Update Sync Time
			$sql = "INSERT INTO " . DB_PREFIX . "sync_result (user_id, sync_action_cd, sync_module_cd, sync_option_cd, source, destination, first_sync, last_sync, status_cd)						
					VALUES ('" . $this->db->escape($this->getUserId()) . "', '" . $this->db->escape($update_action) . "', '" . $this->db->escape($module) . "', '" . $this->db->escape($this->getSyncOptionCd()) . "', '" . $this->db->escape($this->getFromSyncSource()) . "', '" . $this->db->escape($this->getToSyncSource()) . "', '". $this->db->escape($firstDate) . "', '" . $this->db->escape($lastDate) . "', '" . $this->db->escape($status) . "')";
			
			$this->db->query($sql);
		} else { //Update Last Sync Time	
			$sql = "UPDATE " . DB_PREFIX . "sync_result SET ";
			if ($firstDate != null)
				$sql .= " first_sync = '" . $this->db->escape($firstDate) . "', ";
			
			if ($lastDate != null)
				$sql .= " last_sync = '" . $this->db->escape($lastDate) . "', ";
			
		    $sql .= " sync_option_cd = '" . $this->db->escape($this->getSyncOptionCd()) . "', source = '" . $this->db->escape($this->getFromSyncSource()) . "', destination = '" . $this->db->escape($this->getToSyncSource()) . "', status_cd = '" . $this->db->escape($status) . "' WHERE  user_id = '" . $this->db->escape($this->getUserId()) . "' AND sync_module_cd = '" . $this->db->escape($module) . "'";
		    
			$this->db->query($sql);
		}
	}
	
	/**
	 * This function get the id from track Records that use for maintanance table
	 * $module		-	Module Name
	 */
	function getDestTableId($module, $key, $controller) {
		global $log;
		$tid = '';
		$sql = '';
		
		if ($controller) {
			$sql = "SELECT key2 as id FROM " . DB_PREFIX . "sync_tracker WHERE sync_module_cd = '" . $this->db->escape($module) . "' AND key1 = '" . $this->db->escape($key) . "'";
		} else {
			$sql = "SELECT key1 as id FROM " . DB_PREFIX . "sync_tracker WHERE sync_module_cd = '" . $this->db->escape($module) . "' AND key2 = '" . $this->db->escape($key) . "'";			
		}

		$query = $this->db->query($sql);
		
		if ($query->num_rows) {
			$tid = $query->row['id'];
		}
				
		return $tid;	
	}
	
	
	/**
	 * This function track Last Sync Records that use for maintanance table
	 * $module		-	Module Name
	 */
	function trackerSyncUpdate($module, $key1, $value1, $key2, $value2, $controller) {
		global $log;
		$tid = '';
		
		$currentTime = time();		
		$currentDate = date("Y-m-d H:i:s", $currentTime);	
		
		if ($controller) {
			$sql = "SELECT tid FROM " . DB_PREFIX . "sync_tracker WHERE sync_module_cd = '" . $this->db->escape($module) . "' AND key1 = '" . $this->db->escape($key1) . "'";
		} else {
			$sql = "SELECT tid FROM " . DB_PREFIX . "sync_tracker WHERE sync_module_cd = '" . $this->db->escape($module) . "' AND key2 = '" . $this->db->escape($key2) . "'";			
		}

		$query = $this->db->query($sql);

		if ($query->num_rows == 0) { //Inser Tracker Record
			$sql = "INSERT INTO " . DB_PREFIX . "sync_tracker (user_id, sync_module_cd, key1, value1, key2, value2, modifiedtime)
					VALUES ('" . $this->db->escape($this->getUserId()) . "', '" . $this->db->escape($module) . "', '" . $this->db->escape($key1) . "', '" . $this->db->escape($value1) . "', '" . $this->db->escape($key2) . "', '" . $this->db->escape($value2) . "', '" . $this->db->escape($currentDate) . "')";

			$query = $this->db->query($sql);
			
			$tid = $this->db->getLastId();
			
		} else { //Update Tracker Record
			if ($query->num_rows) {
				$tid = $query->row['tid'];
			}
				
			if ($controller) {
				$sql = "UPDATE " . DB_PREFIX . "sync_tracker SET user_id = '" . $this->db->escape($this->getUserId()) . "', modifiedtime = '" . $this->db->escape($currentDate) . "', key1 = '" . $this->db->escape($key1) . "', value1 = '" . $this->db->escape($value1) . "' WHERE  tid = '" . $this->db->escape($tid) . "'";
			} else {
				$sql = "UPDATE " . DB_PREFIX . "sync_tracker SET user_id = '" . $this->db->escape($this->getUserId()) . "', modifiedtime = '" . $this->db->escape($currentDate) . "', key2 = '" . $this->db->escape($key2) . "', value2 = '" . $this->db->escape($value2) . "' WHERE  tid = '" . $this->db->escape($tid) . "'";
			}
	
			$this->db->query($sql);
		}
		
		return $tid;
	}
	
	/**
	 * Vtiger Retrieve Sync Array
	 * $url				-	vtiger Webservice http URL
	 * $module			-	Module Name
	 * $operation		-	sync
	 * $stime			-	Sync Time
	 * $is_sql			-	true  - Call Dynamic SQL Services
	 * 						false - Call Rest Services
	 * $return			- 	Array Object
	 */
	function vtigerSync($url, $module, $operation, $stime, $is_sql = false) {
		global $log;
		
		$log->write("================== Start Vtiger ==============================================");
		
		$result = array();
				
		//Call Dynamic SQL Services
		if ($is_sql) {			
			$action = "sync";
			
			$synctime = date("Y-m-d H:i:s", $stime);
			
			switch ($module) {
			    case "ProductCategory":
			    	$table = 'vtiger_productcategory';
			   		$result = $this->doDynamicSql($url, $table, $action,
							Array('custom_sql'=>"SELECT * FROM " . $table,
								  'where_clause'=> Array("WHERE modifiedtime > "=>$synctime),											  
								  'order_by'=>"ORDER BY modifiedtime DESC"
							)	  
						);
			        break;
			    case "ManufacturerCategory":
			    	$table = 'vtiger_manufacturer';
			   		$result = $this->doDynamicSql($url, $table, $action,
							Array('custom_sql'=>"SELECT * FROM " . $table,
								  'where_clause'=> Array("WHERE modifiedtime > "=>$synctime),											  
								  'order_by'=>"ORDER BY modifiedtime DESC"
							)	  
						);
			        break;
			    case "ServiceCategory":
			    	$table = 'vtiger_servicecategory';
			   		$result = $this->doDynamicSql($url, $table, $action,
							Array('custom_sql'=>"SELECT * FROM " . $table,
								  'where_clause'=> Array("WHERE modifiedtime > "=>$synctime),											  
								  'order_by'=>"ORDER BY modifiedtime DESC"
							)	  
						);
			        break;       
			    case "Currency":
			    	$table = 'vtiger_currency_info';
			   		$result = $this->doDynamicSql($url, $table, $action,
							Array('custom_sql'=>"SELECT * FROM " . $table,
								  'where_clause'=> Array("WHERE modifiedtime > "=>$synctime,
								  						 "AND deleted = "=>"0"),											  
								  'order_by'=>"ORDER BY modifiedtime DESC"
							)	  
						);
			        break;
	    	}		
			
		} else { //Call Rest Services
			
		//sync must be GET Request.
			$data = array ();
			
			$params = "operation=$operation&elementType=$module&modifiedTime=$stime&sessionName=" . $this->getVtigerSessionId();
			$jsonResponse = $this->sendRequestToVtiger($url, "GET", $params);
	
			//operation was successful get the token from the reponse.
			if ($jsonResponse['success'] == false) {
				//handle the failure case.
				$arrError = array('sessionName'=>$this->getVtigerSessionId(), 'operation'=>$operation, 'elementType'=>$module, 'modifiedTime'=>$stime);
			} else {
				$result = (array)$jsonResponse['result'];
			}
		}

		return $result;
	}
	
 	/**
	 * Send the request to sugarcrm via REST WebServices
	 * $module_name		-	Module Name
	 * $params		-	Array Object
	 * $return			-	Return Object
	 */
 	private function sendRequestToVtiger($url, $method, $params, $file_field_array = Array()) {
 	 global $log;
	
 	 	$connection_timeout = 50;
 	 
		// Tell curl to use HTTP POST
		if (strtolower(trim($method)) == 'get') {
			$curl = curl_init() or die(curl_error());
			curl_setopt($curl, CURLOPT_URL,$url . "?" . $params);
	 	} else {
		 
	 		// Open a curl session for making the call
			$curl = curl_init($url);
	 		curl_setopt($curl, CURLOPT_POST, true);
	 		
			// set post data
			$result_post = array_merge($params, $file_field_array);
			curl_setopt($curl, CURLOPT_POSTFIELDS, $result_post);
	 	}
		// Tell curl not to return headers, but do return the response
		$headers = array('Content-Type: multipart/form-data');
		curl_setopt($curl, CURLOPT_HTTPHEADER, $headers);
		
		curl_setopt($curl, CURLOPT_FAILONERROR, true);
		curl_setopt($curl, CURLOPT_FOLLOWLOCATION, true);
		curl_setopt($curl,CURLOPT_ENCODING , 'gzip, deflate');
		curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($curl, CURLOPT_RETURNTRANSFER, true); 
		curl_setopt($curl, CURLOPT_CONNECTTIMEOUT, $connection_timeout);
    	curl_setopt($curl, CURLOPT_TIMEOUT, 300);
		
		//spoof information
    	$agents = array(
    		'Mozilla/5.0 (X11; Linux x86_64; rv:12.0) Gecko/20100101 Firefox/12.0',
			'Mozilla/5.0 (Macintosh; Intel Mac OS X 10.7; rv:7.0.1) Gecko/20100101 Firefox/7.0.1',
			'Mozilla/5.0 (X11; U; Linux i686; en-US; rv:1.9.1.9) Gecko/20100508 SeaMonkey/2.0.4',
			'Mozilla/5.0 (Windows; U; MSIE 7.0; Windows NT 6.0; en-US)',
			'Mozilla/5.0 (Macintosh; U; Intel Mac OS X 10_6_7; da-dk) AppleWebKit/533.21.1 (KHTML, like Gecko) Version/5.0.5 Safari/533.21.1'
		 
		);
		curl_setopt($curl, CURLOPT_USERAGENT,$agents[array_rand($agents)]);

        $response = curl_exec($curl);

		return json_decode($response, true);
	}
	
	/**
	 * Vtiger Login
	 * $url				-	vtiger Webservice http URL
	 * $username		-	UserName
	 * $userAccessKey	-	User Access Key
	 * $return			-	true/false
	 */
	function vtigerLogin($url, $username, $userAccessKey) {				
		$return = false;
		
		//getchallenge request must be a GET request.
		$getChanllege = "operation=getchallenge&username=$username";
		$jsonResponse = $this->sendRequestToVtiger($url, "GET", $getChanllege);

		//check for whether the requested operation was successful or not.
		if ($jsonResponse['success'] == false) {
			//handle the failure case.
			//$arrError = array('username'=>$username);
			return $return;
		}
		//operation was successful get the token from the reponse.
		$challengeToken = $jsonResponse['result']['token'];

		//create md5 string concatenating user accesskey from my preference page 
		//and the challenge token obtained from get challenge result. 
		$generatedKey = md5($challengeToken . $userAccessKey);

		//login request must be POST request.
		$params = array ('operation' => 'login',
						'username' => $username,
						'accessKey' => $generatedKey
						);

		$jsonResponse = $this->sendRequestToVtiger($url, "POST", $params);

		//Verify the login process
		if ($jsonResponse['success'] == false) {
			$return = false;
			if(!empty($jsonResponse['error']['code'])) {
				//$this->setError("[" . $jsonResponse['error']['code'] . "] [" . $jsonResponse['error']['message'] . "]"); 
			}
			return $return;
		} else {
			$return = $jsonResponse['success'];
		}

		//login successful extract sessionId and userId from LoginResult to it can used for further calls.
		$this->setVtigerSessionId($jsonResponse['result']['sessionName']);
		$this->setVtigerUserId($jsonResponse['result']['userId']);

		return $return;
	}
	
	/**
	 * Vtiger Logout
	 * $url				-	vtiger Webservice http URL
	 */
	function vtigerLogout($url) {
		$return = false;

		//Logout must be a GET request.		
		$params = "operation=logout&sessionName=" . $this->getVtigerSessionId();
		$jsonResponse = $this->sendRequestToVtiger($url, "GET", $params);
		
		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
		    //handle the failure case.
		    //die('logout failed:'.$jsonResponse['errorMsg']);
		} else {
			//logout successful session terminated.
		}
				 
	}

	/**
	 * Retrieve details of record.
	 */
	function doRetrieve($url, $record) {
		// Perform re-login if required.
//		$this->__checkLogin();

		$result = array();
		
		//sessionId is obtained from login result.
		$params = "sessionName=" . $this->getVtigerSessionId() . "&operation=retrieve&id=$record";
		$jsonResponse = $this->sendRequestToVtiger($url, "GET", $params);
			
		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
			//handle the failure case.
			//die('retrieve failed:' . $jsonResponse['errorMsg']);
			//$arrError = array('sessionName'=>$this->getVtigerSessionId(), 'operation'=>'retrieve', 'id'=>$record);
		} else {
			$result = $jsonResponse['result'];
		}

		return $result;
	}
	
	/**
	 * Do Query Operation.
	 */
	function doQuery($url, $query) {
		global $log;
		// Perform re-login if required.
		//$this->__checkLogin();
		$retrievedObjects = array();
		
		// Make sure the query ends with ;
		$query = trim($query);		
		if(strripos($query, ';') != strlen($query)-1) $query .= ';';

		//urlencode to as its sent over http.
		$queryParam = urlencode($query);

		//sessionId is obtained from login result.
		$params = "sessionName=" . $this->getVtigerSessionId() . "&operation=query&query=$queryParam";

		//query must be GET Request.		
		$jsonResponse = $this->sendRequestToVtiger($url, "GET", $params);
		
		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
		 //   //handle the failure case.
		   // die('query failed:'.$jsonResponse['errorMsg']);
		   //$arrError = array('sessionName'=>$this->getVtigerSessionId(), 'operation'=>'query', 'query'=>$queryParam);
		} else {
			$retrievedObjects = $jsonResponse['result'];
		}
		
		return $retrievedObjects;
	}
	
	/**
	 * Do Create Operation
	 */
	function doCreate($url, $module, $valuemap) {
		// Perform re-login if required.
		//$this->__checkLogin();

		$createResult = array();
			
		// Assign record to logged in user if not specified
		if(!isset($valuemap['assigned_user_id'])) {
			$valuemap['assigned_user_id'] = $this->getVtigerUserId();
		}

		$params = array(
			'operation'   => 'create',
			'sessionName' => $this->getVtigerSessionId(),
			'elementType' => $module,
			'element'     => json_encode($valuemap)
		);
		
		//Create must be POST Request.
		$jsonResponse = $this->sendRequestToVtiger($url, "POST", $params);

		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
		    //handle the failure case.
		   // die('create failed:'.$jsonResponse['error']['errorMsg']);
		} else {
			$createResult = $jsonResponse['result'];
		}
		
		return $createResult;
		
	}
	
	/**
	 * Do Update Operation
	 */
	function doUpdate($url, $valuemap) {
		// Perform re-login if required.
//		$this->__checkLogin();

		$savedObject = array();

		// Assign record to logged in user if not specified
		if(!isset($valuemap['assigned_user_id'])) {
			$valuemap['assigned_user_id'] = $this->getVtigerUserId();
		}

		$params = array(
			'operation'   => 'update',
			'sessionName' => $this->getVtigerSessionId(),
			'element'     => json_encode($valuemap)
		);
		//Create must be POST Request.
		$jsonResponse = $this->sendRequestToVtiger($url, "POST", $params);

		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
			//handle the failure case.
			//die('updated failed:' . $jsonResponse['error']['errorMsg']);
		} else {
			$savedObject = $jsonResponse['result'];
		}
		
		return $savedObject;
		 
	}

	/**
	 * Do Create Quotes/SalesOrder/Purchase Order Operation
	 */
	function doSyncOperation($url, $operation, $subject, $valuemap) {
		// Perform re-login if required.
		//$this->__checkLogin();
		
		$savedObject = array();

		// Assign record to logged in user if not specified
		if(!isset($valuemap['assigned_user_id'])) {
			$valuemap['assigned_user_id'] = $this->getVtigerUserId();
		}
		
		$params = array (
			'operation'   => $operation,
			'sessionName' => $this->getVtigerSessionId(),
			'subject' => $subject,
			'assigned_user_id'=>$this->getVtigerUserId(),
			'element'     => json_encode($valuemap)
		);
		
		//Create must be POST Request.
		$jsonResponse = $this->sendRequestToVtiger($url, "POST", $params);

		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
			//handle the failure case.
			//die('sync operation ' . $operation . ' failed:' . $jsonResponse['error']['errorMsg']);
		} else {
			$savedObject = $jsonResponse['result'];
		}
	
		return $savedObject;
	}
	
	/**
	 * Do Create Operation
	 */
	function doDynamicSql($url, $table, $action, $valuemap) {
		// Perform re-login if required.
//		$this->__checkLogin();

		$savedObject = array();

		$params = array(
			'operation'   => 'dynamic_sql',
			'sessionName' => $this->getVtigerSessionId(),
			'table_name' => $table,
			'action' => $action,
			'element'     => json_encode($valuemap)
		);

		//Create must be POST Request.		
		$jsonResponse = $this->sendRequestToVtiger($url, "POST", $params);

		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
			//die('sql failed:' . $jsonResponse['error']['errorMsg']);
		} else {		
			$savedObject = $jsonResponse['result'];
		}

		return $savedObject;
		 
	}
	
	
	/**
	 * Do Sync Prices
	 */
	function doSyncPrices($url, $operation, $action, $module, $valuemap) {
		// Perform re-login if required.
		//$this->__checkLogin();

		$savedObject = array();
		
		// Assign record to logged in user if not specified
		if(!isset($valuemap['assigned_user_id'])) {
			$valuemap['assigned_user_id'] = $this->getVtigerUserId();
		}
		
		if ($action == 'post') {
			
			$params = array (
				'operation'   => $operation,
				'sessionName' => $this->getVtigerSessionId(),
				'module' => $module,
				'assigned_user_id'=>$this->getVtigerUserId(),
				'element'     => json_encode($valuemap)
			);
		
			//Create must be POST Request.
			$jsonResponse = $this->sendRequestToVtiger($url, "POST", $params);
		} else {
			//Get must be GET Request.			
			$params = "$url?operation=$operation&sessionName=" . $this->getVtigerSessionId() . "&module=" . $module . "&assigned_user_id=" . $this->getVtigerUserId() . "&element=" . json_encode($valuemap);
			$jsonResponse = $this->sendRequestToVtiger($url, "GET", $params);
			
		}

		//operation was successful get the token from the reponse.
		if ($jsonResponse['success'] == false) {
			//handle the failure case.
			//die('sync prices ' . $operation . ' failed:' . $jsonResponse['error']['errorMsg']);
		} else {		
			$savedObject = $jsonResponse['result'];
		}
		
		return $savedObject;
	}
	
 /**
	 * Populate Sync Role Information
	 * $sync_group_name			-	Sync Group Name
	 * $store_id				-	Store ID
	 * $user_id					-	User ID
	 * $obj						-	Array Object
	 */
	function clientRoleSync($sync_group_name, $store_id, $user_id, $obj) {
		global $log;
		
		$currentTime = time();		
		$currentDate = date("Y-m-d H:i:s", $currentTime);
		$user = 'user';
		
		//Deactive all the roles
		$sql = "UPDATE " . DB_PREFIX . "sync_role SET is_active = 0 WHERE store_id = " . $this->db_escape($store_id) . " AND sync_group_name = " . $this->db_escape($sync_group_name);
		$this->db->query($sql);
		
		foreach ($obj as $key => $value) {
				
				$sql = "SELECT * FROM " . DB_PREFIX . "sync_role WHERE store_id = " . $this->db_escape($store_id) . " AND sync_group_name = " . $this->db_escape($sync_group_name) . " AND ref_key = " . $this->db_escape($key);
				$result = $this->db->query($sql);

				if (!$result->num_rows) {//Insert New Record
					
					$sql = "INSERT INTO " . DB_PREFIX . "sync_role (store_id, sync_group_name, id, name, ref_key, is_system, created_by, dt_created, updated_by, dt_updated, is_active)
							VALUES (" . $this->db_escape($store_id) . ", " . $this->db_escape($sync_group_name) . ", " . $this->db_escape($user) . ", " . $this->db_escape($value) . ", " . $this->db_escape($key) . ", 0, " . $this->db_escape($user_id) . ", " . $this->db_escape($currentDate) . ", " . $this->db_escape($user_id) . ", " . $this->db_escape($currentDate) . ", 1)";
					$this->db->query($sql);
					
				} else { //Update Role Record
						
					$sql = "UPDATE " . DB_PREFIX . "sync_role SET name = " . $this->db_escape($value) . ", is_active = 1 WHERE store_id = " . $this->db_escape($store_id) . " AND sync_group_name = " . $this->db_escape($sync_group_name) . " AND ref_key = " . $this->db_escape($key);
					$this->db->query($sql);
				}
		}
	}

 	/**
	 * Delete All Sync Lookup Information
	 * $sync_group_name			-	Sync Group Name
	 * $store_id				-	Sync ID
	 * $user_id					-	User ID
	 * $obj						-	Array Object
	 */
	function clientDeleteLookupTable($store_id, $obj) {
		global $log;
		
		//Delete all the lookup values
		$sql = "DELETE FROM " . DB_PREFIX . "sync_lookup WHERE store_id = " . $this->db_escape($store_id) ." AND sync_group_name IN (" . $obj . ")";
		$this->db->query($sql);
	}
	
   /**
	 * Populate Sync Lookup Information
	 * $sync_group_name			-	Sync Group Name
	 * $store_id				-	Sync ID
	 * $user_id					-	User ID
	 * $obj						-	Array Object
	 */
	function clientLookupTable($sync_group_name, $store_id, $user_id, $obj) {
		global $log;
		
		$currentTime = time();		
		$currentDate = date("Y-m-d H:i:s", $currentTime);
		$user = 'user';
		
		//Deactive all the lookup values
		$sql = "UPDATE " . DB_PREFIX . "sync_lookup SET is_active = 0 WHERE store_id = " . $this->db_escape($store_id) . " AND sync_group_name = " . $this->db_escape($sync_group_name);
		$this->db->query($sql);
		
		foreach ($obj as $key => $value) {
				
				$sql = "SELECT * FROM " . DB_PREFIX . "sync_lookup WHERE store_id = " . $this->db_escape($store_id) . " AND sync_group_name = " . $this->db_escape($sync_group_name) . " AND ref_key = " . $this->db_escape($key);
				$result = $this->db->query($sql);
				
				if (!$result->num_rows) {//Insert New lookup values Record
					
					$sql = "INSERT INTO " . DB_PREFIX . "sync_lookup (store_id, sync_group_name, name, ref_key, is_system, created_by, dt_created, updated_by, dt_updated, is_active)
							VALUES (" . $this->db_escape($store_id) . ", " . $this->db_escape($sync_group_name) . ", " . $this->db_escape($value) . ", " . $this->db_escape($key) . ", 0, " . $this->db_escape($user_id) . ", " . $this->db_escape($currentDate) . ", " . $this->db_escape($user_id) . ", " . $this->db_escape($currentDate) . ", 1)";
					$this->db->query($sql);			
					
				} else { //Update lookup values Record
						
					$sql = "UPDATE " . DB_PREFIX . "sync_lookup SET name = " . $this->db_escape($value) . ", is_active = 1 WHERE store_id = " . $this->db_escape($store_id) . " AND sync_group_name = " . $this->db_escape($sync_group_name) . " AND ref_key = " . $this->db_escape($key);
					$this->db->query($sql);
				}
		}
	}
	
	/**
	 * This function to retrieve vtiger Role
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerRole($vtiger_url) {
		global $log;
			$table = 'vtiger_role';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT roleid, rolename FROM " . $table,
						  'where_clause'=> Array("WHERE depth > "=> 0),											  
						  'order_by'=>"ORDER BY roleid ASC"
					)	  
				);

			$result = array();		

			for ($j=0;$j<count($resultRole);$j++) {
				$result[$resultRole[$j]['roleid']] = $resultRole[$j]['rolename'];
			}

			return $result;			
	}
	
	/**
	 * This function to retrieve vtiger GL Account
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerGLAccount($vtiger_url) {
		
			$table = 'vtiger_glacct';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT glacctid, glacct FROM " . $table,
						  'where_clause'=> Array("WHERE presence = "=> 1),											  
						  'order_by'=>"ORDER BY glacctid ASC"
					)	  
				);

			$result = array();			
			
			for ($j=0;$j<count($resultRole);$j++) {				
				$result[$resultRole[$j]['glacctid']] = $resultRole[$j]['glacct'];
			}
			
			return $result;			
	}
	
	
	/**
	 * This function to retrieve vtiger Quotations Stage Status
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerQuoteStageStatus($vtiger_url) {
		
			$table = 'vtiger_quotestage';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT quotestageid, quotestage FROM " . $table,
						  'where_clause'=> Array(),											  
						  'order_by'=>"ORDER BY quotestage ASC"
					)	  
				);

			$result = array();			
			
			for ($j=0;$j<count($resultRole);$j++) {				
				$result[$resultRole[$j]['quotestageid']] = $resultRole[$j]['quotestage'];
			}
			
			return $result;			
	}
	
	
	/**
	 * This function to retrieve vtiger Sales Status
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerSalesStatus($vtiger_url) {
		
			$table = 'vtiger_sostatus';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT sostatusid, sostatus FROM " . $table,
						  'where_clause'=> Array(),											  
						  'order_by'=>"ORDER BY sostatus ASC"
					)	  
				);

			$result = array();			
			
			for ($j=0;$j<count($resultRole);$j++) {				
				$result[$resultRole[$j]['sostatusid']] = $resultRole[$j]['sostatus'];
			}
			
			return $result;			
	}
	
	/**
	 * This function to retrieve vtiger Invoice Status
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerInvoiceStatus($vtiger_url) {
		
			$table = 'vtiger_invoicestatus';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT invoicestatusid, invoicestatus FROM " . $table,
						  'where_clause'=> Array(),											  
						  'order_by'=>"ORDER BY invoicestatus ASC"
					)	  
				);

			$result = array();			
			
			for ($j=0;$j<count($resultRole);$j++) {				
				$result[$resultRole[$j]['invoicestatusid']] = $resultRole[$j]['invoicestatus'];
			}
			
			return $result;			
	}
	
	/**
	 * This function to retrieve vtiger Purchase Order Status
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerPOStatus($vtiger_url) {
		
			$table = 'vtiger_postatus';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT postatusid,	postatus FROM " . $table,
						  'where_clause'=> Array(),											  
						  'order_by'=>"ORDER BY postatus ASC"
					)	  
				);

			$result = array();			
			
			for ($j=0;$j<count($resultRole);$j++) {				
				$result[$resultRole[$j]['postatusid']] = $resultRole[$j]['postatus'];
			}
			
			return $result;			
	}
	
/**
	 * This function to retrieve vtiger Custom Field
	 * $vtiger_url		-	vtiger Webservice http URL
	 */
	function getVtigerCustomField($vtiger_url, $tablename) {
		
			$table = 'vtiger_field';
			$action = "sql";
			
	
	   		$resultRole = $this->doDynamicSql($vtiger_url, $table, $action,
					Array('custom_sql'=>"SELECT fieldid, fieldname, fieldlabel FROM " . $table,
						  'where_clause'=> Array("WHERE tablename LIKE "=> $tablename),											  
						  'order_by'=>"ORDER BY fieldlabel ASC"
					)	  
				);

			$result = array();			
			
			for ($j=0;$j<count($resultRole);$j++) {				
				$result[$resultRole[$j]['fieldname']] = $resultRole[$j]['fieldlabel'];
			}
			
			return $result;			
	}
	
	/**
	 * JSONify input data.
	 */
	function toJSON($input) {
		return $this->__jsondecode($input);
	}

	/**
	 * Convert input data to JSON String.
	 */
	function toJSONString($input) {
		return $this->__jsonencode($input);
	}
	
	function __jsondecode($indata) {
		return json_decode($indata, true);
	}

	function __jsonencode($indata) {
		return json_encode($indata);
	}
	
	/**	
	 * Get actual record id from the response id.
	 */
	function getRecordId($id) {
		
		$ex = explode('x', $id);
		if (isset($ex[1]))
			return $ex[1];
		else 
			$id;
	}
	
	/**
	 * Construct Array Object
	 * $result			-	Database ResultSet
	 * $return 			-	Array Object
	 */
	function mysql_fetch_full_result_array($result)
	{
	    $table_result=array();
	    $r=0;
	    while($row = mysql_fetch_assoc($result)){
	        $arr_row=array();
	        $c=0;
	        while ($c < mysql_num_fields($result)) {       
	            $col = mysql_fetch_field($result, $c);   
	            $arr_row[$col -> name] = $row[$col -> name];           
	            $c++;
	        }   
	        $table_result[$r] = $arr_row;
	        $r++;
	    }   
	    return $table_result;
	}
	
	/**
	 * Function to check conflict records
	 * $array 		-	Array Object
	 * $key			-	Key Name
	 * $value		-	Value
	 * @return 		-	Conflict Array Object
	 */
	function isConflict($array, $key, $value) {
		
	    $ret = array();
	    
	    for ($i=0;$i<count($array);$i++)
	    {	    	
	        if ($array[$i][$key]==$value)
	            $ret[] = $array[$i];
	    }
	    return $ret;
	}
	
	/**
	 * To Render the value in Active/Inactive to Vtiger
	 * @param obj	-	value
	 * @return		-	Active/Inactive
	 * @Authors		-	tclim
	 * @Date  		-	23032011
	 */
	function getActiveStatus($obj = null) {
		
		if ($obj == '1') {
			return 'Active';
		} else {
			return 'Inactive';
		}
	} // getActiveStatus
	
	 /**
	 * To Render the value in Email Opt In/Out to Vtiger
	 * @param obj	-	value
	 * @return		-	0 = Opt In, 1 = Opt Out
	 * @Authors		-	tclim
	 * @Date  		-	27022012
	 */
	function getEmailOptInOut($obj = null) {
		
		if ($obj == '1') {
			return '0';
		} else {
			return '1';
		}
	} // getEmailOptInOut
	
	/**
	 * Function to round up (Currency Exchange Rate)
	 * $value		-	value
	 * $precision	-	round to 3 for currency
	 */
	function round_up($value, $precision) {

	  	  $pow = pow ( 10, $precision );
	
	    return ( ceil ( $pow * $value ) + ceil ( $pow * $value - ceil ( $pow * $value ) ) ) / $pow;
	
	}
	
	function db_escape($obj) {
		$obj = @html_entity_decode($obj, ENT_QUOTES, "UTF-8");
		$obj = @htmlspecialchars($obj, ENT_QUOTES, "UTF-8");
		
		if (is_string($obj)) {
			if (function_exists('mysql_real_escape_string')) {
		  		$obj = "'" . mysql_real_escape_string($obj) . "'";
			} else {
			  $obj = "'" . mysql_escape_string($obj) . "'";
			}
		}
		return $obj;
	}
 }
?>