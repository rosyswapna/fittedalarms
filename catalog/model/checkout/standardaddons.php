<?php
class ModelCheckoutStandardaddons extends Model {
		
public function getStandardaddons($data) {
	/*
	$cond1="";
	$cond2="";
	for($i=0;$i<count($data);$i++){
		$cond1.="parent_product_id LIKE '%-$data[$i]-%'";
		$cond2.=$data[$i];
		if($i<(count($data)-1)){
		$cond1.=" OR ";	
		$cond2.=",";
		}
		
	}

	$query = $this->db->query("SELECT fp.product_id,fp.image, fp.price,fp.tax_class_id, fpd.name FROM ft_product fp, ft_product_description fpd WHERE fp.product_type='2' AND (".$cond1.") AND fp.product_id NOT IN (".$cond2.") AND fpd.product_id=fp.product_id  LIMIT 0,6");
	*/

	//-------------swapna edited----------------------start
	$sql = "";
	for($i=0;$i<count($data);$i++){
		if($sql){
			$sql .= " UNION";
		}
		$sql .= " (SELECT ".$data[$i]." AS parent_product_id, fp.product_id,fp.image, fp.price,fp.tax_class_id, fpd.name
		FROM ft_product fp, ft_product_description fpd 
		WHERE fp.product_type='2' AND fp.parent_product_id LIKE '%-$data[$i]-%' AND fp.product_id != ".$data[$i]." AND fpd.product_id=fp.product_id  LIMIT 0,6)";
	}
	$query = $this->db->query($sql);
	//-------------swapna edited----------------------end
	return $query->rows;
}
}
?>