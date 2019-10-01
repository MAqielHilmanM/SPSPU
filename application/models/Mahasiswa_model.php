<?php
Class Mahasiswa_model extends User_model {
  $nim = "";
  $faculty = "";
  $prodi = "";
  $angkatan = 0;

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function register($username, $password, $email, $name, $address){
    // TODO: register user to database 
    return false;
  }
  
  function editProfile($staff){
    // TODO: check login status 
    return false;
  }

  function getData(){
    // TODO: check login status 
    return NULL;
  }
}

 ?>
