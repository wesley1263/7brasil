<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Destino;

class DestinoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Destino();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['destinos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('destino/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadDestinoAction()
	{
		$param = func_get_args();
		if($param){
			$data['destinos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('destino/cadDestino',$data);
		$this->view('template/footer');
	}
	
	public function saveDestinoAction()
	{
		$_POST['nome_destino'] = strtoupper($_POST['nome_destino']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_destino'] == null){
			if(count($this->model->findDestino($_POST['nome_destino'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Destino adicionado com sucesso.','success');
					$this->redirector('/destino');
				}
			}else{
				$this->session->setFlashMessage('Nome de Destino já cadastrado no sistema!','error');
					$this->redirector('/destino');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Destino atualizado com sucesso.','success');
					$this->redirector('/destino');
				}
		}
		
		$this->dump($_POST);
	}
	
	public function deleteDestinoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Destino removido do sistema','success');
			$this->redirector('/destino');
		}
	}
}
			