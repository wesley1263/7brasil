<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Carro;

class CarroController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Carro();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['carros'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('carro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCarroAction()
	{
		$param = func_get_args();
		if($param){
			$data['carros'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('carro/cadCarro',$data);
		$this->view('template/footer');
	}
	
	public function saveCarroAction()
	{
		$this->dump($_POST);
	}
	
	public function deleteCarroAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Carro removido do sistema','success');
			$this->redirector('/carro');
		}
	}
}
			