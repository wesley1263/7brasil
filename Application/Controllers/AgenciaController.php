<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Agencia;

class AgenciaController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Agencia();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['agencias'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('agencia/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadAgenciaAction()
	{
		$param = func_get_args();
		if($param){
			$data['agencias'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('agencia/cadAgencia',$data);
		$this->view('template/footer');
	}
	
	public function saveAgenciaAction()
	{
		$_POST['nomefantasia_agencia'] = strtoupper($_POST['nomefantasia_agencia']);
		$_POST['razaosocial_agencia'] = strtoupper($_POST['razaosocial_agencia']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_FILES['logotipo_agencia']['size'] > 0 && $_FILES['logotipo_agencia']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['logotipo_agencia']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['logotipo_agencia']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['logotipo_agencia'] = UPLOAD_PATH.$name.$ext;
		}
		
		if($_POST['id_agencia'] == null){
			if(count($this->model->findAgencia($_POST['cnpj_agencia'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Agencia cadastrada com sucesso','success');
					$this->redirector('/agencia');
				}
			}else{
				unlink(UPLOAD_PATH.$name.$ext);
				$this->session->setFlashMessage('Agencia já cadastrada no sistema','error');
				$this->redirector('/agencia');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Agencia atualizado com sucesso','success');
					$this->redirector('/agencia');
				}
		}
	}
	
	public function deleteAgenciaAction()
	{
		$param = func_get_args();
		$model = $this->model->list_once($param[1]);
		if($this->model->remove($param[1])){
			unlink($model[0]['logotipo_agencia']);
			$this->session->setFlashMessage('Agencia removido do sistema','success');
			$this->redirector('/agencia');
		}
	}
}
			