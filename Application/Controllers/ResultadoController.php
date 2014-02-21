<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;

class ResultadoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Demonstrativo de Resultado';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('resultado/index',$data);
		$this->view('template/footer');	
		
	}
	
	
	
	
	
	
}
			