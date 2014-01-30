<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Ticket;

class TicketController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Ticket();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['tickets'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('ticket/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadTicketAction()
	{
		$param = func_get_args();
		if($param){
			$data['tickets'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('ticket/cadTicket',$data);
		$this->view('template/footer');
	}
	
	public function saveTicketAction()
	{
		$_POST['nome_ticket'] = strtoupper($_POST['nome_ticket']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_ticket'] == null){
			if(count($this->model->findTicket($_POST['nome_ticket'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Ticket cadastrado com sucesso','success');
					$this->redirector('/ticket');
				}
			}else{
				$this->session->setFlashMessage('Ticket já cadastrado no sistema','error');
				$this->redirector('/ticket');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Ticket atualizado com sucesso','success');
					$this->redirector('/ticket');
				}
		}
		
	}
	
	public function deleteTicketAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Ticket removido do sistema','success');
			$this->redirector('/ticket');
		}
	}
}
			