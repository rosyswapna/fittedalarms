<?php
class Cart {
	private $config;
	private $db;
	private $data = array();
	private $data_ft = array();
	
  	public function __construct($registry) {
		$this->config = $registry->get('config');
		$this->customer = $registry->get('customer');
		$this->session = $registry->get('session');
		$this->db = $registry->get('db');
		$this->tax = $registry->get('tax');
		$this->weight = $registry->get('weight');

		if (!isset($this->session->data['cart']) || !is_array($this->session->data['cart'])) {
      		$this->session->data['cart'] = array();
    	}
	}
	      
  	public function getProducts() {
		if (!$this->data) {
			foreach ($this->session->data['cart'] as $key => $quantity) {
				$product = explode(':', $key);
				$product_id = $product[0];
				$stock = true;
	
				// Options
				if (isset($product[1])) {
					$options = unserialize(base64_decode($product[1]));
				} else {
					$options = array();
				} 
				
				$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
				
			
				if ($product_query->num_rows) {
					$option_price = 0;
					$option_points = 0;
					$option_weight = 0;
	
					$option_data = array();
	
					foreach ($options as $product_option_id => $option_value) {
						$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
						
						if ($option_query->num_rows) {
							if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$option_value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
								
								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}
	
									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}
																
									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}
									
									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
										$stock = false;
									}
									
									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $option_value,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'option_value'            => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],									
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);								
								}
							} elseif ($option_query->row['type'] == 'checkbox' && is_array($option_value)) {
								foreach ($option_value as $product_option_value_id) {
									$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
									
									if ($option_value_query->num_rows) {
										if ($option_value_query->row['price_prefix'] == '+') {
											$option_price += $option_value_query->row['price'];
										} elseif ($option_value_query->row['price_prefix'] == '-') {
											$option_price -= $option_value_query->row['price'];
										}
	
										if ($option_value_query->row['points_prefix'] == '+') {
											$option_points += $option_value_query->row['points'];
										} elseif ($option_value_query->row['points_prefix'] == '-') {
											$option_points -= $option_value_query->row['points'];
										}
																	
										if ($option_value_query->row['weight_prefix'] == '+') {
											$option_weight += $option_value_query->row['weight'];
										} elseif ($option_value_query->row['weight_prefix'] == '-') {
											$option_weight -= $option_value_query->row['weight'];
										}
										
										if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
											$stock = false;
										}
										
										$option_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => $product_option_value_id,
											'option_id'               => $option_query->row['option_id'],
											'option_value_id'         => $option_value_query->row['option_value_id'],
											'name'                    => $option_query->row['name'],
											'option_value'            => $option_value_query->row['name'],
											'type'                    => $option_query->row['type'],
											'quantity'                => $option_value_query->row['quantity'],
											'subtract'                => $option_value_query->row['subtract'],
											'price'                   => $option_value_query->row['price'],
											'price_prefix'            => $option_value_query->row['price_prefix'],
											'points'                  => $option_value_query->row['points'],
											'points_prefix'           => $option_value_query->row['points_prefix'],
											'weight'                  => $option_value_query->row['weight'],
											'weight_prefix'           => $option_value_query->row['weight_prefix']
										);								
									}
								}						
							} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => '',
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => '',
									'name'                    => $option_query->row['name'],
									'option_value'            => $option_value,
									'type'                    => $option_query->row['type'],
									'quantity'                => '',
									'subtract'                => '',
									'price'                   => '',
									'price_prefix'            => '',
									'points'                  => '',
									'points_prefix'           => '',								
									'weight'                  => '',
									'weight_prefix'           => ''
								);						
							}
						}
					} 
				
					if ($this->customer->isLogged()) {
						$customer_group_id = $this->customer->getCustomerGroupId();
					} else {
						$customer_group_id = $this->config->get('config_customer_group_id');
					}
					
					$price = $product_query->row['price'];
					
					// Product Discounts
					$discount_quantity = 0;
					
					foreach ($this->session->data['cart'] as $key_2 => $quantity_2) {
						$product_2 = explode(':', $key_2);
						
						if ($product_2[0] == $product_id) {
							$discount_quantity += $quantity_2;
						}
					}
					
					$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
					
					if ($product_discount_query->num_rows) {
						$price = $product_discount_query->row['price'];
					}
					
					// Product Specials
					$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
				
					if ($product_special_query->num_rows) {
						$price = $product_special_query->row['price'];
					}						
			
					// Reward Points
					$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "'");
					
					if ($product_reward_query->num_rows) {	
						$reward = $product_reward_query->row['points'];
					} else {
						$reward = 0;
					}
					
					// Downloads		
					$download_data = array();     		
					
					$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$product_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
					foreach ($download_query->rows as $download) {
						$download_data[] = array(
							'download_id' => $download['download_id'],
							'name'        => $download['name'],
							'filename'    => $download['filename'],
							'mask'        => $download['mask'],
							'remaining'   => $download['remaining']
						);
					}
					
					// Stock
					if (!$product_query->row['quantity'] || ($product_query->row['quantity'] < $quantity)) {
						$stock = false;
					}
					
					$this->data[$key] = array(
						'key'             => $key,
						'product_id'      => $product_query->row['product_id'],
						'name'            => $product_query->row['name'],
						'model'           => $product_query->row['model'],
						'shipping'        => $product_query->row['shipping'],
						'image'           => $product_query->row['image'],
						'product_type'           => $product_query->row['product_type'],
						'parent_product_id'           => $product_query->row['parent_product_id'],
						'option'          => $option_data,
						'download'        => $download_data,
						'quantity'        => $quantity,
						'minimum'         => $product_query->row['minimum'],
						'subtract'        => $product_query->row['subtract'],
						'stock'           => $stock,
						'price'           => ($price + $option_price),
						'total'           => ($price + $option_price) * $quantity,
						'reward'          => $reward * $quantity,
						'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $quantity : 0),
						'tax_class_id'    => $product_query->row['tax_class_id'],
						'weight'          => ($product_query->row['weight'] + $option_weight) * $quantity,
						'weight_class_id' => $product_query->row['weight_class_id'],
						'length'          => $product_query->row['length'],
						'width'           => $product_query->row['width'],
						'height'          => $product_query->row['height'],
						'length_class_id' => $product_query->row['length_class_id']
									
					);
				} else {
					$this->remove($key);
				}
			}
		}
		
		return $this->data;
  	}
	
	
		public function getProductsft(){
			if(isset($this->session->data['cart_ft'])){
				
			$addon=array();		
				//echo "<pre>";
				//print_r($this->session->data['cart_ft']);
				//echo "</pre>";
			foreach($this->session->data['cart_ft'] as $key_product => $product){
			
				$quantity=$product['qty'];
				if(isset($product['addon'])){
			$addon=$product['addon'];
				}else{
				$addon="";	
				}
				//print_r($quantity);
				//print_r($addon);
				//exit();
				$product_id = $key_product;
				$stock = true;
	
				// Options
				if (isset($product[1])) {
					$options = unserialize(base64_decode($product[1]));
				} else {
					$options = array();
				} 
				
				$product_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$product_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
				
			
				if ($product_query->num_rows) {
					$option_price = 0;
					$option_points = 0;
					$option_weight = 0;
	
					$option_data = array();
	
					foreach ($options as $product_option_id => $option_value) {
						$option_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$product_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
						
						if ($option_query->num_rows) {
							if ($option_query->row['type'] == 'select' || $option_query->row['type'] == 'radio' || $option_query->row['type'] == 'image') {
								$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$option_value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
								
								if ($option_value_query->num_rows) {
									if ($option_value_query->row['price_prefix'] == '+') {
										$option_price += $option_value_query->row['price'];
									} elseif ($option_value_query->row['price_prefix'] == '-') {
										$option_price -= $option_value_query->row['price'];
									}
	
									if ($option_value_query->row['points_prefix'] == '+') {
										$option_points += $option_value_query->row['points'];
									} elseif ($option_value_query->row['points_prefix'] == '-') {
										$option_points -= $option_value_query->row['points'];
									}
																
									if ($option_value_query->row['weight_prefix'] == '+') {
										$option_weight += $option_value_query->row['weight'];
									} elseif ($option_value_query->row['weight_prefix'] == '-') {
										$option_weight -= $option_value_query->row['weight'];
									}
									
									if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
										$stock = false;
									}
									
									$option_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $option_value,
										'option_id'               => $option_query->row['option_id'],
										'option_value_id'         => $option_value_query->row['option_value_id'],
										'name'                    => $option_query->row['name'],
										'option_value'            => $option_value_query->row['name'],
										'type'                    => $option_query->row['type'],
										'quantity'                => $option_value_query->row['quantity'],
										'subtract'                => $option_value_query->row['subtract'],
										'price'                   => $option_value_query->row['price'],
										'price_prefix'            => $option_value_query->row['price_prefix'],
										'points'                  => $option_value_query->row['points'],
										'points_prefix'           => $option_value_query->row['points_prefix'],									
										'weight'                  => $option_value_query->row['weight'],
										'weight_prefix'           => $option_value_query->row['weight_prefix']
									);								
								}
							} elseif ($option_query->row['type'] == 'checkbox' && is_array($option_value)) {
								foreach ($option_value as $product_option_value_id) {
									$option_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
									
									if ($option_value_query->num_rows) {
										if ($option_value_query->row['price_prefix'] == '+') {
											$option_price += $option_value_query->row['price'];
										} elseif ($option_value_query->row['price_prefix'] == '-') {
											$option_price -= $option_value_query->row['price'];
										}
	
										if ($option_value_query->row['points_prefix'] == '+') {
											$option_points += $option_value_query->row['points'];
										} elseif ($option_value_query->row['points_prefix'] == '-') {
											$option_points -= $option_value_query->row['points'];
										}
																	
										if ($option_value_query->row['weight_prefix'] == '+') {
											$option_weight += $option_value_query->row['weight'];
										} elseif ($option_value_query->row['weight_prefix'] == '-') {
											$option_weight -= $option_value_query->row['weight'];
										}
										
										if ($option_value_query->row['subtract'] && (!$option_value_query->row['quantity'] || ($option_value_query->row['quantity'] < $quantity))) {
											$stock = false;
										}
										
										$option_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => $product_option_value_id,
											'option_id'               => $option_query->row['option_id'],
											'option_value_id'         => $option_value_query->row['option_value_id'],
											'name'                    => $option_query->row['name'],
											'option_value'            => $option_value_query->row['name'],
											'type'                    => $option_query->row['type'],
											'quantity'                => $option_value_query->row['quantity'],
											'subtract'                => $option_value_query->row['subtract'],
											'price'                   => $option_value_query->row['price'],
											'price_prefix'            => $option_value_query->row['price_prefix'],
											'points'                  => $option_value_query->row['points'],
											'points_prefix'           => $option_value_query->row['points_prefix'],
											'weight'                  => $option_value_query->row['weight'],
											'weight_prefix'           => $option_value_query->row['weight_prefix']
										);								
									}
								}						
							} elseif ($option_query->row['type'] == 'text' || $option_query->row['type'] == 'textarea' || $option_query->row['type'] == 'file' || $option_query->row['type'] == 'date' || $option_query->row['type'] == 'datetime' || $option_query->row['type'] == 'time') {
								$option_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => '',
									'option_id'               => $option_query->row['option_id'],
									'option_value_id'         => '',
									'name'                    => $option_query->row['name'],
									'option_value'            => $option_value,
									'type'                    => $option_query->row['type'],
									'quantity'                => '',
									'subtract'                => '',
									'price'                   => '',
									'price_prefix'            => '',
									'points'                  => '',
									'points_prefix'           => '',								
									'weight'                  => '',
									'weight_prefix'           => ''
								);						
							}
						}
					} 
				
					if ($this->customer->isLogged()) {
						$customer_group_id = $this->customer->getCustomerGroupId();
					} else {
						$customer_group_id = $this->config->get('config_customer_group_id');
					}
					
					$price = $product_query->row['price'];
					
					// Product Discounts
					$discount_quantity = 0;
					foreach ($this->session->data['cart_ft'] as $key_product_2 => $product_2) {
						$quantity_2=$product_2['qty'];
						if(isset($product_2['addon'])){
						$addon_2=$product_2['addon'];
						}
						else{
				$addon_2="";	
				}
						//print_r($quantity_2);
						//$product_2 = explode(':', $key_product_2);
						
						if ($key_product_2 == $product_id) {
							$discount_quantity += $quantity_2;
						}
					}
					
					$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
					
					if ($product_discount_query->num_rows) {
						$price = $product_discount_query->row['price'];
					}
					
					// Product Specials
					$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
				
					if ($product_special_query->num_rows) {
						$price = $product_special_query->row['price'];
					}						
			
					// Reward Points
					$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$product_id . "' AND customer_group_id = '" . (int)$customer_group_id . "'");
					
					if ($product_reward_query->num_rows) {	
						$reward = $product_reward_query->row['points'];
					} else {
						$reward = 0;
					}
					
					// Downloads		
					$download_data = array();     		
					
					$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$product_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
					foreach ($download_query->rows as $download) {
						$download_data[] = array(
							'download_id' => $download['download_id'],
							'name'        => $download['name'],
							'filename'    => $download['filename'],
							'mask'        => $download['mask'],
							'remaining'   => $download['remaining']
						);
					}
					
					// Stock
					if (!$product_query->row['quantity'] || ($product_query->row['quantity'] < $quantity)) {
						$stock = false;
					}
					//print_r($addon);
					$this->data_ft[$key_product] = array(
						'key'             => $key_product,
						'product_id'      => $product_query->row['product_id'],
						'name'            => $product_query->row['name'],
						'model'           => $product_query->row['model'],
						'shipping'        => $product_query->row['shipping'],
						'image'           => $product_query->row['image'],
						'product_type'           => $product_query->row['product_type'],
						'parent_product_id'           => $product_query->row['parent_product_id'],
						'option'          => $option_data,
						'download'        => $download_data,
						'quantity'        => $quantity,
						'minimum'         => $product_query->row['minimum'],
						'subtract'        => $product_query->row['subtract'],
						'stock'           => $stock,
						'price'           => ($price + $option_price),
						'total'           => ($price + $option_price) * $quantity,
						'reward'          => $reward * $quantity,
						'points'          => ($product_query->row['points'] ? ($product_query->row['points'] + $option_points) * $quantity : 0),
						'tax_class_id'    => $product_query->row['tax_class_id'],
						'weight'          => ($product_query->row['weight'] + $option_weight) * $quantity,
						'weight_class_id' => $product_query->row['weight_class_id'],
						'length'          => $product_query->row['length'],
						'width'           => $product_query->row['width'],
						'height'          => $product_query->row['height'],
						'addon' 		  =>$this->getAddonft($addon),
						'product_addon' 		  =>$addon,
						'length_class_id' => $product_query->row['length_class_id']					
					);
				} else {
					$this->remove($key_product);
				}
			
					
		}
		
		return $this->data_ft;
	
				}
		}
		
		 public function getAddonft($addon){
			 if($addon!=""){
			$addons=array();
			/*echo "<pre>";
			print_r($addon);
			echo "</pre>";*/
			foreach($addon as $addonid => $addonqty){
				//echo "<pre>";
				//print_r($addon);
				//echo "</pre>";
				  $addonquantity=$addonqty;
				  $addon_id=$addonid;
			
				$addonoptions = array();
				
				$addon_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p LEFT JOIN " . DB_PREFIX . "product_description pd ON (p.product_id = pd.product_id) WHERE p.product_id = '" . (int)$addon_id . "' AND pd.language_id = '" . (int)$this->config->get('config_language_id') . "' AND p.date_available <= NOW() AND p.status = '1'");
				
			
				if ($addon_query->num_rows) {
					$addonoption_price = 0;
					$addonoption_points = 0;
					$addonoption_weight = 0;
	
					$addonoption_data = array();
	
					foreach ($addonoptions as $product_option_id => $addonoption_value) {
						$addonoption_query = $this->db->query("SELECT po.product_option_id, po.option_id, od.name, o.type FROM " . DB_PREFIX . "product_option po LEFT JOIN `" . DB_PREFIX . "option` o ON (po.option_id = o.option_id) LEFT JOIN " . DB_PREFIX . "option_description od ON (o.option_id = od.option_id) WHERE po.product_option_id = '" . (int)$product_option_id . "' AND po.product_id = '" . (int)$addon_id . "' AND od.language_id = '" . (int)$this->config->get('config_language_id') . "'");
						
						if ($addonoption_query->num_rows) {
							if ($addonoption_query->row['type'] == 'select' || $addonoption_query->row['type'] == 'radio' || $addonoption_query->row['type'] == 'image') {
								$addonoption_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$addonoption_value . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
								
								if ($addonoption_value_query->num_rows) {
									if ($addonoption_value_query->row['price_prefix'] == '+') {
										$addonoption_price += $addonoption_value_query->row['price'];
									} elseif ($addonoption_value_query->row['price_prefix'] == '-') {
										$addonoption_price -= $addonoption_value_query->row['price'];
									}
	
									if ($addonoption_value_query->row['points_prefix'] == '+') {
										$addonoption_points += $addonoption_value_query->row['points'];
									} elseif ($addonoption_value_query->row['points_prefix'] == '-') {
										$addonoption_points -= $addonoption_value_query->row['points'];
									}
																
									if ($addonoption_value_query->row['weight_prefix'] == '+') {
										$addonoption_weight += $addonoption_value_query->row['weight'];
									} elseif ($addonoption_value_query->row['weight_prefix'] == '-') {
										$addonoption_weight -= $addonoption_value_query->row['weight'];
									}
									
									if ($addonoption_value_query->row['subtract'] && (!$addonoption_value_query->row['quantity'] || ($addonoption_value_query->row['quantity'] < $addonquantity))) {
										$stock = false;
									}
									
									$addonoption_data[] = array(
										'product_option_id'       => $product_option_id,
										'product_option_value_id' => $addonoption_value,
										'option_id'               => $addonoption_query->row['option_id'],
										'option_value_id'         => $addonoption_value_query->row['option_value_id'],
										'name'                    => $addonoption_query->row['name'],
										'option_value'            => $addonoption_value_query->row['name'],
										'type'                    => $addonoption_query->row['type'],
										'quantity'                => $addonoption_value_query->row['quantity'],
										'subtract'                => $addonoption_value_query->row['subtract'],
										'price'                   => $addonoption_value_query->row['price'],
										'price_prefix'            => $addonoption_value_query->row['price_prefix'],
										'points'                  => $addonoption_value_query->row['points'],
										'points_prefix'           => $addonoption_value_query->row['points_prefix'],									
										'weight'                  => $addonoption_value_query->row['weight'],
										'weight_prefix'           => $addonoption_value_query->row['weight_prefix']
									);								
								}
							} elseif ($addonoption_query->row['type'] == 'checkbox' && is_array($addonoption_value)) {
								foreach ($addonoption_value as $product_option_value_id) {
									$addonoption_value_query = $this->db->query("SELECT pov.option_value_id, ovd.name, pov.quantity, pov.subtract, pov.price, pov.price_prefix, pov.points, pov.points_prefix, pov.weight, pov.weight_prefix FROM " . DB_PREFIX . "product_option_value pov LEFT JOIN " . DB_PREFIX . "option_value ov ON (pov.option_value_id = ov.option_value_id) LEFT JOIN " . DB_PREFIX . "option_value_description ovd ON (ov.option_value_id = ovd.option_value_id) WHERE pov.product_option_value_id = '" . (int)$product_option_value_id . "' AND pov.product_option_id = '" . (int)$product_option_id . "' AND ovd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
									
									if ($addonoption_value_query->num_rows) {
										if ($addonoption_value_query->row['price_prefix'] == '+') {
											$addonoption_price += $addonoption_value_query->row['price'];
										} elseif ($addonoption_value_query->row['price_prefix'] == '-') {
											$addonoption_price -= $addonoption_value_query->row['price'];
										}
	
										if ($addonoption_value_query->row['points_prefix'] == '+') {
											$addonoption_points += $addonoption_value_query->row['points'];
										} elseif ($addonoption_value_query->row['points_prefix'] == '-') {
											$addonoption_points -= $addonoption_value_query->row['points'];
										}
																	
										if ($addonoption_value_query->row['weight_prefix'] == '+') {
											$addonoption_weight += $addonoption_value_query->row['weight'];
										} elseif ($addonoption_value_query->row['weight_prefix'] == '-') {
											$addonoption_weight -= $addonoption_value_query->row['weight'];
										}
										
										if ($addonoption_value_query->row['subtract'] && (!$addonoption_value_query->row['quantity'] || ($addonoption_value_query->row['quantity'] < $addonquantity))) {
											$stock = false;
										}
										
										$addonoption_data[] = array(
											'product_option_id'       => $product_option_id,
											'product_option_value_id' => $product_option_value_id,
											'option_id'               => $addonoption_query->row['option_id'],
											'option_value_id'         => $addonoption_value_query->row['option_value_id'],
											'name'                    => $addonoption_query->row['name'],
											'option_value'            => $addonoption_value_query->row['name'],
											'type'                    => $addonoption_query->row['type'],
											'quantity'                => $addonoption_value_query->row['quantity'],
											'subtract'                => $addonoption_value_query->row['subtract'],
											'price'                   => $addonoption_value_query->row['price'],
											'price_prefix'            => $addonoption_value_query->row['price_prefix'],
											'points'                  => $addonoption_value_query->row['points'],
											'points_prefix'           => $addonoption_value_query->row['points_prefix'],
											'weight'                  => $addonoption_value_query->row['weight'],
											'weight_prefix'           => $addonoption_value_query->row['weight_prefix']
										);								
									}
								}						
							} elseif ($addonoption_query->row['type'] == 'text' || $addonoption_query->row['type'] == 'textarea' || $addonoption_query->row['type'] == 'file' || $addonoption_query->row['type'] == 'date' || $addonoption_query->row['type'] == 'datetime' || $addonoption_query->row['type'] == 'time') {
								$addonoption_data[] = array(
									'product_option_id'       => $product_option_id,
									'product_option_value_id' => '',
									'option_id'               => $addonoption_query->row['option_id'],
									'option_value_id'         => '',
									'name'                    => $addonoption_query->row['name'],
									'option_value'            => $addonoption_value,
									'type'                    => $addonoption_query->row['type'],
									'quantity'                => '',
									'subtract'                => '',
									'price'                   => '',
									'price_prefix'            => '',
									'points'                  => '',
									'points_prefix'           => '',								
									'weight'                  => '',
									'weight_prefix'           => ''
								);						
							}
						}
					} 
				
					if ($this->customer->isLogged()) {
						$customer_group_id = $this->customer->getCustomerGroupId();
					} else {
						$customer_group_id = $this->config->get('config_customer_group_id');
					}
					
					$price = $addon_query->row['price'];
					
					// Product Discounts
					$discount_quantity = 0;
/*					foreach ($this->session->data['cart_ft'] as $key_product_2 => $product_2) {
						$quantity_2=$product_2['qty'];
						$addon_2=$product_2['addon'];
						//print_r($quantity_2);
						//$product_2 = explode(':', $key_product_2);
						
						
					}
*/					//if ($key_product_2 == $addon_id) //{$addonquantity=$addonqty;
			// echo $addon_id=$addonid;
							$discount_quantity += $addonquantity;
					//	}
					$product_discount_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_discount WHERE product_id = '" . (int)$addon_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND quantity <= '" . (int)$discount_quantity . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY quantity DESC, priority ASC, price ASC LIMIT 1");
					
					if ($product_discount_query->num_rows) {
						$price = $product_discount_query->row['price'];
					}
					
					// Product Specials
					$product_special_query = $this->db->query("SELECT price FROM " . DB_PREFIX . "product_special WHERE product_id = '" . (int)$addon_id . "' AND customer_group_id = '" . (int)$customer_group_id . "' AND ((date_start = '0000-00-00' OR date_start < NOW()) AND (date_end = '0000-00-00' OR date_end > NOW())) ORDER BY priority ASC, price ASC LIMIT 1");
				
					if ($product_special_query->num_rows) {
						$price = $product_special_query->row['price'];
					}						
			
					// Reward Points
					$product_reward_query = $this->db->query("SELECT points FROM " . DB_PREFIX . "product_reward WHERE product_id = '" . (int)$addon_id . "' AND customer_group_id = '" . (int)$customer_group_id . "'");
					
					if ($product_reward_query->num_rows) {	
						$reward = $product_reward_query->row['points'];
					} else {
						$reward = 0;
					}
					
					// Downloads		
					$download_data = array();     		
					
					$download_query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product_to_download p2d LEFT JOIN " . DB_PREFIX . "download d ON (p2d.download_id = d.download_id) LEFT JOIN " . DB_PREFIX . "download_description dd ON (d.download_id = dd.download_id) WHERE p2d.product_id = '" . (int)$addon_id . "' AND dd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
				
					foreach ($download_query->rows as $download) {
						$download_data[] = array(
							'download_id' => $download['download_id'],
							'name'        => $download['name'],
							'filename'    => $download['filename'],
							'mask'        => $download['mask'],
							'remaining'   => $download['remaining']
						);
					}
					
					// Stock
					if (!$addon_query->row['quantity'] || ($addon_query->row['quantity'] < $addonquantity)) {
						$stock = false;
					}else{
						$stock = $addon_query->row['quantity'];
					}
					
					$addons[] = array(
						'addonid'             => $addonid,
						'product_id'      => $addon_query->row['product_id'],
						'name'            => $addon_query->row['name'],
						'model'           => $addon_query->row['model'],
						'shipping'        => $addon_query->row['shipping'],
						'image'           => $addon_query->row['image'],
						'product_type'           => $addon_query->row['product_type'],
						'parent_product_id'           => $addon_query->row['parent_product_id'],
						'option'          => $addonoption_data,
						'download'        => $download_data,
						'quantity'        => $addonquantity,
						'minimum'         => $addon_query->row['minimum'],
						'subtract'        => $addon_query->row['subtract'],
						'stock'           => $stock,
						'price'           => ($price + $addonoption_price),
						'total'           => ($price + $addonoption_price) * $addonquantity,
						'reward'          => $reward * $addonquantity,
						'points'          => ($addon_query->row['points'] ? ($addon_query->row['points'] + $addonoption_points) * $addonquantity : 0),
						'tax_class_id'    => $addon_query->row['tax_class_id'],
						'weight'          => ($addon_query->row['weight'] + $addonoption_weight) * $addonquantity,
						'weight_class_id' => $addon_query->row['weight_class_id'],
						'length'          => $addon_query->row['length'],
						'width'           => $addon_query->row['width'],
						'height'          => $addon_query->row['height'],
						'length_class_id' => $addon_query->row['length_class_id']
						//'remove'  		  => $this->cart->url->link('checkout/cart', 'remove=' . $addon_query->row['product_id']),				
					);
				} else {
					$this->remove($addonid);
				}
			
					
		
			} 
			return $addons;
			 }else{
				return false; 
			 }
		 }
	
	
	
  	public function add($product_id, $qty = 1, $option = array()) {
    	if (!$option) {
      		$key = (int)$product_id;
    	} else {
      		$key = (int)$product_id . ':' . base64_encode(serialize($option));
    	}
    	
		if ((int)$qty && ((int)$qty > 0)) {
    		if (!isset($this->session->data['cart'][$key])) {
      			$this->session->data['cart'][$key] = (int)$qty;
    		} else {
      			$this->session->data['cart'][$key] += (int)$qty;
    		}
    		if (!isset($this->session->data['cart_ft'][$key]["qty"])) {
      			$this->session->data['cart_ft'][$key]["qty"] = (int)$qty;
    		} else {
      			$this->session->data['cart_ft'][$key]["qty"] += (int)$qty;
    		}			
		}
		
		
		$this->data = array();
  	}

  	


	
	public function add_addon($addon_id, $product_id, $qty = 1, $option = array()) {
		if (!$option) {
      		$key_product = (int)$product_id;
			$key_addon = (int)$addon_id;
    	} else {
      		$key_product = (int)$product_id . ':' . base64_encode(serialize($option));
			$key_addon = (int)$addon_id . ':' . base64_encode(serialize($option));
    	}
    	
		if ((int)$qty && ((int)$qty > 0)) {
			if(!isset($this->session->data['cart_ft'][$key_product]['addon'])){
				$addon_arr=array();
				$addon_arr[$key_addon] = $qty;
				$this->session->data['cart_ft'][$key_product]['addon']=$addon_arr;
			}else{
				$addon_arr=$this->session->data['cart_ft'][$key_product]["addon"];
				if(!isset($addon_arr[$key_addon])){
					$addon_arr[$key_addon] = $qty;
				}else{
					$addon_arr[$key_addon]+= $qty;
				}
				$this->session->data['cart_ft'][$key_product]["addon"]=$addon_arr;
			}
    		
		}
		
		if ((int)$qty && ((int)$qty > 0)) {
    		if (!isset($this->session->data['cart'][$key_addon])) {
      			$this->session->data['cart'][$key_addon] = (int)$qty;
    		} else {
      			$this->session->data['cart'][$key_addon] += (int)$qty;
    		}
		}
		
		$this->data = array();
  	}
	
	
	
	
	

  	public function update($key, $qty) {

    	if ((int)$qty && ((int)$qty > 0)) {
      		$this->session->data['cart'][$key] = (int)$qty;
			$this->session->data['cart_ft'][$key]["qty"] = (int)$qty;
    	} else {
	  		$this->remove($key);
		}
		
		$this->data = array();
  	}

  	public function remove($key) {
		if(array_key_exists($key, $this->session->data['cart_ft'])){
			if(isset($this->session->data['cart_ft'][$key]['addon'])){
				foreach ($this->session->data['cart_ft'][$key]['addon'] as $addon_key => $addon_qty) {
					$this->addonremove($addon_key,$key);
				}
			}
			unset($this->session->data['cart_ft'][$key]);
			unset($this->session->data['cart'][$key]);
		}
		$this->data = array();
	}
	
	
	public function updateaddon( $keyproduct, $addonarr) {
		foreach($addonarr as $keyaddon =>$addonqty){
			if ((int)$addonqty && ((int)$addonqty > 0)) {

				//$this->session->data['cart_ft'][$key]["addon"][$keyaddon];
	      		$prdctad_qty	= $this->session->data['cart'][$keyaddon];
				$addonqty1		= $this->session->data['cart_ft'][$keyproduct]["addon"][$keyaddon];
				$crctd_qty		= $addonqty-$addonqty1;
				$prdct_addqty	= $prdctad_qty+$crctd_qty;

				$this->session->data['cart_ft'][$keyproduct]["addon"][$keyaddon]=(int)$addonqty;
				$this->session->data['cart'][$keyaddon]=(int)$prdct_addqty;

	    	} else {
		  		$this->addonremove($keyaddon,$keyproduct);
			}
		}
    	
		//exit();
		
		$this->data = array();
  	}

  	/*

  	public function remove($key) {
		//echo count($this->session->data['cart_ft'][$key]);
		//count($this->session->data['cart_ft'][$key]);
		if (isset($this->session->data['cart'][$key])) {
			if(count($this->session->data['cart_ft'][$key])==1){
				unset($this->session->data['cart_ft'][$key]);
	     		unset($this->session->data['cart'][$key]);	
			}
			else if(count($this->session->data['cart_ft'][$key])>1){
				
				$cartft_arr=$this->session->data['cart_ft'][$key]['addon'];
				//print_r($cartft_arr);
				if(!empty($cartft_arr)){
					foreach($cartft_arr as $key_addon => $productvalue ){
						unset($this->session->data['cart'][$key]);
						unset($this->session->data['cart_ft'][$key]);
						$addonqty=$this->session->data['cart'][$key_addon];
						if($addonqty==$productvalue){
							unset($this->session->data['cart'][$key_addon]);	
						}else{
							$addonqty_dif=$addonqty-$productvalue;
							$this->session->data['cart'][$key_addon]=$addonqty_dif;
						}
					}
				}else{
					unset($this->session->data['cart_ft'][$key]);
     				unset($this->session->data['cart'][$key]);
				}
			}
			//print_r($this->session->data['cart_ft'][$key]['addon']);
			//echo $this->session->data['cart'][$key];
			// print_r($this->session->data['cart_ft'][$key]);
			//unset($this->session->data['cart_ft'][$key]);
     		//unset($this->session->data['cart'][$key]);
  		}
		//exit();
		$this->data = array();
	}
	*/
	
	
	public function addonremove($keyaddon,$key) {
		//$keyaddon; parent product id
		//$key; addon id
		
		 $productqty=$this->session->data['cart'][$keyaddon];
		 $addon_qty=$this->session->data['cart_ft'][$key]['addon'][$keyaddon];
		
		if($productqty==$addon_qty){ //if addon qty is same as qty in cart array then array that product array
			unset($this->session->data['cart'][$keyaddon]);
			unset($this->session->data['cart_ft'][$key]['addon'][$keyaddon]);
		}else{ //if same addon is in different product then set cart array qty to cart_ft addonqty- cart productqty 
			$prdct_addon=$productqty-$addon_qty;
			$this->session->data['cart'][$keyaddon]=$prdct_addon;
			unset($this->session->data['cart_ft'][$key]['addon'][$keyaddon]);
		}
	//exit();	
	}

	
	
  	public function clear() {
		$this->session->data['cart'] = array();
		$this->data = array();

		$this->session->data['cart_ft'] = array();
		$this->data = array();

		unset($this->session->data['service_id']);
		unset($this->session->data['service_charge']);
		unset($this->session->data['service_option']);
		unset($this->session->data['alarm_servicing']);
  	}
	
  	public function getWeight() {
		$weight = 0;
	
    	foreach ($this->getProducts() as $product) {
			if ($product['shipping']) {
      			$weight += $this->weight->convert($product['weight'], $product['weight_class_id'], $this->config->get('config_weight_class_id'));
			}
		}
	
		return $weight;
	}
	
  	public function getSubTotal() {
		$total = 0;
		
		foreach ($this->getProducts() as $product) {
			$total += $product['total'];
		}

		$total += $this->expressInstallationCharge();
		$total += $this->serviceOptionCharge();
		
		return $total;
  	}

  	public function expressInstallationCharge(){
  		if(isset($this->session->data['service_charge'])){
  			$service_charge = $this->session->data['service_charge'];	
  		}else{
  			$service_charge = 0;
  		}

  		return $service_charge;
  	}

  	public function serviceOptionCharge(){
  		if(isset($this->session->data['service_option'])){
  			$service_option = $this->session->data['service_option'];	
  		}else{
  			$service_option = 0;
  		}

  		return $service_option;
  	}

  	public function checkAlarmServicing()
  	{
  		if(isset($this->session->data['alarm_servicing'])){
  			$this->remove($this->session->data['alarm_servicing']);
  			unset($this->session->data['alarm_servicing']);
  		}
  		return true;
  	}
	
	public function getTaxes() {
		$tax_data = array();
		
		foreach ($this->getProducts() as $product) {
			if ($product['tax_class_id']) {
				$tax_rates = $this->tax->getRates($product['price'], $product['tax_class_id']);
				
				foreach ($tax_rates as $tax_rate) {
					if (!isset($tax_data[$tax_rate['tax_rate_id']])) {
						$tax_data[$tax_rate['tax_rate_id']] = ($tax_rate['amount'] * $product['quantity']);
					} else {
						$tax_data[$tax_rate['tax_rate_id']] += ($tax_rate['amount'] * $product['quantity']);
					}
				}
			}
		}
		
		return $tax_data;
  	}

  	public function getTotal() {
		$total = 0;
		
		foreach ($this->getProducts() as $product) {
			$total += $this->tax->calculate($product['price'], $product['tax_class_id'], $this->config->get('config_tax')) * $product['quantity'];
		}

		return $total;
  	}
	  	
  	public function countProducts() {
		$product_total = 0;
			
		$products = $this->getProducts();
			
		foreach ($products as $product) {
			$product_total += $product['quantity'];
		}		
					
		return $product_total;
	}
	  
  	public function hasProducts() {
    	return count($this->session->data['cart']);
  	}
  
  	public function hasStock() {
		$stock = true;
		
		foreach ($this->getProducts() as $product) {
			if (!$product['stock']) {
	    		$stock = false;
			}
		}
		
    	return $stock;
  	}
  
  	public function hasShipping() {
		$shipping = false;
		
		foreach ($this->getProducts() as $product) {
	  		if ($product['shipping']) {
	    		$shipping = true;
				
				break;
	  		}		
		}
		
		return $shipping;
	}
	
  	public function hasDownload() {
		$download = false;
		
		foreach ($this->getProducts() as $product) {
	  		if ($product['download']) {
	    		$download = true;
				
				break;
	  		}		
		}
		
		return $download;
	}

	


	public function set_cart_ft_with_cart(){

		if(isset($this->session->data['cart'])){
      		foreach($this->session->data['cart'] as $product_id=>$qty){
      			$key = (int)$product_id;
				if((int)$qty && ((int)$qty > 0)) {
    		
		    		if (!isset($this->session->data['cart_ft'][$key]["qty"])) {
		      			$this->session->data['cart_ft'][$key]["qty"] = (int)$qty;
		    		} else {
		      			$this->session->data['cart_ft'][$key]["qty"] += (int)$qty;
		    		}			
				}
			
				$this->data = array();
			}
		}
	}


}
?>