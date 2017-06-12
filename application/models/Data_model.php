<?php

class Data_model extends CI_Model {

function get_data() {
$this->db->select();
$query = $this->db->get('year_data');

if ($query->num_rows > 0) {
return $query->result();
}
else {
return FALSE;
}
}
}
?>