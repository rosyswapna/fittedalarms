<?php
	class ControllerProductBestSellers extends Controller {  

		public function index() { 

			$this->load->language('product/bestsellers');

			$this->document->setTitle($this->language->get('text_title'));

			$this->data['heading_title'] = $this->language->get('heading_title');

			$this->data['text_empty'] = $this->language->get('text_empty');

			$this->data['button_cart'] = $this->language->get('button_cart');

			$this->load->model('catalog/product');
		
			$this->load->model('tool/image');

			$this->data['breadcrumbs'] = array();

			$this->data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('text_home'),
				'href'      => $this->url->link('common/home'),
	       		'separator' => false
	   		);

	   		$this->data['breadcrumbs'][] = array(
	       		'text'      => $this->language->get('text_bestsellers'),
				'href'      => $this->url->link('product/bestsellers'),
	       		'separator' => $this->language->get('text_separator')
	   		);		

			$this->data['products'] = array();

			if (isset($this->request->get['page'])) {
				$page = $this->request->get['page'];
			} else { 
				$page = 1;
			}

			if (isset($this->request->get['limit'])) {
				$limit = $this->request->get['limit'];
			} else {
				$limit = $this->config->get('config_catalog_limit');
			}


			$data = array(
				'start'              => ($page - 1) * $limit,
				'limit'              => $limit
			);



			$results = $this->model_catalog_product->getBestSellerProducts('',$data);


			$setting = array('image_width'=>110,'image_height'=>110);

			$this->data['image_width'] = $setting['image_width'];
			$this->data['image_height'] = $setting['image_height'];
			
			foreach ($results as $result) {
				if ($result['image']) {
					$image = $this->model_tool_image->resize($result['image'], $setting['image_width'], $setting['image_height']);
				} else {
					$image = false;
				}
				
				if (($this->config->get('config_customer_price') && $this->customer->isLogged()) || !$this->config->get('config_customer_price')) {
					$price = $this->currency->format($this->tax->calculate($result['price'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$price = false;
				}
						
				if ((float)$result['special']) {
					$special = $this->currency->format($this->tax->calculate($result['special'], $result['tax_class_id'], $this->config->get('config_tax')));
				} else {
					$special = false;
				}	
				
				if ($this->config->get('config_review_status')) {
					$rating = $result['rating'];
				} else {
					$rating = false;
				}
								
				$this->data['products'][] = array(
					'product_id' => $result['product_id'],
					'thumb'   	 => $image,
					'name'    	 => $result['name'],
					'model'    	 => $result['model'],
					'price'   	 => $price,
					'special' 	 => $special,
					'rating'     => $rating,
					'reviews'    => sprintf($this->language->get('text_reviews'), (int)$result['reviews']),
					'href'    	 => $this->url->link('product/product', 'product_id=' . $result['product_id']),
				);
				
			}

			$pagination = new Pagination();
			$pagination->total = $this->model_catalog_product->getTotalBestSellerProducts();
			$pagination->page = $page;
			$pagination->limit = $limit;
			$pagination->text = $this->language->get('text_pagination');
			$pagination->url = $this->url->link('product/bestsellers', '&page={page}');
		
			$this->data['pagination'] = $pagination->render();

			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/product/bestsellers.tpl')) {
				$this->template = $this->config->get('config_template') . '/template/product/bestsellers.tpl';
			} else {
				$this->template = 'default/template/product/bestsellers.tpl';
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
?>