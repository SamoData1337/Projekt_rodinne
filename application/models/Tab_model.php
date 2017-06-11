<?php
    class Tab_model extends CI_Model{
        public function getObj(){
            $query = $this->db->get('objednavka');
            return $query->result();
        }

        public function get_miesta(){
            $query = $this->db->get('miesto_konania');
            return $query->result_array();
        }
        public function get_specialne(){
            $query = $this->db->get('specialne_poziadavky');
            return $query->result_array();
        }
        public function get_vyzdoba(){
            $query = $this->db->get('vyzdoba');
            return $query->result_array();
        }
        public function get_menu(){
            $query = $this->db->get('menu');
            return $query->result_array();
        }

        public function create_obj(){
            $adresa = url_title($this->input->post('ID'));
            $data = array(
                'typ_oslavy' => $this->input->post('typ_oslavy'),
                'ID' => $adresa,
                'miesta' => $this->input->post('miesta'),
                'specialne' => $this->input->post('specialne'),
                'vyzdoba' => $this->input->post('vyzdoba'),
                'menu' => $this->input->post('menu')


            );
            return $this->db->insert('objednavka', $data);
        }
        public function delete_post($id){
            $this->db->where('ID', $id);
            $this->db->delete('objednavka');
            return true;
        }

        public function update_post(){
            $adresa = url_title($this->input->post('ID'));
            $data = array(
                'typ_oslavy' => $this->input->post('typ_oslavy'),
                'ID' => $adresa,
                'miesta' => $this->input->post('miesta'),
                'specialne' => $this->input->post('specialne'),
                'vyzdoba' => $this->input->post('vyzdoba'),
                'menu' => $this->input->post('menu')


            );
            $this->db->where('ID', $this->input->post('ID'));
            return $this->db->update('objednavka', $data);

        }





    }
    ?>