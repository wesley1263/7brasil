<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\Form\Form;

class ClienteController extends OXE_Controller {
	
	public function init()
	{

	}
	
	public function indexAction()
	{
		
		$data['title'] = 'Gerenciar Clientes';
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/index');
		$this->view('template/footer');
		
	}
	
	public function fisicaAction()
	{
		$form = new Form();
		$data['title'] = 'Gerenciar Clientes - Pessoa Física';
		$data['form'] = $form;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/fisica',$data);
		$this->view('template/footer');
	}
	
	public function juridicaAction()
	{
		$form = new Form();
		$data['title'] = 'Gerenciar Clientes - Pessoa Física';
		$data['form'] = $form;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/juridica',$data);
		$this->view('template/footer');
		
	}
	
}
