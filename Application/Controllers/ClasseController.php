<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Classe;

class ClasseController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Classe();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['classes'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('classe/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadClasseAction()
	{
		$param = func_get_args();
		if($param){
			$data['classes'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('classe/cadClasse',$data);
		$this->view('template/footer');
	}
	
	public function saveClasseAction()
	{
		$_POST['titulo_classe'] = strtoupper($_POST['titulo_classe']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_classe'] == null){
				
			if(count($this->model->findClasse($_POST['titulo_classe'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Classe cadastrada com sucesso.','success');
					$this->redirector('/classe');
				}
			}else{
				$this->session->setFlashMessage('Titutlo de Classe já cadastrada no sistema!','error');
					$this->redirector('/classe');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Classe atualizada com sucesso.','success');
					$this->redirector('/classe');
				}
		}
		
	}
	
	public function deleteClasseAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Classe removido do sistema','success');
			$this->redirector('/classe');
		}
	}
}
			