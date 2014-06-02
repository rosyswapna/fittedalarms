<?php
class ControllerModuleVtigerSync extends Controller {
	private $error = array(); 
	
	public function index() {   
		$this->language->load('module/vtiger_sync');

		$this->document->setTitle($this->language->get('heading_title'));
		
		$this->load->model('setting/setting');
				
		if (($this->request->server['REQUEST_METHOD'] == 'POST') && $this->validate()) {
			$this->model_setting_setting->editSetting('vtiger_sync', $this->request->post);		
					
			$this->session->data['success'] = $this->language->get('text_success');
						
			$this->redirect($this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL'));
		}
		
		//Load Order Status
		$this->load->model('localisation/order_status');
		
		$data = array(); //Emtpy array return all order status
		$this->data['order_statuses'] = $this->model_localisation_order_status->getOrderStatuses($data);
		
		//Load Vtiger Status
		$this->load->model('datasync/vtiger_sync');		
		$this->data['sync_roles'] = $this->model_datasync_vtiger_sync->getSyncRole('vtigercrm');
		$this->data['glaccts'] = $this->model_datasync_vtiger_sync->getSyncLookup('glacct');
		$this->data['invoicestatuses'] = $this->model_datasync_vtiger_sync->getSyncLookup('invoicestatus');
		$this->data['vtiger_invoicecfs'] = $this->model_datasync_vtiger_sync->getSyncLookup('vtiger_invoicecf');
		$this->data['vtiger_accountscf'] = $this->model_datasync_vtiger_sync->getSyncLookup('vtiger_accountscf');
		$this->data['vtiger_contactscf'] = $this->model_datasync_vtiger_sync->getSyncLookup('vtiger_contactscf');
		$this->data['vtiger_productcf'] = $this->model_datasync_vtiger_sync->getSyncLookup('vtiger_productcf');
 				
		$this->data['heading_title'] = $this->language->get('heading_title');

		$this->data['text_enabled'] = $this->language->get('text_enabled');
		$this->data['text_disabled'] = $this->language->get('text_disabled');
		$this->data['text_content_top'] = $this->language->get('text_content_top');
		$this->data['text_content_bottom'] = $this->language->get('text_content_bottom');		
		$this->data['text_column_left'] = $this->language->get('text_column_left');
		$this->data['text_column_right'] = $this->language->get('text_column_right');
		
		$this->data['text_yes'] = $this->language->get('text_yes');
		$this->data['text_no'] = $this->language->get('text_no');
		$this->data['text_vtiger_sync_auto_assigned'] = $this->language->get('text_vtiger_sync_auto_assigned');
		$this->data['text_vtiger_sync_debug_mode'] = $this->language->get('text_vtiger_sync_debug_mode');		
		$this->data['text_vtiger_sync_powered_by'] = $this->language->get('text_vtiger_sync_powered_by');
		
		$this->data['text_vtiger_sync_tab_general'] = $this->language->get('text_vtiger_sync_tab_general');
		$this->data['text_vtiger_sync_tab_vtiger'] = $this->language->get('text_vtiger_sync_tab_vtiger');
		$this->data['text_vtiger_sync_tab_account'] = $this->language->get('text_vtiger_sync_tab_account');
		$this->data['text_vtiger_sync_tab_invoice'] = $this->language->get('text_vtiger_sync_tab_invoice');
		
		$this->data['text_vtiger_sync_gl_account'] = $this->language->get('text_vtiger_sync_gl_account');
		$this->data['text_vtiger_sync_user_role'] = $this->language->get('text_vtiger_sync_user_role');
		$this->data['text_vtiger_sync_default_sync_status'] = $this->language->get('text_vtiger_sync_default_sync_status');
		$this->data['text_vtiger_sync_default_invoice_status'] = $this->language->get('text_vtiger_sync_default_invoice_status');
		$this->data['text_vtiger_sync_default_custom_field'] = $this->language->get('text_vtiger_sync_default_custom_field');
		$this->data['text_vtiger_sync_default_invoice_product_attribute'] = $this->language->get('text_vtiger_sync_default_invoice_product_attribute');
		$this->data['text_vtiger_sync_load_params_data'] = $this->language->get('text_vtiger_sync_load_params_data');
		$this->data['text_vtiger_sync_shipping_handling_charge_tax'] = $this->language->get('text_vtiger_sync_shipping_handling_charge_tax');
		$this->data['text_individual'] = $this->language->get('text_individual');
		$this->data['text_group'] = $this->language->get('text_group');
		$this->data['text_percentage'] = $this->language->get('text_percentage');
		$this->data['text_amount'] = $this->language->get('text_amount');
		
		$this->data['entry_vtiger_sync_url'] = $this->language->get('entry_vtiger_sync_url');
		$this->data['entry_vtiger_sync_eg'] = $this->language->get('entry_vtiger_sync_eg');
		$this->data['entry_vtiger_sync_user_id'] = $this->language->get('entry_vtiger_sync_user_id');
		$this->data['entry_vtiger_sync_accesskey'] = $this->language->get('entry_vtiger_sync_accesskey');
		$this->data['entry_vtiger_sync_status'] = $this->language->get('entry_vtiger_sync_status');
		$this->data['entry_vtiger_sync_auto_assigned'] = $this->language->get('entry_vtiger_sync_auto_assigned');
		$this->data['entry_vtiger_sync_debug_mode'] = $this->language->get('entry_vtiger_sync_debug_mode');		
		
		$this->data['entry_vtiger_sync_sales_order_status'] = $this->language->get('entry_vtiger_sync_sales_order_status');
		$this->data['entry_vtiger_sync_invoice_status'] = $this->language->get('entry_vtiger_sync_invoice_status');
		$this->data['entry_vtiger_sync_delivered_status'] = $this->language->get('entry_vtiger_sync_delivered_status');
		
		$this->data['entry_vtiger_sync_gl_account'] = $this->language->get('entry_vtiger_sync_gl_account');
		$this->data['entry_vtiger_sync_user_role'] = $this->language->get('entry_vtiger_sync_user_role');
		$this->data['entry_vtiger_sync_default_sync_status'] = $this->language->get('entry_vtiger_sync_default_sync_status');
		$this->data['entry_vtiger_sync_default_invoice_status'] = $this->language->get('entry_vtiger_sync_default_invoice_status');
		$this->data['entry_vtiger_sync_default_custom_field'] = $this->language->get('entry_vtiger_sync_default_custom_field');
		$this->data['entry_vtiger_sync_default_invoice_product_attribute'] = $this->language->get('entry_vtiger_sync_default_invoice_product_attribute');
		$this->data['entry_vtiger_sync_shipping_handling_charge_tax'] = $this->language->get('entry_vtiger_sync_shipping_handling_charge_tax');
		$this->data['entry_vtiger_sync_tax_mode'] = $this->language->get('entry_vtiger_sync_tax_mode');
		$this->data['entry_vtiger_sync_discount_type_final'] = $this->language->get('entry_vtiger_sync_discount_type_final');
		
		$this->data['entry_vtiger_sync_account_customer_id'] = $this->language->get('entry_vtiger_sync_account_customer_id');
		$this->data['entry_vtiger_sync_contact_id'] = $this->language->get('entry_vtiger_sync_contact_id');
		$this->data['entry_vtiger_sync_product_id'] = $this->language->get('entry_vtiger_sync_product_id');
		
		$this->data['entry_layout'] = $this->language->get('entry_layout');
		$this->data['entry_position'] = $this->language->get('entry_position');
		$this->data['entry_status'] = $this->language->get('entry_status');
		$this->data['entry_sort_order'] = $this->language->get('entry_sort_order');
		
		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');
		$this->data['button_add_module'] = $this->language->get('button_add_module');
		$this->data['button_remove'] = $this->language->get('button_remove');
		
 		if (isset($this->error['warning'])) {
			$this->data['error_warning'] = $this->error['warning'];
		} else {
			$this->data['error_warning'] = '';
		}
		
		if (isset($this->error['vtiger_sync_url'])) {
			$this->data['error_vtiger_sync_url'] = $this->error['vtiger_sync_url'];
		} else {
			$this->data['error_vtiger_sync_url'] = '';
		}
		
		if (isset($this->error['vtiger_sync_user_id'])) {
			$this->data['error_vtiger_sync_user_id'] = $this->error['vtiger_sync_user_id'];
		} else {
			$this->data['error_vtiger_sync_user_id'] = '';
		}
		
		if (isset($this->error['vtiger_sync_accesskey'])) {
			$this->data['error_vtiger_sync_accesskey'] = $this->error['vtiger_sync_accesskey'];
		} else {
			$this->data['error_vtiger_sync_accesskey'] = '';
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
		
   		$this->data['breadcrumbs'][] = array(
       		'text'      => $this->language->get('heading_title'),
			'href'      => $this->url->link('module/vtiger_sync', 'token=' . $this->session->data['token'], 'SSL'),
      		'separator' => ' :: '
   		);
		
		$this->data['action'] = $this->url->link('module/vtiger_sync', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('extension/module', 'token=' . $this->session->data['token'], 'SSL');
		
		if (isset($this->request->post['vtiger_sync_url'])) {
			$this->data['vtiger_sync_url'] = $this->request->post['vtiger_sync_url'];
		} else {
			$this->data['vtiger_sync_url'] = $this->config->get('vtiger_sync_url');
		}

		if (isset($this->request->post['vtiger_sync_user_id'])) {
			$this->data['vtiger_sync_user_id'] = $this->request->post['vtiger_sync_user_id'];
		} else {
			$this->data['vtiger_sync_user_id'] = $this->config->get('vtiger_sync_user_id');
		}
		
		if (isset($this->request->post['vtiger_sync_accesskey'])) {
			$this->data['vtiger_sync_accesskey'] = $this->request->post['vtiger_sync_accesskey'];
		} else {
			$this->data['vtiger_sync_accesskey'] = $this->config->get('vtiger_sync_accesskey');
		}
		
		if (isset($this->request->post['vtiger_sync_status'])) {
			$this->data['vtiger_sync_status'] = $this->request->post['vtiger_sync_status'];
		} else {
			$this->data['vtiger_sync_status'] = $this->config->get('vtiger_sync_status');
		}
		
		if (isset($this->request->post['vtiger_sync_debug_mode'])) {
			$this->data['vtiger_sync_debug_mode'] = $this->request->post['vtiger_sync_debug_mode'];
		} else {
			$this->data['vtiger_sync_debug_mode'] = $this->config->get('vtiger_sync_debug_mode');
		}
		
		if (isset($this->request->post['vtiger_sync_auto_assigned'])) {
			$this->data['vtiger_sync_auto_assigned'] = $this->request->post['vtiger_sync_auto_assigned'];
		} else {
			$this->data['vtiger_sync_auto_assigned'] = $this->config->get('vtiger_sync_auto_assigned');
		}
		
		if (isset($this->request->post['vtiger_sync_sales_order_status'])) {
			$this->data['vtiger_sync_sales_order_status'] = $this->request->post['vtiger_sync_sales_order_status'];
		} else {
			$this->data['vtiger_sync_sales_order_status'] = $this->config->get('vtiger_sync_sales_order_status');
		}
		
		if (isset($this->request->post['vtiger_sync_invoice_status'])) {
			$this->data['vtiger_sync_invoice_status'] = $this->request->post['vtiger_sync_invoice_status'];
		} else {
			$this->data['vtiger_sync_invoice_status'] = $this->config->get('vtiger_sync_invoice_status');
		}
		
		if (isset($this->request->post['vtiger_sync_delivered_status'])) {
			$this->data['vtiger_sync_delivered_status'] = $this->request->post['vtiger_sync_delivered_status'];
		} else {
			$this->data['vtiger_sync_delivered_status'] = $this->config->get('vtiger_sync_delivered_status');
		}
		
		if (isset($this->request->post['vtiger_sync_gl_account'])) {
			$this->data['vtiger_sync_gl_account'] = $this->request->post['vtiger_sync_gl_account'];
		} else {
			$this->data['vtiger_sync_gl_account'] = $this->config->get('vtiger_sync_gl_account');
		}
		
		if (isset($this->request->post['vtiger_sync_user_role'])) {
			$this->data['vtiger_sync_user_role'] = $this->request->post['vtiger_sync_user_role'];
		} else {
			$this->data['vtiger_sync_user_role'] = $this->config->get('vtiger_sync_user_role');
		}
		
		if (isset($this->request->post['vtiger_sync_default_invoice_status'])) {
			$this->data['vtiger_sync_default_invoice_status'] = $this->request->post['vtiger_sync_default_invoice_status'];
		} else {
			$this->data['vtiger_sync_default_invoice_status'] = $this->config->get('vtiger_sync_default_invoice_status');
		}
		
		if (isset($this->request->post['vtiger_sync_default_invoice_product_attribute'])) {
			$this->data['vtiger_sync_default_invoice_product_attribute'] = $this->request->post['vtiger_sync_default_invoice_product_attribute'];
		} else {
			$this->data['vtiger_sync_default_invoice_product_attribute'] = $this->config->get('vtiger_sync_default_invoice_product_attribute');
		}	
		
		if (isset($this->request->post['vtiger_sync_shipping_handling_charge_tax'])) {
			$this->data['vtiger_sync_shipping_handling_charge_tax'] = $this->request->post['vtiger_sync_shipping_handling_charge_tax'];
		} else {
			$this->data['vtiger_sync_shipping_handling_charge_tax'] = $this->config->get('vtiger_sync_shipping_handling_charge_tax');
		}
		
		if (isset($this->request->post['vtiger_sync_tax_mode'])) {
			$this->data['vtiger_sync_tax_mode'] = $this->request->post['vtiger_sync_tax_mode'];
		} else {
			$this->data['vtiger_sync_tax_mode'] = $this->config->get('vtiger_sync_tax_mode');
		}
		
		if (isset($this->request->post['vtiger_sync_discount_type_final'])) {
			$this->data['vtiger_sync_discount_type_final'] = $this->request->post['vtiger_sync_discount_type_final'];
		} else {
			$this->data['vtiger_sync_discount_type_final'] = $this->config->get('vtiger_sync_discount_type_final');
		}
		
		if (isset($this->request->post['vtiger_sync_account_customer_id'])) {
			$this->data['vtiger_sync_account_customer_id'] = $this->request->post['vtiger_sync_account_customer_id'];
		} else {
			$this->data['vtiger_sync_account_customer_id'] = $this->config->get('vtiger_sync_account_customer_id');
		}
		
		if (isset($this->request->post['vtiger_sync_contact_id'])) {
			$this->data['vtiger_sync_contact_id'] = $this->request->post['vtiger_sync_contact_id'];
		} else {
			$this->data['vtiger_sync_contact_id'] = $this->config->get('vtiger_sync_contact_id');
		}
		
		if (isset($this->request->post['vtiger_sync_product_id'])) {
			$this->data['vtiger_sync_product_id'] = $this->request->post['vtiger_sync_product_id'];
		} else {
			$this->data['vtiger_sync_product_id'] = $this->config->get('vtiger_sync_product_id');
		}
		
		if (isset($this->request->post['vtiger_sync_module'])) {
			$modules = explode(',', $this->request->post['vtiger_sync_module']);
		} elseif ($this->config->get('vtiger_sync_module') != '') {
			$modules = explode(',', $this->config->get('vtiger_sync_module'));
		} else {
			$modules = array();
		}		
				
		$this->load->model('design/layout');
		
		$this->data['layouts'] = $this->model_design_layout->getLayouts();
				
		foreach ($modules as $module) {
			if (isset($this->request->post['vtiger_sync_' . $module . '_layout_id'])) {
				$this->data['vtiger_sync_' . $module . '_layout_id'] = $this->request->post['vtiger_sync_' . $module . '_layout_id'];
			} else {
				$this->data['vtiger_sync_' . $module . '_layout_id'] = $this->config->get('vtiger_sync_' . $module . '_layout_id');
			}	
			
			if (isset($this->request->post['vtiger_sync_' . $module . '_position'])) {
				$this->data['vtiger_sync_' . $module . '_position'] = $this->request->post['vtiger_sync_' . $module . '_position'];
			} else {
				$this->data['vtiger_sync_' . $module . '_position'] = $this->config->get('vtiger_sync_' . $module . '_position');
			}	
			
			if (isset($this->request->post['vtiger_sync_' . $module . '_status'])) {
				$this->data['vtiger_sync_' . $module . '_status'] = $this->request->post['vtiger_sync_' . $module . '_status'];
			} else {
				$this->data['vtiger_sync_' . $module . '_status'] = $this->config->get('vtiger_sync_' . $module . '_status');
			}	
						
			if (isset($this->request->post['vtiger_sync_' . $module . '_sort_order'])) {
				$this->data['vtiger_sync_' . $module . '_sort_order'] = $this->request->post['vtiger_sync_' . $module . '_sort_order'];
			} else {
				$this->data['vtiger_sync_' . $module . '_sort_order'] = $this->config->get('vtiger_sync_' . $module . '_sort_order');
			}				
		}
		
		$this->data['modules'] = $modules;
		
		if (isset($this->request->post['vtiger_sync_module'])) {
			$this->data['vtiger_sync_module'] = $this->request->post['vtiger_sync_module'];
		} else {
			$this->data['vtiger_sync_module'] = $this->config->get('vtiger_sync_module');
		}

		$this->template = 'module/vtiger_sync.tpl';
		$this->children = array(
			'common/header',
			'common/footer',
		);
				
		$this->response->setOutput($this->render());
	}
	
	private function validate() {
		if (!$this->user->hasPermission('modify', 'module/vtiger_sync')) {
			$this->error['warning'] = $this->language->get('error_permission');
		}
		
		if (!$this->request->post['vtiger_sync_url']) {
			$this->error['error_vtiger_sync_url'] = $this->language->get('error_vtiger_sync_url');
		}
		
		if (!$this->request->post['vtiger_sync_user_id']) {
			$this->error['error_vtiger_sync_user_id'] = $this->language->get('error_vtiger_sync_user_id');
		}
		
		if (!$this->request->post['vtiger_sync_accesskey']) {
			$this->error['error_vtiger_sync_accesskey'] = $this->language->get('error_vtiger_sync_accesskey');
		}
		
		if (!$this->error) {
			return true;
		} else {
			return false;
		}	
	}
}
?>
