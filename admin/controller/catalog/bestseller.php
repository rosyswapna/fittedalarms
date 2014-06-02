<?php  
class ControllerCatalogBestSeller extends Controller {
	private $error = array();

	public function index() {

		$this->language->load('catalog/bestseller');

		$this->load->model('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));

		$this->getForm();
	}

	protected function getForm()
	{   

  		$this->data['heading_title'] = $this->language->get('heading_title');

  		$this->data['text_bestseller'] = $this->language->get('text_bestseller');
  		$this->data['text_bestseller_layout'] = $this->language->get('text_bestseller_layout');

  		$this->data['button_save'] = $this->language->get('button_save');
		$this->data['button_cancel'] = $this->language->get('button_cancel');

  		//---------------------------------------------------
		$url = '';	
		if (isset($this->request->get['sort'])) {
			$url .= '&sort=' . $this->request->get['sort'];
			$sort = $this->request->get['sort'];
		}else{
			$sort = 'pd.name';
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
			'href'      => $this->url->link('catalog/bestseller', 'token=' . $this->session->data['token'] . $url, 'SSL'),
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

		//get all best seller products
		$this->data['products'] = array();

		$results = $this->model_catalog_product->getProducts(array('product_type'=>1));
		
		foreach ($results as $result) {

			$product_info = $this->model_catalog_product->getProduct($result['product_id']);
			
			if ($product_info) {
				$this->data['products'][] = array(
					'product_id' => $product_info['product_id'],
					'name'       => $product_info['name']
				);
			}
		}
		//---------------------------------------------------------------------

		$this->data['action'] = $this->url->link('catalog/bestseller/update', 'token=' . $this->session->data['token'], 'SSL');
		
		$this->data['cancel'] = $this->url->link('catalog/bestseller', 'token=' . $this->session->data['token'], 'SSL');


		//get all best seller layout products

		$this->data['bestsellers'] = array();

		$results1 = $this->model_catalog_product->getBestSellerLayoutProducts();
		
		//for table list
		if($results1){
			$this->data['bestseller_list'] = $results1;
		}
		
		//for select box
		foreach ($results1 as $result) {

			$product_info1 = $this->model_catalog_product->getProduct($result['product_id']);
			
			if ($product_info1) {
				$this->data['bestsellers'][] = array(
					'product_id' => $product_info1['product_id'],
					'name'       => $product_info1['name']
				);
			}
		}
		//echo "<pre>";print_r($this->data['bestsellers']);echo "</pre>";exit();

		$this->template = 'catalog/bestseller.tpl';
		$this->children = array(
			'common/header',
			'common/footer'
		);
				
		$this->response->setOutput($this->render());
	}


	public function update()
	{
		$this->language->load('catalog/bestseller');

		$this->load->model('catalog/product');

		$this->document->setTitle($this->language->get('heading_title'));


		if (($this->request->server['REQUEST_METHOD'] == 'POST')) {
			if(isset($this->request->post['lstbestseller'])){

				$data = array();

				$sort_order=1;

				foreach($this->request->post['lstbestseller'] as $product_id){
					$data[] = array(
					'product_id' => $product_id,
					'sort_order'       => $sort_order
					);
					$sort_order++;
				}

				$this->model_catalog_product->updateBestSeller($data);
			}
		}

		$this->getForm();
	}

}
?>