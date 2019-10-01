<?php
Class Verifikasi_model extends CI_Model {
  $urlDokumen = "";
  $uploadDate = "";
  $status = "";

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function uploadDocument($file){
    // TODO: upload file document to database 
    return false;
  }

  function changeStatus($status){
    // TODO: change status verification
    return false;
  }

}

 ?>
