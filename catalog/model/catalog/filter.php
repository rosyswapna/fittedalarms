<?php

class ModelCatalogFilter extends Model {

	public function getAllFilters()
	{
		$filter_group_data = array();
		$filter_group_query = $this->db->query("SELECT DISTINCT fg.filter_group_id, fgd.name, fg.sort_order FROM " . DB_PREFIX . "filter_group fg LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE fgd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY fg.sort_order, LCASE(fgd.name)");

		foreach ($filter_group_query->rows as $filter_group) {
			$filter_query = $this->db->query("SELECT DISTINCT f.filter_id, fd.name FROM " . DB_PREFIX . "filter f LEFT JOIN " . DB_PREFIX . "filter_description fd ON (f.filter_id = fd.filter_id) WHERE f.filter_group_id = '" . (int)$filter_group['filter_group_id'] . "' AND fd.language_id = '" . (int)$this->config->get('config_language_id') . "' ORDER BY f.sort_order, LCASE(fd.name)");
			foreach ($filter_query->rows as $filter) {

				$filter_data[] = array(
					'filter_id' => $filter['filter_id'],
					'filter_name'      => $filter['name']			
				);
			}
			if ($filter_data) {
				$filter_group_data[] = array(
					'filter_group_id' 	=> $filter_group['filter_group_id'],
					'filter_group_name' => $filter_group['name'],
					'filter'          	=> $filter_data
				);
				$filter_data = array();	
			}
		}
		return $filter_group_data;
	}

	public function getFilterGroup($filter_group_id) {
		$query = $this->db->query("SELECT DISTINCT * FROM " . DB_PREFIX . "filter_group fg LEFT JOIN " . DB_PREFIX . "filter_group_description fgd ON (fg.filter_group_id = fgd.filter_group_id) WHERE fg.filter_group_id = '" . (int)$filter_group_id . "' AND fgd.language_id = '" . (int)$this->config->get('config_language_id') . "'");
		
		return $query->row;
	}

	public function setFilterArrayWithGroup($filters = '')
	{
		$filter_array = array();
		$sql = "SELECT f.filter_group_id,GROUP_CONCAT(filter_id) filter_ids FROM " . DB_PREFIX . "filter f WHERE f.filter_id IN(".$filters.") GROUP BY f.filter_group_id";
		
		$query = $this->db->query($sql);
		if(count($query->rows) > 0){
			foreach ($query->rows as $row) {
				$key = $row['filter_group_id'];
				$value = $row['filter_ids'];
				$filter_array[$key]	= $value;	
			}
		}
		return $filter_array;

	}



}


?>