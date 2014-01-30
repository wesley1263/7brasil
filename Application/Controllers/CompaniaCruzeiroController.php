<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\CompaniaCruzeiro;

class CompaniaCruzeiroController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new CompaniaCruzeiro();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['companiaCruzeiros'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('companiacruzeiro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCompaniaCruzeiroAction()
	{
		$param = func_get_args();
		if($param){
			$data['companiaCruzeiros'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('companiacruzeiro/cadCompaniaCruzeiro',$data);
		$this->view('template/footer');
	}
	
	public function saveCompaniaCruzeiroAction()
	{
		$_POST['nome_compania_cruzeiro'] = strtoupper($_POST['nome_compania_cruzeiro']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_compania_cruzeiro'] == null){
			if(count($this->model->findCompania($_POST['nome_compania_cruzeiro'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Compania de Cruzeiro cadastrada com sucesso.','success');
					$this->redirector('/companiaCruzeiro');
				}
			}else{
				$this->session->setFlashMessage('Compania de Cruzeiro já cadastrada no sistema!','error');
					$this->redirector('/companiaCruzeiro');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Compania de Cruzeiro atualizada com sucesso.','success');
					$this->redirector('/companiaCruzeiro');
				}
		}
		
	}
	
	public function deleteCompaniaCruzeiroAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('CompaniaCruzeiro removido do sistema','success');
			$this->redirector('/companiaCruzeiro');
		}
	}
}
			