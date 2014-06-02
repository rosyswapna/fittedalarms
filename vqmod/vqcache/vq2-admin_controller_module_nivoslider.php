<?php
class ControllerModuleNivoslider extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->load->language('module/nivoslider');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('nivoslider', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');

			$this->data['text_content_menu_over'] = $this->language->get('text_content_menu_over');
			$this->data['text_content_menu_under'] = $this->language->get('text_content_menu_under');
			$this->data['text_content_footer'] = $this->language->get('text_content_footer');
			
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['entry_banner'] = $this->language->get('entry_banner');
		$this->data['entry_dimension'] = $this->language->get('entry_dimension'); 
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
		$this->data['slide_slices']  	=	10;
		$this->data['slide_boxCols']	=	5;
		$this->data['slide_boxRows']	=	3;
		$this->data['slide_animSpeed']	=	1500;
		$this->data['slide_pauseTime']	=	1500;
		$this->data['slide_startSlide']	=	0;
	
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['dimension'])) {
			$this->data['error_dimension'] = $this->error['dimension'];
		} else {
			$this->data['error_dimension'] = array();
		}
		
  		$this->data['breadcrumbs'] = array();

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => false
   		);

   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('text_module'),
			'href'      => $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		//slider option
		$this->data['effect_style'] = $this->language->get('effect_style');
		$this->data['slices'] = $this->language->get('slices');
		$this->data['boxCols'] = $this->language->get('boxCols');
		$this->data['boxRows'] = $this->language->get('boxRows');
		$this->data['animSpeed'] = $this->language->get('animSpeed');
		$this->data['pauseTime'] = $this->language->get('pauseTime');
		$this->data['startSlide'] = $this->language->get('startSlide');
		
		
		
		
		$this->data['display_effect_option'] = $this->language->get('display_effect_option');
		
		
		if (isset($this->request->post['display_soption'])) {
			$this->data['display_soption'] = $this->request->post['display_soption'];
		} else {
			$this->data['display_soption'] = $this->config->get('display_soption');
		}
		
		if (isset($this->request->post['slide_slices'])) {
			$this->data['slide_slices'] = $this->request->post['slide_slices'];
		} elseif ($this->config->get('slide_slices')) { 
			$this->data['slide_slices'] = $this->config->get('slide_slices');
		}
		
		if (isset($this->request->post['slide_boxCols'])) {
			$this->data['slide_boxCols'] = $this->request->post['slide_boxCols'];
		} elseif ($this->config->get('slide_boxCols')) { 
			$this->data['slide_boxCols'] = $this->config->get('slide_boxCols');
		}
		
		if (isset($this->request->post['slide_boxRows'])) {
			$this->data['slide_boxRows'] = $this->request->post['slide_boxRows'];
		} elseif ($this->config->get('slide_boxRows')) { 
			$this->data['slide_boxRows'] = $this->config->get('slide_boxRows');
		}
		
		if (isset($this->request->post['slide_animSpeed'])) {
			$this->data['slide_animSpeed'] = $this->request->post['slide_animSpeed'];
		} elseif ($this->config->get('slide_animSpeed')) { 
			$this->data['slide_animSpeed'] = $this->config->get('slide_animSpeed');
		}
		
		if (isset($this->request->post['slide_pauseTime'])) {
			$this->data['slide_pauseTime'] = $this->request->post['slide_pauseTime'];
		} elseif ($this->config->get('slide_pauseTime')) { 
			$this->data['slide_pauseTime'] = $this->config->get('slide_pauseTime');
		}
		
		if (isset($this->request->post['slide_startSlide'])) {
			$this->data['slide_startSlide'] = $this->request->post['slide_startSlide'];
		} elseif ($this->config->get('slide_startSlide')) { 
			$this->data['slide_startSlide'] = $this->config->get('slide_startSlide');
		}
		
		
		
		
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/nivoslider', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/nivoslider', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['modules'] = array();
		
		if (isset($this->request->post['nivoslider_module'])) {
			$this->data['modules'] = $this->request->post['nivoslider_module'];
		} elseif ($this->config->get('nivoslider_module')) { 
			$this->data['modules'] = $this->config->get('nivoslider_module');
		}	
						
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();

		$this->load->model('design/banner');
		
		$this->data['banners'] = $this->model_design_banner->getBanners();
		
		$this->template = 'module/nivoslider.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/nivoslider')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (isset($this->request->post['nivoslider_module'])) {
			foreach ($this->request->post['nivoslider_module'] as $key => $value) {
				if (!$value['width'] || !$value['height']) {
					$this->error['dimension'][$key] = $this->language->get('error_dimension');
				}				
			}
		}	
						
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>