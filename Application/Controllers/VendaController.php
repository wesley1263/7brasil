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
use Application\Models\Brokers;
use Application\Models\Moeda;
use Application\Models\Cambio;
use Application\Models\Hotel;
use Application\Models\Seguradora;
use Application\Models\TipoSeguro;
use Application\Models\Continente;
use Application\Models\Seguro;
use Application\Models\Ticket;
use Application\Models\CompraTicket;
use Application\Models\CompaniaCruzeiro;
use Application\Models\Cruzeiro;
use Application\Models\ProdutoOutros;
use Application\Models\Compania;
use Application\Models\Origem;
use Application\Models\Destino;
use Application\Models\Classe;
use Application\Models\Passagens;

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
		### Estanciar as classess ###	
		$clientePF = new ClientePF();
		$dependente = new DependentePF();
		$participacao = new Participacao();
		$locadora = new Locadora();
		$carro = new Carro();
		$brokers = new Brokers();
		$Moeda = new Moeda();
		$cambio = new Cambio();
		$seguradora = new Seguradora();
		$tipoSeguro = new TipoSeguro();
		$continente = new Continente();
		$ticket = new Ticket();
		$CompraTicket = new CompraTicket();
		$companiaCruzeiro = new CompaniaCruzeiro();
		$cruzeiro = new Cruzeiro();
		$ProdutoOutros = new ProdutoOutros();
		$compania = new Compania();
		$origem = new Origem();
		$destino = new Destino();
		$classe = new Classe();
		$passagens = new Passagens();
		### Estanciar as classess ###	

				
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
		
		############### Iteração de Sessão de Tickets##########
		if(isset($_SESSION['tickets'])){
			$arrayTicket = array();
			foreach($_SESSION['tickets'] as $key => $value){
				foreach($value['id_tickets'] as $k => $v){
					$arrayTicket[] = $CompraTicket->list_once($v);
				}
			}
			$data['compraTickets'] = $arrayTicket;
		}
		
		############### Iteração de Sessão de Tickets##########
		
		
		
		
		
		############### Iteração de Sessão de Hotel##########
		if(isset($_SESSION['hotel'])){
			$arrayHotel = array();
			$hotel = new Hotel();
			foreach($_SESSION['hotel'] as $key => $value){
				foreach($value as $k => $v){
					foreach($v as $chave => $valor){
					$arrayHotel[] = $hotel->list_once($valor);
					}
				}
			}
			$data['hoteis'] = $arrayHotel;
		}
		############### Iteração de Sessão de Hotel##########
		
		
		############### Iteração de Sessão de Seguro##########
		if(isset($_SESSION['seguro'])){
			$seguro = new Seguro();
			$arraySeguro = array();
			foreach($_SESSION['seguro'] as $key => $value){
				foreach($value as $k => $val){
					foreach($val as $chave => $valor){
						$arraySeguro[] = $seguro->list_once($valor);
					}
				}
			}
			$data['seguros'] = $arraySeguro;
		}
		############### Iteração de Sessão de Seguro##########
		
		
		############### Iteração de Sessão de Cruzeiros ##########
		if(isset($_SESSION['cruzeiros'])){
			$arrayCruzeiro = array();
			foreach($_SESSION['cruzeiros'] as $key => $value){
				foreach($value['id_cruzeiro'] as $chave => $valor){
					$arrayCruzeiro[] = $cruzeiro->list_once($valor);
				}
			}
			
			$data['cruzeiros'] = $arrayCruzeiro;
		}
		############### Iteração de Sessão de Cruzeiros ##########
		
		
		############### Iteração de Sessão de Outro Produtos ##########
		if(isset($_SESSION['produtos'])){
			$arrayProdutos = array();
			foreach($_SESSION['produtos'] as $key => $value){
				foreach($value['id_produtos'] as $chave => $valor){
					$arrayProdutos[] = $ProdutoOutros->list_once($valor);
				}
			}
			$data['produtos'] = $arrayProdutos;
		}
		############### Iteração de Sessão de Outro Produtos ##########
		
		
		############### Iteração de Sessão Passagens ##########
		if(isset($_SESSION['passagens'])){
			$arrayPassagens = array();
			foreach($_SESSION['passagens'] as $key => $value){
				foreach($value['id_passagens'] as $valor){
					$arrayPassagens[] = $passagens->list_once($valor);
				}
			}
			$data['passagens'] = $arrayPassagens;
		}
		############### Iteração de Sessão Passagens ##########
		
		
		
		
		
		
		$data['title'] = '7 Brasil - Vendas';
		
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['clientesPF'] = $clientePF;
		$data['participacao'] = $participacao->list_all();
		$data['locadoras'] = $locadora->list_all();
		$data['carros'] = $carro->getCambio();
		$data['brokers'] = $brokers->list_all();
		$data['moedas'] = $cambio->list_all();
		$data['seguradoras'] = $seguradora->list_all();
		$data['tipoSeguros'] = $tipoSeguro->list_all();
		$data['continentes'] = $continente->list_all();
		$data['tickets'] = $ticket->list_all();
		$data['companiasCruzeiro'] = $companiaCruzeiro->list_all();
		$data['companias'] = $compania->list_all();
		$data['origens'] = $origem->list_all();
		$data['destinos'] = $destino->list_all();
		$data['classes'] = $classe->list_all();
				
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
				if(count($_SESSION['id_clientePF']['id']) == 0){
					unset($_SESSION['id_clientePF']);
				}
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
			