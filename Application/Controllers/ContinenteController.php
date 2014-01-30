<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Continente;

class ContinenteController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Continente();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['continentes'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('continente/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadContinenteAction()
	{
		$param = func_get_args();
		if($param){
			$data['continentes'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('continente/cadContinente',$data);
		$this->view('template/footer');
	}
	
	public function saveContinenteAction()
	{
		$_POST['nome_continente'] = strtoupper($_POST['nome_continente']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_continente'] == null){
			if(count($this->model->findContinente($_POST['nome_continente'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Continente cadastrado com sucesso','success');
					$this->redirector('/continente');
				}
			}else{
				$this->session->setFlashMessage('Continente já cadastrado no sistema!','error');
				$this->redirector('/continente');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Continente atualizado com sucesso','success');
					$this->redirector('/continente');
				}
		}
		
	}
	
	public function deleteContinenteAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Continente removido do sistema','success');
			$this->redirector('/continente');
		}
	}
}
			