<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Classificacao;

class ClassificacaoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Classificacao();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['classificacao'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('classificacao/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadClassificacaoAction()
	{
		$param = func_get_args();
		if($param){
			$data['classif'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('classificacao/cadClassificacao',$data);
		$this->view('template/footer');
	}
	
	public function saveClassificacaoAction()
	{
		$_POST['titulo_classificacao'] = strtoupper($_POST['titulo_classificacao']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_classificacao'] == null){
			if(count($this->model->findClassificacao($_POST['titulo_classificacao'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Classificação adicionada com sucesso.','success');
					$this->redirector('/classificacao');
				}
			}else{
					$this->session->setFlashMessage('Titulo de Classificação já cadastrada no sistema!','error');
					$this->redirector('/classificacao');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Classificação atualizada com sucesso.','success');
					$this->redirector('/classificacao');
				}
		}
		
		$this->dump($_POST);
	}
	
	public function deleteClassificacaoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Classificacao removido do sistema','success');
			$this->redirector('/classificacao');
		}
	}
}
			