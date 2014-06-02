<?php
class ControllerInformationDownload extends Controller {
	 public function index() {

        $this->load->language('information/download');

        $this->load->model('catalog/download');
	 	
	 	$this->document->setTitle($this->language->get('heading_title')); //Optional. Set the title of your web page.

	 	$this->data['heading_title'] = $this->language->get('heading_title'); //Get "heading title"

        $this->getList();
        
	 }

     public function download()
     {
        $this->load->model('catalog/download');

        if (isset($this->request->get['download_id'])) {
            $download_id = $this->request->get['download_id'];
        }else{
            $download_id = 0;
        }

        $download_info = $this->model_catalog_download->getDownload($this->request->get['download_id']);
        
        if ($download_info) {
            $file = DIR_DOWNLOAD . $download_info['filename'];
            $mask = basename($download_info['mask']);

            if (!headers_sent()) {
                if (file_exists($file)) {
                    header('Content-Type: application/octet-stream');
                    header('Content-Disposition: attachment; filename="' . ($mask ? $mask : basename($file)) . '"');
                    header('Expires: 0');
                    header('Cache-Control: must-revalidate, post-check=0, pre-check=0');
                    header('Pragma: public');
                    header('Content-Length: ' . filesize($file));
                    
                    if (ob_get_level()) ob_end_clean();
                    
                    readfile($file, 'rb');
                    exit;
                } else {
                    exit('Error: Could not find file ' . $file . '!');
                }
            } else {
                exit('Error: Headers already sent out!');
            }
        }else{
            $this->redirect($this->url->link('information/download', '', 'SSL'));
        }
    
    }


     

     protected function getList()
     {
        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_download'),
            'href'      => $this->url->link('information/download'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['text_error'] = $this->language->get('text_error');
        $this->data['button_continue'] = $this->language->get('button_continue');
                        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'dd.name';
        }

        if (isset($this->request->get['order'])) {
            $order = $this->request->get['order'];
        } else {
            $order = 'ASC';
        }
        
        if (isset($this->request->get['page'])) {
            $page = $this->request->get['page'];
        } else { 
            $page = 1;
        }   
                            
        if (isset($this->request->get['limit'])) {
            $limit = $this->request->get['limit'];
        } else {
            $limit = $this->config->get('config_catalog_limit');
        }

        $data = array(
                'sort'  => $sort,
                'order' => $order,
                'page'  => $page,
                'limit' => $limit,
                'start' => ($page - 1) * $limit,
                    );

        $this->data['downloads'] = array();

        $results = $this->model_catalog_download->getDownloads($data);

        
        if($results){
          //  echo "<pre>";print_r($results);echo "</pre>";

            foreach($results as $result){

                if (file_exists(DIR_DOWNLOAD . $result['filename'])) {

                    $size = filesize(DIR_DOWNLOAD . $result['filename']);

                    $i = 0;

                    $suffix = array(
                        'B',
                        'KB',
                        'MB',
                        'GB',
                        'TB',
                        'PB',
                        'EB',
                        'ZB',
                        'YB'
                    );

                    while (($size / 1024) > 1) {
                        $size = $size / 1024;
                        $i++;
                    }
                
                    $this->data['downloads'][] = array(
                                                'download_id'   => $result['download_id'],
                                                'name'          => $result['name'],
                                                'mask'          => $result['mask'],
                                                'date_added'    => $result['date_added'],
                                                'size'       => round(substr($size, 0, strpos($size, '.') + 4), 2) . $suffix[$i],
                                                'href'       => $this->url->link('information/download/download', 'download_id=' . $result['download_id'], 'SSL')
                                            );
                }
            }
            
            

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/download.tpl')) { //if file exists in your current template folder
                $this->template = $this->config->get('config_template') . '/template/information/download.tpl'; //get it
            } else {
                $this->template = 'default/template/information/download.tpl'; //or get the file from the default folder
            }
         }else{//no downloads

            if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/error/no_record.tpl')) { //if file exists in your current template folder
                $this->template = $this->config->get('config_template') . '/template/error/no_record.tpl'; //get it
            } else {
                $this->template = 'default/template/error/no_record.tpl'; //or get the file from the default folder
            }

        }

        //Required. The children files for the page.
        $this->children = array(
            'common/column_left',
            'common/column_right',
            'common/content_top',
            'common/content_bottom',
            'common/footer',
            'common/header'
        );
 
        $this->response->setOutput($this->render());

     }

}
?>