<?php  
class ControllerModuleNivoslider extends Controller {
	protected function index($setting) {
		static $module = 0;
		
		
		$this->load->model('design/banner');
		$this->load->model('tool/image');
		
		$this->document->addScript('catalog/view/javascript/jquery/nivo-slider/jquery.nivo.slider.pack.js');
		
		if (file_exists('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/nivoslider.css')) {
			$this->document->addStyle('catalog/view/theme/' . $this->config->get('config_template') . '/stylesheet/nivoslider.css');
		} else {
			$this->document->addStyle('catalog/view/theme/default/stylesheet/nivoslider.css');
		}
		
		$this->data['width'] = $setting['width'];
		$this->data['height'] = $setting['height'];
		
		
		
		$this->data['banners'] = array();
		
		if (isset($setting['banner_id'])) {
			$results = $this->model_design_banner->getBanner($setting['banner_id']);
			  
			foreach ($results as $result) {
				if (file_exists(DIR_IMAGE . $result['image'])) {
					$this->data['banners'][] = array(
						'title' => $result['title'],
						'link'  => $result['link'],
						'image' => $this->model_tool_image->resize($result['image'], $setting['width'], $setting['height'])
					);
				}
			}
		}
		
		$this->data['module'] = $module++;
						
		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/nivoslider.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/nivoslider.tpl';
		} else {
			$this->template = 'default/template/module/nivoslider.tpl';
		}
		//slider
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
		} else {
			$this->data['slide_startSlide']	=	0;
		}
		
		$this->render();
	}
}

?>