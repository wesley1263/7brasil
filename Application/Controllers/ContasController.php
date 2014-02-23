<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Vendor\Library\Pagination\Pagination;
use Application\Models\Contas;
use Application\Models\Grupo;
use Application\Models\Subgrupo;
use Application\Models\Filial;

class ContasController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Contas();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
		$param = func_get_args();
			//$this->dump($param);
		
		if($param){
			
			$array['de'] = $param[0];
			$array['ate'] = $param[1];
			$array['id_grupo'] = $param[2];
			$array['id_subgrupo'] = $param[3];
			$array['id_filial'] = $param[4];
			$array['status_contas'] = $param[5];
			$page = $param[7];
			
			
			// $pagination = new Pagination();
			// $count = $this->model->list_all();
			// $inicio = $pagination->init();
			// $limit = 15;
			// $pagination->setLimit($limit);
			// $pagination->setParam('page');
			// $pagination->setTotalRegister($count);
			$limit = 10;
			$total = ceil(count($this->model->list_all()) / $limit);
			
			$data['listas'] = $this->model->lista_tudo($array);
			$data['total'] = $total;
		}
		
		$grupo = new Grupo();
		$filial = new Filial();
		$subgrupo = new Subgrupo();
				
		$data['title'] = 'Contas a Pagar';
		$data['grupo'] = $grupo->list_all();
		$data['filial'] = $filial->list_all();
		$data['subgrupo'] = $subgrupo->list_all();
		$data['contas'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('contas/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadContasAction()
	{
		$param = func_get_args();
		if($param){
			$data['contas'] = $this->model->list_once($param[1]);
		}
		$grupo = new Grupo();
		$filial = new Filial();
		$subgrupo = new Subgrupo();
		$moeda = new Application\Models\Cambio();
		
		$data['title'] = 'Cadastro de Contas';
		$data['grupo'] = $grupo->list_all();
		$data['filial'] = $filial->list_all();
		$data['subgrupo'] = $subgrupo->list_all();
		$data['moeda'] = $moeda->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('contas/cadContas',$data);
		$this->view('template/footer');
	}
	
	public function saveContasAction()
	{
		
		if($_FILES['recibo_conta']['size'] > 0 && $_FILES['recibo_conta']['error'] == UPLOAD_ERR_OK){
			$file = explode('.', $_FILES['recibo_conta']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['recibo_conta']['tmp_name'], UPLOAD_PATH.$name.$ext);
			$_POST['recibo_conta'] = UPLOAD_PATH.$name.$ext;
		}
		
		 
		
		
		
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
			 $vezes = $_POST['vezes_conta'];
			 unset($_POST['vezes_conta']);
		
		
		if($_POST['id_contas'] == null){
			 $valor_total = $_POST['valor_contas'];
			 $valor_parcelado = $valor_total / $vezes;
			 $validade = new DateTime($_POST['validade_conta']);
			 $arrayContas = array();
			 
			if(count($this->model->findContas($_POST)) == 0){
				for ($i=0; $i < $vezes; $i++) { 
					
				 $arrayContas['id_grupo'] = $_POST['id_grupo'];
				 $arrayContas['id_subgrupo'] = $_POST['id_subgrupo'];
				 $arrayContas['id_filial'] = $_POST['id_filial'];
				 $arrayContas['validade_conta'] =  $validade->format("Y-m-d");
				 $arrayContas['valor_contas'] = $valor_parcelado;
				 $arrayContas['status_contas'] = '2';
				 $arrayContas['descricao_contas'] = $_POST['descricao_contas'];
				 $validade->modify('+ 1 month');
			$this->model->add($arrayContas);
			
		 }
				$this->session->setFlashMessage('Conta à pagar adicionado ao sistema.','success');
				$this->redirector('/contas');
			}else{
				$this->session->setFlashMessage('Conta à pagar já lançada no sistema!','error');
				$this->redirector('/contas');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Conta à pagar atualizada no sistema.','success');
					$this->redirector('/contas');
				}
		}
		
	}
	
	public function deleteContasAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Contas removido do sistema','success');
			$this->redirector('/contas');
		}
	}
	
	public function findContasAction()
	{
		$this->redirector('/contas/index/'.$_POST['data_contas_de'].'/'.$_POST['data_contas_ate'].'/'.$_POST['id_grupo'].'/'.$_POST['id_subgrupo'].'/'.$_POST['id_filial'].'/'.$_POST['status_contas'].'/page/0');
	}
}
			