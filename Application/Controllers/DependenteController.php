<?php

use Vendor\Core\OXE_Controller;
use Application\Models\DependentePF;
use Application\Models\DependentePJ;
use Application\Models\Classificacao;
use Application\Models\ClientePF;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Session\Session;
use Vendor\Library\Table\Table;

class DependenteController extends OXE_Controller{
		
	public function init()
	{

	}
	
	public function indexAction()
	{
		
	}
	
	public function dependentePFAction()
	{
		$model = new DependentePF();
		$form = new FormStyle();
		$table = new Table();
		$session = new Session();
		$cliente = new ClientePF();
		
		$data['title'] = 'Gerenciar Dependentes';
		$data['dependentes'] = $model->list_all();
		$data['form'] = $form;
		$data['table'] = $table;
		$data['dependentes'] = $model->list_all();
		$data['session'] = $session;
		$data['cliente'] = $cliente->list_all();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('dependentePF/index',$data);
		$this->view('template/footer');

	}
	
	public function cadDependentePFAction()
	{
		
		$model = new DependentePF();
		$form = new FormStyle();
		$class = new Classificacao ();
		$sess = new Session ();
		$data ['title'] = 'Gerenciar Dependentes';
		$data ['classif'] = $class->list_all ();
		$data ['clientes'] = $model->clientePF ();
		$data ['form'] = $form;
		$data['session'] = $sess;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('dependentePF/cadDep',$data);
		$this->view('template/footer');
	}
	
	public function saveDependentePFAction()
	{
		$model = new DependentePF();
		$session = new Session();
		
		if($model->findCPF($_POST['cpf_dependente'])){
			$session->setFlashMessage('Dependente já cadastrado no sistema!','error');
			$this->redirector('/dependente/dependentePF');
			exit;
		}
		$_POST['nome_dependente'] = strtoupper($_POST['nome_dependente']);
		$_POST['dt_nascimento_dependente'] = $this->dateToMysql($_POST['dt_nascimento_dependente']);
		if($_POST['dt_validade_passaporte_dependente']){
		$_POST['dt_validade_passaporte_dependente'] = $this->dateToMysql($_POST['dt_validade_passaporte_dependente']);
		}

		
		if($_FILES['foto_dependente']['size'] > 0){
			$file = explode('.', $_FILES['foto_dependente']['name']);
			$ext = '.'.end($file);
			$new_name = md5(time().$file[0]);
			$_POST['foto_dependente'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_name.$ext;
			
			move_uploaded_file($_FILES['foto_dependente']['tmp_name'],UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_name.$ext);
		}
		
		if($_FILES['copia_cpf_dependente']['size'] > 0){
			$file = explode('.', $_FILES['copia_cpf_dependente']['name']);
			$ext = '.'.end($file);
			$new_name = md5(time().$file[0]);
			$_POST['copia_cpf_dependente'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_name.$ext;
			move_uploaded_file($_FILES['copia_cpf_dependente']['tmp_name'],UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_name.$ext);
		}

		if($_FILES['copia_rg_dependente']['size'] > 0){
			$file = explode('.', $_FILES['copia_rg_dependente']['name']);
			$ext = '.'.end($file);
			$new_name = md5(time().$file[0]);
			$_POST['copia_rg_dependentePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_name.$ext;
			
			move_uploaded_file($_FILES['copia_rg_dependente']['tmp_name'],UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_name.$ext);
		}
		
		
		if($model->add($_POST)){
			$session->setFlashMessage('Dependente adicionado com sucesso','success');
			$this->redirector('/dependente/dependentePF');
		}

	}
	
	public function deleteDependentePFAction()
	{
		$param = func_get_args();
		$model = new DependentePF();
		$session = new Session();
		$dependente = $model->list_once($param[1]);
		
		if($model->remove($param[1])){
			unlink($dependente['foto_dependente']);
			unlink($dependente['copia_cpf_dependente']);
			unlink($dependente['copia_rg_dependente']);
			$session->setFlashMessage('Dependente removido com sucesso','success');
			$this->redirector('/dependente/dependentePF');
		}
		
	}
	
	public function updateDependentePFAction()
	{
		$param = func_get_args();
		
		$model = new DependentePF();
		$session = new Session();
		$form = new FormStyle();
		$class = new Classificacao();
		
		
		$data['title'] = 'Atualizar Dependentes';
		$data['classif'] = $class->list_all();
		$data['dependente'] = $model->list_once($param[1]);
		$data['clientes'] = $model->clientePF();
		$data['form'] = $form;

		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('dependentePF/updtDep',$data);
		$this->view('template/footer');
		
		
	}
	
	public function alterDependentePFAction()
	{
		$model = new DependentePF();
		$session = new Session();
		
		$_POST['nome_dependente'] = strtoupper($_POST['nome_dependente']);
		$_POST['dt_nascimento_dependente'] = $this->dateToMysql($_POST['dt_nascimento_dependente']);
		if($_POST['dt_validade_passaporte_dependente']){
		$_POST['dt_validade_passaporte_dependente'] = $this->dateToMysql($_POST['dt_validade_passaporte_dependente']);
		}

		if($_FILES['foto_dependente']['size'] > 0){
			$file = explode('.', $_FILES['foto_dependente']['name']);
			$ext = '.'.end($file);
			$new_name = md5(time().$file[0]);
			$_POST['foto_dependente'] = UPLOAD_PATH.$new_name.$ext;
			
			move_uploaded_file($_FILES['foto_dependente']['tmp_name'],UPLOAD_PATH.$new_name.$ext);
		}
		
		if($_FILES['copia_cpf_dependente']['size'] > 0){
			$file = explode('.', $_FILES['copia_cpf_dependente']['name']);
			$ext = '.'.end($file);
			$new_name = md5(time().$file[0]);
			$_POST['copia_cpf_dependente'] = UPLOAD_PATH.$new_name.$ext;
			move_uploaded_file($_FILES['copia_cpf_dependente']['tmp_name'],$new_name.$ext);
		}

		if($_FILES['copia_rg_dependente']['size'] > 0){
			$file = explode('.', $_FILES['copia_rg_dependente']['name']);
			$ext = '.'.end($file);
			$new_name = md5(time().$file[0]);
			$_POST['copia_rg_dependente'] = UPLOAD_PATH.$new_name.$ext;
			
			move_uploaded_file($_FILES['copia_rg_dependente']['tmp_name'],$new_name.$ext);
		}
		
		
		if($model->alter($_POST)){
			$session->setFlashMessage('Dados de Dependente atualizado com sucesso','success');
			$this->redirector('/dependente/dependentePF');
		}
	}
	
		
	private function dateToMysql($date)
	{
		$data = explode('/',$date);
		return $data[2].'-'.$data[1].'-'.$data[0];
	}
}
			