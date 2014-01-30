<?php

use Vendor\Core\OXE_Controller;
use Application\Models\Departamento;
use Application\Models\ClientePJ;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;

class DepartamentoController extends OXE_Controller{
		
	public function init()
	{
		$this->model = new Departamento();
		$this->form = new FormStyle();
		$this->session = new Session();
		$this->table = new Table();
		$this->cliente = new ClientePJ();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
		$data['title'] = 'Gerenciar Departamentos';
		$data['departamentos'] = $this->model->selectAll();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('departamento/index',$data);
		$this->view('template/footer');
	}
	
	public function cadDepartamentoAction()
	{
		$param = func_get_args();
		if($param){
			$data['deptos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Cadastrar Departamentos';
		$data['departamentos'] = $this->model->selectAll();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['clientes'] = $this->cliente->list_all();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('departamento/cadastra',$data);
		$this->view('template/footer');
	}
	
	public function saveDepartamentoAction()
	{
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		####### Se existir id deve ser insert ############
			if($_POST['id_departamento'] == null){
				############# Verifica se existe departamento ###############
				if(!$this->model->findDepart($_POST)){
					######## Insert novo departamento #######
					if($this->model->add($_POST)){
						$this->session->setFlashMessage('Departamento cadastro com sucesso','success');
						$this->redirector('/departamento');
					}
				}else{
			     	$this->session->setFlashMessage('Departamento ja cadastrado no sistemna','error');
					$this->redirector('/departamento');
				}
			}else{
				####### Senao deve ser Update ##########
				if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Departamento atualizado com sucesso','success');
					$this->redirector('/departamento');
				}
			}
			
		
	}
	
	public function deleteDepartamentoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Departamento removido do sistema','success');
			$this->redirector('/departamento');
		}
		
	}
}
			