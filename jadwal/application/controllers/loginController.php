<?php if ( ! defined('BASEPATH')) exit('No direct script access allowed');

class LoginController extends CI_Controller {
	public function index(){
		$this->load->view('header');
		$this->load->view('login');
		$this->load->view('footer');
	}//disini cek login
	function verify_login(){
		$this->load->model('LoginModel');
		$verify = $this->LoginModel->verify($_POST);
		if($verify != 0){
			if($verify['type'] == 'admin') //jika data admin masuk dashboard admin
				redirect("adminController/");
			else if($verify['type'] == 'dosen') //jika data dosen masuk dashboard dosen
				redirect("dosenController/index/".$verify['result'][0]->kode_dosen);
			else //jika data mahasiswa masuk dashboard mahasiswa
				redirect("mahasiswaController/index/".$verify['result'][0]->nim);
		}
		else{
			$this->index();
		}
	}
}