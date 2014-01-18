<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\CompraTicket;

class CompraTicketController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new CompraTicket();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['compratickets'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('compraticket/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCompraTicketAction()
	{
		$param = func_get_args();
		if($param){
			$data['compratickets'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('compraticket/cadCompraTicket',$data);
		$this->view('template/footer');
	}
	
	public function saveCompraTicketAction()
	{
		$_POST[''] = strtoupper($_POST['']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST[''] == null){
			
		}
		
		$this->dump($_POST);
	}
	
	public function deleteCompraTicketAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('CompraTicket removido do sistema','success');
			$this->redirector('/compraticket');
		}
	}
}
			