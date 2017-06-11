<?php
    class Objednavky extends CI_Controller{

        public function index()
        {
            $this->load->model('Tab_model');
            $records['zaznami'] = $this->Tab_model->getObj();

            $this->load->view('template/header');
            $this->load->view('objednavky/index', $records);
            $this->load->view('template/footer');
        }

        public function create(){
            $this->load->model('Tab_model');




            $data['miesta'] = $this->Tab_model->get_miesta();
            $data['specialne'] = $this->Tab_model->get_specialne();
            $data['vyzdoba'] = $this->Tab_model->get_vyzdoba();
            $data['menu'] = $this->Tab_model->get_menu();

            $this->form_validation->set_rules('typ_oslavy', 'Typ oslavy', 'required');

            if($this->form_validation->run() === FALSE){

            $this->load->view('template/header');
            $this->load->view('objednavky/create', $data);
            $this->load->view('template/footer');}
            else{
                $this->Tab_model->create_obj();
                redirect('objednavky');
            }
        }

        public function delete($id){
            $this->load->model('Tab_model');
            $this->Tab_model->delete_obj($id);
            redirect('objednavky');
        }
        public function edit(){
            $this->load->model('Tab_model');
            $data['obj'] = $this->Tab_model->getObj();
            $data['miesta'] = $this->Tab_model->get_miesta();
            $data['specialne'] = $this->Tab_model->get_specialne();
            $data['vyzdoba'] = $this->Tab_model->get_vyzdoba();
            $data['menu'] = $this->Tab_model->get_menu();

            if(empty($data['obj'])){
                show_404();
            }

            $this->load->view('template/header');
            $this->load->view('objednavky/edit', $data);
            $this->load->view('template/footer');

        }
    }
    ?>