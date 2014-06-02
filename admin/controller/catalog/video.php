<?php  
class ControllerCatalogVideo extends Controller {
	private $error = array();
	public function index() {
		$this->language->load('catalog/video');

		$this->load->model('catalog/video');

		$this->document->setTitle($this->language->get('heading_title'));
    	
    	$this->getList();
	
  	}

  	public function insert() {
		$this->language->load('catalog/video');
    
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/video');
			
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {

			//echo "<pre>";print_r($this->request->post);echo "</pre>";exit();
			$this->model_catalog_video->addVideo($this->request->post);
   	  		
			$this->session->data['success'] = $this->language->get('text_success');
	  
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/video', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
	
    	$this->getForm();
  	}

  	public function update() {
  		$this->language->load('catalog/video');

    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/video');

		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validateForm()) {
			$this->model_catalog_video->editVideo($this->request->get['video_id'], $this->request->post);

			$this->session->data['success'] = $this->language->get('text_success');
	      
			$url = '';
			
			if (isset($this->request->get['sort'])) {
				$url .= '&sort=' . $this->request->get['sort'];
			}

			if (isset($this->request->get['order'])) {
				$url .= '&order=' . $this->request->get['order'];
			}

			if (isset($this->request->get['page'])) {
				$url .= '&page=' . $this->request->get['page'];
			}
			
			$this->redirect($this->url->link('catalog/video', 'token=' . $this->session->data['token'] . $url, 'SSL'));
		}
		
    	$this->getForm();

  	}

  	public function delete() {
		$this->language->load('catalog/video');
 
    	$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('catalog/video');
			
    	

    	$this->getList();
  	}

  	protected function validateForm() { 
    	if (!$this->user->hasPermission('modify', 'catalog/video')) {
      		$this->error['warning'] = $this->language->get('error_permission');
    	}

    	foreach ($this->request->post['video_description'] as $language_id => $value) {
      		if ((utf8_strlen($value['name']) < 3) || (utf8_strlen($value['name']) > 255)) {
        		$this->error['name'][$language_id] = $this->language->get('error_name');
      		}
    	}

    	if (utf8_strlen($this->request->post['video_url']) < 4) {
      		$this->error['video_url'] = $this->language->get('error_url');
    	}

			
		if (!$this->error) {
	  		return true;
		} else {
	  		return false;
		}
  	}


  	protected function getList() {
  		//---------------------------------------------------
		$url = '';	
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
			$sort = $this->request->get['sort'];
		}else{
			$sort = 'vd.name';
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
			$order = $this->request->get['order'];
		}else{
			$order = 'ASC';
		}

		if (isset($this->request->get['page'])) {
			$url .= '&page=' . $this->request->get['page'];
			$page = $this->request->get['page'];
		}else{
			$page = 1;
		}
		//---------------------------------------------------

		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),       		
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('catalog/video', 'token=' . $this->session->data['token'] . $url, 'SSL'),
      		'separator' => ' :: '
   		);
   		//-------------------------------------------------------------------

    	if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		//--------------------------------------------------------------------

		if (isset($this->session->data['success'])) {
			$this->data['success'] = $this->session->data['success'];
		
			unset($this->session->data['success']);
		} else {
			$this->data['success'] = '';
		}
		//--------------------------------------------------------------------

		$this->data['videos'] = array();

		$data = array(
			'sort'  => $sort,
			'order' => $order,
			'start' => ($page - 1) * $this->config->get('config_admin_limit'),
			'limit' => $this->config->get('config_admin_limit')
		);
		
		$video_total = $this->model_catalog_video->getTotalVideos();
	
		$results = $this->model_catalog_video->getVideos($data);
		foreach ($results as $result) {
			$action = array();
			if($result['product_id'] >0){
				$action = false;
			}else{
				$action[] = array(
				'text' => $this->language->get('text_edit'),
				'href' => $this->url->link('catalog/video/update', 'token=' . $this->session->data['token'] . '&video_id=' . $result['video_id'] . $url, 'SSL')
				);
			}
						
			

			$this->data['videos'][] = array(
				'video_id' => $result['video_id'],
				'name'        => $result['name'],
				'video_url'   => $result['video_url'],
				'selected'    => isset($this->request->post['selected']) && in_array($result['video_id'], $this->request->post['selected']),
				'action'      => $action
			);
		}
		//-------------------------------------------------------------------

		$this->data['insert'] = $this->url->link('catalog/video/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		$this->data['delete'] = $this->url->link('catalog/video/delete', 'token=' . $this->session->data['token'] . $url, 'SSL');

		$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_no_results'] = $this->language->get('text_no_results');

		$this->data['column_name'] = $this->language->get('column_name');
		$this->data['column_url'] = $this->language->get('column_url');
		$this->data['column_action'] = $this->language->get('column_action');

		$this->data['button_insert'] = $this->language->get('button_insert');
		$this->data['button_delete'] = $this->language->get('button_delete');
		//-------------------------------------------------------------------------


		$pagination = new Pagination();
		$pagination->total = $video_total;
		$pagination->page = $page;
		$pagination->limit = $this->config->get('config_admin_limit');
		$pagination->text = $this->language->get('text_pagination');
		$pagination->url = $this->url->link('catalog/video', 'token=' . $this->session->data['token'] . $url . '&page={page}', 'SSL');

		$this->data['pagination'] = $pagination->render();

		$this->data['sort'] = $sort;
		$this->data['order'] = $order;
		//----------------------------------------------------------------------------
	
		$this->template = 'catalog/video_list.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
		//--------------------------------------------------------------------
				
		$this->response->setOutput($this->render());
  	}

  	protected function getForm() {
  		$this->data['heading_title'] = $this->language->get('heading_title');

  		$this->data['entry_name'] = $this->language->get('entry_name');
  		$this->data['entry_url'] = $this->language->get('entry_url');
  		$this->data['entry_description'] = $this->language->get('entry_description');
  		$this->data['entry_product'] = $this->language->get('entry_product');

  		$this->data['button_save'] = $this->language->get('button_save');
    	$this->data['button_cancel'] = $this->language->get('button_cancel');

    	$this->data['tab_general'] = $this->language->get('tab_general');
    	$this->data['tab_data'] = $this->language->get('tab_data');

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
		
  		if (isset($this->error['video_url'])) {
			$this->data['error_url'] = $this->error['video_url'];
		} else {
			$this->data['error_url'] = '';
		}


    	$url = '';
			
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
		}

		if (isset($this->request->get['order'])) {
			$url .= '&order=' . $this->request->get['order'];
		}
		
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
			'href'      => $this->url->link('catalog/video', 'token=' . $this->session->data['token'] . $url, 'SSL'),      		
      		'separator' => ' :: '
   		);

   		if (!isset($this->request->get['video_id'])) {
			$this->data['action'] = $this->url->link('catalog/video/insert', 'token=' . $this->session->data['token'] . $url, 'SSL');
		} else {
			$this->data['action'] = $this->url->link('catalog/video/update', 'token=' . $this->session->data['token'] . '&video_id=' . $this->request->get['video_id'] . $url, 'SSL');
		}

		$this->data['cancel'] = $this->url->link('catalog/video', 'token=' . $this->session->data['token'] . $url, 'SSL');

		if (isset($this->request->get['video_id']) && ($this->request->server['REQUEST_METHOD'] != 'POST')) {
			$video_info = $this->model_catalog_video->getVideo($this->request->get['video_id']);
    	}

  		$this->data['token'] = $this->session->data['token'];
  
  		if (isset($this->request->get['video_id'])) {
			$this->data['video_id'] = $this->request->get['video_id'];
		} else {
			$this->data['video_id'] = 0;
		}

		if (isset($this->request->post['video_description'])) {
			$this->data['video_description'] = $this->request->post['video_description'];
		} elseif (isset($this->request->get['video_id'])) {
			$this->data['video_description'] = $this->model_catalog_video->getVideoDescriptions($this->request->get['video_id']);
		} else {
			$this->data['video_description'] = array();
		} 
		//echo "<pre>";print_r($this->data['video_description']);echo "</pre>";exit();

		if (isset($this->request->post['video_url'])) {
    		$this->data['video_url'] = $this->request->post['video_url'];
    	} elseif (!empty($video_info)) {
      		$this->data['video_url'] = $video_info['video_url'];
		} else {
			$this->data['video_url'] = '';
		}
		
    	if (isset($this->request->post['product_id'])) {
    		$this->data['product_id'] = $this->request->post['product_id'];
    	} elseif (!empty($video_info)) {
      		$this->data['product_id'] = $video_info['product_id'];		
		} else {
			$this->data['product_id'] = '';
		}  
			

		$this->load->model('localisation/language');
		
		$this->data['languages'] = $this->model_localisation_language->getLanguages();

  		$this->template = 'catalog/video_form.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
  	}


}
?>