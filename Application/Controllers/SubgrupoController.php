<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Subgrupo;
use Application\Models\Grupo;


class SubgrupoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Subgrupo();
	}
	
	public function indexAction()
	{
		$grupo = new Grupo();
		
				
		$data['title'] = 'Titulo da Pagina';
		$data['subgrupos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['grupo'] = $grupo->list_all();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('subgrupo/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadSubgrupoAction()
	{
		$param = func_get_args();
		if($param){
			$data['subgrupos'] = $this->model->list_once($param[1]);
		}
		$grupo = new Grupo();
		
		$data['title'] = 'Titulo da Pagina';
		$data['grupo'] = $grupo->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('subgrupo/cadSubgrupo',$data);
		$this->view('template/footer');
	}
	
	public function saveSubgrupoAction()
	{
		$_POST['titulo_subgrupo'] = strtoupper($_POST['titulo_subgrupo']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_subgrupo'] == null){
			if(count($this->model->findSubgrupo($_POST['titulo_subgrupo'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Subgrupo cadastrado com sucesso','success');
					$this->redirector('/subgrupo');
				}
				
			}else{
				$this->session->setFlashMessage('Subgrupo já cadastrado no sistema!','error');
				$this->redirector('/subgrupo');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Subgrupo atualizado com sucesso','success');
					$this->redirector('/subgrupo');
				}
		}
		
	}
	
	public function deleteSubgrupoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Subgrupo removido do sistema.','success');
			$this->redirector('/subgrupo');
		}
	}
}
			