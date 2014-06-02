<?php
class ControllerModuleCallback extends Controller {
	private $error = array(); 
    public function index() {
        $this->language->load('module/callback'); //Optional. This calls for your language file
 
        $this->document->setTitle($this->language->get('heading_title')); //Optional. Set the title of your web page.
		
		$this->load->model('catalog/callback');
		
	$this->data['entry_name'] = $this->language->get('entry_name');
	$this->data['entry_postcode'] = $this->language->get('entry_postcode');
	$this->data['entry_email'] = $this->language->get('entry_email');
	$this->data['entry_call_back'] = $this->language->get('entry_call_back');
	$this->data['entry_product'] = $this->language->get('entry_product');
	$this->data['entry_contact'] = $this->language->get('entry_contact');
	
 
        /*$this->data['breadcrumbs'] = array();
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('heading_title'),
            'href'      => $this->url->link('information/static'),
            'separator' => $this->language->get('text_separator')
        );*/
 
        // Text from language file
        $this->data['heading_title'] = $this->language->get('heading_title'); //Get "heading title"
      //  $this->data['text_content']  = $this->language->get('text_content');
	  
	  
	  if (($this->request->server['REQUEST_METHOD'] == 'POST')&& $this->validate()) {
			$this->model_catalog_callback->addCallback($this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('module/callback/success', 'token=' . $this->session->data['token'] . $url, 'SSL')); 
						
		}
		
	  
	  if (isset($this->error['enquiry'])) {
			$this->data['error_enquiry'] = $this->error['enquiry'];
		} else {
			$this->data['error_enquiry'] = '';
		}
		
		if (isset($this->error['email'])) {
			$this->data['error_email'] = $this->error['email'];
		} else {
			$this->data['error_email'] = '';
		}
	  
	  
	  //category Selection
	  $this->language->load('module/category');
		
		
	
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
							
		$this->load->model('catalog/category');

		$this->load->model('catalog/product');

		$this->data['categories'] = array();

		$categories = $this->model_catalog_category->getCategories(0);

		foreach ($categories as $category) {
			$total = $this->model_catalog_product->getTotalProducts(array('filter_category_id' => $category['category_id']));

			$children_data = array();

			$children = $this->model_catalog_category->getCategories($category['category_id']);

			foreach ($children as $child) {
				$data = array(
					'filter_category_id'  => $child['category_id'],
					'filter_sub_category' => true
				);

				$product_total = $this->model_catalog_product->getTotalProducts($data);

				$total += $product_total;

				$children_data[] = array(
					'category_id' => $child['category_id'],
					'name'        => $child['name'] . ($this->config->get('config_product_count') ? ' (' . $product_total . ')' : ''),
					'href'        => $this->url->link('product/category', 'path=' . $category['category_id'] . '_' . $child['category_id'])	
				);		
			}

			$this->data['categories'][] = array(
				'category_id' => $category['category_id'],
				'name'        => $category['name'] . ($this->config->get('config_product_count') ? ' (' . $total . ')' : ''),
				'children'    => $children_data,
				'href'        => $this->url->link('product/category', 'path=' . $category['category_id'])
			);	
		}
 
 //End of category
 
 		$this->data['action'] = HTTP_SERVER . 'index.php?route=module/callback';
 
        // We call this Fallback system
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/callback.tpl')) { //if file exists in your current template folder
            $this->template = $this->config->get('config_template') . '/template/module/callback.tpl'; //get it
        } else {
            $this->template = 'default/template/module/callback.tpl'; //or get the file from the default folder
        }
 
        //Required. The children files for the page.
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