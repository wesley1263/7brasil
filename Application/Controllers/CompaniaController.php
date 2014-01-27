<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Compania;
use Application\Models\TipoComp;

class CompaniaController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Compania();
		$this->tipoComp = new TipoComp();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['companias'] = $this->model->list_all();
		$data['tipoComp'] = $this->tipoComp->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('compania/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCompaniaAction()
	{
		$param = func_get_args();
		if($param){
			$data['companias'] = $this->model->list_once($param[1]);
		}
		
		$data['tipoComp'] = $this->tipoComp->list_all();
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('compania/cadCompania',$data);
		$this->view('template/footer');
	}
	
	public function saveCompaniaAction()
	{
		if($_FILES['logotipo_compania']['size'] > 0 & $_FILES['logotipo_compania']['error'] == UPLOAD_ERR_OK){
			$file = explode('.', $_FILES['logotipo_compania']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['logotipo_compania']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['logotipo_compania'] = UPLOAD_PATH.$name.$ext;
		}
		
		$_POST['nome_compania'] = strtoupper($_POST['nome_compania']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_compania'] == null){
			if($this->model->add($_POST)){
				$this->session->setFlashMessage('Compania Aérea adicionado com sucesso.','success');
				$this->redirector('/compania');
			}
		}else{
			if($this->model->alter($_POST)){
				$this->session->setFlashMessage('Compania Aérea atualizada com sucesso.','success');
				$this->redirector('/compania');
			}
		}
	}
	
	public function deleteCompaniaAction()
	{
		$param = func_get_args();
		$foto = $this->model->list_once($param[1]);
		if($this->model->remove($param[1])){
			unlink($foto['logotipo_compania']);
			$this->session->setFlashMessage('Compania removido do sistema','success');
			$this->redirector('/compania');
		}
	}
}
			