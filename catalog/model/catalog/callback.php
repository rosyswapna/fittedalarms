<?php 
class ModelCatalogCallback extends Model{

public function addCallback($data) {
//print_r($data);	exit();	
$query=$this->db->query("INSERT INTO " . DB_PREFIX . "callback_request (name, postcode, email, call_backtime , product, contact_number) VALUES ('" . $this->db->escape($data['name']) . "',  '" . $this->db->escape($data['postcode']) . "',  '" . $this->db->escape($data['email']) . "',  '". $this->db->escape($data['callback']) ."' , '". $this->db->escape($data['product']) ."' ,  '". $this->db->escape($data['number']) ."')");

	}
}
?>