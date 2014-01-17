<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Venda;
use Application\Models\ClientePF;
use Application\Models\ClientePJ;
use Application\Models\DependentePF;
use Application\Models\Participacao;
use Application\Models\Locadora;
use Application\Models\Carro;

class VendaController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Venda();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['vendas'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('venda/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadVendaPFAction()
	{
			
		$clientePF = new ClientePF();
		$dependente = new DependentePF();
		$participacao = new Participacao();
		$locadora = new Locadora();
		$carro = new Carro();
		
		########### Interando sessão de cliente ################
		if(isset($_SESSION['id_clientePF'])){
			foreach($_SESSION['id_clientePF']['id'] as $key => $value){
				$clientes[] = $clientePF->list_once($value);
			}
			$data['clientes'] = $clientes;
		}
		########### Interando sessão de cliente ################
		
		
		
		####### Iterando sessão de dependentes #############
		$depArray = array();
		if(isset($_SESSION['dependentes'])){
			foreach($_SESSION['dependentes'] as $key => $value){
				if(count($value) != null){
					$depArray[] = $dependente->list_once($value);
				}
			}
			$data['dependentes'] = $depArray;
		}
		####### Iterando sessão de dependentes #############
		
		
		############### Iteração de Sessão de Carros##########
		if(isset($_SESSION['carros'])){
			$arrayCarro = array();
			foreach($_SESSION['carros'] as $key => $value){
				foreach($value['id_carro'] as $k => $v){
					$arrayCarro[] = $carro->list_once($v);
				}
			}
			$data['vCarros'] = $arrayCarro;
		}
		############### Iteração de Sessão de Carros##########
		
		
		$data['title'] = '7 Brasil - Vendas';
		
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['participacao'] = $participacao->list_all();
		$data['locadoras'] = $locadora->list_all();
		$data['carros'] = $carro->getCambio();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('venda/pf/cadVendaPF',$data);
		$this->view('template/footer');
	}
	

	public function addClientePFAction()
	{
		if($_POST['id_PF'] != null){
			if(in_array($_POST['id_PF']['id'], $_SESSION['id_clientePF'])){
				$this->session->setFlashMessage('Cliente já foi Adicionado a lista de venda!.','error');
				$this->redirector('/venda/cadVendaPF');
				exit();
			}
			$_SESSION['id_clientePF']['id'][] = $_POST['id_PF'];
			$_SESSION['id_clientePF']['participacao'][] = $_POST['id_participacao'];
			$this->session->setFlashMessage('Cliente Adicionado a lista de venda.','success');
			$this->redirector('/venda/cadVendaPF');
		}else{
			$this->session->setFlashMessage('Cliente não encontrado!','error');
			$this->redirector('/venda/cadVendaPF');
		}	
		
	}
	
	public function findDependenteAction()
	{
		echo json_encode($this->model->getDependentes($_POST['id_cliente']));
	}
	
	public function addDependenteAction()
	{
		if(count($_POST['id_dependentePF']) != 0){
			$_SESSION['dependentes'][$_POST['id_clientePF']] = $_POST['id_dependentePF'];
			$this->session->setFlashMessage('Dependente adicionado à lista de venda.','success');
			$this->redirector('/venda/cadVendaPF');
		}
	}

	public function deleteDependenteAction()
	{
		$param = func_get_args();
	foreach($_SESSION['dependentes'] as $key => $value){
		if($key == $param[1]){
			foreach($value as $K => $val){
				if($val == $param[3]){
					unset($_SESSION['dependentes'][$key][$K]);
				}
			}
		}
	}
		$this->session->setFlashMessage('Dependente adicionado  lista de venda','success');
		$this->redirector('/venda/cadVendaPF');
	}
	
	public function listCarroAction()
	{
		$Carro = new Carro();
		$id_carro = $_SESSION['carros'][$_POST['id_cliente']]['id_carro'];
		$array = array();
		foreach($id_carro as $key => $value){
			$array[]= $Carro->list_once($value);
		}
		echo json_encode($array);
	}
	
	public function deleteClientePFAction()
	{
		$param = func_get_args();
		foreach($_SESSION['id_clientePF']['id'] as $key => $value){
			if($value == $param[1]){
				unset($_SESSION['id_clientePF']['id'][$key]);
				unset($_SESSION['id_clientePF']['participacao'][$key]);
				unset($_SESSION['dependentes'][$value]);
			}
		}
		$this->session->setFlashMessage('Cliente removido da lista de venda','success');
		$this->redirector('/venda/cadVendaPF');
	}
	
	public function saveVendaAction()
	{
		$_POST[''] = strtoupper($_POST['']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST[''] == null){
			
		}
		
		$this->dump($_POST);
	}

	public function findClientePFAction()
	{
		$clientePF = new ClientePF();
			echo json_encode($clientePF->findClienteCPF($_POST['cpf']));
		
	}
	
		#####################################
		############ Cliente PJ #############
		#####################################
	
		public function cadVendaPJAction()
	{
		
		$data['title'] = '7 Brasil - Vendas';
				
		
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('venda/pj/cadVendaPJ',$data);
		$this->view('template/footer');
	}
	
	
	
	
}
			