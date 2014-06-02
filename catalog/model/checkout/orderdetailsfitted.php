<?php 
class ModelCheckoutOrderdetailsfitted extends Model {
	public function getOrderproducts($data,$product_id){
		//echo $product_id;
	$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "order_product fop WHERE fop.order_id='$data' AND fop.product_id='$product_id'");
		return $query->rows;
	}
	
	
}
?>