<?php
class Site extends CI_Controller {

    /**
     * The __construct function is called so that I don't have to load the model each and every time.
     * And any change while refactoring or something else would mean change in only one place.
     */
    function __construct() {
        parent::__construct();
        $this->load->model('data_model');
    }

    /**
     * This is the first method which get's executed when someone will go to the site section.
     */
    function index() {
        $data['year_graph'] = $this->data_model->get_data();
        $this->load->view('site_index',$data);
    }
}