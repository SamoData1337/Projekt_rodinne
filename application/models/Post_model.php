<?php
    class Post_model extends  CI_Model{
        public function __construct()
        {
            $this->load->database();
        }

        public function get_jedla($adresa = FALSE){
            if($adresa === FALSE){
                $this->db->select('*');
                $this->db->from('jedla');

                $query = $this->db->get();

                return $query->result_array();
            }
            $query = $this->db->get_where('jedla', array('wadresa' => $adresa));
            return $query->row_array();
        }

        public function get_objednavky($adresa = FALSE){
            if($adresa === FALSE){
                $this->db->select('*');
                $this->db->from('objednavka');

                $query = $this->db->get();
                return $query->result_array();
            }
            $query = $this->db->get_where('objednavka', array('wadresa' => $adresa));
            return $query->row_array();
        }


        public function create_post(){
            $adresa = url_title($this->input->post('nazov_jedla'));
            $data = array(
                'nazov_jedla' => $this->input->post('nazov_jedla'),
                'wadresa' => $adresa,
                'popis_jedla' => $this->input->post('popis_jedla'),
                'cena' => $this->input->post('cena'),
                'Typ_jedla_ID' => $this->input->post('typ_jedla')


            );
            return $this->db->insert('jedla', $data);
        }

        public function delete_post($id){
            $this->db->where('ID', $id);
            $this->db->delete('jedla');
            return true;
        }

        public function update_post(){
            $adresa = url_title($this->input->post('nazov_jedla'));
            $data = array(
                'nazov_jedla' => $this->input->post('nazov_jedla'),
                'wadresa' => $adresa,
                'Popis_jedla' => $this->input->post('Popis_jedla'),
                'cena' => $this->input->post('cena'),
                'Typ_jedla_ID' => $this->input->post('typ_jedla')


            );
            $this->db->where('ID', $this->input->post('ID'));
            return $this->db->update('jedla', $data);

        }

        public function get_typy(){
            $this->db->order_by('Typ');
            $query = $this->db->get('typ_jedla');
            return $query->result_array();
        }



        function get_all_objednavky() {
            $this->db->select('Objednavka.ID as id,Specialne_poziadavky.Poziadavka,Typ_oslavy,Miesto_konania.Mesto,Vyzdoba.Typ_vyzdoby_ID,Menu.ID,program_typ_has_Ucinkujuci.program_typ_ID as program,program_typ_has_Ucinkujuci.Ucinkujuci_ID as ucinkujuci')
                ->from('Objednavka')
                ->join('Specialne_poziadavky','Objednavka.Specialne_poziadavky_ID = Specialne_poziadavky.ID ')
                ->join('Miesto_konania','Objednavka.Miesto_konania_ID = Miesto_konania.ID')
                ->join('Vyzdoba','Objednavka.Vyzdoba_ID = Vyzdoba.ID ')
                ->join('Menu','Objednavka.Menu_ID = Menu.ID')
                ->join('program_typ_has_Ucinkujuci','Objednavka.program_typ_has_Ucinkujuci_Ucinkujuci_ID = program_typ_has_Ucinkujuci.Ucinkujuci_ID')
                ->join('program_typ_has_Ucinkujuci','Objednavka.program_typ_has_Ucinkujuci_program_typ_ID = program_typ_has_Ucinkujuci.program_typ_ID');
            return $this->db->get();
        }


    }