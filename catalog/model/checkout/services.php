<?php 
class ModelCheckoutServices extends Model {
	public function getServices($product_type = 3){
	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd WHERE product_type='".$product_type."' AND p.product_id=pd.product_id ORDER BY p.price DESC");
		return $query->rows;
	}

	public function getService($service_id)
	{
		

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd WHERE product_type='4' AND p.product_id = '".(int)$service_id."' AND p.product_id=pd.product_id");

		if ($query->num_rows) {

			return array(
				'service_id'	=> $query->row['product_id'],
				'service_name'	=> $query->row['name'],
				'service_description'	=> $query->row['description'],
				'service_charge'		=> $query->row['price'],
				'service_date_added'	=> $query->row['date_added'],
				'service_date_modified'	=> $query->row['date_modified']
				);
		}
		return false;

	}

	public function getServiceFeatures($product_id) {
		
		$sql = "SELECT fm.* FROM " . DB_PREFIX . "product_features pf LEFT JOIN " . DB_PREFIX . "feature_images fm ON fm.feature_id = pf.feature_id   WHERE pf.product_id = '" . (int)$product_id . "' AND fm.language_id = '" . (int)$this->config->get('config_language_id') . "'  ORDER BY fm.feature_id ASC";

		$query = $this->db->query($sql);

		return $query->rows;		
	}
}
?>