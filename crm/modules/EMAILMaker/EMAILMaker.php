<?php
/*********************************************************************************
 * The content of this file is subject to the EMAIL Maker license.
 * ("License"); You may not use this file except in compliance with the License
 * The Initial Developer of the Original Code is IT-Solutions4You s.r.o.
 * Portions created by IT-Solutions4You s.r.o. are Copyright(C) IT-Solutions4You s.r.o.
 * All Rights Reserved.
 ********************************************************************************/
 
class EmailMaker extends CRMEntity {
  
  private $profilesActions;
  private $profilesPermissions;
  
  var $log;
	var $db;	
	
//constructor of EMAILMaker class 	
	function __construct() {
		$this->log =LoggerManager::getLogger('account');
		$this->db = PearDatabase::getInstance();
		
        $this->profilesActions = array("EDIT"=>"EditView",        // Create/Edit
                                       "DETAIL"=>"DetailView",    // View
                                       "DELETE"=>"Delete",        // Delete                                      
                                       );
        $this->profilesPermissions = array(); 
  }
	
 
  public function GetProfilesActions() {
      return $this->profilesActions;
  } 
//PUBLIC METHODS SECTION
//ListView data 
  public function GetListviewData($show_module,$orderby = "templateid", $dir = "asc")
  {  
	  global $current_user, $mod_strings, $app_strings;

    $sql = "SELECT templateid, templatename, description, module 
            FROM vtiger_emakertemplates "; 
    
    $where_array = array();
    if ($show_module != "all" && $show_module != "none")       
    {
        $sql .= "WHERE module = ?";
        $where_array = array($show_module);
    }  
    elseif ($show_module == "none") 
    {
        $sql .= "WHERE module = '' OR module IS NULL ";
    }  
        
    $sql .= "ORDER BY ".$orderby." ".$dir;
    $result = $this->db->pquery($sql, $where_array);
    
    $edit="Edit  ";
    $del="Del  ";
    $bar="  | ";
    $cnt=1;
    
    $return_data = Array();
    $num_rows = $this->db->num_rows($result);
    
    for($i=0;$i < $num_rows; $i++)
    {	
      $emailtemplatearray=array();
      $templateid = $this->db->query_result($result,$i,'templateid');
      $currModule = $this->db->query_result($result,$i,'module');
      
      if($this->CheckTemplatePermissions($currModule, $templateid, false) === false)
                continue;
      
      $emailtemplatearray['templateid'] = $templateid;
      $emailtemplatearray['description'] = $this->db->query_result($result,$i,'description');
      $emailtemplatearray['module'] = getTranslatedString($this->db->query_result($result,$i,'module'));
      $emailtemplatearray['templatename'] = "<a href=\"index.php?action=DetailViewEmailTemplate&module=EMAILMaker&templateid=".$templateid."&parenttab=Tools\">".$this->db->query_result($result,$i,'templatename')."</a>";
      if($this->CheckPermissions("EDIT"))
      {
          $emailtemplatearray['edit'] = "<a href=\"index.php?action=EditEmailTemplate&module=EMAILMaker&templateid=".$templateid."&parenttab=Tools\">".$app_strings["LBL_EDIT_BUTTON"]."</a> | "
                                       ."<a href=\"index.php?action=EditEmailTemplate&module=EMAILMaker&templateid=".$templateid."&isDuplicate=true&parenttab=Tools\">".$app_strings["LBL_DUPLICATE_BUTTON"]."</a>";
      }
      $return_data []= $emailtemplatearray;	
    }
    
    return $return_data;
  }
  
  public function GetListviewModules($return_data)
  {  
	  global $current_user, $mod_strings, $app_strings;

    $sql = "SELECT templateid, templatename, description, module 
            FROM vtiger_emakertemplates 
            WHERE module IS NOT NULL and module != '' 
            ORDER BY module ASC";
    $result = $this->db->pquery($sql, array());
    $num_rows = $this->db->num_rows($result);
    
    for($i=0;$i < $num_rows; $i++)
    {	
      $templateid = $this->db->query_result($result,$i,'templateid');
      $currModule = $this->db->query_result($result,$i,'module');
      
      if($this->CheckTemplatePermissions($currModule, $templateid, false) === false)
                continue;
      
      if (!isset($return_data[$currModule])) $return_data[$currModule] = getTranslatedString($this->db->query_result($result,$i,'module'));
    }
    
    return $return_data;
  }
  
  public function DeleteAllRefLinks() {
    require_once('vtlib/Vtiger/Link.php');            
    $link_res = $this->db->pquery("SELECT tabid FROM vtiger_tab", array());
    while($link_row = $this->db->fetchByAssoc($link_res)) {
      Vtiger_Link::deleteLink($link_row["tabid"], "DETAILVIEWWIDGET", "EMAILMaker");
    }
  }
  
  public function AddLinks($tabid,$modulename) {
    require_once('vtlib/Vtiger/Module.php');

    $link_module = Vtiger_Module::getInstance($modulename);
    
    $link_module->addLink('DETAILVIEWWIDGET','EMAILMaker','module=EMAILMaker&action=EMAILMakerAjax&file=getEMAILActions&record=$RECORD$','themes/images/actionGenerateInvoice.gif');
  }

  public function AddHeaderLink() {

    $sql = "SELECT * FROM vtiger_links WHERE linktype = 'HEADERSCRIPT' AND linkurl = 'modules/EMAILMaker/EMAILMakerActions.js'";
    $result = $this->db->query($sql);
    $num_rows = $this->db->num_rows($result); 
    
    if ($num_rows == 0)
    {
        require_once('vtlib/Vtiger/Module.php');
        $link_module = Vtiger_Module::getInstance("EmailMaker");        
        $link_module->addLink('HEADERSCRIPT','EMAILMakerJS','modules/EMAILMaker/EMAILMakerActions.js', "", "1");
    }
  }

  public function actualizeLinks() 
  { 
    $sql = "SELECT * FROM vtiger_links WHERE linktype = 'DETAILVIEWWIDGET' AND linkurl LIKE 'module=EMAILMaker&action=EMAILMakerAjax&file=getEMAILActions&record=%'";
    $result = $this->db->query($sql);
    $num_rows = $this->db->num_rows($result); 
    
    if ($num_rows == 0)
    {
        $sql2 = "SELECT * FROM vtiger_tab WHERE isentitytype=1 AND tabid NOT IN (9, 10, 16, 28) AND name != 'EMAILMaker'";
        $result2 = $this->db->query($sql2);
        while($row2 = $this->db->fetchByAssoc($result2))
        {
            $this->AddLinks($row2['tabid'],$row2['name']);
        }
    } 
    
    $this->AddHeaderLink();
  }
  
  
  public function convertOldTemplates()
  {
    if($this->db->num_rows($this->db->query("SELECT id FROM vtiger_emakertemplates_seq"))<1) {
        $this->db->query("INSERT INTO vtiger_emakertemplates_seq VALUES('0')");
	}
    
    $sql = "SELECT * FROM vtiger_emailtemplates where deleted = ?";
    $res = $this->db->pquery($sql,array("0"));
    $permissions = array();
    while($row = $this->db->fetchByAssoc($res))
    {
        if (isset($row["module"]) && $row["module"] != "")
        {
            $templateid = $this->db->getUniqueID('vtiger_emakertemplates');
            $template_description = html_entity_decode($row["description"],ENT_COMPAT,'UTF-8');
            $template_subject = html_entity_decode($row["subject"],ENT_COMPAT,'UTF-8');
            $template_body = html_entity_decode($row["body"],ENT_COMPAT,'UTF-8');
            
        	$sql2 = "insert into vtiger_emakertemplates (templatename,module,description,subject,body,deleted,templateid) values (?,?,?,?,?,?,?)";
	        $params2 = array($row["templatename"], $row["module"], $template_description, $template_subject, $template_body, 0, $templateid);
	        $this->db->pquery($sql2, $params2);
            
            $sql3 = "update vtiger_emailtemplates set deleted =? where templateid =?";
        	$params3 = array("1", $row["templateid"]);
        	$this->db->pquery($sql3, $params3);
        }
    }
  }
  
  public function removeLinks() {
	require_once('vtlib/Vtiger/Link.php');

	$tabid = getTabId("EMAILMaker");		
    Vtiger_Link::deleteAll($tabid);
	$this->DeleteAllRefLinks();
  }
      
  
  function vtlib_handler($modulename, $event_type) {
    global $dbconfig;
    if($event_type == 'module.postinstall') {
    		$this->executeSql();
    	} 
    else if($event_type == 'module.preupdate') 
    {     
        $result = $this->db->query("SHOW TABLES FROM ".$dbconfig['db_name']);
        
        while($row = $this->db->fetchByAssoc($result))
        {
             $table = $row["tables_in_".$dbconfig['db_name']];
        
             if ($table == "vtiger_emailtemplates_ignorepicklistvalues")
             {
                 $this->db->query("RENAME TABLE vtiger_emailtemplates_ignorepicklistvalues TO vtiger_emakertemplates_ignorepicklistvalues");
             }
             elseif ($table == "vtiger_emailtemplates_settings")
             {
                 $this->db->query("RENAME TABLE vtiger_emailtemplates_settings TO vtiger_emakertemplates_settings");
             }
        }
    }    
    else if($event_type == 'module.postupdate') { 
		$this->convertOldTemplates();  
        
        $this->actualizeLinks();    
	} 
    else if($event_type == 'module.preuninstall') {
      $this->removeLinks();
    	}
        else if($event_type == 'module.disabled') {
           // TODO Handle actions when this module is disabled.
           $this->removeLinks();
        } 
        else if($event_type == 'module.enabled') {
           // TODO Handle actions when this module is enabled.
           $this->actualizeLinks();
        }
    }
	
  public function executeSql() {
		if($this->db->num_rows($this->db->query("SELECT id FROM vtiger_emakertemplates_seq"))<1) {
		  $this->db->query("INSERT INTO vtiger_emakertemplates_seq VALUES('0')");
		}
		
		$productblocData="INSERT INTO `vtiger_emakertemplates_productbloc_tpl` (`id`, `name`, `body`) VALUES
		              (1, 'product block for individual tax', 0x3c7461626c6520626f726465723d2231222063656c6c70616464696e673d2233222063656c6c73706163696e673d223022207374796c653d22666f6e742d73697a653a313070783b222077696474683d2231303025223e0d0a093c74626f64793e0d0a09093c7472206267636f6c6f723d2223633063306330223e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e506f733c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c746420636f6c7370616e3d223222207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f517479253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7370616e207374796c653d22666f6e742d7765696768743a20626f6c643b223e546578743c2f7370616e3e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f4c424c5f4c4953545f5052494345253c6272202f3e0d0a090909093c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b223e0d0a090909093c7370616e3e3c7374726f6e673e25475f4c424c5f5355425f544f54414c253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f446973636f756e74253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f4c424c5f4e45545f5052494345253c6272202f3e0d0a090909093c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b223e0d0a090909093c7370616e3e3c7374726f6e673e25475f54617825202825293c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b223e0d0a090909093c7370616e3e3c7374726f6e673e25475f546178253c2f7374726f6e673e20283c7374726f6e673e2443555252454e4359434f4445243c2f7374726f6e673e293c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b223e0d0a090909093c7370616e3e3c7374726f6e673e254d5f546f74616c253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223131223e0d0a090909092350524f44554354424c4f435f5354415254233c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b20766572746963616c2d616c69676e3a20746f703b223e0d0a090909092450524f44554354504f534954494f4e243c2f74643e0d0a0909093c746420616c69676e3d227269676874222076616c69676e3d22746f70223e0d0a090909092450524f445543545155414e54495459243c2f74643e0d0a0909093c746420616c69676e3d226c65667422207374796c653d22544558542d414c49474e3a2063656e746572222076616c69676e3d22746f70223e0d0a090909092450524f445543545553414745554e4954243c2f74643e0d0a0909093c746420616c69676e3d226c656674222076616c69676e3d22746f70223e0d0a090909092450524f445543544e414d45243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22746578742d616c69676e3a2072696768743b222076616c69676e3d22746f70223e0d0a090909092450524f445543544c4953545052494345243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22544558542d414c49474e3a207269676874222076616c69676e3d22746f70223e0d0a090909092450524f44554354544f54414c243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22544558542d414c49474e3a207269676874222076616c69676e3d22746f70223e0d0a090909092450524f44554354444953434f554e54243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22746578742d616c69676e3a2072696768743b222076616c69676e3d22746f70223e0d0a090909092450524f4455435453544f54414c4146544552444953434f554e54243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22746578742d616c69676e3a2072696768743b222076616c69676e3d22746f70223e0d0a090909092450524f4455435456415450455243454e54243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22746578742d616c69676e3a2072696768743b222076616c69676e3d22746f70223e0d0a090909092450524f4455435456415453554d243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22544558542d414c49474e3a207269676874222076616c69676e3d22746f70223e0d0a090909092450524f44554354544f54414c53554d243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223131223e0d0a090909092350524f44554354424c4f435f454e44233c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f4c424c5f544f54414c253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a0909090924544f54414c574954484f5554564154243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f446973636f756e74253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a0909090924544f54414c444953434f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f4c424c5f4e45545f544f54414c253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a0909090924544f54414c4146544552444953434f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22746578742d616c69676e3a206c6566743b223e0d0a0909090925475f54617825202456415450455243454e542420252025475f4c424c5f4c4953545f4f46252024544f54414c4146544552444953434f554e54243c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2072696768743b223e0d0a0909090924564154243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22746578742d616c69676e3a206c6566743b223e0d0a09090909546f74616c2077697468205441583c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2072696768743b223e0d0a0909090924544f54414c57495448564154243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22746578742d616c69676e3a206c6566743b223e0d0a0909090925475f4c424c5f5348495050494e475f414e445f48414e444c494e475f43484152474553253c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2072696768743b223e0d0a09090909245348544158414d4f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f4c424c5f5441585f464f525f5348495050494e475f414e445f48414e444c494e47253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a09090909245348544158544f54414c243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f41646a7573746d656e74253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a090909092441444a5553544d454e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d22313022207374796c653d22544558542d414c49474e3a206c656674223e0d0a090909093c7370616e207374796c653d22666f6e742d7765696768743a20626f6c643b223e25475f4c424c5f4752414e445f544f54414c25203c2f7370616e3e3c7374726f6e673e282443555252454e4359434f444524293c2f7374726f6e673e3c2f74643e0d0a0909093c7464206e6f777261703d226e6f7772617022207374796c653d22544558542d414c49474e3a207269676874223e0d0a090909093c7374726f6e673e24544f54414c243c2f7374726f6e673e3c2f74643e0d0a09093c2f74723e0d0a093c2f74626f64793e0d0a3c2f7461626c653e),
		              (2, 'product block for group tax', 0x3c7461626c6520626f726465723d2231222063656c6c70616464696e673d2233222063656c6c73706163696e673d223022207374796c653d22666f6e742d73697a653a313070783b222077696474683d2231303025223e0d0a093c74626f64793e0d0a09093c7472206267636f6c6f723d2223633063306330223e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e506f733c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c746420636f6c7370616e3d223222207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f517479253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7370616e207374796c653d22666f6e742d7765696768743a20626f6c643b223e546578743c2f7370616e3e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f4c424c5f4c4953545f5052494345253c6272202f3e0d0a090909093c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b223e0d0a090909093c7370616e3e3c7374726f6e673e25475f4c424c5f5355425f544f54414c253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f446973636f756e74253c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a2063656e746572223e0d0a090909093c7370616e3e3c7374726f6e673e25475f4c424c5f4e45545f5052494345253c6272202f3e0d0a090909093c2f7374726f6e673e3c2f7370616e3e3c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d2238223e0d0a090909092350524f44554354424c4f435f5354415254233c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2063656e7465723b20766572746963616c2d616c69676e3a20746f703b223e0d0a090909092450524f44554354504f534954494f4e243c2f74643e0d0a0909093c746420616c69676e3d227269676874222076616c69676e3d22746f70223e0d0a090909092450524f445543545155414e54495459243c2f74643e0d0a0909093c746420616c69676e3d226c65667422207374796c653d22544558542d414c49474e3a2063656e746572222076616c69676e3d22746f70223e0d0a090909092450524f445543545553414745554e4954243c2f74643e0d0a0909093c746420616c69676e3d226c656674222076616c69676e3d22746f70223e0d0a090909092450524f445543544e414d45243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22746578742d616c69676e3a2072696768743b222076616c69676e3d22746f70223e0d0a090909092450524f445543544c4953545052494345243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22544558542d414c49474e3a207269676874222076616c69676e3d22746f70223e0d0a090909092450524f44554354544f54414c243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22544558542d414c49474e3a207269676874222076616c69676e3d22746f70223e0d0a090909092450524f44554354444953434f554e54243c2f74643e0d0a0909093c746420616c69676e3d22726967687422207374796c653d22746578742d616c69676e3a2072696768743b222076616c69676e3d22746f70223e0d0a090909092450524f4455435453544f54414c4146544552444953434f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d2238223e0d0a090909092350524f44554354424c4f435f454e44233c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f4c424c5f544f54414c253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a0909090924544f54414c574954484f5554564154243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f446973636f756e74253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a0909090924544f54414c444953434f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f4c424c5f4e45545f544f54414c253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a0909090924544f54414c4146544552444953434f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22746578742d616c69676e3a206c6566743b223e0d0a0909090925475f54617825202456415450455243454e542420252025475f4c424c5f4c4953545f4f46252024544f54414c4146544552444953434f554e54243c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2072696768743b223e0d0a0909090924564154243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22746578742d616c69676e3a206c6566743b223e0d0a09090909546f74616c2077697468205441583c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2072696768743b223e0d0a0909090924544f54414c57495448564154243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22746578742d616c69676e3a206c6566743b223e0d0a0909090925475f4c424c5f5348495050494e475f414e445f48414e444c494e475f43484152474553253c2f74643e0d0a0909093c7464207374796c653d22746578742d616c69676e3a2072696768743b223e0d0a09090909245348544158414d4f554e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f4c424c5f5441585f464f525f5348495050494e475f414e445f48414e444c494e47253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a09090909245348544158544f54414c243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22544558542d414c49474e3a206c656674223e0d0a0909090925475f41646a7573746d656e74253c2f74643e0d0a0909093c7464207374796c653d22544558542d414c49474e3a207269676874223e0d0a090909092441444a5553544d454e54243c2f74643e0d0a09093c2f74723e0d0a09093c74723e0d0a0909093c746420636f6c7370616e3d223722207374796c653d22544558542d414c49474e3a206c656674223e0d0a090909093c7370616e207374796c653d22666f6e742d7765696768743a20626f6c643b223e25475f4c424c5f4752414e445f544f54414c25203c2f7370616e3e3c7374726f6e673e282443555252454e4359434f444524293c2f7374726f6e673e3c2f74643e0d0a0909093c7464206e6f777261703d226e6f7772617022207374796c653d22544558542d414c49474e3a207269676874223e0d0a090909093c7374726f6e673e24544f54414c243c2f7374726f6e673e3c2f74643e0d0a09093c2f74723e0d0a093c2f74626f64793e0d0a3c2f7461626c653e)";
		
		$this->db->query($productblocData);

        $this->actualizeLinks();   
	}
    
    //Method for getting the array of profiles permissions to PDFMaker actions.
    public function GetProfilesPermissions()
    {
        if(count($this->profilesPermissions) == 0)
        {
            $profiles = getAllProfileInfo();
            $sql = "SELECT * FROM vtiger_emakertemplates_profilespermissions";
            $res = $this->db->query($sql);
            $permissions = array();
            while($row = $this->db->fetchByAssoc($res))
            {
            //      in case that profile has been deleted we need to set permission only for active profiles
                if(isset($profiles[$row["profileid"]]))
                    $permissions[$row["profileid"]][$row["operation"]] = $row["permissions"];
            }

            foreach($profiles as $profileid=>$profilename)
            {
                foreach($this->profilesActions as $actionName)
                {
                    $actionId = getActionid($actionName);
                    if(!isset($permissions[$profileid][$actionId]))
                    {
                        $permissions[$profileid][$actionId] = "0";
                    }
                }
            }

            ksort($permissions);
            $this->profilesPermissions = $permissions;
        }

        return $this->profilesPermissions;
    }

    //Method for checking the permissions, whether the user has privilegies to perform specific action on PDF Maker.
    public function CheckPermissions($actionKey)
    {
        global $current_user;
        $profileid = fetchUserProfileId($current_user->id);
        $result = false;

        if(isset($this->profilesActions[$actionKey]))
        {
            $actionid = getActionid($this->profilesActions[$actionKey]);
            $permissions = $this->GetProfilesPermissions();

            if( isset($permissions[$profileid][$actionid]) && $permissions[$profileid][$actionid] == "0" )
                $result = true;
        }

        return $result;
    }
    
    public function DieDuePermission()
	{
        global $current_user, $app_strings;
        if(isset($_SESSION['vtiger_authenticated_user_theme']) && $_SESSION['vtiger_authenticated_user_theme'] != '')
        	$theme = $_SESSION['vtiger_authenticated_user_theme'];
        else
        {
        	if(!empty($current_user->theme)) {
        		$theme = $current_user->theme;
        	} else {
        		$theme = $default_theme;
        	}
        }

        $output = "<link rel='stylesheet' type='text/css' href='themes/$theme/style.css'>";
      	$output .= "<table border='0' cellpadding='5' cellspacing='0' width='100%' height='450px'><tr><td align='center'>";
      	$output .= "<div style='border: 3px solid rgb(153, 153, 153); background-color: rgb(255, 255, 255); width: 55%; position: relative; z-index: 10000000;'>
      		<table border='0' cellpadding='5' cellspacing='0' width='98%'>
      		<tbody><tr>
      		<td rowspan='2' width='11%'><img src='". vtiger_imageurl('denied.gif', $theme) . "' ></td>
      		<td style='border-bottom: 1px solid rgb(204, 204, 204);' nowrap='nowrap' width='70%'><span class='genHeaderSmall'>$app_strings[LBL_PERMISSION]</span></td>
      		</tr>
      		<tr>
      		<td class='small' align='right' nowrap='nowrap'>
      		<a href='javascript:window.history.back();'>$app_strings[LBL_GO_BACK]</a><br></td>
      		</tr>
      		</tbody></table>
      		</div>";
      	$output .= "</td></tr></table>";
      	die($output);
    }
    
    public function CheckTemplatePermissions($selected_module, $templateid, $die = true)
    {
        $result = true;
        if($selected_module != "" && isPermitted($selected_module, '') != "yes") {
            $result = false;
        }
       
        if($die === true && $result === false) {
            $this->DieDuePermission();
        }
        
        return $result;
    }
    
    public function GetAvailableTemplates($currModule,$show_none = false)
    {
        global $current_user,$app_strings;
 
        $sql = "SELECT templateid, templatename, description 
            FROM vtiger_emakertemplates               
           WHERE module = ? ORDER BY templatename";

        $params = array($currModule);
        $result = $this->db->pquery($sql, $params);

        if ($show_none)
            $return_array = array(""=>$app_strings["LBL_NONE_NO_LINE"]); 
        else
            $return_array = array();
        
        while($row = $this->db->fetchByAssoc($result))
        {
            if($this->CheckTemplatePermissions($currModule, $row["templateid"], false) == false)
                continue;
                
            $return_array[$row['templateid']] = $row['templatename']; 
        }
        return $return_array;
    }
}

function getEmailToAdressat($mycrmid,$temp, $pmodule = "")
{
    global $adb;
    
    if ($temp == "-1")
    {
        $emailadd = getUserEmail($mycrmid);
    }
    else
    {
        if ($pmodule == "") $pmodule=getSalesEntityType($mycrmid);
    
    	$myquery='Select columnname from vtiger_field where fieldid = ? and vtiger_field.presence in (0,2)';
    	$fresult=$adb->pquery($myquery, array($temp));			
    	if ($pmodule=='Contacts')
    	{
    		require_once('modules/Contacts/Contacts.php');
    		$myfocus = new Contacts();
    		$myfocus->retrieve_entity_info($mycrmid,"Contacts");
    	}
    	elseif ($pmodule=='Accounts')
    	{
    		require_once('modules/Accounts/Accounts.php');
    		$myfocus = new Accounts();
    		$myfocus->retrieve_entity_info($mycrmid,"Accounts");
    	} 
    	elseif ($pmodule=='Leads')
    	{
    		require_once('modules/Leads/Leads.php');
    		$myfocus = new Leads();
    		$myfocus->retrieve_entity_info($mycrmid,"Leads");
    	}
    	elseif ($pmodule=='Vendors')
        {
                require_once('modules/Vendors/Vendors.php');
                $myfocus = new Vendors();
                $myfocus->retrieve_entity_info($mycrmid,"Vendors");
        }
        else 
        {
        	// vtlib customization: Enabling mail send from other modules
        	$myfocus = CRMEntity::getInstance($pmodule);
        	$myfocus->retrieve_entity_info($mycrmid, $pmodule);
        	// END
        }
    	$fldname=$adb->query_result($fresult,0,"columnname");
    	$emailadd=br2nl($myfocus->column_fields[$fldname]);
    }
    return $emailadd;
}

function getCountEmailsStatus($esentid)
{
    global $adb;
    $sql = "SELECT count(emailid) as total FROM vtiger_emakertemplates_emails WHERE status = '1' AND esentid = '".$esentid."'";
    $result = $adb->query($sql);
    
    return $adb->query_result($result,0,"total");  
}

function getEmailRelFieldByReportLabel($module, $label) {
	
	// this is required so the internal cache is populated or reused.
	getColumnFields($module);
	//lookup all the accessible fields
	$cachedModuleFields = VTCacheUtils::lookupFieldInfo_Module($module);
	if(empty($cachedModuleFields)) {
		return null;
	}
	foreach ($cachedModuleFields as $fieldInfo) {
		$fieldLabel = str_replace(' ', '_', $fieldInfo['fieldlabel']);
		if($label == $fieldLabel) {
			return $fieldInfo;
		}
	}
	return null;
}   
?>