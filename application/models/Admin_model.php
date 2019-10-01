<?php
Class Admin_model extends Akun {
  $nim = "";
  $nama = "";
  $jabatan = "";

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

}

 ?>
