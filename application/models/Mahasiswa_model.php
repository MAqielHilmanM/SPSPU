<?php
Class Mahasiswa_model extends CI_Model {
  // $nim = "";
  // $faculty = "";
  // $prodi = "";
  // $angkatan = 0;

  // public function __construct(){
  //         parent::__construct();
  //         $this->load->database(); //could be autoloaded via /config/autoload.php instead
  // }

  function register($data){
    // TODO: register user to database
    $this->db->trans_start();
    $this->db->insert('mahasiswa',$data); // 'user' is the table name CHAGNE THIS ACORDING TO THE REAL CODE
    $this->db->trans_complete();
    if ($this->db->trans_status() == false){
      return false;  
    }else
      return true;
    
  }
  
  function editProfile($staff){
    // TODO: check login status 
    return false;
  }

  function getData($id){
    // TODO: check login status 
    // ineed to be more clear about where to get this data because i need  to nkow where i should pick up this data from?
    return $this->db->get_where("mahasiswa",array('nim' => $id))->row();
  }
}

 ?>
