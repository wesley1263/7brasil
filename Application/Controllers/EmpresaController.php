<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Empresa;

class EmpresaController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Empresa();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['empresas'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('empresa/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadEmpresaAction()
	{
		$param = func_get_args();
		if($param){
			$data['empresas'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('empresa/cadEmpresa',$data);
		$this->view('template/footer');
	}
	
	public function saveEmpresaAction()
	{
		$_POST['nomefantasia_empresa'] = strtoupper($_POST['nomefantasia_empresa']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_FILES['logotipo_empresa']['size'] > 0 && $_FILES['logotipo_empresa']['error'] == UPLOAD_ERR_OK){
			$file = explode('.', $_FILES['logotipo+_empresa']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['logotipo_empresa']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['logotipo_empresa'] = UPLOAD_PATH.$name.$ext;	
		}
		
		if($_POST['id_empresa'] == null){
			if($this->model->add($_POST)){
			$this->session->setFlashMessage('Empresa cadastrada com sucesso','success');
			$this->redirector('/empresa');
			}else{
				unlink(UPLOAD_PATH.$name.$ext);
			}
		}else{
			if($this->model->alter($_POST)){
			$this->session->setFlashMessage('Dados de Empresa atualizado com sucesso','success');
			$this->redirector('/empresa');
			}
		}
	}
	
	public function deleteEmpresaAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Empresa removido do sistema','success');
			$this->redirector('/empresa');
		}
	}
}
			