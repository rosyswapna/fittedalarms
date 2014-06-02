<?php  
class ControllerCommonFooter extends Controller {
	protected function index() {
		$this->language->load('common/footer');
		
		$this->load->model('catalog/callback');
		
		$this->data['text_information'] = $this->language->get('text_information');
		$this->data['text_service'] = $this->language->get('text_service');
		$this->data['text_extra'] = $this->language->get('text_extra');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_return'] = $this->language->get('text_return');
    	$this->data['text_sitemap'] = $this->language->get('text_sitemap');
		$this->data['text_manufacturer'] = $this->language->get('text_manufacturer');
		$this->data['text_voucher'] = $this->language->get('text_voucher');
		$this->data['text_affiliate'] = $this->language->get('text_affiliate');
		$this->data['text_special'] = $this->language->get('text_special');
		$this->data['text_account'] = $this->language->get('text_account');
		$this->data['text_order'] = $this->language->get('text_order');
		$this->data['text_wishlist'] = $this->language->get('text_wishlist');
		$this->data['text_newsletter'] = $this->language->get('text_newsletter');
		
		$this->load->model('catalog/information');
		
		$this->data['informations'] = array();

		foreach ($this->model_catalog_information->getInformations() as $result) {
			if ($result['bottom']) {
				$this->data['informations'][] = array(
					'title' => $result['title'],
					'description' => $result['description'],
					'href'  => $this->url->link('information/information', 'information_id=' . $result['information_id'])
				);
			}
    	}

    	if(isset($_POST['callback_check'])){

			if (($this->request->server['REQUEST_METHOD'] == 'POST')&& $this->validate() && $_POST['callback_check']=="callback") {
				 
				$this->model_catalog_callback->addCallback($this->request->post);		
						
				$this->session->data['success'] = $this->language->get('text_success');
				
				$url = '';

				if (isset($this->request->get['page'])) {
					$url .= '&page=' . $this->request->get['page'];
				}
							
				$this->redirect($this->url->link('module/callback/success', 'SSL')); 
							
			}
		}

		$this->data['contact'] = $this->url->link('information/contact');
		$this->data['return'] = $this->url->link('account/return/insert', '', 'SSL');
    	$this->data['sitemap'] = $this->url->link('information/sitemap');
		$this->data['manufacturer'] = $this->url->link('product/manufacturer');
		$this->data['voucher'] = $this->url->link('account/voucher', '', 'SSL');
		$this->data['affiliate'] = $this->url->link('affiliate/account', '', 'SSL');
		$this->data['special'] = $this->url->link('product/special');
		$this->data['account'] = $this->url->link('account/account', '', 'SSL');
		$this->data['order'] = $this->url->link('account/order', '', 'SSL');
		$this->data['wishlist'] = $this->url->link('account/wishlist', '', 'SSL');
		$this->data['newsletter'] = $this->url->link('account/newsletter', '', 'SSL');		

		$this->data['powered'] = sprintf($this->language->get('text_powered'), $this->config->get('config_name'), date('Y', time()));
		
		 
					
		// Whos Online
		if ($this->config->get('config_customer_online')) {
			$this->load->model('tool/online');
	
			if (isset($this->request->server['REMOTE_ADDR'])) {
				$ip = $this->request->server['REMOTE_ADDR'];	
			} else {
				$ip = ''; 
			}
			
			if (isset($this->request->server['HTTP_HOST']) && isset($this->request->server['REQUEST_URI'])) {
				$url = 'http://' . $this->request->server['HTTP_HOST'] . $this->request->server['REQUEST_URI'];	
			} else {
				$url = '';
			}
			
			if (isset($this->request->server['HTTP_REFERER'])) {
				$referer = $this->request->server['HTTP_REFERER'];	
			} else {
				$referer = '';
			}
						
			$this->model_tool_online->whosonline($ip, $this->customer->getId(), $url, $referer);
		}		
		$this->language->load('module/kdo_category');
		
		$this->data['heading_title'] = $this->language->get('heading_title');
		
		if (isset($this->request->get['path'])) {
			$parts = explode('_', (string)$this->request->get['path']);
		} else {
			$parts = array();
		}
		
		if (isset($parts[0])) {
			$this->data['category_id'] = $parts[0];
		} else {
			$this->data['category_id'] = 0;
		}
		
		if (isset($parts[1])) {
			$this->data['child_id'] = $parts[1];
		} else {
			$this->data['child_id'] = 0;
		}
		
		if (isset($parts[2])) {
			$this->data['sisters_id'] = $parts[2];
		} else {
			$this->data['sisters_id'] = 0;
		} 
		
		$this->load->model('catalog/kdo_category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));

			$children_data = array();
			
			$sister_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);
	$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,
				'sister'    => $sister_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
				);	
		}
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/footer.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/footer.tpl';
		} else {
			$this->template = 'default/template/common/footer.tpl';
		}

		$this->children = array(
		   'common/column_left_end'
		);
		
		$this->render();
		
		
	}
	
	public function success() {
		$this->language->load('module/callback');

		$this->document->SetTitle($this->language->get('quote')); 
    	
		$this->data['heading_title'] = $this->language->get('heading_title');
	
		$this->data['text_message'] = $this->language->get('text_message');
	
		$this->data['button_continue'] = $this->language->get('button_continue');
		
		$this->data['continue'] = HTTP_SERVER . 'index.php?route=common/home';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/quote_success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/quote_success.tpl';
		} else {
			$this->template = 'default/template/common/quote_success.tpl';
		}


		$this->children = array(
			'common/column_left',
			'common/column_right',
			'common/content_top',
			'common/content_bottom',
			'common/footer',
			'common/header'		
		);
		
 		$this->response->setOutput($this->render(TRUE), $this->config->get('config_compression')); 
	}
		
	private function validate() {

	    	if (($this->request->post['name'])==""||($this->request->post['postcode'])==""||($this->request->post['email'])==""||($this->request->post['number'])==""||($this->request->post['callback'])=="") {
	      		$this->error['enquiry'] = $this->language->get('error_enquiry');
	    	}
		if (($this->request->post['email'])!=""){
				if(!filter_var($this->request->post['email'], FILTER_VALIDATE_EMAIL)){
					$this->error['email'] = $this->language->get('error_email');
				}
				
			}
		if (!$this->error) {
	  		return TRUE;
		} else {
	  		return FALSE;
		}  	  
  	}
}
?>