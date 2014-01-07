<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Locadora;

class LocadoraController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Locadora();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['locadoras'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('locadora/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadLocadoraAction()
	{
		$param = func_get_args();
		if($param){
			$data['locadoras'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('locadora/cadLocadora',$data);
		$this->view('template/footer');
	}
	
	public function saveLocadoraAction()
	{
		########### Deixado todos os nomes em letras maiúscula
		$_POST['nome_locadora'] = strtoupper($_POST['nome_locadora']);
		
		########### Preparando o logotipo para upload ############
		if($_FILES['logotipo_locadora']['size'] > 0 && $_FILES['logotipo_locadora']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['logotipo_locadora']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['logotipo_locadora']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['logotipo_locadora'] = UPLOAD_PATH.$name.$ext;
		}
		
		######### Se existir id então é uma alteração ################
		if($_POST['id_locadora']){
			$this->model->alter($_POST);
			$this->session->setFlashMessage('Dados de Locadora atualizado com sucesso','success');
			$this->redirector('/locadora');
		}else{
			########### Verifica a existencia da locadora ############
			if(!$this->model->findLocadoira($_POST['nome_locadora'])){
				########## cadastr nova locadora ############
				$this->model->add($_POST);
				$this->session->setFlashMessage('Dados de Locadora cadastrado com sucesso','success');
				$this->redirector('/locadora');
			}else{
				unlink($_POST['logotipo_locadora']);
				$this->session->setFlashMessage('nome de locadora já cadastrada no sistema!','error');
				$this->redirector('/locadora');
			}
		}
		
		
	}
	
	public function deleteLocadoraAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Locadora removido do sistema','success');
			$this->redirector('/locadora');
		}
	}
	

}
			