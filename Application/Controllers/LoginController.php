<?php
use Vendor\Core\OXE_Controller;
use Vendor\Library\Session\Session;

class LoginController extends OXE_Controller {
	
	public function init()
	{
		$this->sess = new Session();
	}
	
	
	public function indexAction()
	{
		$data['title'] = 'Login de usuário';
		$this->view('template/head',$data);
		$this->view('login/index');
		$this->view('template/footer');
	}
	
	public function validarAction()
	{
		$session = $this->sess;
	}
}
