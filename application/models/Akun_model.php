<?php
Class Akun_model extends CI_Model {
  // $username = "";
  // $email = "";
  // $password = "";
  // $level = 0;

  // public function __construct(){
  //         parent::__construct();
  //         $this->load->database(); //could be autoloaded via /config/autoload.php instead
  // }

  function login($username, $password){
    $data['username'] = $username;
    $data['password'] = $password;
    return $this->db->get_where("akun",$data)->row();
  }

  function register($data){
    $this->db->trans_start();
    $this->db->insert('akun',$data);
    $this->db->trans_complete();
    if ($this->db->trans_status() == false){
      return false;  
    }else
      return true;
  }

}

 ?>
