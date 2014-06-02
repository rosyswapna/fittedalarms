<?php 
class ControllerInformationContact extends Controller {
	private $error_contact = array(); 
	    
  	public function index() {
		$this->language->load('information/contact');
		
		$this->load->model('catalog/contact');

    	$this->document->setTitle($this->language->get('heading_title'));  
		
		//print_r($_REQUEST);
	 
    	if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate_contact()) {
			$this->model_catalog_contact->addContact($this->request->post);		
			 
			

			$mail = new Mail();
			$mail->protocol = $this->config->get('config_mail_protocol');
			$mail->parameter = $this->config->get('config_mail_parameter');
			$mail->hostname = $this->config->get('config_smtp_host');
			$mail->username = $this->config->get('config_smtp_username');
			$mail->password = $this->config->get('config_smtp_password');
			$mail->port = $this->config->get('config_smtp_port');
			$mail->timeout = $this->config->get('config_smtp_timeout');				
			$mail->setTo($this->request->post['email']);
	  		$mail->setFrom($this->config->get('config_email'));
	  		$mail->setSender($this->request->post['name']);
	  		$mail->setSubject(html_entity_decode(sprintf($this->language->get('email_subject'), $this->request->post['name']), ENT_QUOTES, 'UTF-8'));
	  		$mail->setText("Hello".html_entity_decode($this->request->post['name'])."</br>".
			"Thank you for your time for being with us. We have received your request. Please allow us 24 hours to process your query.".
			"</br>".
			"For immediate reply please ring us on 020 3137 8727".
			"</br>".
			"Sincerely".
			"</br>".
			"Fitted Home Alarm Team"."</br>"
);
      		$mail->send();
/*			echo "<pre>";
			print_r($mail);exit();
			echo "</pre>"*/;
			//$this->redirect($this->url->link('information/contact/success', 'token=' . $this->session->data['token'] . $url, 'SSL'));
	  		$this->redirect($this->url->link('information/contact/success'));
    	}

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),        	
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/contact'),
        	'separator' => $this->language->get('text_separator')
      	);	
			
    	$this->data['heading_title'] = $this->language->get('heading_title');
		
		$this->data['text_contact_sub_head1'] = $this->language->get('text_contact_sub_head1');
		$this->data['text_contact_sub_head'] = $this->language->get('text_contact_sub_head');
    	$this->data['text_location'] = $this->language->get('text_location');
		$this->data['text_contact'] = $this->language->get('text_contact');
		$this->data['text_address'] = $this->language->get('text_address');
    	$this->data['text_telephone'] = $this->language->get('text_telephone');
    	$this->data['text_fax'] = $this->language->get('text_fax');

    	$this->data['entry_name'] = $this->language->get('entry_name');
    	$this->data['entry_email'] = $this->language->get('entry_email');
    	$this->data['entry_postcode'] = $this->language->get('entry_postcode');
		$this->data['entry_captcha'] = $this->language->get('entry_captcha');
		$this->data['entry_call_back'] = $this->language->get('entry_call_back');
		$this->data['entry_contact'] = $this->language->get('entry_contact');
		$this->data['entry_comments'] = $this->language->get('entry_comments');

		if (isset($this->error_contact['name'])) {
    		$this->data['error_contact_name'] = $this->error_contact['name'];
		} else {
			$this->data['error_contact_name'] = '';
		}
		
		if (isset($this->error_contact['email'])) {
			$this->data['error_contact_email'] = $this->error_contact['email'];
		} else {
			$this->data['error_contact_email'] = '';
		}		
		
		if (isset($this->error_contact['enquiry'])) {
			$this->data['error_contact_enquiry'] = $this->error_contact['enquiry'];
		} else {
			$this->data['error_contact_enquiry'] = '';
		}		
		
 		if (isset($this->error_contact['captcha'])) {
			$this->data['error_contact_captcha'] = $this->error_contact['captcha'];
		} else {
			$this->data['error_contact_captcha'] = '';
		}
		if (isset($this->error_contact['postcode'])) {
			$this->data['error_contact_postcode'] = $this->error_contact['postcode'];
		} else {
			$this->data['error_contact_postcode'] = '';
		}
		if (isset($this->error_contact['call_back'])) {
			$this->data['error_contact_call_back'] = $this->error_contact['call_back'];
		} else {
			$this->data['error_contact_call_back'] = '';
		}
		if (isset($this->error_contact['contact'])) {
			$this->data['error_contact_contact'] = $this->error_contact['contact'];
		} else {
			$this->data['error_contact_contact'] = '';
		}
		if (isset($this->error_contact['fields'])) {
			$this->data['error_contact_fields'] = $this->error_contact['fields'];
		} else {
			$this->data['error_contact_fields'] = '';
		}	

    	$this->data['button_continue'] = $this->language->get('button_continue');
    
		$this->data['action'] = $this->url->link('information/contact');
		$this->data['store'] = $this->config->get('config_name');
    	$this->data['address'] = nl2br($this->config->get('config_address'));
    	$this->data['telephone'] = $this->config->get('config_telephone');
    	$this->data['fax'] = $this->config->get('config_fax');
    	
		if (isset($this->request->post['name'])) {
			$this->data['name'] = $this->request->post['name'];
		} else {
			$this->data['name'] = $this->customer->getFirstName();
		}

		if (isset($this->request->post['email'])) {
			$this->data['email'] = $this->request->post['email'];
		} else {
			$this->data['email'] = $this->customer->getEmail();
		}
		
		if (isset($this->request->post['enquiry'])) {
			$this->data['enquiry'] = $this->request->post['enquiry'];
		} else {
			$this->data['enquiry'] = '';
		}
		
		if (isset($this->request->post['captcha'])) {
			$this->data['captcha'] = $this->request->post['captcha'];
		} else {
			$this->data['captcha'] = '';
		}		

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/contact.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/information/contact.tpl';
		} else {
			$this->template = 'default/template/information/contact.tpl';
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
		$this->language->load('information/contact');

		$this->document->setTitle($this->language->get('heading_title')); 

      	$this->data['breadcrumbs'] = array();

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('text_home'),
			'href'      => $this->url->link('common/home'),
        	'separator' => false
      	);

      	$this->data['breadcrumbs'][] = array(
        	'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('information/contact'),
        	'separator' => $this->language->get('text_separator')
      	);	
		
    	$this->data['heading_title'] = $this->language->get('heading_title');

    	$this->data['text_message'] = $this->language->get('text_message');

    	$this->data['button_continue'] = $this->language->get('button_continue');

    	$this->data['continue'] = $this->url->link('common/home');

		if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/common/success.tpl')) {
			$this->template = $this->config->get('config_template') . '/template/common/success.tpl';
		} else {
			$this->template = 'default/template/common/success.tpl';
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
	
  	protected function validate_contact() {

		if (($this->request->post['contact'])==""||($this->request->post['postcode'])==""||($this->request->post['call_back'])==""||($this->request->post['enquiry'])==""||($this->request->post['email'])==""||($this->request->post['name'])=="") {
      		$this->error_contact['fields'] = $this->language->get('error_contact_fields');
    	}
		if(($this->request->post['name'])!=""){
		if ((utf8_strlen($this->request->post['name']) < 3) || (utf8_strlen($this->request->post['name']) > 32)) {
      		$this->error_contact['name'] = $this->language->get('error_contact_name');
    	}	
		}
		if(($this->request->post['email'])!=""){
		if (!preg_match('/^[^\@]+@.*\.[a-z]{2,6}$/i', $this->request->post['email'])) {
      		$this->error_contact['email'] = $this->language->get('error_contact_email');
    	}	
		}
		if(($this->request->post['enquiry'])!=""){
		if ((utf8_strlen($this->request->post['enquiry']) < 10) || (utf8_strlen($this->request->post['enquiry']) > 3000)) {
      		$this->error_contact['enquiry'] = $this->language->get('error_contact_enquiry');
    	}	
		}

    	if (empty($this->session->data['captcha']) || ($this->session->data['captcha'] != $this->request->post['captcha'])) {
      		$this->error_contact['captcha'] = $this->language->get('error_contact_captcha');
    	}
		
		if (!$this->error_contact) {
	  		return true;
		} else {
	  		return false;
		}  	  
  	}

	public function captcha() {
		$this->load->library('captcha');
		
		$captcha = new Captcha();
		
		$this->session->data['captcha'] = $captcha->getCode();
		
		$captcha->showImage();
	}	
}
?>
