	<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Session\Session;
use Vendor\Library\Table\Table;
use Application\Models\DependentePF;
use Application\Models\Classificacao;

class FuncionarioController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->model = new DependentePF();
		$this->form = new FormStyle();
		$this->table = new Table();
		$this->classificacao = new Classificacao();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
		$empresa = new Application\Models\ClientePF();
		
		$data['title'] = 'Gerenciar Funcionários';
		$data['dependentes'] = $this->model->list_all();
		$data['empresa'] = $empresa->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		
		$data['empresas'] = $this->model->list_all();
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('funcionario/index',$data);
		$this->view('template/footer');
	}
	
	public function cadFuncionarioAction()
	{
		$data['title'] = 'Gerenciar Funcionários';
		// $data['dependentes'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['classificacao'] = $this->classificacao->list_all();
		
		$data['empresas'] = $this->model->lista_tudo();
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('funcionario/cadFunc',$data);
		$this->view('template/footer');
		
	}
	
	
	public function getDepartamentoAction()
	{
		$departamento = new Application\Models\Departamento();
		echo json_encode($departamento->getDepartamento($_POST['id_clientePF']));
	}
	
	public function saveFuncionarioAction()
	{
		if($this->model->findCPF($_POST['cpf_dependente'])){
			$this->session->setFlashMessage('Funcionário já cadastrado no sistema','error');
			$this->redirector('/funcionario');
			exit;
		}
		$_POST['nome_dependente'] = strtoupper($_POST['nome_dependente']);
		$_POST['dt_nascimento_dependente'] = $this->dateToMysql($_POST['dt_nascimento_dependente']);
		if(!is_null($_POST['dt_validade_passaporte_dependente'])){
			$_POST['dt_validade_passaporte_dependente'] = $this->dateToMysql($_POST['dt_validade_passaporte_dependente']);
		}


		if($_FILES['foto_dependente']['size'] > 0){
			$file = explode('.',$_FILES['foto_dependente']['name']);
			$ext = '.'.end($file);
			$new_file = md5(time().$file[0]);
			$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_file.$ext;
			$_POST['foto_dependente'] = $arq;
			move_uploaded_file($_FILES['foto_dependente']['tmp_name'], $arq);
		}
		
		if($_FILES['copia_rg_dependente']['size'] > 0){
			$file = explode('.',$_FILES['copia_rg_dependente']['name']);
			$ext = '.'.end($file);
			$new_file = md5(time().$file[0]);
			$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_file.$ext;
			$_POST['copia_rg_dependente'] = $arq;
			move_uploaded_file($_FILES['copia_rg_dependente']['tmp_name'], $arq);
		}

		if($_FILES['copia_cpf_dependente']['size'] > 0){
					$file = explode('.',$_FILES['copia_cpf_dependente']['name']);
					$ext = '.'.end($file);
					$new_file = md5(time().$file[0]);
					$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_file.$ext;
					$_POST['copia_cpf_dependente'] = $arq;
					move_uploaded_file($_FILES['copia_cpf_dependente']['tmp_name'], $arq);
				}

		if($this->model->add($_POST)){
			$this->session->setFlashMessage('Funcionário cadastrado com sucesso.','success');
			$this->redirector('/funcionario');
		}
		
	}
	
	public function updateFuncionarioAction()
	{
		$param = func_get_args();
		$model = $this->model;
		$departamento = new Application\Models\Departamento();
		
		$data['title'] = 'Gerenciar Funcionários';
		$data['dependentes'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['classificacao'] = $this->classificacao->list_all();
		$data['funcionarios'] = $model->list_once($param[1]);
		$data['departamentos'] = $departamento->list_all();
		
		$data['empresas'] = $this->model->clientePF();
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('funcionario/updateFunc',$data);
		$this->view('template/footer');
	}
	
	public function alterFuncionarioAction()
	{
		$_POST['nome_dependente'] = strtoupper($_POST['nome_dependente']);
		// $_POST['dt_nascimento_dependente'] = $this->dateToMysql($_POST['dt_nascimento_dependente']);
		// if(!is_null($_POST['dt_validade_passaporte_dependente'])){
			// $_POST['dt_validade_passaporte_dependentePJ'] = $this->dateToMysql($_POST['dt_validade_passaporte_dependente']);
		// }


		if($_FILES['foto_dependente']['size'] > 0){
			$file = explode('.',$_FILES['foto_dependente']['name']);
			$ext = '.'.end($file);
			$new_file = md5(time().$file[0]);
			$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_file.$ext;
			$_POST['foto_dependente'] = $arq;
			move_uploaded_file($_FILES['foto_dependente']['tmp_name'], $arq);
		}
		
		if($_FILES['copia_rg_dependente']['size'] > 0){
			$file = explode('.',$_FILES['copia_rg_dependente']['name']);
			$ext = '.'.end($file);
			$new_file = md5(time().$file[0]);
			$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_file.$ext;
			$_POST['copia_rg_dependente'] = $arq;
			move_uploaded_file($_FILES['copia_rg_dependente']['tmp_name'], $arq);
		}

		if($_FILES['copia_cpf_dependente']['size'] > 0){
					$file = explode('.',$_FILES['copia_cpf_dependente']['name']);
					$ext = '.'.end($file);
					$new_file = md5(time().$file[0]);
					$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.$new_file.$ext;
					$_POST['copia_cpf_dependente'] = $arq;
					move_uploaded_file($_FILES['copia_cpf_dependente']['tmp_name'], $arq);
				}

		if($this->model->alter($_POST)){
			$this->session->setFlashMessage('Dados de Funcionário atualizado com sucesso.','success');
			$this->redirector('/funcionario');
		}
	}
	
	public function removeFuncionarioAction()
	{
		
		$param = func_get_args();
		$model = $this->model;
		
		if($model->remove($param[1])){
			$this->session->setFlashMessage('Funcionario removido do sistema','success');
			$this->redirector('/funcionario');
		}
	}
	
	private function dateToMysql($date)
	{
		$data = explode('/', $date);
		return $data[2].'-'.$data[1].'-'.$data[0];
	}
}
			