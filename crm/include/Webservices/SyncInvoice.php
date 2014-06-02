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

 		/*  
 		 * Webserwis method, that allows adding a Invoice instance with associated Items. 
 		 *  */ 
 		
 		include_once('config.php'); 
 		require_once('include/logging.php'); 
 		require_once('modules/Invoice/Invoice.php'); 
 		require_once('include/utils/utils.php'); 
 		 
 		function vtws_syncinvoice($subject, $assigned_user_id, $element, $user) {
		
 		        global $adb, $log;
 		         			 
 		        $focus = new Invoice();
 		         
 		        try {
 		        	
 		                $log->debug("vtws_syncinvoice");
 		                $log->debug("===================================================================");
 		                $log->debug("subject == " . $subject);
 		                $log->debug("assigned_user_id  === " . $assigned_user_id);
 		                $log->debug("count element === " . count($element));
 		                $log->debug("salesorder_name  === " . $element['salesorder_name']);
 		                $log->debug("Description  ===>>>>>>>>>> " . $element['description']);

 		                 //If update, set the record id
                        if (isset($element['invoiceid']) && ($element['invoiceid']) != '') {
	                        $_REQUEST['record'] =  $element['invoiceid'];
	                        
	                        // Save each module record with update value.
							$focus->retrieve_entity_info($element['invoiceid'], 'Invoice');
							$focus->mode = 'edit';		
							$focus->id = $element['invoiceid'];
							
							$log->debug("focus->id === " . $focus->id);
							$log->debug("focus->mode === " . $focus->mode);		
                        }
                        
 		                //checkInvoiceNo($focus, $element); 
 		                checkSubjectValue($focus, $subject); 
 		                checkAssignedUserId($focus, $assigned_user_id); 
 		                setObjectValuesFromElementData($focus, $element); 
 		                $product_count = count($element['products']);
 		                
 		                 if (isset($element['customerno'])) {
 		                	$focus->column_fields['customerno'] = $element['customerno']; 
 		                	$_REQUEST['customerno'] = $element['customerno'];
 		                }
 		                
 		                if (isset($element['invoicedate'])) {
 		                	$focus->column_fields['invoicedate'] = getValidDBInsertDateValue($element['invoicedate']); 
 		                	$_REQUEST['invoicedate'] = getValidDBInsertDateValue($element['invoicedate']);
 		                }
 		                
 		                if (isset($element['duedate'])) {
 		                	$focus->column_fields['duedate'] = getValidDBInsertDateValue($element['duedate']); 
 		                	$_REQUEST['duedate'] = getValidDBInsertDateValue($element['duedate']);
 		                }
 		                
 		                if (isset($element['invoiceterms'])) {
 		                	$focus->column_fields['invoiceterms'] = decode_html($element['invoiceterms']); 
 		                	$_REQUEST['invoiceterms'] = decode_html($element['invoiceterms']);
 		                }
 		                
 		                if (isset($element['salescommission'])) {
 		                	$focus->column_fields['salescommission'] = decode_html($element['salescommission']); 
 		                	$_REQUEST['salescommission'] = decode_html($element['salescommission']);
 		                }
 		                
 		                if (isset($element['exciseduty'])) {
 		                	$focus->column_fields['exciseduty'] = decode_html($element['exciseduty']); 
 		                	$_REQUEST['exciseduty'] = decode_html($element['exciseduty']);
 		                }
 		                
 		                if (isset($element['shipping_handling_charge'])) {
 		                	$focus->column_fields['shipping_handling_charge'] = decode_html($element['shipping_handling_charge']); 
 		                	$_REQUEST['shipping_handling_charge'] = decode_html($element['shipping_handling_charge']);
 		                }
 		                
 		                if (isset($element['terms_conditions'])) {
 		                	$focus->column_fields['terms_conditions'] = decode_html($element['terms_conditions']); 
 		                	$_REQUEST['terms_conditions'] = decode_html($element['terms_conditions']);
 		                }
 		                 
 		                if (isset($element['purchaseorder'])) {
 		                	$focus->column_fields['vtiger_purchaseorder'] = decode_html($element['purchaseorder']); 
 		                	$_REQUEST['vtiger_purchaseorder'] = decode_html($element['purchaseorder']);
 		                }
 		                
 		                if (isset($element['salesorder_name'])) {
 		                	$focus->column_fields['salesorder_name'] = decode_html($element['salesorder_name']); 
 		                	$_REQUEST['salesorder_name'] = decode_html($element['salesorder_name']);
 		                }

 		                if (isset($element['description'])) {
 		                	$focus->column_fields['description'] = decode_html($element['description']); 
 		                	$_REQUEST['description'] = decode_html($element['description']);
 		                }

 		                if (isset($element['invoice_product_attr'])) {
					$option_data = (array)$element['invoice_product_attr'];

					foreach($option_data as $key => $value) {
						$focus->column_fields[$key] = decode_html($value); 
	 		                	$_REQUEST[$key] = decode_html($value);
					} 		                	
 		                }

 		                //Discount Percentage
 		                if (isset($element['discount_type_final']) && ($element['discount_type_final'] == 'percentage')) {
 		                		$_REQUEST['discount_type_final'] = 'percentage';
 		                        $_REQUEST['discount_percentage_final'] = decode_html($element['discount_percent']);
 		                        $_REQUEST['discountTotal_final'] = $element['discount_percent'] * $element['total'];		               
 		                 //Discount Amount
 		                } else if (isset($element['discount_type_final']) && ($element['discount_type_final'] == 'amount')) {
 		                		$_REQUEST['discount_type_final'] = 'amount'; 
 		                        $_REQUEST['discount_amount_final'] = decode_html($element['discount_amount']);
 		                        $_REQUEST['discountTotal_final'] = decode_html($element['discount_amount']);	
 		                } else {
								$_REQUEST['discount_type_final'] = 'zero';
 		                } 
 		                
 		                $log->debug("product_count === " . $product_count);
 		                 
 		                if($product_count > 0) { 
 		                        setProductsDetailsIntoRequest($element, $product_count); 
 		                        //to call function that saves inventory details 
 		                        $_REQUEST['action']='Save'; 
 		                         
 		                        $adb->startTransaction(); 
 		                        $focus->save('Invoice'); 
 		                        $error = $adb->hasFailedTransaction(); 
 		                        $adb->completeTransaction(); 
 		                        if($error) { 
 		                                error_log("ERROR ".$error); 
 		                        }		                        
 		 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, 'Invoice must contain at least 1 product.'); 
 		                } 
 		        } catch(Exception $e) { 
 		                //throw $e; 
 		        } 
		     
			  return $focus->column_fields; 
 		} 

	
// 		function checkInvoiceNo($focus,$element) { 
// 		        global $adb;
// 	
// 		        if(isset($element['invoice_no'])) {
// 		                $sql = 'select invoiceid from vtiger_invoice where invoice_no = ?'; 
// 		                $result = $adb->pquery($sql, array($element['invoice_no'])); 
// 		                if($adb->num_rows($result) > 0) { 
// 		                        throw new WebServiceException(WebServiceErrorCode::$INVALIDID, 'Sales order with specified invoice_no already exists.'); 
// 		                } else { 
// 		                        $focus->column_fields['invoice_no'] = $element['invoice_no']; 
// 		                } 
// 		        } else { 
// 		                throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, "Attribute 'invoice_no' is required."); 
// 		        } 
// 		} 
 		 
 		/** 
 		 * Adds parsed item details into request, to make it possible 
 		 * to call native vtiger method. 
 		 */ 
 		function setProductsDetailsIntoRequest($element, $product_count) { 
 		        global $adb, $log;
 		         
 		        $_REQUEST['totalProductCount'] = count($element['products']);
 		         
 		       
 		        $i = 1; 
 		        foreach($element['products'] as $p) {
 		        		
 		        		$log->debug("setProductsDetailsIntoRequest");
 		                $log->debug("===================================================================");
 		                $log->debug("Line Item Type ==> " . $p['line_item_type']);
 		                
 		        		//Determine is Products / Services 		        		
 		        		if (trim($p['line_item_type']) == 'Services') {
 		        			$sql_prod_id = 'SELECT serviceid,unit_price from vtiger_service INNER JOIN vtiger_crmentity crm ON crm.crmid = vtiger_service.serviceid AND crm.deleted = 0 WHERE servicename = ?';
 		        			//mandatory fields 
	 		                $result = $adb->pquery($sql_prod_id, array($p['product_name'])); 
	 		                if(isset($p['service_code'])) { 
	 		                        $_REQUEST['hdnProductId'.$i] = $adb->query_result($result, 0, 'serviceid'); 
	 		                } else { 
	 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, 'service_no is required.'); 
	 		                }
 		        		} else { //Products
 		        			$sql_prod_id = 'SELECT productid,unit_price from vtiger_products INNER JOIN vtiger_crmentity crm ON crm.crmid = vtiger_products.productid AND crm.deleted = 0 WHERE product_no = ? || productname = ?';
 		        			//mandatory fields 
	 		                $result = $adb->pquery($sql_prod_id, array($p['product_code'],$p['product_name'])); 
	 		                if(isset($p['product_code'])) { 
	 		                        $_REQUEST['hdnProductId'.$i] = $adb->query_result($result, 0, 'productid'); 
	 		                } else { 
	 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, 'product_code is required.'); 
	 		                }
 		        		}
 		        		 		        	 
 		 
 		                if(isset($p['qty']) && is_numeric($p['qty'])) { 
 		                        $_REQUEST['qty'.$i] = $p['qty']; 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, 'For each product \'qty\' with numeric value must be specified.'); 
 		                } 
 		 
 		                //Product Name
 		                $_REQUEST['productName'.$i] = decode_html($p['product_name']); 
 		 
 		 				//Line item Type (Products/Services)
 		 				$_REQUEST['lineItemType'.$i] = decode_html($p['line_item_type']);
 		 				
 		 				//Comments
 		 				$_REQUEST['comment'.$i] = decode_html($p['comment']);
 		 				
 		 				//Price
 		                if(isset($p['list_price'])) { 
 		                        $_REQUEST['listPrice'.$i] = $p['list_price']; 
 		                } else { 
 		                        $_REQUEST['listPrice'.$i] = $adb->query_result($result, 0, 'unit_price'); 
 		                } 
 		                
 		                //individual taxes 
 		                if(!isset($element['taxtype']) || $element['taxtype']!='group') {
 		                        $all_available_taxes = getTaxDetailsForProduct($_REQUEST['hdnProductId'.$i],'all'); 
 		                        for($j=0;$j<count($all_available_taxes);$j++) { 
 		                                $req_tax = $all_available_taxes[$j]['taxname']."_percentage".$i; 
 		                                if(isset($element[$all_available_taxes[$j]['taxname']])) { 
 		                                        $_REQUEST[$req_tax] = decode_html($element[$all_available_taxes[$j]['taxname']]); 
 		                                } else { 
 		                                        $_REQUEST[$req_tax] = decode_html($all_available_taxes[$j]['percentage']); 
 		                                } 
 		                        } 
 		                }
 		                
 		                 //Discount Percentage
 		                if(isset($p['discount_percent'])) { 
 		                		$_REQUEST['discount_type'.$i] = 'percentage';
 		                        $_REQUEST['discount_percentage'.$i] = $p['discount_percent'];
 		                        $_REQUEST['discountTotal'.$i] = $p['discount_percent'] * $p['list_price'];		               
 		                } 
 		                
 		                  //Discount Percentage
 		                if(isset($p['discount_amount'])) { 
 		                		$_REQUEST['discount_type'.$i] = 'amount';
 		                        $_REQUEST['discount_amount'.$i] = $p['discount_amount'];
 		                } 
 		 
 		                //next product 
 		                $i++; 
 		        } 
 		 
 		} 
 		 
 		/** 
 		 * Sets assigned_used ref. If user with specified id doesn;t exits 
 		 * exception is thrown. 
 		 * @param <type> $focus 
 		 * @param <type> $assigned_user_id 
 		 */ 
 		function checkAssignedUserId($focus, $assigned_user_id) { 
 		        global $adb; 
 		        if(!isset($assigned_user_id)) { 
 		                throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, "Invoice assigned_user_id is required"); 
 		        } else { 
 		                $ids = explode('x', $assigned_user_id); 
 		                if(count($ids) > 1) { 
 		                        $id = $ids[1]; 
 		                } else { 
 		                        $id = $assigned_user_id; 
 		                } 
 		                $sql = 'SELECT user_name from vtiger_users WHERE deleted = 0 AND id = ?';
 		                $result = $adb->pquery($sql, array($id)); 
 		                if($adb->num_rows($result)>0) { 
 		                        $focus->column_fields['assigned_user_id'] = $id; 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, "Invoice assigned_user_id must be a valid user id."); 
 	                 } 
 		        } 
 		} 
 		 
 		/** 
 		 * Sets subject value into focus instance 
 		 * @param <type> $focus 
 		 * @param <type> $subject 
 		 */ 
 	   function checkSubjectValue($focus, $subject) { 
 		        if(!isset($subject)) { 
 		                throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, "Invoice subject is required."); 
 		        } else { 
 		                $focus->column_fields['subject'] = decode_html($subject); 
 		        } 
 		} 
 		 
 		/** 
 		 * Like setObjectValuesFromRequest method 
 		 * Sets all fields that are required by the create new sale order form 
 		 */ 
 		function setObjectValuesFromElementData($focus,$element) { 
 			 global $log;
 			 
 		        //mandatory fields testing: account_id, invoicestatus 
 		        setAccountId($focus, $element);
				//get contactid by firstname or lastname
 		        setContactId($focus, $element); 
 		        //currency code - must be valid 
 		        setCurrency($focus, $element); 
 		        //set salesOrder id 
 		        setSalesOrderId($focus, $element); 
 		        //if valid invoicestatus is not found - default - autocreated is set 
 		        setInvoicestatus($focus, $element); 
 		        //if set and valid quote is set by specified quote_no 
 		        if(isset($element['carrier'])) { 
 		                $focus->column_fields['carrier'] = decode_html($element['carrier']); 
 		        } 
 		        //rewriting additional fields 
 		        foreach($focus->column_fields as $fieldname => $val) { 
 		                 
 		                if(!isset($focus->column_fields[$fieldname]) && isset($element[$fieldname])) { 
 		                        $focus->column_fields[$fieldname] = decode_html($element[$fieldname]); 		                        
 		                }
 		        }

			if (isset($element['total'])) {
	                	$focus->column_fields['hdnGrandTotal'] = decode_html($element['total']);
				$_REQUEST['total'] = $element['total'];
	                	$_REQUEST['hdnGrandTotal'] = decode_html($element['total']);
	                }

			if (isset($element['subtotal'])) {
	                	$focus->column_fields['hdnSubTotal'] = decode_html($element['subtotal']);
						$_REQUEST['subtotal'] = $element['subtotal'];
	                	$_REQUEST['hdnSubTotal'] = decode_html($element['subtotal']);
	                }

 		        $_REQUEST['shipping_handling_charge'] = $element['shipping_handling_charge']; 
 		 
 		        //taxes 
 		        if(!isset($element['taxtype'])) { 
 		                $_REQUEST['taxtype'] = 'individual'; 
 		        }else { 
 		                $_REQUEST['taxtype'] = decode_html($element['taxtype']); 
 		        } 
 		 
 		        if($_REQUEST['taxtype'] == 'group') { 
 		                $all_available_taxes = getAllTaxes('available','','edit',$focus->id); 
 		                for($i=0;$i<count($all_available_taxes);$i++) { 
 		                        $req_tax = $all_available_taxes[$i]['taxname']."_group_percentage"; 
 		                        $_REQUEST[$req_tax] = decode_html($element[$all_available_taxes[$i]['taxname']]); 
 		                } 
 		        }  
 		 
 		 //Changes by tclim to determine Taxes For Shipping and Handling
 		 if(isset($element['shipping_handling_charge_tax']) && (strtoupper($element['shipping_handling_charge_tax']) == 'YES')) { 
 		 	
 		        $sh_tax_details = getAllTaxes('all','sh'); 
 		        for($i=0;$i<count($sh_tax_details);$i++) { 
 		                $req_tax = $sh_tax_details[$i]['taxname']."_sh_percent"; 
 		                if(isset($element["vat_sh_percent"])) { 
 		                        $_REQUEST[$req_tax] = $element["vat_sh_percent"]; 
 		                } else { 
 		                        $_REQUEST[$req_tax] = $sh_tax_details[$i]['percentage']; 
 		                } 
 		        }
 		 } 
 		 
 	        $_REQUEST['adjustmentType'] = $element['adjustmentType']; 
 		        $_REQUEST['adjustment'] = $element['adjustment']; 
 		} 
 		 
 		/** 
 		 * Sets currency for the sale order 
 		 * @param <type> $focus 
 		 * @param <type> $element 
 		 */ 
 		function setCurrency($focus, $element) { 
 		        if(isset($element['currency_code'])) { 
 		                global $adb; 
 		                $sql = 'SELECT id,conversion_rate FROM vtiger_currency_info WHERE deleted = 0 AND currency_code = ?'; 
 		                $result = $adb->pquery($sql, array($element['currency_code'])); 
 		                if($adb->num_rows($result) > 0) { 
 		                        $focus->column_fields['currency_id'] = $adb->query_result($result, 0, 'id'); 
 		                        $focus->column_fields['conversion_rate'] =$adb->query_result($result, 0, 'conversion_rate'); 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, 'No currency was found with the specified currency_code'); 
 		                } 
 		        }else { 
 		                throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, 'Invoice \'currency_code\' value is required.'); 
 		        } 
 		} 
 		
 		
 		/** 
 		 * Sets sale order id 
 		 * @param <type> $focus 
 		 * @param <type> $element 
 		 */ 
 		function setSalesOrderId($focus, $element) { 
 		        if(isset($element['salesorder_name'])) { 
 		                global $adb; 
 		                $sql = 'SELECT salesorderid FROM vtiger_salesorder INNER JOIN vtiger_crmentity crm ON crm.crmid = vtiger_salesorder.salesorderid AND crm.deleted = 0 WHERE subject = ?'; 
 		                $result = $adb->pquery($sql, array($element['salesorder_name'])); 
 		                if($adb->num_rows($result) > 0) { 
 		                        $focus->column_fields['salesorder_id'] = $adb->query_result($result, 0, 'salesorderid'); 
 		                		$_REQUEST['salesorder_id'] = $focus->column_fields['salesorder_id'];
 		                } 		      
 		        } 
 		} 
 		 
 		 
 		/** 
 		 * Checks for valid invoice status value 
 		 * @param <type> $focus 
 		 * @param <type> $element 
 		 */ 
 		function setInvoicestatus($focus, $element) { 
// 		        global $adb; 
// 		        if(!isset($element['invoicestatus'])) { 
// 		                $focus->column_fields['invoicestatus'] = "AutoCreated"; 
// 		        } else { 
// 		                $invoiceStatus = $element['invoicestatus']; 
// 		 
// 		                $sql = "select invoicestatus from vtiger_invoicestatus"; 
// 		                $result = $adb->query($sql); 
// 		                for($i = 0; $i < $adb->num_rows($result); $i++) { 
// 		                        $qresult = $adb->query_result($result, $i, 'invoicestatus'); 
// 		                         
// 		                        if(strtolower($invoiceStatus) === strtolower($qresult)) { 
// 		                                $focus->column_fields['invoicestatus'] = $qresult; 
// 		                        } 
// 		                } 
// 		                if(!isset($focus->column_fields['invoicestatus'])) { 
// 		                        throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, "Invoice invoicestatus valid value is required."); 
// 		                } 
// 		        }
 		        if(!isset($element['invoicestatus'])) { 
 		             $focus->column_fields['invoicestatus'] = "AutoCreated"; 
 		        } else {
 					$focus->column_fields['invoicestatus'] = decode_html($element['invoicestatus']);
 		        }
 		} 
 		 
 		/** 
 		 * Sets account id and address info if required. 
 		 */ 
 		function setAccountId($focus, $element) { 
 		        if(isset($element['account_no'])) {
 		                global $adb; 
 		                $sql = 'SELECT accountid FROM vtiger_account INNER JOIN vtiger_crmentity crm ON crm.crmid = vtiger_account.accountid AND crm.deleted = 0 WHERE account_no = ?'; 
 		                $result = $adb->pquery($sql,array($element['account_no'])); 
 		                if($adb->num_rows($result)>0) { 
 		                        $focus->column_fields['account_id'] = $adb->query_result($result, 0, 'accountid'); 
 		                        //if account id is set but billing address is not address is taken from account. 
 		                        setBillingAddress($focus, $element); 
 		                        //if shipping_address isn't set we fetch if from the account. 
 		                        setShippingAddress($focus, $element); 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, 'No account was found with the specified account_no '.$element['account_no']); 
 		                } 
 		        } else { 
 		                throw new WebServiceException(WebServiceErrorCode::$MANDFIELDSMISSING, "Invoice account_no is required."); 
 		        } 
 		} 
 		
 		/** 
 		 * Sets contact id 
 		 */ 
 		function setContactId($focus, $element) { 
 		        if(isset($element['firstname']) || isset($element['lastname'])) { 		        		
 		                global $adb; 
 		                $sql = 'SELECT contactid FROM vtiger_contactdetails INNER JOIN vtiger_crmentity crm ON crm.crmid = vtiger_contactdetails.contactid AND crm.deleted = 0 WHERE accountid =? AND (firstname = ? || lastname = ?)'; 
 		                $result = $adb->pquery($sql,array($focus->column_fields['account_id'],$element['firstname'],$element['lastname'])); 
 		                if($adb->num_rows($result)>0) { 
 		                        $focus->column_fields['contact_id'] = $adb->query_result($result, 0, 'contactid');
 		                }
 		        }
 		} 
 		 
 		/** 
 		 * Sets billing address values fetched from saved account billing address. 
 		 */ 
 		function setBillingAddress($focus, $element) { 
 		        $billing_fields = array("bill_street", "bill_city", "bill_state", "bill_code", "bill_country", "bill_pobox"); 
 		        if(!isset($element['bill_street'])) { 
 		                global $adb; 
 		                $sql = "SELECT * FROM vtiger_accountbillads WHERE accountaddressid = ?"; 
 		                $result = $adb->pquery($sql, array($focus->column_fields['account_id'])); 
 		 
 		                if($adb->num_rows($result)>0) { 
 		                        foreach($billing_fields as $field) { 
 		                                $focus->column_fields[$field] = decode_html($adb->query_result($result, 0, $field)); 
 		                        } 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, 'No billing_address was found for the specified account.'); 
 		                } 
 		        } else { 
 		                foreach($billing_fields as $field) { 
 		                        $focus->column_fields[$field] = decode_html($element[$field]); 
 		                } 
 		        } 
 		} 
 		 
 		 
 		 
 		/** 
 		 * Sets valid values to shipping address 
 		 * @global <type> $adb 
 		 * @param <type> $focus 
 		 */ 
 		function setShippingAddress($focus, $element) { 
 		        $shipping_fields = array("ship_street", "ship_city", "ship_state", "ship_code", "ship_country", "ship_pobox"); 
 		        if(!isset($element['ship_street'])) { 
 		                global $adb; 
 		                $sql = "SELECT * FROM vtiger_accountshipads WHERE accountaddressid = ?"; 
 		                $result = $adb->pquery($sql, array($focus->column_fields['account_id'])); 
 		                if($adb->num_rows($result)>0) { 
 		                        foreach($shipping_fields as $field) { 
 		                                $focus->column_fields[$field] = decode_html($adb->query_result($result, 0, $field)); 
 		                        } 
 		                } else { 
 		                        throw new WebServiceException(WebServiceErrorCode::$REFERENCEINVALID, 'No shipping_address was found for the specified account.'); 
 		                } 
 		        } else { 
 		                foreach($shipping_fields as $field) { 
 		                        $focus->column_fields[$field] = decode_html($element[$field]); 
 		                } 
 		        } 
 		} 
 		 
 		?> 
