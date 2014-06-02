<?php
class ControllerInformationJobs extends Controller {
	private $error_jobs = array(); 
    public function index() {
        $this->language->load('information/jobs'); //Optional. This calls for your language file
 
        $this->document->setTitle($this->language->get('heading_title')); //Optional. Set the title of your web page.
		

	$this->data['cus_name'] = $this->language->get('cus_name');
	$this->data['cus_post_code'] = $this->language->get('cus_post_code');
	$this->data['cus_email'] = $this->language->get('cus_email');
	$this->data['cus_num'] = $this->language->get('cus_num');
	$this->data['cus_product'] = $this->language->get('cus_product');
	$this->data['cus_comments'] = $this->language->get('cus_comments');
	$this->data['cus_call_back'] = $this->language->get('cus_call_back');
	
 
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
 
        // We call this Fallback system
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/jobs.tpl')) { //if file exists in your current template folder
            $this->template = $this->config->get('config_template') . '/template/information/jobs.tpl'; //get it
        } else {
            $this->template = 'default/template/information/jobs.tpl'; //or get the file from the default folder
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
	

}
?>