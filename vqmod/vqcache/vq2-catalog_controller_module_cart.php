<?php 
class ControllerModuleCart extends Controller {
	public function index() {


		$this->language->load('module/cart');
		
      	if (isset($this->request->get['remove'])) {
          	$this->cart->remove($this->request->get['remove']);
			
			unset($this->session->data['vouchers'][$this->request->get['remove']]);
      	}	


			
		// Totals
		$this->load->model('setting/extension');
		
		$total_data = array();					
		$total = 0;
		$taxes = $this->cart->getTaxes();
		
		// Display prices
		if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
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
				
				$sort_order = array(); 
			  
				foreach ($total_data as $key => $value) {
					$sort_order[$key] = $value['sort_order'];
				}
	
				array_multisort($sort_order, SORT_ASC, $total_data);			
			}		
		}
		
		$this->data['totals'] = $total_data;
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_items'] = sprintf($this->language->get('text_items'), $this->cart->countProducts() + (isset($this->session->data['vouchers']) ? count($this->session->data['vouchers']) : 0), $this->currency->format($total));
		$this->data['text_empty'] = $this->language->get('text_empty');
		$this->data['text_cart'] = $this->language->get('text_cart');
		$this->data['text_checkout'] = $this->language->get('text_checkout');

					
						$this->data['text_account'] = $this->language->get('text_account');
						$this->data['account'] = $this->url->link('account/account', '', 'SSL');
					
				
		
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->load->model('tool/image');
		
		$this->data['products'] = array();
			
		foreach ($this->cart->getProducts() as $product) {
			if ($product['image']) {
				$image = $this->model_tool_image->resize($product['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
			} else {
				$image = '';
			}
							
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
					'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value),
					'type'  => $option['type']
				);
			}
			
			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$price = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')));
			} else {
				$price = false;
			}
			
			// Display prices
			if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
				$total = $this->currency->format($this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity']);
			} else {
				$total = false;
			}
													
			$this->data['products'][] = array(
				'key'      => $product['key'],
				'thumb'    => $image,
				'name'     => $product['name'],
				'model'    => $product['model'], 
				'option'   => $option_data,
				'quantity' => $product['quantity'],
				'price'    => $price,	
				'total'    => $total,	
				'href'     => $this->url->link('product/product', 'product_id=' . $product['product_id'])		
			);
		}
		
					$this->data['productsft'] = array();

			
			$productsfts=$this->cart->getProductsft();
			
			
			//echo "<pre>";
			//print_r($products);
			//echo "</pre>";
					
			//echo "<pre>";
			//print_r($productsfts);
			//echo "</pre>";
			//exit(); 
			if($productsfts!=""){
			foreach ($productsfts as $productsft) {
				$productsft_total = 0;
					
				foreach ($productsfts as $productsft_2) {
					if ($productsft_2['product_id'] == $productsft['product_id']) {
						$productsft_total += $productsft_2['quantity'];
					}
				}			
				
				if ($productsft['minimum'] > $productsft_total) {
					$this->data['error_warning'] = sprintf($this->language->get('error_minimum'), $productsft['name'], $productsft['minimum']);
				}				
					
				if ($productsft['image']) {
					$image = $this->model_tool_image->resize($productsft['image'], $this->config->get('config_image_cart_width'), $this->config->get('config_image_cart_height'));
				} else {
					$image = '';
				}

				$option_data = array();

        		foreach ($productsft['option'] as $optionft) {
					if ($optionft['type'] != 'file') {
						$value = $optionft['option_value'];	
					} else {
						$filename = $this->encryption->decrypt($optionft['option_value']);
						
						$value = utf8_substr($filename, 0, utf8_strrpos($filename, '.'));
					}
					
					$option_dataft[] = array(
						'name'  => $option['name'],
						'value' => (utf8_strlen($value) > 20 ? utf8_substr($value, 0, 20) . '..' : $value)
					);
        		}
				
				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($productsft['price'], $productsft['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
				
				// Display prices
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$total = $this->currency->format($this->tax->calculate($productsft['price'], $productsft['tax_class_id'], $this->config->get('config_tax')) * $productsft['quantity']);
				} else {
					$total = false;
				}
				//echo "<pre>";
				//print_r($productsft);
				//echo "</pre>";
        		$product_ft_temp= array(
				'product_id' =>$productsft['product_id'],
          			'key_product'      => $productsft['product_id'],
          			'thumb'    => $image,
					'name'     => $productsft['name'],
          			'model'    => $productsft['model'],
          			'option'   => $option_data,
          			'quantity' => $productsft['quantity'],
          			'stock'    => $productsft['stock'] ? true : !(!$this->config->get('config_stock_checkout') || $this->config->get('config_stock_warning')),
					'reward'   => ($productsft['reward'] ? sprintf($this->language->get('text_points'), $productsft['reward']) : ''),
					'price'    => $price,
					'total'    => $total,
					'product_type'=>$productsft['product_type'],
					'parent_product_id' =>$productsft['parent_product_id'],
					'addon' 		  =>$this->cart->getAddonft($productsft['product_addon']),
					'href'     => $this->url->link('product/product', 'product_id=' . $productsft['product_id']),
					'emptycart'   => $this->url->link('checkout/cart', 'emptycart=' . 1),
					'remove'   => $this->url->link('checkout/cart', 'remove=' . $productsft['product_id'])
				);
				 $addon_temp=$product_ft_temp['addon'];
				// print_r($addon_temp);
				 if(!empty($addon_temp)){
	foreach($addon_temp as $key_addon => $valueaddon){
		//print_r($valueaddon);
		$addon_temp[$key_addon]['remove']=$this->url->link('checkout/cart', 'addonremove=' .$valueaddon['addonid'].'&parent_id='.$productsft['product_id']);
	}
				 }
				$product_ft_temp['addon']=$addon_temp;
				$this->data['productsfts'][]= $product_ft_temp;
			}
			}
		
		// Gift Voucher
		$this->data['vouchers'] = array();
		
		if (!empty($this->session->data['vouchers'])) {
			foreach ($this->session->data['vouchers'] as $key => $voucher) {
				$this->data['vouchers'][] = array(
					'key'         => $key,
					'description' => $voucher['description'],
					'amount'      => $this->currency->format($voucher['amount'])
				);
			}
		}
					
		$this->data['cart'] = $this->url->link('checkout/cart');
						
		$this->data['checkout'] = $this->url->link('checkout/checkout', '', 'SSL');
	
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/cart.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/cart.tpl';
		} else {
			$this->template = 'default/template/module/cart.tpl';
		}
				
		$this->response->setOutput($this->render());		
	}
}
?>