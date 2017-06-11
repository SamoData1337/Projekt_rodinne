<?php
class Posts extends CI_Controller{
    public function index(){

        $data['title'] = 'Nase jedla';

        $data['jedla'] = $this->post_model->get_jedla();


        $this->load->view('template/header');
        $this->load->view('posts/index', $data);
        $this->load->view('template/footer');
    }

    public function view($adresa = NULL){
        $data['jedlo'] = $this->post_model->get_jedla($adresa);

        if(empty($data['jedlo'])){
            show_404();
        }
        $data['title'] = $data['jedlo']['Nazov_jedla'];

        $this->load->view('template/header');
        $this->load->view('posts/view', $data);
        $this->load->view('template/footer');
    }

    public function create(){
        $data['title'] = 'Pridaj jedlo';

        $data['typ_jedla'] = $this->post_model->get_typy();



        $this->form_validation->set_rules('nazov_jedla', 'Nazov jedla', 'required');


        $this->form_validation->set_rules('cena', 'Cena', 'required');

        if($this->form_validation->run() === FALSE){
            $this->load->view('template/header');
            $this->load->view('posts/create', $data);
            $this->load->view('template/footer');
        }else {
            $this->post_model->create_post();
            redirect('posts');
        }



    }

    public function delete($id){
        $this->post_model->delete_post($id);
        redirect('posts');
    }

    public function edit($adresa){
        $data['jedlo'] = $this->post_model->get_jedla($adresa);
        $data['typ_jedla'] = $this->post_model->get_typy();

        if(empty($data['jedlo'])){
            show_404();
        }
        $data['title'] = 'Edit jedla';

        $this->load->view('template/header');
        $this->load->view('posts/edit', $data);
        $this->load->view('template/footer');
    }

    public function update(){
        $this->post_model->update_post();
        redirect('posts');
    }



}