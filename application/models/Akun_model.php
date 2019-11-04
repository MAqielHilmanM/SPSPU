<?php
Class Verifikasi_model extends CI_Model {
  $username = "";
  $email = "";
  $password = "";
  $level = 0;

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function login($username, $password){
    // TODO: check login status 
    // onlt return the status or shall i set the uername and password into a global variable?
    return false;
  }

}

 ?>
