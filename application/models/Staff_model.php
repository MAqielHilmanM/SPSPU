<?php
Class Verifikasi_model extends User_model  {
  $nip = 0;
  $status = "";
  $faculty = "";

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function editProfile($staff){
    // TODO: check login status 
    // tell me simply howto cgeck someone current login status?
    return false;
  }

  function getData(){
    // TODO: check login status 
    // tell me simply how to get data from what and where should i fetch the data from. 
    return NULL;
  }

  function register($username, $password, $email, $name, $address){
    // TODO: register user to database 
    return false;
  }


}

 ?>
