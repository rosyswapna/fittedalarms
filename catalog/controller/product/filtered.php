<?php 
class ControllerProductFiltered extends Controller {  
	public function index() { 
		
		$this->load->model('catalog/product');
		
		$this->load->model('tool/image'); 
		
		$filter = '';

		$price_range_data[0]['filter_id'] = 'p1';
		$price_range_data[0]['max'] = 500;
		$price_range_data[0]['description'] = 'Under £500';

		$price_range_data[1]['filter_id'] = 'p2';
		$price_range_data[1]['min'] = 500;
		$price_range_data[1]['max'] = 650;
		$price_range_data[1]['description'] = '£500 to £650';

		$price_range_data[2]['filter_id'] = 'p3';
		$price_range_data[2]['min'] = 650;
		$price_range_data[2]['max'] = 800;
		$price_range_data[2]['description'] = '£650 to £800';

		$price_range_data[3]['filter_id'] = 'p4';
		$price_range_data[3]['min'] = 800;
		$price_range_data[3]['description'] = '£800 and above';

		
		if (isset($this->request->get['filter']) and $this->request->get['filter']!='') { 
			$filter = $this->request->get['filter'];
			//build data array for get products
			$filter_list = explode(",", $filter);
			$manufacturer_ids = '';
			$feature_ids = '';
			$price_ranges = array();$i=0;
			foreach ($filter_list as $each) {
				$split = preg_split('#(?<=[a-z])(?=\d)#i', $each);
				$str = $split[0];
				$int = $split[1];

				switch ($str) {
					case 'm':
							if($manufacturer_ids){
								$manufacturer_ids .= ",".$int;
							}else{
								$manufacturer_ids .= $int;
							}
							break;
					case 'f':
							if($feature_ids){
								$feature_ids .= ",".$int;
							}else{
								$feature_ids .= $int;
							}
							break;
					case 'p':$index = $int-1;
								if(array_key_exists($index,$price_range_data))
								{
									$price_range_detail = $price_range_data[$index];
									if(array_key_exists('min',$price_range_detail) || array_key_exists('max',$price_range_detail)){
										if(array_key_exists('min',$price_range_detail)){
											$price_ranges[$i]['min'] = $price_range_detail['min'];
										}
										if(array_key_exists('max',$price_range_detail)){
											$price_ranges[$i]['max'] = $price_range_detail['max'];
										}
										$i++;
									}
								}							
							break;
					
					default:
						# code...
						break;
				}
			}

			$product_data_array = array(
									'manufacturer_ids'	=>$manufacturer_ids,
									'feature_ids' 		=>$feature_ids,
									'price_ranges'		=>$price_ranges
									);
		}else{
			$product_data_array = array();
		}
							
		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
       		'separator' => false
   		);


		if ($filter) {

			$products =$this->model_catalog_product->getProducts($product_data_array);

			$product_total = count($products);

			$this->language->load('product/filtered');

			$this->data['heading_title'] = $this->language->get('heading_title');
					
			$this->data['button_cart'] = $this->language->get('button_cart');

			$this->data['text_empty'] = $this->language->get('text_empty');

			$this->document->setTitle($this->language->get('text_title'));
			
			
			$url = '';
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}	
						
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}	
			
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
								
			
			
			$this->data['products'] = array();

			$filtered_product='';
			$setting = array('image_width'=>80,'image_height'=>80);

			foreach ($products as $product)
			{
				if (!$filtered_product) {
					$filtered_product = $product['product_id'];
				} else {
					$filtered_product .= ',' . $product['product_id'];
				}

				$product_info = $this->model_catalog_product->getProduct($product['product_id']);
			
				if ($product_info) {
					if ($product_info['image']) {
						$image = $this->model_tool_image->resize($product_info['image'], $setting['image_width'], $setting['image_height']);
					} else {
						$image = false;
					}

					if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
						$price = $this->currency->format($this->tax->calculate($product_info['price'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$price = false;
					}
							
					if ((float)$product_info['special']) {
						$special = $this->currency->format($this->tax->calculate($product_info['special'], $product_info['tax_class_id'], $this->config->get('config_tax')));
					} else {
						$special = false;
					}
					
					if ($this->config->get('config_review_status')) {
						$rating = $product_info['rating'];
					} else {
						$rating = false;
					}
						
					$this->data['products'][] = array(
						'product_id' => $product_info['product_id'],
						'thumb'   	 => $image,
						'name'    	 => $product_info['name'],
						'price'   	 => $price,
						'special' 	 => $special,
						'rating'     => $rating,
						'reviews'    => sprintf($this->language->get('text_reviews'), (int)$product_info['reviews']),
						'href'    	 => $this->url->link('product/product', 'product_id=' . $product_info['product_id'])
					);
				}
			}
			
			$url = '';
			
					
			$pagination = new Pagination();
			$pagination->total = $product_total;
			//$pagination->page = $page;
			//$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/filtered', $url . '&page={page}');
		
			$this->data['pagination'] = $pagination->render();
		
		
			$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/filtered.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/filtered.tpl';
			} else {
				$this->template = 'default/template/product/filtered.tpl';
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
    	} else {
    		$this->language->load('error/no_record');
			$url = '';
			
			if (isset($this->request->get['path'])) {
				$url .= '&path=' . $this->request->get['path'];
			}
			
			if (isset($this->request->get['filter'])) {
				$url .= '&filter=' . $this->request->get['filter'];
			}
												
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}	

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}
				
			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			if (isset($this->request->get['limit'])) {
				$url .= '&limit=' . $this->request->get['limit'];
			}
						
			$this->data['breadcrumbs'][] = array(
				'text'      => $this->language->get('text_error'),
				'href'      => $this->url->link('product/category', $url),
				'separator' => $this->language->get('text_separator')
			);
				
			$this->document->setTitle($this->language->get('text_error'));

      		$this->data['heading_title'] = $this->language->get('text_error');

      		$this->data['text_error'] = $this->language->get('text_error');

      		$this->data['button_continue'] = $this->language->get('button_continue');

      		$this->data['continue'] = $this->url->link('common/home');

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/no_record.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/error/no_record.tpl';
			} else {
				$this->template = 'default/template/error/no_record.tpl';
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
  	}
}
?>