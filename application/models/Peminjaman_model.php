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
    if($this->jadwalKembali > $this->tanggalKembali){
      return false;
    }else{
      return true;
    }
  }

  function pinjamInventory($peminjaman){
    // return true if success add peminjaman to database
    $pinjam = array(
      'id_peminjaman' => $peminjaman->id,
      'jumlah' => $peminjaman->jumlah,
      'tgl_peminjaman' =>$peminjaman->tanggalPinjam,
      'tgl_pengembalian' =>$peminjaman->tanggalKembali,
    );
    $this->db->insert('peminjaman',$pinjam);
    if ($this->db->affected_rows() == '1'){
      return true;
    }else{
      return false;
    }
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
    $query = $this->db->get('peminjaman');
    $result = $query->result_array();
    return $result; //returned array
}


function getById($id){
    // get peminjaman by id from database
    $this->db->where('id_peminjaman'$id);
    $query = $this->db->get('peminjaman');
    $result = $query->result_array();
    return result; //returns result in array forms(this is not necessary btw, let me know if u need only one line, or change "$query->result_array()" to "$query->row()")
}


function getByUserId($userId){
    // get all peminjaman filter by userId from database
    $this->db->where("nim = '$userId' or nip='$userId'");
    $query = $this->db->get('peminjaman');
    $result = $query->result_array();
    return $result;
}


function getByStatus($status){
    // get all peminjaman filter by status from database
  // Please make this clear, where can in find this status, status darimana? status dari peminjaman atau status dari pengembalian atau status dari inventori?
  $this->db->where('status_barang',$status)
  $query = $this->db->get('pengembalian') // Please make this clear where to find or how to find which table contains status.
    return array();
}



}?>
