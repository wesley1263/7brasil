<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\Form\Form;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Session\Session;
use Vendor\Library\Table\Table;
use Application\Models\ClientePF;
use Application\Models\ClientePJ;

class ClienteController extends OXE_Controller {
	
	public function init()
	{
		$this->model = new ClientePF();
		$this->session = new Session();
	}
	
	public function indexAction()
	{
		
		$data['title'] = 'Gerenciar Clientes';
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/index');
		$this->view('template/footer');
		
	}
	
	public function fisicaAction()
	{
		$form = new Form();
		$table = new Table();
		$data['title'] = 'Gerenciar Clientes - Pessoa Física';
		$data['form'] = $form;
		$data['table'] = $table;
		$data['clientes'] = $this->model->list_all();
		
		
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('cliente/pf/listaFisica',$data);
		$this->view('template/footer');
	}
	
	public function cadfisicaAction()
	{
		$form = new Form();
		$data['title'] = 'Cadastro Clientes - Pessoa Física';
		$data['form'] = $form;
		$data['model'] = $this->model;
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/pf/fisica',$data);
		$this->view('template/footer');
	}
	
	public function saveFisicaAction()
	{
		$_POST['nome_clientePF'] = strtoupper($_POST['nome_clientePF']);
		foreach($_POST as $key => $value){
			$_POST[$key] = utf8_decode(strip_tags($value));
		}
		
		if($_FILES['copia_rg_clientePF']['error'] == UPLOAD_ERR_OK){
			$extension = explode('.',$_FILES['copia_rg_clientePF']['name']);
			$file = md5(time().$extension[0]);
			$extension = '.'.end($extension);
			$ok = move_uploaded_file($_FILES['copia_rg_clientePF']['tmp_name'], UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension);
			if($ok){
				$_POST['copia_rg_clientePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension;
			}
		}		
		
		if($_FILES['copia_cpf_clientePF']['error'] == UPLOAD_ERR_OK){
			$extension = explode('.',$_FILES['copia_cpf_clientePF']['name']);
			$file = md5(time().$extension[0]);
			$extension = '.'.end($extension);
			$ok = move_uploaded_file($_FILES['copia_cpf_clientePF']['tmp_name'], UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension);
			if($ok){
				$_POST['copia_cpf_clientePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension;
			}
		}
		
		if($_FILES['foto_clientePF']['error'] == UPLOAD_ERR_OK){
			$extension = explode('.',$_FILES['foto_clientePF']['name']);
			$file = md5(time().$extension[0]);
			$extension = '.'.end($extension);
			$ok = move_uploaded_file($_FILES['foto_clientePF']['tmp_name'], UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension);
			if($ok){
				$_POST['foto_clientePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension;
			}
		}
		$user = $this->model->findClientePF($_POST['cpf_clientePF']);
		if(!$user){
		$ok = $this->model->insert($_POST);
		if($ok){
			$this->session->setFlashMessage('Cadastro de Cliente PF realizado com sucesso','success');
			$this->redirector('/cliente/fisica');
			}
		}else{
			$this->session->setFlashMessage('Cliente PF já cadastrado no sistema!','error');
			$this->redirector('/cliente/fisica');
		}
	}
	
	public function juridicaAction()
	{
		$form = new FormStyle();	
		$model = new ClientePJ();
		$table = new Table();
		
		$data['title'] = 'Gerenciar Clientes - Pessoa Física';
		$data['form'] = $form;
		$data['clientes'] = $model->list_all();
		$data['table'] = $table;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cliente/pj/lista_jurdica',$data);
		$this->view('template/footer');
		
	}
	
	public function cadJuridicaAction()
	{
		$form = new FormStyle();	
		$data['title'] = 'Cadastrar Clientes - Pessoa Jurídica';
		$data['form'] = $form;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/pj/juridica',$data);
		$this->view('template/footer');
	}
	
	public function findCepAction()
	{
		$cep = file_get_contents("http://clareslab.com.br/ws/cep/json/".$_POST['cep'].'/');
		echo utf8_encode($cep);
	}
	
	public function saveJuridicaAction()
	{
		$model = new ClientePJ();
		$_POST['nomefantasia_clientePJ'] = strtoupper($_POST['nomefantasia_clientePJ']);
		foreach($_POST as $key => $value){
			$_POST[$key] = utf8_decode(strip_tags($value));
		}
		
		if($_FILES['logotipo_clientePJ']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['logotipo_clientePJ']['name']);
			$extension = '.'.end($file);
			$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.md5(time().$file[0]).$extension;
			if(move_uploaded_file($_FILES['logotipo_clientePJ']['tmp_name'],$arq)){
				$_POST['logotipo_clientePJ'] = $arq;
			}
		}
		
		
		if(!$model->findCNPJ($_POST['cnpj_clientePJ'])){
			if($model->insert_cli($_POST)){
			$this->session->setFlashMessage('Empresa cadastrada com sucesso','success');
			$this->redirector('/cliente/juridica');
			}else{
				$this->session->setFlashMessage('Erro ao tentar cadastrar Empresa!','error');
				$this->redirector('/cliente/juridica');
			}
		}else{
			$this->session->setFlashMessage('Empresa já cadastrada no sistema!','error');
			$this->redirector('/cliente/juridica');
		}
		
	}

	public function listClientePFAction()
	{
		return ($this->model->list_once($_POST['id_clientePF']));
	}
	
	
}
