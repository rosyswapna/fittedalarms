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

	//Time Out Setting
	// Set 0 = No timeout (Caution - it will cause unexpected usage if you set to unlimited timeout)
	@set_time_limit(0);
	 
	 // Configuration
	require_once('config.php');
	
	// Startup
	require_once(DIR_SYSTEM . 'startup.php');

	// Application Classes
	require_once(DIR_SYSTEM . 'sync/AntErpOpenCartVtigerSync.php');
	
	// Registry
	$registry = new Registry();
	
	// Loader
	$loader = new Loader($registry);
	$registry->set('load', $loader);
	
	// Config
	$config = new Config();
	$registry->set('config', $config);
	
	// Database 
	$db = new DB(DB_DRIVER, DB_HOSTNAME, DB_USERNAME, DB_PASSWORD, DB_DATABASE);
	$registry->set('db', $db);
	
	// Settings
	$query = $db->query("SELECT * FROM " . DB_PREFIX . "setting");
	
	foreach ($query->rows as $setting) {
		$config->set($setting['key'], $setting['value']);
	}

	 //Retrieve FrontAccounting Config Parameters
	$vtiger_url = $config->get('vtiger_sync_url');
	$username = $config->get('vtiger_sync_user_id');
	$userAccessKey = $config->get('vtiger_sync_accesskey');
	$debugMode = $config->get('vtiger_sync_debug_mode');
 	//Check if Enabled, Sync Order Record to Vtiger
	$isEnabled = $config->get('vtiger_sync_status');
    $store_id = 0; //Hardcode to default store
	 

// Log 
	$log = new Log("opencart_vtiger" . '_' . date('Y-m-d') . ".log");
	$registry->set('log', $log);
	
	if ($isEnabled == '1') {

	// AntErpOpenCartVtigerSync
	$ant_client = new AntErpOpenCartVtigerSync($registry);
	
	//Initial Operation
	$operation = 'sync';
	
	//Set the pre-requisite information
	////////////////////////////////////////////////////////////
	$ant_client->setSourceUserId($username);
	$ant_client->setDestUserId($username);
	$ant_client->setTimeInterval("+20 seconds");
	$ant_client->setDebugMode($debugMode);
	$ant_client->setStoreId($store_id);
	//////////////////////////////////////////////////////////
	
	
	$isLogin = $ant_client->vtigerLogin($vtiger_url, $username, $userAccessKey);
	
	if ($isLogin) { //Check if the user successfully login
	
	//********** DEFAULT LAST SYNC TIME DO NOT REMOVE ***************************
	//Default Last Sync time
	//	$stime = '1300969793'; //2011-03-24 20:29:53
	 $stime = '1000969793'; //2001-09-20 15:09:53
	//********** DEFAULT LAST SYNC TIME DO NOT REMOVE ***************************

    //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// START - Sync OpenCart Product Category
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Has new record
	$hasUpdateRec = false;	
	//OpenCart Module Name
	$module = 'ProductCategory';
	//Vtiger Module	Name
	$vtigermodule = 'ProductCategory';
	//Set User Id
	$ant_client->setUserId($username);
	//Reset the Sync Time
	$ant_client->setSyncTime($stime);
	$ant_client->setSyncTimeTo($stime);
	//To retrieve the Sync Source Information
	$ant_client->getSyncConfig($module);
	//Retrieve particular user last sync information
	$ant_client->getLastSync($module);
	
	
		//Check if the Category Sync Option is PAUSE
		if ($ant_client->getSyncModuleCd() == $module && $ant_client->getSyncOptionCd() != 'PAUSE' ) {
			if ($config->get('vtiger_sync_debug_mode')) $log->write("*****************************************************************************************************");
			if ($ant_client->getSyncOptionCd() == '2WAY') {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " [" . $ant_client->getFromSyncSource() . "]  <===> [" . $ant_client->getToSyncSource() . "]");
			} else {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " From : [" . $ant_client->getFromSyncSource() . "]  ===> To : [" . $ant_client->getToSyncSource() . "]");
			}
			
			//Initialize Object
			$openCartCategory = array();
			$vtigerCategory = array();
		
			$openCartCategory["lastModifiedTime"] = '';
			$vtigerCategory["lastModifiedTime"] = '';
			
			//OpenCart Category
			if (($ant_client->getSyncOptionCd() == '2WAY') || ($ant_client->getSyncOptionCd() == '1WAY' && $ant_client->getFromSyncSource() =='shoppingcart')) {
				$openCartCategory = $ant_client->openCartSync($module, $ant_client->getSyncTime());
			}
			
			//Sync Category
			if (count($openCartCategory) > 0 || count($vtigerCategory) > 0)
				$hasUpdateRec = $ant_client->openCartSyncVtigerCategory($vtiger_url, $vtigerCategory, $vtigermodule, $store_id, $username, $userAccessKey, $openCartCategory, $module);
			 
			// Update Last Sync Time
			if ($hasUpdateRec) { 
				$ant_client->lastSyncUpdate($module, 'UPDATE', 'C', $openCartCategory["lastModifiedTime"], $vtigerCategory["lastModifiedTime"]);
			}		
		}//End Checking PAUSE
		

	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// START - Sync OpenCart Manufacturer Category
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Has new record
	$hasUpdateRec = false;	
	//OpenCart Module Name
	$module = 'ManufacturerCategory';
	//Vtiger Module	Name
	$vtigermodule = 'ManufacturerCategory';
	//Set User Id
	$ant_client->setUserId($username);
	//Reset the Sync Time
	$ant_client->setSyncTime($stime);
	$ant_client->setSyncTimeTo($stime);
	//To retrieve the Sync Source Information
	$ant_client->getSyncConfig($module);
	//Retrieve particular user last sync information
	$ant_client->getLastSync($module);
	
	
		//Check if the Category Sync Option is PAUSE
		if ($ant_client->getSyncModuleCd() == $module && $ant_client->getSyncOptionCd() != 'PAUSE' ) {
			if ($config->get('vtiger_sync_debug_mode')) $log->write("*****************************************************************************************************");
			if ($ant_client->getSyncOptionCd() == '2WAY') {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " [" . $ant_client->getFromSyncSource() . "]  <===> [" . $ant_client->getToSyncSource() . "]");
			} else {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " From : [" . $ant_client->getFromSyncSource() . "]  ===> To : [" . $ant_client->getToSyncSource() . "]");
			}
			
			//Initialize Object
			$openCartManufacturerCategory = array();
			$vtigerManufacturerCategory = array();
		
			$openCartManufacturerCategory["lastModifiedTime"] = '';
			$vtigerManufacturerCategory["lastModifiedTime"] = '';
			
			//OpenCart Category
			if (($ant_client->getSyncOptionCd() == '2WAY') || ($ant_client->getSyncOptionCd() == '1WAY' && $ant_client->getFromSyncSource() =='shoppingcart')) {
				$openCartManufacturerCategory = $ant_client->openCartSync($module, $ant_client->getSyncTime());
			}
			
			//Sync Category
			if (count($openCartManufacturerCategory) > 0 || count($vtigerManufacturerCategory) > 0)
				$hasUpdateRec = $ant_client->openCartSyncVtigerCategory($vtiger_url, $vtigerManufacturerCategory, $vtigermodule, $store_id, $username, $userAccessKey, $openCartManufacturerCategory, $module);
			 
			// Update Last Sync Time
			if ($hasUpdateRec) { 
				$ant_client->lastSyncUpdate($module, 'UPDATE', 'C', $openCartManufacturerCategory["lastModifiedTime"], $vtigerManufacturerCategory["lastModifiedTime"]);
			}		
		}//End Checking PAUSE

	 //////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// START - Sync OpenCart Currency
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Has new record
	$hasUpdateRec = false;	
	//OpenCart Module Name
	$module = 'Currency';
	//Vtiger Module	Name
	$vtigermodule = 'Currency';
	//Set User Id
	$ant_client->setUserId($username);
	//Reset the Sync Time
	$ant_client->setSyncTime($stime);
	$ant_client->setSyncTimeTo($stime);
	//To retrieve the Sync Source Information
	$ant_client->getSyncConfig($module);
	//Retrieve particular user last sync information
	$ant_client->getLastSync($module);
	
	
		//Check if the Currency Sync Option is PAUSE
		if ($ant_client->getSyncModuleCd() == $module && $ant_client->getSyncOptionCd() != 'PAUSE' ) {
			if ($config->get('vtiger_sync_debug_mode')) $log->write("*****************************************************************************************************");
			if ($ant_client->getSyncOptionCd() == '2WAY') {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " [" . $ant_client->getFromSyncSource() . "]  <===> [" . $ant_client->getToSyncSource() . "]");
			} else {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " From : [" . $ant_client->getFromSyncSource() . "]  ===> To : [" . $ant_client->getToSyncSource() . "]");
			}
			
			//Initialize Object
			$opencartCurrency = array();
			$vtigerCurrency = array();
		
			$opencartCurrency["lastModifiedTime"] = '';
			$vtigerCurrency["lastModifiedTime"] = '';
			
			//OpenCart Currency
			if (($ant_client->getSyncOptionCd() == '2WAY') || ($ant_client->getSyncOptionCd() == '1WAY' && $ant_client->getFromSyncSource() =='shoppingcart')) {
				$opencartCurrency = $ant_client->openCartSync($module, $ant_client->getSyncTime());
			}

			//Sync Currency
			if (count($opencartCurrency) > 0 || count($vtigerCurrency) > 0)
				$hasUpdateRec = $ant_client->openCartSyncVtigerOperation($opencartCurrency, $module, $vtiger_url, $store_id, $username, $userAccessKey, $vtigerCurrency, $vtigermodule);
			 
			// Update Last Sync Time
			if ($hasUpdateRec) { 
				$ant_client->lastSyncUpdate($module, 'UPDATE', 'C', $opencartCurrency["lastModifiedTime"], $vtigerCurrency["lastModifiedTime"]);
			}		
		}//End Checking PAUSE
		
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// START - Sync Vtiger OpenCart Products Status
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Has new record
	$hasUpdateRec = false;	
	//OpenCart Module Name
	$module = 'Products';
	//Vtiger Module	Name
	$vtigermodule = 'Products';
	//Set User Id
	$ant_client->setUserId($username);
	//Reset the Sync Time
	$ant_client->setSyncTime($stime);
	$ant_client->setSyncTimeTo($stime);
	//To retrieve the Sync Source Information
	$ant_client->getSyncConfig($module);
	//Retrieve particular user last sync information
	$ant_client->getLastSync($module);
	
	
		//Check if the Products Sync Option is PAUSE
		if ($ant_client->getSyncModuleCd() == $module && $ant_client->getSyncOptionCd() != 'PAUSE' ) {
			if ($config->get('vtiger_sync_debug_mode')) $log->write("*****************************************************************************************************");
			if ($ant_client->getSyncOptionCd() == '2WAY') {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " [" . $ant_client->getFromSyncSource() . "]  <===> [" . $ant_client->getToSyncSource() . "]");
			} else {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " From : [" . $ant_client->getFromSyncSource() . "]  ===> To : [" . $ant_client->getToSyncSource() . "]");
			}
			
			//Initialize Object
			$opencartStocks = array();
			$vtigerProducts = array();
		
			$opencartStocks["lastModifiedTime"] = '';
			$vtigerProducts["lastModifiedTime"] = '';
			
			//OpenCart Products
			if (($ant_client->getSyncOptionCd() == '2WAY') || ($ant_client->getSyncOptionCd() == '1WAY' && $ant_client->getFromSyncSource() =='shoppingcart')) {
				$opencartStocks = $ant_client->openCartSync($module, $ant_client->getSyncTime());
			}

			//Sync Products
			if (count($opencartStocks) > 0 || count($vtigerProducts) > 0)
				$hasUpdateRec = $ant_client->openCartSyncVtigerOperation($opencartStocks, $module, $vtiger_url, $store_id, $username, $userAccessKey, $vtigerProducts, $vtigermodule);
			 
			// Update Last Sync Time
			if ($hasUpdateRec) { 
				$ant_client->lastSyncUpdate($module, 'UPDATE', 'C', $opencartStocks["lastModifiedTime"], $vtigerProducts["lastModifiedTime"]);
			}		
		}//End Checking PAUSE
		
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// START - Sync OpenCart Customer & Contacts
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	 //	//Has new record
	$hasUpdateRec = false;	
	//OpenCart Module Name
	$module = 'Accounts';
	//Vtiger Module	Name
	$vtigermodule = 'Accounts';
	//Set User Id
	$ant_client->setUserId($username);
	//Reset the Sync Time
	$ant_client->setSyncTime($stime);
	$ant_client->setSyncTimeTo($stime);
	//To retrieve the Sync Source Information
	$ant_client->getSyncConfig($module);
	//Retrieve particular user last sync information
	$ant_client->getLastSync($module);
	
		//Check if the Accounts Sync Option is PAUSE
		if ($ant_client->getSyncModuleCd() == $module && $ant_client->getSyncOptionCd() != 'PAUSE' ) {
			if ($config->get('vtiger_sync_debug_mode')) $log->write("*****************************************************************************************************");
			if ($ant_client->getSyncOptionCd() == '2WAY') {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " [" . $ant_client->getFromSyncSource() . "]  <===> [" . $ant_client->getToSyncSource() . "]");
			} else {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " From : [" . $ant_client->getFromSyncSource() . "]  ===> To : [" . $ant_client->getToSyncSource() . "]");
			}
			
			//Initialize Object
			$opencartCustomers = array();
			$vtigerAccounts = array();
		
			$opencartCustomers["lastModifiedTime"] = '';
			$vtigerAccounts["lastModifiedTime"] = '';
			
			//OpenCart Accounts
			if (($ant_client->getSyncOptionCd() == '2WAY') || ($ant_client->getSyncOptionCd() == '1WAY' && $ant_client->getFromSyncSource() =='shoppingcart')) {
				$opencartCustomers = $ant_client->openCartSync($module, $ant_client->getSyncTime());
			}

			//Sync Accounts
			if (count($opencartCustomers) > 0 || count($vtigerAccounts) > 0)
				$hasUpdateRec = $ant_client->openCartSyncVtigerOperation($opencartCustomers, $module, $vtiger_url, $store_id, $username, $userAccessKey, $vtigerAccounts, $vtigermodule);
			 
			// Update Last Sync Time
			if ($hasUpdateRec) { 
				$ant_client->lastSyncUpdate($module, 'UPDATE', 'C', $opencartCustomers["lastModifiedTime"], $vtigerAccounts["lastModifiedTime"]);
			}		
		}//End Checking PAUSE
 
	
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	// START - Sync OpenCart Vtiger Invoice
	//////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

	//Has new record
	$hasUpdateRec = false;	
	//Vtiger Module Name
	$module = 'Invoice';
	//Vtiger Module	Name
	$vtigermodule = 'Invoice';
	//Set User Id
	$ant_client->setUserId($username);
	//Reset the Sync Time
	$ant_client->setSyncTime($stime);
	$ant_client->setSyncTimeTo($stime);
	//To retrieve the Sync Source Information
	$ant_client->getSyncConfig($module);
	//Retrieve particular user last sync information
	$ant_client->getLastSync($module);
	
	
		//Check if the Invoice Sync Option is PAUSE
		if ($ant_client->getSyncModuleCd() == $module && $ant_client->getSyncOptionCd() != 'PAUSE' ) {
			if ($config->get('vtiger_sync_debug_mode')) $log->write("*****************************************************************************************************");
			if ($ant_client->getSyncOptionCd() == '2WAY') {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " [" . $ant_client->getFromSyncSource() . "]  <===> [" . $ant_client->getToSyncSource() . "]");
			} else {
				if ($config->get('vtiger_sync_debug_mode')) $log->write("Module : [" . $ant_client->getSyncModuleCd() . "]" . " Sync Option : [" . $ant_client->getSyncOptionCd() . "]" . " From : [" . $ant_client->getFromSyncSource() . "]  ===> To : [" . $ant_client->getToSyncSource() . "]");
			}
			
			//Initialize Object
			$openCartInvoice = array();
			$vtigerInvoice = array();
		
			$openCartInvoice["lastModifiedTime"] = '';
			$vtigerInvoice["lastModifiedTime"] = '';
			
			//OpenCart Invoice
			if (($ant_client->getSyncOptionCd() == '2WAY') || ($ant_client->getSyncOptionCd() == '1WAY' && $ant_client->getFromSyncSource() =='shoppingcart')) {
				$openCartInvoice = $ant_client->openCartSync($module, $ant_client->getSyncTime());
			}
			
			//Sync Invoice
			if (count($openCartInvoice) > 0 || count($vtigerInvoice) > 0)
				$hasUpdateRec = $ant_client->openCartSyncVtigerOperation($openCartInvoice, $module, $vtiger_url, $store_id, $username, $userAccessKey, $vtigerInvoice, $vtigermodule);
			 
			// Update Last Sync Time
			if ($hasUpdateRec) { 
				$ant_client->lastSyncUpdate($module, 'UPDATE', 'C', $openCartInvoice["lastModifiedTime"], $vtigerInvoice["lastModifiedTime"]);
			}		
		}//End Checking PAUSE
	}// End Is Login
}//End Check if Enabled

?>