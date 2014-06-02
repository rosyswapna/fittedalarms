<?php 
class ControllerCatalogFeatures extends Controller { 
	private $error = array();
 
	public function index() {
		$this->language->load('catalog/features');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/features');
		 
		$this->getList();
	}

	public function insert() {
		$this->language->load('catalog/features');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/features');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_features->AddFeatures($this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');

			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/features', 'token=' . $this->session->data['token'] . $url, 'SSL')); 
		}

		$this->getForm();
	}

	public function update() {
		$this->language->load('catalog/features');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/features');
		
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_features->editFeature($this->request->get['feature_id'], $this->request->post);
			
			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
						
			$this->redirect($this->url->link('catalog/features', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}

		$this->getForm();
	}

	public function delete() {
		$this->language->load('catalog/features');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/features');
		
		if (isset($this->request->post['selected']) && $this->validateDelete()) {
			foreach ($this->request->post['selected'] as $feature_id) {
				$this->model_catalog_features->deleteFeature($feature_id);
			}

			$this->session->data['success'] = $this->language->get('text_success');
			
			$url = '';

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/features', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
		$this->getList();
	}
	
	public function repair() {/*
		$this->language->load('catalog/features');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/features');
		
		if ($this->validateRepair()) {
			$this->model_catalog_features->repairFeatures();

			$this->session->data['success'] = $this->language->get('text_success');
			
			$this->redirect($this->url->link('catalog/features', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		$this->getList();	
	*/}
	
	protected function getList() {
		if (isset($this->request->get['page'])) {
			$page = $this->request->get['page'];
		} else {
			$page = 1;
		}
		
		$url = '';
		
		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
		}
						
   		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/features', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
									
		$this->data['insert'] = $this->url->link('catalog/features/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/features/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['repair'] = $this->url->link('catalog/features/repair', 'token=' . $this->session->data['token'] . $url, 'SSL');
		
		$this->data['features'] = array();
		
		$data = array(
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
				
		$category_total = $this->model_catalog_features->getTotalFeatures();
		
		$results = $this->model_catalog_features->getFeatures($data);

		foreach ($results as $result) {
			$action = array();
						
			$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/features/update', 'token=' . $this->session->data['token'] . '&feature_id=' . $result['feature_id'] . $url, 'SSL')
			);

			$this->data['features'][] = array(
				'feature_id' => $result['feature_id'],
				'name'        => $result['name'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['feature_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}
		
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_sort_order'] = $this->language->get('column_sort_order');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
 		$this->data['button_repair'] = $this->language->get('button_repair');
 
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		
		$pagination = new Pagination();
		$pagination->total = $category_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/features', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');
			
		$this->data['pagination'] = $pagination->render();
		
		$this->template = 'catalog/features_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function getForm() {
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_none'] = $this->language->get('text_none');
		$this->data['text_default'] = $this->language->get('text_default');
		$this->data['text_image_manager'] = $this->language->get('text_image_manager');
		$this->data['text_browse'] = $this->language->get('text_browse');
		$this->data['text_clear'] = $this->language->get('text_clear');		
		$this->data['text_enabled'] = $this->language->get('text_enabled');
    	$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_percent'] = $this->language->get('text_percent');
		$this->data['text_amount'] = $this->language->get('text_amount');
				
		$this->data['entry_name'] = $this->language->get('entry_name');
		$this->data['entry_meta_keyword'] = $this->language->get('entry_meta_keyword');
		$this->data['entry_meta_description'] = $this->language->get('entry_meta_description');
		$this->data['entry_description'] = $this->language->get('entry_description');
		$this->data['entry_parent'] = $this->language->get('entry_parent');
		$this->data['entry_filter'] = $this->language->get('entry_filter');
		$this->data['entry_store'] = $this->language->get('entry_store');
		$this->data['entry_keyword'] = $this->language->get('entry_keyword');
		$this->data['entry_image'] = $this->language->get('entry_image');
		$this->data['entry_top'] = $this->language->get('entry_top');
		$this->data['entry_column'] = $this->language->get('entry_column');		
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');
		$this->data['tab_design'] = $this->language->get('tab_design');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
	
 		if (isset($this->error['name'])) {
			$this->data['error_name'] = $this->error['name'];
		} else {
			$this->data['error_name'] = array();
		}

  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/features', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		if (!isset($this->request->get['feature_id'])) {
			$this->data['action'] = $this->url->link('catalog/features/insert', 'token=' . $this->session->data['token'], 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/features/update', 'token=' . $this->session->data['token'] . '&feature_id=' . $this->request->get['feature_id'], 'SSL');
		}
		
		$this->data['cancel'] = $this->url->link('catalog/features', 'token=' . $this->session->data['token'], 'SSL');

		if (isset($this->request->get['feature_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
      		$feature_info = $this->model_catalog_features->getFeature($this->request->get['feature_id']);
    	}
		
		$this->data['token'] = $this->session->data['token'];
		
		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

	if (isset($this->request->post['features_description'])) {
			$this->data['features_description'] = $this->request->post['features_description'];
		} elseif (isset($this->request->get['feature_id'])) {
			$this->data['features_description'] = $this->model_catalog_features->getFeatureDescriptions($this->request->get['feature_id']);
		} else {
			$this->data['features_description'] = array();
		}

		/*	if (isset($this->request->post['path'])) {
			$this->data['path'] = $this->request->post['path'];
		} elseif (!empty($feature_info)) {
			$this->data['path'] = $feature_info['path'];
		} else {
			$this->data['path'] = '';
		}*/
		
		/*if (isset($this->request->post['parent_id'])) {
			$this->data['parent_id'] = $this->request->post['parent_id'];
		} elseif (!empty($feature_info)) {
			$this->data['parent_id'] = $feature_info['parent_id'];
		} else {
			$this->data['parent_id'] = 0;
		}*/

		$this->load->model('catalog/filter');
		
/*		if (isset($this->request->post['category_filter'])) {
			$filters = $this->request->post['category_filter'];
		} elseif (isset($this->request->get['feature_id'])) {		
			$filters = $this->model_catalog_features->getFeatureFilters($this->request->get['feature_id']);
		} else {
			$filters = array();
		}*/
	
		$this->data['category_filters'] = array();
		
		/*foreach ($filters as $filter_id) {
			$filter_info = $this->model_catalog_filter->getFilter($filter_id);
			
			if ($filter_info) {
				$this->data['category_filters'][] = array(
					'filter_id' => $filter_info['filter_id'],
					'name'      => $filter_info['group'] . ' &gt; ' . $filter_info['name']
				);
			}
		}	*/
										
		$this->load->model('setting/store');
		
		/*$this->data['stores'] = $this->model_setting_store->getStores();
		
		if (isset($this->request->post['category_store'])) {
			$this->data['category_store'] = $this->request->post['category_store'];
		} elseif (isset($this->request->get['feature_id'])) {
			$this->data['category_store'] = $this->model_catalog_features->getFeatureStores($this->request->get['feature_id']);
		} else {
			$this->data['category_store'] = array(0);
		}	*/		
		
		/*if (isset($this->request->post['keyword'])) {
			$this->data['keyword'] = $this->request->post['keyword'];
		} elseif (!empty($feature_info)) {
			$this->data['keyword'] = $feature_info['keyword'];
		} else {
			$this->data['keyword'] = '';
		}
*/
		if (isset($this->request->post['image'])) {
			$this->data['image'] = $this->request->post['image'];
		} elseif (!empty($feature_info)) {
			$this->data['image'] = $feature_info['image'];
		} else {
			$this->data['image'] = '';
		}
		
		$this->load->model('tool/image');

		if (isset($this->request->post['image']) && file_exists(DIR_IMAGE . $this->request->post['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($this->request->post['image'], 100, 100);
		} elseif (!empty($feature_info) && $feature_info['image'] && file_exists(DIR_IMAGE . $feature_info['image'])) {
			$this->data['thumb'] = $this->model_tool_image->resize($feature_info['image'], 100, 100);
		} else {
			$this->data['thumb'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		}
		
		$this->data['no_image'] = $this->model_tool_image->resize('no_image.jpg', 100, 100);
		
/*		if (isset($this->request->post['top'])) {
			$this->data['top'] = $this->request->post['top'];
		} elseif (!empty($feature_info)) {
			$this->data['top'] = $feature_info['top'];
		} else {
			$this->data['top'] = 0;
		}*/
		
		/*if (isset($this->request->post['column'])) {
			$this->data['column'] = $this->request->post['column'];
		} elseif (!empty($feature_info)) {
			$this->data['column'] = $feature_info['column'];
		} else {
			$this->data['column'] = 1;
		}
		*/		
/*		if (isset($this->request->post['sort_order'])) {
			$this->data['sort_order'] = $this->request->post['sort_order'];
		} elseif (!empty($feature_info)) {
			$this->data['sort_order'] = $feature_info['sort_order'];
		} else {
			$this->data['sort_order'] = 0;
		}*/
		
		if (isset($this->request->post['status'])) {
			$this->data['status'] = $this->request->post['status'];
		} elseif (!empty($feature_info)) {
			$this->data['status'] = $feature_info['status'];
		} else {
			$this->data['status'] = 1;
		}
				
		/*if (isset($this->request->post['category_layout'])) {
			$this->data['category_layout'] = $this->request->post['category_layout'];
		} elseif (isset($this->request->get['feature_id'])) {
			$this->data['category_layout'] = $this->model_catalog_features->getFeatureLayouts($this->request->get['feature_id']);
		} else {
			$this->data['category_layout'] = array();
		}
*/
		/*$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();*/
						
		$this->template = 'catalog/features_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}

	protected function validateForm() {
	
		if (!$this->user->hasPermission('modify', 'catalog/features')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}

/*		foreach ($this->request->post['features_description'] as $language_id => $value) {
			if ((utf8_strlen($value['name']) < 2) || (utf8_strlen($value['name']) > 255)) {
				$this->error['name'][$language_id] = $this->language->get('error_name');
			}
		}*/
		
		if ($this->error && !isset($this->error['warning'])) {
			$this->error['warning'] = $this->language->get('error_warning');
		}
					
		if (!$this->error) {
			return true;
		} else {
			return false;
		}
	}
	
	protected function validateDelete() {
		if (!$this->user->hasPermission('modify', 'catalog/features')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	}
	
	protected function validateRepair() {/*
		if (!$this->user->hasPermission('modify', 'catalog/features')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
 
		if (!$this->error) {
			return true; 
		} else {
			return false;
		}
	*/}
			
	public function autocomplete() {/*
		$json = array();
		
		if (isset($this->request->get['filter_name'])) {
			$this->load->model('catalog/features');
			
			$data = array(
				'filter_name' => $this->request->get['filter_name'],
				'start'       => 0,
				'limit'       => 20
			);
			
			$results = $this->model_catalog_features->getFeatures($data);
				
			foreach ($results as $result) {
				$json[] = array(
					'feature_id' => $result['feature_id'], 
					'name'        => strip_tags(html_entity_decode($result['name'], ENT_QUOTES, 'UTF-8'))
				);
			}		
		}

		$sort_order = array();
	  
		foreach ($json as $key => $value) {
			$sort_order[$key] = $value['name'];
		}

		array_multisort($sort_order, SORT_ASC, $json);

		$this->response->setOutput(json_encode($json));
	*/}		
}
?>