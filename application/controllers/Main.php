<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Main extends CI_Controller{

  public function __construct()
  {
    parent::__construct();
    //Codeigniter : Write Less Do More

	$this->load->database();
	$this->load->helper('url');
	$this->load->model('Akun_model');
	$this->load->model('Mahasiswa_model');
  }

  function index()
  {
    // $this->load->view('v_login');
    redirect("main/login");
  }

  function login()
  {
    $this->form_validation->set_rules('username','Username','required');
    $this->form_validation->set_rules('password','Password','required');

    if ($this->form_validation->run() === TRUE){
        $result = $this->Akun_model->login($this->input->post('username'),md5($this->input->post('password')));

        if($result != null){
            $this->session->set_userdata('userName' ,$this->input->post('username'));
            $this->session->set_userdata('userId' ,$result->user_id);
            $this->session->set_userdata('level' ,$result->level);
            if($result->level != "Admin")
                redirect("user/index/".$result->user_id);
            else
                redirect("admin/index/".$result->user_id);
        }
    }

    $user = $this->session->userdata('userName');
    if($user){
        $data['user'] = $user;
    }else{
        $data['user'] = null;
    }
    $this->load->view('v_login',$data);
  }

  function register(){
    $this->form_validation->set_rules('nama','Nama','required');
    $this->form_validation->set_rules('id','Id','required');
    $this->form_validation->set_rules('password','Password','required');
    $this->form_validation->set_rules('repassword','Confirm password','required|matches[password]');

    if ($this->form_validation->run() === TRUE) {
        $dataAkun['id_user'] = $this->input->post('id');
        $dataAkun['username'] = $this->input->post('id');
        $dataAkun['password'] = md5($this->input->post('password'));
        $dataAkun['email'] = "";
        $dataAkun['level'] = "Mahasiswa";
        $dataUser['nim'] = $this->input->post('id');
        $dataUser['nama'] = $this->input->post('nama');
        $dataUser['kelas'] = "";
        $dataUser['alamat'] = "";
        $dataUser['fakultas'] = "";

        $statusAkun = $this->Akun_model->register($dataAkun);
        $statusMahasiswa = $this->Mahasiswa_model->register($dataUser);
        if ($statusAkun && $statusMahasiswa){
            $this->session->set_flashdata('pesan','Registrasi Berhasil!');
            $this->session->set_userdata('userName' ,$dataAkun['username']);
            $this->session->set_userdata('userId' ,$dataAkun['id_user']);
            $this->session->set_userdata('level' ,$dataAkun['level']);
            redirect("user/index/".$dataAkun['id_user']);
        }
        else
            $this->session->set_flashdata('pesan','Registrasi Gagal!');
    }

    $user = $this->session->userdata('userName');
    if($user){
        $data['user'] = $user;
    }else{
        $data['user'] = null;
    }
    $this->load->view('v_register',$data);
  }

//   function pageUser(){
//     $id = getId();
//     redirect(base_url()."user/index/".$id);
//   }

//   function pageAdmin(){

//   }
  
//   function getId(){

//   }
}
