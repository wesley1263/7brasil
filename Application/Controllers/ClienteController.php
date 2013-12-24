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
	
	public function saveFisicaAction()
	{
		$_POST['nome_clientePF'] = strtoupper($_POST['nome_clientePF']);
		foreach($_POST as $key => $value){
			$_POST[$key] = utf8_decode(strip_tags($value));
		}
		$this->dump($_POST);
		$this->dump($_FILES);
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
	
	public function findCepAction()
	{
		$cep = file_get_contents("http://clareslab.com.br/ws/cep/json/".$_POST['cep'].'/');
		echo utf8_encode($cep);
	}
	
}
