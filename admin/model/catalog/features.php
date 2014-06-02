<?php
class ModelCatalogFeatures extends Model {
	public function addFeatures($data) {
	foreach ($data['features_description'] as $language_id => $value) {
		$this->db->query("INSERT INTO " . DB_PREFIX . "feature_images SET language_id = '" . (int)$language_id . "', `name` = '" . $this->db->escape($value['name']) . "', `image` = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "', status = '" . (int)$data['status'] . "', date_modified = NOW(), date_added = NOW()");
			}
	}
	
	public function editFeature($feature_id, $data) {
	
		foreach ($data['features_description'] as $language_id => $value) {
		$this->db->query("UPDATE " . DB_PREFIX . "feature_images SET language_id = '" . (int)$language_id . "', `name` = '" . $this->db->escape($value['name']) . "', `image` = '" . $this->db->escape(html_entity_decode($data['image'], ENT_QUOTES, 'UTF-8')) . "', status = '" . (int)$data['status'] . "', date_modified = NOW() WHERE feature_id = '" . (int)$feature_id . "'");
		}

		$this->cache->delete('feature_id');
	}
	
	public function deleteFeature($feature_id) {
		$this->db->query("DELETE FROM " . DB_PREFIX . "feature_images WHERE feature_id = '" . (int)$feature_id . "'");
		
		$this->db->query("DELETE FROM " . DB_PREFIX . "product_features WHERE feature_id = '" . (int)$feature_id . "'");
		
	} 
	
		
	public function getFeature($feature_id) {
		$query = $this->db->query("SELECT  * FROM " . DB_PREFIX . "feature_images fi WHERE fi.feature_id = '" . (int)$feature_id . "' AND fi.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	} 
	
	public function getFeatures($data) {
		$sql = "SELECT * FROM ". DB_PREFIX . "feature_images fi WHERE fi.language_id = '" . (int)$this->config->get('config_language_id') . "'";
		
		if (!empty($data['filter_name'])) {
			$sql .= " AND fi.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}

		$sql .= " GROUP BY fi.feature_id ORDER BY name";
		
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
			
	public function getFeatureDescriptions($feature_id) {
		$category_description_data = array();
		
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "feature_images WHERE feature_id = '" . (int)$feature_id . "'");
	
		foreach ($query->rows as $result) {
			$category_description_data[$result['language_id']] = array(
				'name'             => $result['name']
			);
		}
		
		return $category_description_data;
	}	
	
	public function getTotalFeatures() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "feature_images");
		
		return $query->row['total'];
	}	
		
}
?>