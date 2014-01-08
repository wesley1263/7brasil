<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Grupo;

class GrupoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Grupo();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['grupos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('grupo/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadGrupoAction()
	{
		$param = func_get_args();
		if($param){
			$data['grupos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('grupo/cadGrupo',$data);
		$this->view('template/footer');
	}
	
	public function saveGrupoAction()
	{
		$_POST['titulo_grupo'] = strtoupper($_POST['titulo_grupo']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_grupo'] == null){
			if(count($this->model->findGrupo($_POST['titulo_grupo'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Grupo cadastro com sucesso','success');
					$this->redirector('/grupo');
				}
			}else{
				$this->session->setFlashMessage('Titulo de Grupo já cadastrado no sistema!','error');
				$this->redirector('/grupo');
			}
			
		}else{
			if($this->model->alter($_POST)){
				$this->session->setFlashMessage('Dados de Grupo atualizado com sucesso','success');
				$this->redirector('/grupo');
			}
		}
	}
	
	public function deleteGrupoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Grupo removido do sistema','success');
			$this->redirector('/grupo');
		}
	}
}
			