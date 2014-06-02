<?php 
class ControllerAccountTroubleticket extends Controller {  
	public function index(){
		/*
				if (!$this->customer->isLogged()) {
	  		$this->session->data['redirect'] = $this->url->link('account/troubleticket', '', 'SSL');
	  
	  		$this->redirect($this->url->link('account/login', '', 'SSL'));
    	} */
		$this->language->load('account/troubleticket');
			$this->document->setTitle($this->language->get('heading_title'));
		
		
      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),       	
        	'separator' => false
      	); 

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_account'),
			'href'      => $this->url->link('account/account', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_newsletter'),
			'href'      => $this->url->link('account/newsletter', '', 'SSL'),
        	'separator' => $this->language->get('text_separator')
      	);
		
		
		$this->data['heading_title']=$this->language->get('heading_title');
		 // We call this Fallback system
        $this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['button_back'] = $this->language->get('button_back');

    	$this->data['action'] = $this->url->link('account/troubleticket', '', 'SSL');
		
		$this->data['newsletter'] = $this->customer->getNewsletter();
		
		$this->data['back'] = $this->url->link('account/account', '', 'SSL');

		$this->data['crm_link'] = '/crm/modules/Webforms/capture.php';



		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/troubleticket.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/troubleticket.tpl';
		} else {
			$this->template = 'default/template/account/troubleticket.tpl';
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
			
			
	public function success() {
		
		$this->language->load('account/troubleticket');
		$this->document->SetTitle($this->language->get('troubleticket')); 
    	$this->data['heading_title'] = $this->language->get('heading_title');
		$this->data['text_message'] = $this->language->get('text_message');
		$this->data['button_continue'] = $this->language->get('button_continue');
		$this->data['continue'] = HTTP_SERVER . 'index.php?route=common/home';

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/account/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/account/success.tpl';
		} else {
			$this->template = 'default/template/account/success.tpl';
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
		}
?>