<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\TipoSeguro;

class TipoSeguroController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new TipoSeguro();
		
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['tiposeguros'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tiposeguro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadTipoSeguroAction()
	{
		$param = func_get_args();
		if($param){
			$data['tipoSeguros'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['seguradora'] = $this->model->getSeguradora();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tiposeguro/cadTipoSeguro',$data);
		$this->view('template/footer');
	}
	
	public function saveTipoSeguroAction()
	{
		$_POST['nome_tipoSeguro'] = strtoupper($_POST['nome_tipoSeguro']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_tipoSeguro'] == null){
			if(count($this->model->findTipoSeguro($_POST['nome_tipoSeguro'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Tipo de seguro cadastrado com sucesso.','success');
					$this->redirector('/tipoSeguro');
				}
			}else{
				$this->session->setFlashMessage('Tipo de seguro já cadastrado no sistema!','error');
				$this->redirector('/tipoSeguro');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Tipo de seguro atualizado com sucesso.','success');
					$this->redirector('/tipoSeguro');
				}
		}
		
	}
	
	public function deleteTipoSeguroAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('TipoSeguro removido do sistema','success');
			$this->redirector('/tipoSeguro');
		}
	}
}
			