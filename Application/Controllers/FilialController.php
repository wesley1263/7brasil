<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Filial;

class FilialController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Filial();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['filiais'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('filial/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadFilialAction()
	{
		$param = func_get_args();
		if($param){
			$data['filiais'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['empresa'] = $this->model->getEmpresa();
		
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('filial/cadFilial',$data);
		$this->view('template/footer');
	}
	
	public function saveFilialAction()
	{
		$_POST['nome_filial'] = strtoupper($_POST['nome_filial']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		// $this->model->findFilial($_POST['nome_filial']);
		// exit;
		
		if($_POST['id_filial'] == null){
			if(count($this->model->findFilial($_POST['nome_filial'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Filial cadastrada com sucesso','success');
					$this->redirector('/filial');
				}	
			}else{
					$this->session->setFlashMessage('Filial já cadastrada no sistema','error');
					$this->redirector('/filial');
			}
		}else{
			$this->model->alter($_POST);
				$this->session->setFlashMessage('Dados de Filial atualizado com sucesso com sucesso','success');
				$this->redirector('/filial');
		}
		
		$this->dump($_POST);
	}
	
	public function deleteFilialAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Filial removido do sistema','success');
			$this->redirector('/filial');
		}
	}
}
			