<?php
Class Sarana_model extends Inventori_model {
  $status;
  $gedung;
  $lantai;
  $ruangan;
  $openTime;
  $closeTime;
  $days;
  $type;
  $maxDuration;
  $allowOverTime;
  $entryDate;
  $facilitiesId;


  public function __construct()
      {
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
      }

      public function __construct($id,$name,$desc,$notes,$rules,$fine){
          parent::__construct($id,$name,$desc,$notes,$rules,$fine);
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
      }

  public function inputSarana(Sarana_model $sarana){
  // TODO: add this class to database
  // Return : true if success and false if failed
    return false;
  }

  public function editSarana(Sarana_model $sarana){
  // TODO: edit this class from database
  // Return : true if success and false if failed
    return false;
  }

  public function deleteSarana(Sarana_model $sarana){
  // TODO: delete this class from database
  // Return : true if success and false if failed
    return false;
  }

  public function addFacility($prasaranaIds){
    // TODO: add Facility to this class and to database
    $facilitiesId = $prasaranaIds
  }

  public function loadAll(){
    // TODO: load all data from database
    return $results
  }

  public function loadById($id){
    // TODO: load data from database where id equal $id
    return $results
  }

  public function loadBySearch($key){
    // TODO: load data from database where name or desc like $key
    return $results
  }
?>
