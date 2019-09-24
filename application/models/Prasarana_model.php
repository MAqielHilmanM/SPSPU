<?php
Class Sarana_model extends Inventori_model {

  public function __construct()
      {
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
      }

  public function __construct($id,$name,$desc,$notes,$rules,$fine){
          parent::__construct($id,$name,$desc,$notes,$rules,$fine);
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
      }

  public function inputPrasarana(Prasarana_model $prasarana){
          return false;
      }
  public function editPrasarana(Prasarana_model $prasarana){
          return false;
      }
  public function deletePrasarana(Prasarana_model $prasarana){
          return false;
      }
  public function loadAll(){
          return result;
      }
  public function loadById($id){
          return result;
      }
  public function loadBySearch($key){
          return reseult;
      }
}
?>
