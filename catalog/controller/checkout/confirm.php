<?php 
class ControllerCheckoutConfirm extends Controller { 

	public function index() {
	
		// Validate minimum quantity requirments.			
		$products = $this->cart->getProducts();
				
		foreach ($products as $product) {
			$product_total = 0;
				
			foreach ($products as $product_2) {
				if ($product_2['product_id'] == $product['product_id']) {
					$product_total += $product_2['quantity'];
				}
			}		
			
			if ($product['minimum'] > $product_total) {
				$redirect = $this->url->link('checkout/cart');
				
				break;
			}				
		}

		$this->language->load('checkout/checkout');

		$total_data = array();
			$total = 0;
			$taxes = $this->cart->getTaxes();
			 
			$this->load->model('setting/extension');
			
			$sort_order = array(); 
			
			$results = $this->model_setting_extension->getExtensions('total');
			
			foreach ($results as $key => $value) {
				$sort_order[$key] = $this->config->get($value['code'] . '_sort_order');
			}
			
			array_multisort($sort_order, SORT_ASC, $results);
			
			foreach ($results as $result) {
				if ($this->config->get($result['code'] . '_status')) {
					$this->load->model('total/' . $result['code']);
		
					$this->{'model_total_' . $result['code']}->getTotal($total_data, $total, $taxes);
				}
			}
			
			$sort_order = array(); 
		  
			foreach ($total_data as $key => $value) {
				$sort_order[$key] = $value['sort_order'];
			}
	
			array_multisort($sort_order, SORT_ASC, $total_data);
						
		
			
		$product_data = array();
		
		foreach ($this->cart->getProducts() as $product) {
			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['option_value'];	
				} else {
					$value = $this->encryption->decrypt($option['option_value']);
				}	
				
				$option_data[] = array(
					'product_option_id'       => $option['product_option_id'],
					'product_option_value_id' => $option['product_option_value_id'],
					'option_id'               => $option['option_id'],
					'option_value_id'         => $option['option_value_id'],								   
					'name'                    => $option['name'],
					'value'                   => $value,
					'type'                    => $option['type']
				);					
			}
	 
			$product_data[] = array(
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'model'      => $product['model'],
				'option'     => $option_data,
				'download'   => $product['download'],
				'quantity'   => $product['quantity'],
				'subtract'   => $product['subtract'],
				'price'      => $product['price'],
				'total'      => $product['total'],
				'tax'        => $this->tax->getTax($product['price'], $product['tax_class_id']),
				'reward'     => $product['reward']
			); 
		}
			
		// Gift Voucher
		$voucher_data = array();
		
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$voucher_data[] = array(
					'description'      => $voucher['description'],
					'code'             => substr(md5(mt_rand()), 0, 10),
					'to_name'          => $voucher['to_name'],
					'to_email'         => $voucher['to_email'],
					'from_name'        => $voucher['from_name'],
					'from_email'       => $voucher['from_email'],
					'voucher_theme_id' => $voucher['voucher_theme_id'],
					'message'          => $voucher['message'],						
					'amount'           => $voucher['amount']
				);
			}
		}  
						
		$data['products'] = $product_data;
		$data['vouchers'] = $voucher_data;
		$data['totals'] = $total_data;
		//$data['comment'] = $this->session->data['comment'];
		$data['total'] = $total;
			
			
			
		$data['language_id'] = $this->config->get('config_language_id');
		$data['currency_id'] = $this->currency->getId();
		$data['currency_code'] = $this->currency->getCode();
		$data['currency_value'] = $this->currency->getValue($this->currency->getCode());
		$data['ip'] = $this->request->server['REMOTE_ADDR'];
				
			
		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_model'] = $this->language->get('column_model');
		$this->data['column_quantity'] = $this->language->get('column_quantity');
		$this->data['column_price'] = $this->language->get('column_price');
		$this->data['column_total'] = $this->language->get('column_total');
		$this->data['button_continue'] = $this->language->get('button_continue');

		$this->data['text_service_charge'] = $this->language->get('text_service_charge');

		//---------------------------------get all other charges-------------------------------------------------
		$this->data['other_charges'] = array();

		//1. Installation charge
		if(isset($this->session->data['service_charge'])){
			if(isset($this->session->data['service_id'])){
				$this->load->model('checkout/services');
				$service = $this->model_checkout_services->getService($this->session->data['service_id']);
				if($service){
					$this->data['other_charges'][] = array(
													'text'	=> $service['service_name'],
													'value'	=> $this->session->data['service_charge']
													); 
				}else{
					$this->data['other_charges'][] = array(
													'text'	=> $this->language->get('text_service_charge'),
													'value'	=> $this->session->data['service_charge']
													); 
				}
			}else{
				$this->data['other_charges'][] = array(
													'text'	=> $this->language->get('text_service_charge'),
													'value'	=> $this->session->data['sevice_charge']
													); 
			}
		}

		//2. Monthly charge
		if(isset($this->session->data['service_option'])){
			$this->data['other_charges'][] = array(
													'text'	=> $this->language->get('text_monthly_charge'),
													'value'	=> $this->session->data['service_option']
													); 
		}

		//echo "<pre>";print_r($this->data['other_charges']);echo "</pre>";exit();
		//------------------------------------------------------------------
		

		$this->data['products'] = array();
	
		foreach ($this->cart->getProducts() as $product) {
			$option_data = array();

			foreach ($product['option'] as $option) {
				if ($option['type'] != 'file') {
					$value = $option['option_value'];	
				} else {
					$filename = $this->encryption->decrypt($option['option_value']);
					
					$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
				}
									
				$option_data[] = array(
					'name'  => $option['name'],
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
				);
			}  
 
			$this->data['products'][] = array(
				'product_id' => $product['product_id'],
				'name'       => $product['name'],
				'model'      => $product['model'],
				'option'     => $option_data,
				'quantity'   => $product['quantity'],
				'subtract'   => $product['subtract'],
				'price'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax'))),
				'total'      => $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']),
				'href'       => $this->url->link('product/product', 'product_id=' . $product['product_id'])
			); 
		} 
			
		// Gift Voucher
		$this->data['vouchers'] = array();
		
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $voucher) {
				$this->data['vouchers'][] = array(
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}  
						
		$this->data['totals'] = $total_data;

		
		
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/checkout/confirm.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/checkout/confirm.tpl';
		} else {
			$this->template = 'default/template/checkout/confirm.tpl';
		}
		
		$this->response->setOutput($this->render());	
  	}
}
?>