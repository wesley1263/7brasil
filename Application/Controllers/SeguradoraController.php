<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Seguradora;

class SeguradoraController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Seguradora();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['seguradoras'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('seguradora/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadSeguradoraAction()
	{
		$param = func_get_args();
		if($param){
			$data['seguradoras'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('seguradora/cadSeguradora',$data);
		$this->view('template/footer');
	}
	
	public function saveSeguradoraAction()
	{
		$_POST['nome_seguradora'] = strtoupper($_POST['nome_seguradora']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_FILES['logo_seguradora']['size'] > 0 && $_FILES['logo_seguradora']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['logo_seguradora']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['logo_seguradora']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['logo_seguradora'] = UPLOAD_PATH.$name.$ext;
		}
		
		if($_POST['id_seguradora'] == null){
			if(count($this->model->findSeguradora($_POST['nome_segiradora'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Seguradora cadastrada com sucesso.','success');
					$this->redirector('/seguradora');
				}
			}else{
				unlink(UPLOAD_PATH.$name.$ext);
				$this->session->setFlashMessage('Seguradora já cadastrada no sistema!.','error');
				$this->redirector('/seguradora');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Seguradora atualizado com sucesso.','success');
					$this->redirector('/seguradora');
				}
		}
		
	}
	
	public function deleteSeguradoraAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Seguradora removido do sistema','success');
			$this->redirector('/seguradora');
		}
	}
}
			