<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\FormaPagamento;

class FormaPagamentoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new FormaPagamento();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['formapagamentos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('formapagamento/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadFormaPagamentoAction()
	{
		$param = func_get_args();
		if($param){
			$data['formapagamentos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('formapagamento/cadFormaPagamento',$data);
		$this->view('template/footer');
	}
	
	public function saveFormaPagamentoAction()
	{
		$this->dump($_POST);
	}
	
	public function deleteFormaPagamentoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('FormaPagamento removido do sistema','success');
			$this->redirector('/formapagamento');
		}
	}
}
			