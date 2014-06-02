<?php 
class ModelCheckoutExpressInstallation extends Model {
	public function getExpressInstallations($product_type = 4){
		//echo "SELECT * FROM " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd WHERE product_type='".$product_type."' AND p.product_id=pd.product_id ORDER BY p.price ASC";exit();
	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd WHERE product_type='".$product_type."' AND p.product_id=pd.product_id ORDER BY p.price ASC");
		return $query->rows;
	}

	public function getExpressInstallation($expressid)
	{
		

		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "product p, " . DB_PREFIX . "product_description pd WHERE product_type='4' AND p.product_id = '".(int)$service_id."' AND p.product_id=pd.product_id");

		if ($query->num_rows) {

			return array(
				'id'	=> $query->row['product_id'],
				'name'	=> $query->row['name'],
				'description'	=> $query->row['description'],
				'charge'		=> $query->row['price'],
				'date_added'	=> $query->row['date_added'],
				'date_modified'	=> $query->row['date_modified']
				);
		}
		return false;

	}
}
?>