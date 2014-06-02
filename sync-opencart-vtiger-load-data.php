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
	$log = new Log("opencart_sync_" . $username . '_' . date('Y-m-d') . ".log");
	$registry->set('log', $log);
	
	if ($isEnabled == '1') {

		// AntErpOpenCartVtigerSync
		$ant_client = new AntErpOpenCartVtigerSync($registry);
	
		$log->write("Start Sync [" . $username . "]....");
		
		//Check if the userid exist
		if ($username == null || trim($username) =='') {	
			return;
		}
		
		//Initial Operation
		$operation = 'sync';
		
		//Set the pre-requisite information
		////////////////////////////////////////////////////////////
		$ant_client->setSourceUserId($username);
		$ant_client->setDestUserId($username);
		$ant_client->setTimeInterval("+20 seconds");
		$ant_client->setDebugMode($debugMode);
		//////////////////////////////////////////////////////////
	
		$isLogin = $ant_client->vtigerLogin($vtiger_url, $username, $userAccessKey);
	
		if ($isLogin) { //Check if the user successfully login
			
			//Retrieve VtigerCRM Role
			$resultRole = $ant_client->getVtigerRole($vtiger_url);
			$log->write("Sync Vtiger Role.");	
			//Update VtigerCRM Role	
			$ant_client->clientRoleSync('vtigercrm', $store_id, $username, $resultRole);
			
			/*
			 * Vtiger LookUp Table
			 */
			
			//Removed all 
			$ant_client->clientDeleteLookupTable($store_id, "'glacct','quotestage','sostatus','invoicestatus','postatus','vtiger_accountscf','vtiger_contactscf','vtiger_productcf','vtiger_invoicecf','vtiger_purchaseordercf','vtiger_quotescf','vtiger_salesordercf'");
			
			
			//Retrieve VtigerCRM GL Account
			$resultGL = $ant_client->getVtigerGLAccount($vtiger_url);
			$log->write("Sync Vtiger GL Account.");	
			//Update VtigerCRM GL Account
			$ant_client->clientLookupTable('glacct', $store_id, $username, $resultGL);
			
			//Retrieve VtigerCRM Quote Stage Status
			$resultStatus = $ant_client->getVtigerQuoteStageStatus($vtiger_url);
			$log->write("Sync Vtiger Quote Stage Status.");	
			//Update VtigerCRM Quote Stage
			$ant_client->clientLookupTable('quotestage', $store_id, $username, $resultStatus);
			
			//Retrieve VtigerCRM Sales Status
			$resultStatus = $ant_client->getVtigerSalesStatus($vtiger_url);
			$log->write("Sync Vtiger Sales Status.");	
			//Update VtigerCRM Sales Status
			$ant_client->clientLookupTable('sostatus', $store_id, $username, $resultStatus);
			
			//Retrieve VtigerCRM Invoice Status
			$resultStatus = $ant_client->getVtigerInvoiceStatus($vtiger_url);
			$log->write("Sync Vtiger Invoice Status.");	
			//Update VtigerCRM Invoice Status
			$ant_client->clientLookupTable('invoicestatus', $store_id, $username, $resultStatus);
			
			//Retrieve VtigerCRM Purchase Order Status
			$resultStatus = $ant_client->getVtigerPOStatus($vtiger_url);
			$log->write("Sync Vtiger Purchase Order Status.");	
			//Update VtigerCRM Purchase Order Status
			$ant_client->clientLookupTable('postatus', $store_id, $username, $resultStatus);
			
			//Retrieve VtigerCRM Accounts Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_accountscf');			
			$log->write("Sync Vtiger Account Custom Field.");	
			//Update VtigerCRM Accounts Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_accountscf', $store_id, $username, $resultCustomFields);
			
			//Retrieve VtigerCRM Contacts Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_contactscf');			
			$log->write("Sync Vtiger Contact Custom Field.");	
			//Update VtigerCRM Contacts Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_contactscf', $store_id, $username, $resultCustomFields);
				
			//Retrieve VtigerCRM Products Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_productcf');			
			$log->write("Sync Vtiger Product Custom Field.");	
			//Update VtigerCRM Products Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_productcf', $store_id, $username, $resultCustomFields);	
					
			//Retrieve VtigerCRM Invoice Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_invoicecf');
			$log->write("Sync Vtiger Invoice Custom Field.");	
			//Update VtigerCRM Invoice Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_invoicecf', $store_id, $username, $resultCustomFields);

			//Retrieve VtigerCRM Purchase Order Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_purchaseordercf');
			$log->write("Sync Vtiger Purchase Order Custom Field.");	
			//Update VtigerCRM Purchase Order Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_purchaseordercf', $store_id, $username, $resultCustomFields);
					
			//Retrieve VtigerCRM Quotes Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_quotescf');
			$log->write("Sync Vtiger Quotes Custom Field.");	
			//Update VtigerCRM Quotes Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_quotescf', $store_id, $username, $resultCustomFields);
			
			//Retrieve VtigerCRM SalesOrder Custom Field
			$resultCustomFields = $ant_client->getVtigerCustomField($vtiger_url, 'vtiger_salesordercf');
			$log->write("Sync Vtiger SalesOrder Custom Field.");	
			//Update VtigerCRM SalesOrder Custom Field
			if (count($resultCustomFields) > 0)
				$ant_client->clientLookupTable('vtiger_salesordercf', $store_id, $username, $resultCustomFields);			
			
		} else {
			//Invalid Login ID or Password!!!!
			$log->write("Invalid User ID and Password ==> " . $username . "\n");
		}
		$log->write("End Sync [" . $username . "]....");
}
?>