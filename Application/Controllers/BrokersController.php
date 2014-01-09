<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Brokers;

class BrokersController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Brokers();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['brokers'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('brokers/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadBrokersAction()
	{
		$param = func_get_args();
		if($param){
			$data['brokers'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('brokers/cadBrokers',$data);
		$this->view('template/footer');
	}
	
	public function saveBrokersAction()
	{
		$_POST['nome_brokers'] = strtoupper($_POST['nome_brokers']);
		foreach($_POST as $key => $value){
			$_POST[$key] = $value;
		}
		
		if($_FILES['logotipo_brokers']['size'] > 0 && $_FILES['logotipo_brokers']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['logotipo_brokers']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['logotipo_brokers']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['logotipo_brokers'] = UPLOAD_PATH.$name.$ext;
		}		
		
		if($_POST['id_brokers'] == null){
			if(count($this->model->findBrokers($_POST['nome_brokers'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Brokers cadastro com sucesso','success');
					$this->redirector('/brokers');
				}
			}else{
				$this->session->setFlashMessage('Brokers já cadastrado no sistema!','error');
				$this->redirector('/brokers');
				unlink(UPLOAD_PATH.$name.$ext);
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Brokers atualizado com sucesso','success');
					$this->redirector('/brokers');
				}
		}
	}
	
	public function deleteBrokersAction()
	{
		$param = func_get_args();
		$model = $this->model->list_once($param[1]);
		
		if($this->model->remove($param[1])){
			unlink($model[0]['logotipo_brokers']);
			$this->session->setFlashMessage('Brokers removido do sistema','success');
			$this->redirector('/brokers');
		}
	}
}
			