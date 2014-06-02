<?php  
class ControllerModuleFooterspecail extends Controller {
	protected function index($setting) {
		$this->language->load('module/footerspecail');
		
    	$this->data['heading_title'] = sprintf($this->language->get('heading_title'), $this->config->get('config_name'));
    	
		
		$this->data['left'] = html_entity_decode($setting['description'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		
		$this->data['right'] = html_entity_decode($setting['description1'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		
		$this->data['center'] = html_entity_decode($setting['description2'][$this->config->get('config_language_id')], ENT_QUOTES, 'UTF-8');
		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/footerspecail.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/module/footerspecail.tpl';
		} else {
			$this->template = 'default/template/module/footerspecail.tpl';
		}
		
		$this->render();
	}
}
?>