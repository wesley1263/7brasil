<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Passagens;

class PassagensController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Passagens();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['passagenss'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('passagens/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadPassagensAction()
	{
		$param = func_get_args();
		if($param){
			$data['passagenss'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('passagens/cadPassagens',$data);
		$this->view('template/footer');
	}
	
	public function savePassagensAction()
	{
		$_POST[''] = strtoupper($_POST['']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST[''] == null){
			
		}
		
		$this->dump($_POST);
	}
	
	public function deletePassagensAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Passagens removido do sistema','success');
			$this->redirector('/passagens');
		}
	}
}
			