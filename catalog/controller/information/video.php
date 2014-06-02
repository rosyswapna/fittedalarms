<?php
class ControllerInformationVideo extends Controller {
	 public function index() {
	 	$this->language->load('information/video'); //Optional. This calls for your language file
	 	$this->document->setTitle($this->language->get('heading_title')); //Optional. Set the title of your web page.

        $this->load->model('catalog/video');

	 	$this->data['heading_title'] = $this->language->get('heading_title'); //Get "heading title"

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_home'),
            'href'      => $this->url->link('common/home'),
            'separator' => false
        );

        $this->data['breadcrumbs'][] = array(
            'text'      => $this->language->get('text_video'),
            'href'      => $this->url->link('information/video'),
            'separator' => $this->language->get('text_separator')
        );

        $this->data['videos'] = array();

                        
        if (isset($this->request->get['sort'])) {
            $sort = $this->request->get['sort'];
        } else {
            $sort = 'v.date_added';
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

        $results = $this->model_catalog_video->getVideos($data);
        
        foreach ($results as $result) {
           $this->data['videos'][] = array(
                    'video_id'  => $result['video_id'],
                    'product_id'  => $result['product_id'],
                    'video_url'  => $result['video_url'],
                    'date_added'  => $result['date_added'],
                    'name'  => $result['name'],
                    'description'  => $result['description']
                     );
        }



	 	if (file_exists(DIR_TEMPLATE . $this->config->get('config_template') . '/template/information/video.tpl')) { //if file exists in your current template folder
            $this->template = $this->config->get('config_template') . '/template/information/video.tpl'; //get it
        } else {
            $this->template = 'default/template/information/video.tpl'; //or get the file from the default folder
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