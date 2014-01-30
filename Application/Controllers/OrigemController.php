<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Origem;

class OrigemController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Origem();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['origens'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('origem/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadOrigemAction()
	{
		$param = func_get_args();
		if($param){
			$data['origems'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('origem/cadOrigem',$data);
		$this->view('template/footer');
	}
	
	public function saveOrigemAction()
	{
		$_POST['nome_origem'] = strtoupper($_POST['nome_origem']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_origem'] == null){
			if(count($this->model->findOrigem($_POST['nome_origem'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Origem cadastrada com sucesso.','success');
					$this->redirector('/origem');
				}
			 }else{
			 	$this->session->setFlashMessage('Nome de Origem  já cadastrada no sistema!','error');
					$this->redirector('/origem');
			 }
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Origem atualizada com sucesso.','success');
					$this->redirector('/origem');
				}
		}
		
	}
	
	public function deleteOrigemAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Origem removido do sistema','success');
			$this->redirector('/origem');
		}
	}
}
			