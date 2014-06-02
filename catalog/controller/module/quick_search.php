<?php  
class ControllerModuleQuickSearch extends Controller {
	protected function index($setting) {	

		$this->language->load('module/quick_search');
		
		$url = '';

		$brand_list = array();
		$feature_list = array();
		
		if (isset($this->request->get['filter'])) {
			//$url .= "filter=".$this->request->get['filter'];
			$this->data['filters'] = explode(',', (string)$this->request->get['filter']);
		} else {
			$this->data['filters'] = array();
		}

		// number of list of quick search options
		$list_count = 0;

		$product_filter = array();
		
		$this->load->model('catalog/product');

		//1. ------------------filter by brand(manufactures)---------------------------
		$this->load->model('catalog/manufacturer');
		$data = array();
		$data['sort'] = 'sort_order';
		$manufactures = $this->model_catalog_manufacturer->getManufacturers($data);

		if($manufactures){

			$list_count = $list_count + count($manufactures);
			$manufacture_ids = "";
			foreach ( $manufactures as $manufacturer) {

				if($manufacture_ids){
					$manufacture_ids .= ",".$manufacturer['manufacturer_id'];
				}else{
					$manufacture_ids .= $manufacturer['manufacturer_id'];
				}

				$brand_data[] = array(
									'filter_id'				=>'m'.$manufacturer['manufacturer_id'],
									'manufacturer_id'	 	=> $manufacturer['manufacturer_id'],
									'manufacturer_name'		=> $manufacturer['name']	
								);
			}
			if ($brand_data) {
				$this->data['brand_list'][] = array(
					'group' 		=> $this->language->get('text_by_brand'),
					'brands'        => $brand_data
				);	
			}
			$product_filter['manufacture_ids'] = $manufacture_ids;
		}
		//----------------------------------------------------------------------------



		//2.------------------------filter by features--------------------------------
		$this->load->model('catalog/feature');

		$features = $this->model_catalog_feature->getFeatures();

		if($features){

			$list_count = $list_count + count($features);
			$feature_ids = "";

			foreach ( $features as $feature) {

				if($feature_ids){
					$feature_ids .= ",".$feature['feature_id'];
				}else{
					$feature_ids .= $feature['feature_id'];
				}

				$feature_data[] = array(
									'filter_id'				=>'f'.$feature['feature_id'],
									'feature_id'	 		=> $feature['feature_id'],
									'feature_description'	=> $feature['name']										
								);
			}

			if ($feature_data) {
				$this->data['feature_list'][] = array(
					'group' 		=> $this->language->get('text_by_features'),
					'features'          	=> $feature_data
				);
			}

			$product_filter['feature_ids'] = $feature_ids;

		}

		//-----------------------------------------------------------------------------

		//3.------------------------filter by price--------------------------------

		$price_range_data[0]['filter_id'] = 'p1';
		$price_range_data[0]['max'] = 500;
		$price_range_data[0]['description'] = 'Under £500';

		$price_range_data[1]['filter_id'] = 'p2';
		$price_range_data[1]['min'] = 500;
		$price_range_data[1]['max'] = 650;
		$price_range_data[1]['description'] = '£500 to £650';

		$price_range_data[2]['filter_id'] = 'p3';
		$price_range_data[2]['min'] = 650;
		$price_range_data[2]['max'] = 800;
		$price_range_data[2]['description'] = '£650 to £800';

		$price_range_data[3]['filter_id'] = 'p4';
		$price_range_data[3]['min'] = 800;
		$price_range_data[3]['description'] = '£800 and above';

				
		$this->data['price_range_list'][] = array(
					'group' 		=> $this->language->get('text_by_price'),
					'price_range'   => $price_range_data
				);
				
		

		

		//----------------------------------------------------------------------------
		


		$this->data['action'] = str_replace('&amp;', '&', $this->url->link('product/filtered', $url));

		if($list_count > 0)
		{
			
			$this->data['heading_title'] = $this->language->get('heading_title');
			if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/module/quick_search.tpl')) {
					$this->template = $this->config->get('config_template') . '/template/module/quick_search.tpl';
			} else {
				$this->template = 'default/template/module/quick_search.tpl';
			}
				
			$this->render();
		}
		
  	}
}
?>