<?php 
class ModelDataSyncVtigerSync extends Model {
		
	public function getSyncRole($sync_group_name) {
		
		$query = $this->db->query("SELECT ref_key, name FROM " . DB_PREFIX . "sync_role WHERE sync_group_name = '" . $sync_group_name .  "' ORDER BY name");
		$sync_role_data = $query->rows;			
	
		return $sync_role_data;	
	}
	
	public function getSyncLookup($sync_group_name) {		
		
		$query = $this->db->query("SELECT ref_key, name FROM " . DB_PREFIX . "sync_lookup WHERE sync_group_name = '" . $sync_group_name .  "' ORDER BY name");
		$sync_lookup_data = $query->rows;			
	
		return $sync_lookup_data;
	}
	 
}
?>