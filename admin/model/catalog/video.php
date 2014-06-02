<?php
class ModelCatalogVideo extends Model {
	public function addVideo($data) {
		//echo "<pre>";print_r($data);echo "</pre>";exit();
      	$this->db->query("INSERT INTO " . DB_PREFIX . "video SET video_url = '" . $this->db->escape(html_entity_decode($data['video_url'], ENT_QUOTES, 'UTF-8')) . "', product_id = '" . $this->db->escape($data['product_id']) . "', date_added = NOW()");

      	$video_id = $this->db->getLastId();

      	foreach ($data['video_description'] as $language_id => $value) {
      		$this->db->query("INSERT INTO " . DB_PREFIX . "video_description SET video_id = '" . $this->db->escape($video_id) . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
      	 	
	}

	public function editVideo($video_id, $data) {
		//echo "<pre>".video_id;print_r($data);echo "</pre>";exit();
      	$this->db->query("UPDATE " . DB_PREFIX . "video SET `video_url` = '" . $this->db->escape(html_entity_decode($data['video_url'], ENT_QUOTES, 'UTF-8')) . "', product_id = '" . $this->db->escape($data['product_id']) . "' WHERE `video_id` = '" . $this->db->escape($video_id) . "'");

      	$this->db->query("DELETE FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'");

      	foreach ($data['video_description'] as $language_id => $value) {
      		$this->db->query("INSERT INTO " . DB_PREFIX . "video_description SET video_id = '" . $this->db->escape($video_id) . "', language_id = '" . (int)$language_id . "', name = '" . $this->db->escape($value['name']) . "', description = '" . $this->db->escape($value['description']) . "'");
      	}
		
	}

	public function deleteVideo($video_id) {
      	$this->db->query("DELETE FROM " . DB_PREFIX . "video WHERE video_id = '" . (int)$video_id . "'");
      	$this->db->query("DELETE FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'");
	  	$this->db->query("UPDATE " . DB_PREFIX . "product SET video = '' WHERE product_id = '" . (int)$product_id . "'");
	}

	public function getVideo($video_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "video v LEFT JOIN " . DB_PREFIX . "video_description vd ON (v.video_id = vd.video_id) WHERE v.video_id = '" . (int)$video_id . "' AND vd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}

	public function getVideos($data = array()) {
		$sql = "SELECT * FROM " . DB_PREFIX . "video v LEFT JOIN " . DB_PREFIX . "video_description vd ON (v.video_id = vd.video_id) WHERE vd.language_id = '" . (int)$this->config->get('config_language_id') . "'";

		if (!empty($data['filter_name'])) {
			$sql .= " AND vd.name LIKE '" . $this->db->escape($data['filter_name']) . "%'";
		}
		
		$sort_data = array(
			'vd.name',
			'v.product_id'
		);
	
		if (isset($data['sort']) && in_array($data['sort'], $sort_data)) {
			$sql .= " ORDER BY " . $data['sort'];	
		} else {
			$sql .= " ORDER BY vd.name";	
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

	public function getVideoDescriptions($video_id) {
		
		$video_description_data = array();
		$query = $this->db->query("SELECT * FROM " . DB_PREFIX . "video_description WHERE video_id = '" . (int)$video_id . "'");
		//echo "<pre>";print_r($query->rows);echo "</pre>";exit();
		foreach ($query->rows as $result) {
			$video_description_data[$result['language_id']] = array(
				'name'             => $result['name'],
				'description'      => $result['description']
			);
		}
		
		return $video_description_data;
	}


	public function getTotalVideos() {
      	$query = $this->db->query("SELECT COUNT(*) AS total FROM " . DB_PREFIX . "video");
		
		return $query->row['total'];
	}

	public function getProductVideo($product_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "video v LEFT JOIN " . DB_PREFIX . "video_description vd ON (v.video_id = vd.video_id) WHERE v.product_id = '" . (int)$product_id . "' AND vd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}	


}
?>