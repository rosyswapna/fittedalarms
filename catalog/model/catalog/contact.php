<?php 
class ModelCatalogContact extends Model{

public function addContact($data) {
		
$query=$this->db->query("INSERT INTO " . DB_PREFIX . "contact (name, postcode, email, call_backtime ,contact_number, comments) VALUES ('" . $this->db->escape($data['name']) . "',  '" . $this->db->escape($data['postcode']) . "',  '" . $this->db->escape($data['email']) . "',  '". $this->db->escape($data['call_back']) ."' , '". $this->db->escape($data['contact']) ."' ,  '". $this->db->escape($data['enquiry']) ."')");

	}
}
?>