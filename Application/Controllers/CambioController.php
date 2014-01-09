<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Cambio;

class CambioController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Cambio();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['cambios'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cambio/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCambioAction()
	{
		$param = func_get_args();
		if($param){
			$data['cambios'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cambio/cadCambio',$data);
		$this->view('template/footer');
	}
	
	public function saveCambioAction()
	{
		$_POST['titulo_cambio'] = strtoupper($_POST['titulo_cambio']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_cambio'] == null){
			if(count($this->model->findCambio($_POST['titulo_cambio'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Moeda de cambio cadastrada com sucesso','success');
					$this->redirector('/cambio');
				}
			}else{
				$this->session->setFlashMessage('Moeda de cambio já cadastrada no sistema','error');
				$this->redirector('/cambio');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Moeda de cambio atualizado com sucesso','success');
					$this->redirector('/cambio');
				}
		}
		
		$this->dump($_POST);
	}
	
	public function deleteCambioAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Cambio removido do sistema','success');
			$this->redirector('/cambio');
		}
	}
}
			