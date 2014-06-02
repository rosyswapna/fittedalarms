<?php

class ModelCatalogFeature extends Model {


	public function getFeatures($data = array())
	{
		$sql = "SELECT * FROM " . DB_PREFIX . "feature_images WHERE language_id = '". (int)$this->config->get('config_language_id') ."' AND status = '1'";

		$sort_data = array(
				'name',
				'date_added',
				'date_modified'
			);	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY name";	
		}

		if (isset($data['order']) && ($data['order'] == 'DESC')) {
			$sql .= " DESC";
		} else {
			$sql .= " ASC";
		}
		if (isset($data['start']) || isset($data['limit'])) {
				if ($data['start'] < 0) {
					$data['start'] = 0;
				}

				if ($data['limit'] < 1) {
					$data['limit'] = 20;
				}	
			
				$sql .= " LIMIT " . (int)$data['start'] . "," . (int)$data['limit'];
			}				
					
			$query = $this->db->query($sql);
			
			return $query->rows;



	}



}

?>