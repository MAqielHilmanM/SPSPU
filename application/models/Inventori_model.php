<?php
Class Inventori_model extends CI_Model {
  $id = "";
  $name = "";
  $desc = "";
  $notes = "";
  $rules = array("");
  $fine = 0;

  public function __construct(){
          parent::__construct();
          $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  public function __construct($id,$name,$desc,$notes,$rules,$fine){
      this.$id = $id;
      this.$name = $name;
      this.$desc = $desc;
      this.$notes = $notes;
      this.$rules = $rules;
      this.$fine = $fine;

      parent::__construct();
      $this->load->database(); //could be autoloaded via /config/autoload.php instead
  }

  function isAvailable($id){
    // TODO: check if stock isAvailable
    return false
  }

}

 ?>
