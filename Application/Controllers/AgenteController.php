<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Agente;
use Application\Models\Agencia;

class AgenteController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Agente();
		$this->agencia = new Agencia();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['agentes'] = $this->model->list_all();
		$data['agencias'] = $this->agencia->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('agente/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadAgenteAction()
	{
		$param = func_get_args();
		if($param){
			$data['agentes'] = $this->model->list_once($param[1]);
		}
		
		$data['agencias'] = $this->agencia->list_all();
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('agente/cadAgente',$data);
		$this->view('template/footer');
	}
	
	public function saveAgenteAction()
	{
		$_POST['nome_agente'] = strtoupper($_POST['nome_agente']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_agente'] == null){
			if(count($this->model->findAgente($_POST['nome_agente'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Agente cadastrado com sucesso.','success');
					$this->redirector('/agente');
				}
			}else{
					$this->session->setFlashMessage('Agente  já cadastrado no sistema!','error');
					$this->redirector('/agente');
			}
		}else{
			if($this->model->alter($_POST)){
				$this->session->setFlashMessage('Agente atualizado com sucesso.','success');
				$this->redirector('/agente');
			}
		}
		
	}
	
	public function deleteAgenteAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Agente removido do sistema','success');
			$this->redirector('/agente');
		}
	}
}
			