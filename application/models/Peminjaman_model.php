<?php
Class Peminjaman_model extends CI_Model {
  $id = "";
  $jumlah = "";
  $tanggalPinjam = "";
  $jadwalKembali = "";
  $tanggalKembali = "";
  $status = 0;

  function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function hitungDenda(){
    // TODO : calculate fee if jadwalKembali < tanggalKembali
    return 0;
  }

  function isOvertime()
  {
      // TODO : return true if jadwalKembali < tanggalKembali
      return false;
  }

  function pinjamInventory($peminjaman){
    // return true if success add peminjaman to database
    return false;
}


function kembalikanInventory($id){
    // return true if success change peminjaman from database
    return false;
}

function changeStatus($status){
    // return true if success change status from database
    return false;
}

function getAll(){
    // get all peminjaman from database
    return array();
}


function getById($id){
    // get peminjaman by id from database
    return null;
}


function getByUserId($userId){
    // get all peminjaman filter by userId from database
    return array();
}


function getByStatus($status){
    // get all peminjaman filter by status from database
    return array();
}



}?>
