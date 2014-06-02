<?php
class ControllerModuleGetcaptcha extends Controller {
	
	public function index(){
	        // We call this Fallback system
        if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/getcaptcha.tpl')) { //if file exists in your current template folder
            $this->template = $this->config->get('config_template') . '/template/module/getcaptcha.tpl'; //get it
        } else {
            $this->template = 'default/template/module/getcaptcha.tpl'; //or get the file from the default folder
        }	
	
	      $this->response->setOutput($this->render());}
}?>