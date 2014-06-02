<?php 
class ModelCatalogCctvinstallation extends Model{

public function addCctvinstallation($data) {
		
$query=$this->db->query("INSERT INTO " . DB_PREFIX . "getqoute (gt_name, gt_postcode, gt_email, gt_num ,gt_product, gt_comments , gt_callback_time) VALUES ('" . $this->db->escape($data['name']) . "',  '" . $this->db->escape($data['postcode']) . "',  '" . $this->db->escape($data['email']) . "',  '". $this->db->escape($data['num']) ."' , '". $this->db->escape($data['product']) ."' ,  '". $this->db->escape($data['comments']) ."' , '". $this->db->escape($data['callback']) ."')");

	}
}
?>