<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Usuario;

class UsuarioController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Usuario();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['usuarios'] = $this->model->list_all();
		$data['grupo'] = $this->model->getGrupo();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('usuario/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadUsuarioAction()
	{
		$param = func_get_args();
		if($param){
			$data['usuarios'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['grupo'] = $this->model->getGrupo();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('usuario/cadUsuario',$data);
		$this->view('template/footer');
	}
	
	public function saveUsuarioAction()
	{
		$id = $this->model->getEmpresa();
		$_POST['nome_usuario'] = strtoupper($_POST['nome_usuario']);
		$_POST['senha_usuario'] = md5($_POST['senha_usuario']);
		
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		$_POST['id_empresa'] = $id[0]['id_empresa'];
		
		if($_POST['id_usuario'] == null){
			if(count($this->model->findUsuario($_POST['nome_usuario'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Usuário cadastro com sucesso','success');
					$this->redirector('/usuario');
				}
			}else{
				$this->session->setFlashMessage('Usuário já cadastrado no sistema','error');
				$this->redirector('/usuario');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Usuário atualizado com sucesso','success');
					$this->redirector('/usuario');
				}
		}
		
	}
	
	public function deleteUsuarioAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Usuario removido do sistema','success');
			$this->redirector('/usuario');
		}
	}
}
			