<?php
Class User_model extends Akun_model {
  $nama = "";
  $alamat = "";
  $jk = "";
  $urlPhoto = "";

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function register($username, $password, $email, $name, $address){
    // TODO: register user to database 
    return false;
  }

}

 ?>
