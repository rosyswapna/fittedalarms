<?php
class ControllerCheckoutSuccess extends Controller { 
	public function index() { 

		$order_id ='';
		if (isset($this->session->data['order_id'])) {

			//----------------swapna---------------------
			if(isset($this->session->data['service_option'])){
				$this->session->data['current_order_monthly_charge'] = $this->session->data['service_option'];
			}
			
			$this->session->data['current_order_id']=$this->session->data['order_id'];

			
			
			$this->cart->clear();
			$this->session->data['invoice_order_id'] = $this->session->data['order_id'] . "|" . time();
			unset($this->session->data['shipping_method']);
			unset($this->session->data['shipping_methods']);
			unset($this->session->data['payment_method']);
			unset($this->session->data['payment_methods']);
			unset($this->session->data['guest']);
			unset($this->session->data['comment']);
			unset($this->session->data['order_id']);	
			unset($this->session->data['coupon']);
			unset($this->session->data['reward']);
			unset($this->session->data['voucher']);
			//$this->session->data['vouchers']=$this->session->data['vouchers'];
			unset($this->session->data['vouchers']);
			$this->session->data['current_order_ft']=$this->session->data['cart_ft'];
			unset($this->session->data['cart_ft']);
			unset($this->session->data['installation_address_id']);

			unset($this->session->data['service_id']);
			unset($this->session->data['service_charge']);
			unset($this->session->data['service_option']);//monthly charge
		}
		if(isset($this->session->data['current_order_id'])){
			$order_id = $this->session->data['current_order_id'];	
			$this->load->model('checkout/order');
			$this->data['order_info']  = $this->model_checkout_order->getOrderDetails($order_id);

			if(isset($this->session->data['current_order_monthly_charge'])){
				$this->data['monthly_charge'] = $this->session->data['current_order_monthly_charge'];
			}else{
				$this->data['monthly_charge'] = '';
			}

			//echo "<pre>";print_r($this->data['order_info']);echo "</pre>";exit();
			
			$this->data['totals'] = $this->model_checkout_order->getOrderTotals($order_id);

		}else{
			$this->data['order_info'] = array();
			$this->data['totals'] = array();
		}
		
			$this->load->model('checkout/orderdetailsfitted');
		$current_order_fts=$this->session->data['current_order_ft'];
		$current_order_id_ft=$this->session->data['current_order_id_ft'];
		//print_r($current_order_fts);
		
		
		foreach($current_order_fts as $product_id => $productid){
			//print_r($productid['addon']);
			$order_products=$this->model_checkout_orderdetailsfitted->getOrderproducts($current_order_id_ft,$product_id);
			foreach($order_products as $order_product){
				$product_alladdons=array();
				if(!empty($productid['addon'])){
				foreach($productid['addon'] as $addon => $qty){
					$product_addons_ft=array();
					//echo $addon;
					//echo $qty;
			$product_addons_ft=$this->model_checkout_orderdetailsfitted->getOrderproducts($current_order_id_ft,$addon);	
			$product_addons_ft=$product_addons_ft[0];
			$product_addons_ft["quantity"]=$qty;
			$product_alladdons[]=$product_addons_ft;
			
				}
				}
			$this->data['current_order_fts'][] = array(
			'orderid'  =>$order_product['order_id'],
			'productid' =>$order_product['product_id'],
			'name'		 =>$order_product['name'],
			'qty'      => $order_product['quantity'],
			'model'		=>$order_product['model'],
			'price'		=>$order_product['price'],
			'totalprice'=>$order_product['total'],
			'order_products_addons' => $product_alladdons
			);
		}
			
		}
									   
		$this->language->load('checkout/success');
		
		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->data['breadcrumbs'] = array(); 

      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('common/home'),
        	'text'      => $this->language->get('text_home'),
        	'separator' => false
      	); 
		
      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/cart'),
        	'text'      => $this->language->get('text_basket'),
        	'separator' => $this->language->get('text_separator')
      	);
				
		$this->data['breadcrumbs'][] = array(
			'href'      => $this->url->link('checkout/checkout', '', 'SSL'),
			'text'      => $this->language->get('text_checkout'),
			'separator' => $this->language->get('text_separator')
		);	
					
      	$this->data['breadcrumbs'][] = array(
        	'href'      => $this->url->link('checkout/success'),
        	'text'      => $this->language->get('text_success'),
        	'separator' => $this->language->get('text_separator')
      	);

		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if ($this->customer->isLogged()) {
    		$this->data['text_message'] = sprintf($this->language->get('text_customer'), $this->url->link('account/account', '', 'SSL'), $this->url->link('account/order', '', 'SSL'), $this->url->link('account/download', '', 'SSL'), $this->url->link('information/contact'));
		} else {
    		$this->data['text_message'] = sprintf($this->language->get('text_guest'), $this->url->link('information/contact'));
		}
		
    	$this->data['button_continue'] = $this->language->get('button_continue');
		
		$this->data['button_invoice'] = $this->language->get('button_invoice');
			$this->data['invoice'] = $this->url->link('checkout/success/invoice', '', 'SSL');

    	$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
		}
		
		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'			
		);
	
		$this->response->setOutput($this->render());
  	}
	public 	function invoice() {

				if (!isset($this->session->data['current_order_id'])) {
					$this->redirect($this->url->link('common/home'));			
					
				} else {		
					$this->load->language('checkout/success');

					$this->data['title'] = $this->language->get('text_invoice_title');

					if (isset($this->request->server['HTTPS']) && (($this->request->server['HTTPS'] == 'on') || ($this->request->server['HTTPS'] == '1'))) {
						$this->data['base'] = HTTPS_SERVER;
					} else {
						$this->data['base'] = HTTP_SERVER;
					}

					$this->data['direction'] = $this->language->get('direction');
					$this->data['language'] = $this->language->get('code');

					$this->data['text_invoice'] = $this->language->get('text_invoice');

					$this->data['text_order_id'] = $this->language->get('text_order_id');
					$this->data['text_invoice_no'] = $this->language->get('text_invoice_no');
					$this->data['text_invoice_date'] = $this->language->get('text_invoice_date');
					$this->data['text_date_added'] = $this->language->get('text_date_added');
					$this->data['text_telephone'] = $this->language->get('text_telephone');
					$this->data['text_fax'] = $this->language->get('text_fax');
					$this->data['text_to'] = $this->language->get('text_to');
					$this->data['text_ship_to'] = $this->language->get('text_ship_to');

					$this->data['column_product'] = $this->language->get('column_product');
					$this->data['column_model'] = $this->language->get('column_model');
					$this->data['column_quantity'] = $this->language->get('column_quantity');
					$this->data['column_price'] = $this->language->get('column_price');
					$this->data['column_total'] = $this->language->get('column_total');
					$this->data['column_comment'] = $this->language->get('column_comment');

					$this->data['logo'] = $this->config->get('config_url') . 'image/' . $this->config->get('config_logo');

					$this->load->model('checkout/order');

					$this->load->model('setting/setting');

					$this->data['orders'] = array();
					
					$order_id = explode('|', $this->session->data['current_order_id']);
					
					// Expires after 15 mins of inactivity.
					if (isset($order_id[1]) && (int)$order_id[1] > 0 && time() - (int)$order_id[1] > 900) {
						unset ($this->session->data['current_order_id']);
						unset ($this->session->data['current_order_monthly_charge']);
						
						unset ($order_id);
						
						$this->redirect($this->url->link('common/home'));
					
					} else {					
						$order_info = $this->model_checkout_order->getOrder($order_id[0]);


						if ($order_info) {
							$store_info = $this->model_setting_setting->getSetting('config', $order_info['store_id']);
								
							if ($store_info) {
								$store_address = $store_info['config_address'];
								$store_email = $store_info['config_email'];
								$store_telephone = $store_info['config_telephone'];
								$store_fax = $store_info['config_fax'];
							} else {
								$store_address = $this->config->get('config_address');
								$store_email = $this->config->get('config_email');
								$store_telephone = $this->config->get('config_telephone');
								$store_fax = $this->config->get('config_fax');
							}
							
							if ($order_info['invoice_no']) {
								$invoice_no = $order_info['invoice_prefix'] . $order_info['invoice_no'];
							} else {
								$invoice_no = '';
							}
							
							if ($order_info['shipping_address_format']) {
								$format = $order_info['shipping_address_format'];
							} else {
								$format = '{firstname} {lastname}' .  "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
							}
							
							$find = array(
								'{firstname}',
								'{lastname}',
								'{company}',
								'{address_1}',
								'{address_2}',
								'{city}',
								'{postcode}',
								'{zone}',
								'{zone_code}',
								'{country}'
							);
							
							$replace = array(
								'firstname' => $order_info['shipping_firstname'],
								'lastname'  => $order_info['shipping_lastname'],
								'company'   => $order_info['shipping_company'],
								'address_1' => $order_info['shipping_address_1'],
								'address_2' => $order_info['shipping_address_2'],
								'city'      => $order_info['shipping_city'],
								'postcode'  => $order_info['shipping_postcode'],
								'zone'      => $order_info['shipping_zone'],
								'zone_code' => $order_info['shipping_zone_code'],
								'country'   => $order_info['shipping_country']
							);
							
							$shipping_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
							if ($order_info['payment_address_format']) {
								$format = $order_info['payment_address_format'];
							} else {
								$format = '{firstname} {lastname}' . "\n" . '{address_1}' . "\n" . '{address_2}' . "\n" . '{city} {postcode}' . "\n" . '{zone}' . "\n" . '{country}';
							}
							
							$find = array(
								'{firstname}',
								'{lastname}',
								'{company}',
								'{address_1}',
								'{address_2}',
								'{city}',
								'{postcode}',
								'{zone}',
								'{zone_code}',
								'{country}'
							);

							$replace = array(
								'firstname' => $order_info['payment_firstname'],
								'lastname'  => $order_info['payment_lastname'],
								'company'   => $order_info['payment_company'],
								'address_1' => $order_info['payment_address_1'],
								'address_2' => $order_info['payment_address_2'],
								'city'      => $order_info['payment_city'],
								'postcode'  => $order_info['payment_postcode'],
								'zone'      => $order_info['payment_zone'],
								'zone_code' => $order_info['payment_zone_code'],
								'country'   => $order_info['payment_country']
							);

							$payment_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));

							//installation address
							$this->load->model('account/installation_address');
				
							$installation_address_row = $this->model_account_installation_address->getAddress($order_info['installation_address_id']);
							if($installation_address_row){

								$replace = array(
									'firstname' => $installation_address_row['firstname'],
									'lastname'  => $installation_address_row['lastname'],
									'company'   => $installation_address_row['company'],
									'address_1' => $installation_address_row['address_1'],
									'address_2' => $installation_address_row['address_2'],
									'city'      => $installation_address_row['city'],
									'postcode'  => $installation_address_row['postcode'],
									'zone'      => $installation_address_row['zone'],
									'zone_code' => $installation_address_row['zone_code'],
									'country'   => $installation_address_row['country']  
								);

								$installation_address = str_replace(array("\r\n", "\r", "\n"), '<br />', preg_replace(array("/\s\s+/", "/\r\r+/", "/\n\n+/"), '<br />', trim(str_replace($find, $replace, $format))));
							}else{
								$installation_address = $payment_address;
							}



							$product_data = array();

							$products = $this->model_checkout_order->getOrderProducts($order_id[0]);

							foreach ($products as $product) {
								$option_data = array();
								$options = $this->model_checkout_order->getOrderOptions($order_id[0], $product['order_product_id']);

								foreach ($options as $option) {
									if ($option['type'] != 'file') {
										$option_data[] = array(
											'name'  => $option['name'],
											'value' => $option['value']
										);		
									} else {
										$option_data[] = array(
											'name'  => $option['name'],
											'value' => utf8_substr($option['value'], 0, strrpos($option['value'], '.'))
										);	
									}
								}
								
								$product_data[] = array(
									'name'     => $product['name'],
									'model'    => $product['model'],
									'option'   => $option_data,
									'quantity' => $product['quantity'],
									'price'    => $this->currency->format($product['price'], $order_info['currency_code'], $order_info['currency_value']),
									'total'    => $this->currency->format($product['total'], $order_info['currency_code'], $order_info['currency_value'])
								);
							}
							
							    $this->load->model('account/order');
   $total_data = $this->model_account_order->getOrderTotals($order_id[0]);


								
							$this->data['orders'][] = array(
								'order_id'	       => $order_id[0],
								'invoice_no'       => $invoice_no,
								'date_added'       => date($this->language->get('date_format_short'), strtotime($order_info['date_added'])),
								'store_name'       => $order_info['store_name'],
								'store_url'        => rtrim($order_info['store_url'], '/'),
								'store_address'    => nl2br($store_address),
								'store_email'      => $store_email,
								'store_telephone'  => $store_telephone,
								'store_fax'        => $store_fax,
								'email'            => $order_info['email'],
								'telephone'        => $order_info['telephone'],
								'shipping_address' => $shipping_address,
								'payment_address'  => $payment_address,
								'installation_address'  => $installation_address,
								'product'          => $product_data,
								'total'            => $total_data,
								'comment'          => nl2br($order_info['comment'])
							);
							
						} elseif (empty($order_info)) {
							$this->redirect($this->url->link('common/home'));
						}

						if (empty($this->data['orders'])) {
							$this->redirect($this->url->link('common/home'));
							
						} else {
							if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/order_invoice.tpl')) {
								$this->template = $this->config->get('config_template') . '/template/common/order_invoice.tpl';
							} else {
								$this->template = 'default/template/common/order_invoice.tpl';			
							}

							$this->response->setOutput($this->render());
						}
						
						unset ($this->session->data['invoice_order_id']);
						unset ($order_id);
					}
				}
				$this->response->setOutput($this->render());
			}		
}
?>