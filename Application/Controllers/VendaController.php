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
use Application\Models\Agencia;
use Application\Models\Agente;
use Application\Models\TipoPagamento;
use Application\Models\CartaoPF;
use Application\Models\TipoCartao;
use Application\Models\ClienteTicket;
use Application\Models\VendaClientePF;
use Application\Models\FormaPagamento;
use Application\Models\CarroClientePF;
use Application\Models\AsseguradoPF;
use Application\Models\CruzeiroClientePF;
use Application\Models\VendaDependentePF;
use Application\Models\DependentePFTicket;
use Application\Models\CruzeiroDependentePF;
use Application\Models\HotelClientePF;
use Application\Models\HotelDependentePF;
use Application\Models\OutroProdutoPF;
use Application\Models\AdicionaClientePF;
use Application\Models\AdicionarDependentePF;


class VendaController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Venda();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
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
		$agencia = new Agencia();
		$agente = new Agente();
		$tipoPagamento = new TipoPagamento();
		$cartaoPF = new CartaoPF();
		$tipoCartao = new TipoCartao();
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
		$data['agencias'] = $agencia->list_all();
		$data['agentes'] = $agente->list_all();
		$data['tipoPagamento'] = $tipoPagamento->list_all();
		$data['tipoCartao'] = $tipoCartao->list_all();
		$data['cartaoPF'] = $cartaoPF;		
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
		$this->session->setFlashMessage('Dependente removido da lista de venda','success');
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
		########### Instanciar classes necessárias #########
		$agencia = new Agencia();
		$agente = new Agente();
		$venda = new Venda();
		$venda_ClientePF = new VendaClientePF();
		$formPagamento = new FormaPagamento();
		$clienteTicket = new ClienteTicket();
		$CompraTicket = new CompraTicket();
		$carro = new CarroClientePF();
		
		
		######## Preparando os arrays para as tabelas ########
		$arrayVenda = array();
		$vendaClientePF = array();
		$vendaDependentePF = array();
		$arrayTicket = array();
		
		
		######### Buscando dados na Sessão ############
		$cliente = $this->session->getSession('id_clientePF');
		$usuario = $this->session->getSession('user');
		$formaPagamento = $this->session->getSession('formarPagamento');
		if(isset($_SESSION['dependentes'])){
			$dependente = $this->session->getSession('dependentes');
		}else{
			$dependente = null;
		}
		
		############ Preparando dados para tbl_venda ###########
		$id_usuario = $usuario['id_usuario'];
		$id_agencia = $_POST['id_agencia'] == '0' ? null : $_POST['id_agencia'];
		$id_agente = isset($_POST['id_agente']) ? $_POST['id_agente'] : null;
		$total_comissao = $_POST['total_comissao'];
		$total_venda = $_POST['total_venda'];
		$data_venda = date('Y-m-d');
		$descricao_venda = $_POST['descricao_venda'];
		$numero_processo = str_pad($id_usuario,3,0,STR_PAD_LEFT).date('m').date('Y');
		
		
		
		############ Busca os valores de Agencia e Agente ###########
		if($id_agencia != null){
			$busca_agencia = $agencia->list_once($id_agencia);
			$busca_agente = $agente->list_once($id_agente);
			
			$valor_agencia = $busca_agencia[0]['comissao_agencia'];
			$valor_agente = ($total_venda * ceil($busca_agente['porcentagem_agente'])) / 100;
		}else{
			$valor_agencia = 0.00;
			$valor_agente = 0.00;
		}
		
		$tbl_venda = array(
			'id_usuario' => $id_usuario,
			'id_agencia' => $id_agencia,
			'id_agente' => $id_agente,
			'valor_agencia' => $valor_agencia,
			'valor_agente' => $valor_agente,
			'valor_casa' => $total_comissao,
			'total_venda' => $total_venda,
			'data_venda' => $data_venda,
			'descricao_venda' => $descricao_venda,
			'nm_processo_venda' => $numero_processo
		);
		
		
		
		########### Adicionando nas tabela envolvidas ##########
		$id_venda = $this->model->add($tbl_venda);
		if($id_venda){
			$tbl_venda['id_venda'] = $id_venda;
			$tbl_venda['nm_processo_venda'] = $numero_processo.$id_venda;
			if($this->model->alter($tbl_venda)){
				######## Preparando array vendaClientePF ###########
				$tbl_vendaClientePF = array();
				foreach($cliente['id'] as $key => $value){
					$tbl_vendaClientePF[]['id_clientePF'] = $value;
					$tbl_vendaClientePF[$key]['id_participacaoPF'] = $cliente['participacao'][$key];
					$tbl_vendaClientePF[$key]['id_venda'] = $id_venda;
				}
				
				foreach($tbl_vendaClientePF as  $array){
					$venda_ClientePF->add($array);
				}
				
				########### Preparando o array de venda_dependentePF
				$arrayDependente = array();
				if(isset($_SESSION['dependentes'])){
					foreach($_SESSION['dependentes'] as $key => $value){
						foreach($value as $chave => $valor){
							$arrayDependente[]['id_dependentePF'] = $valor;
							$arrayDependente[$chave]['id_venda'] = $id_venda;
						}
					}
						$vendaDependentePF = new VendaDependentePF();
						
						foreach($arrayDependente as $key => $value){
							$vendaDependentePF->add($value);
						}
				}
				
				######### Registrando forma de pagamento ###########
				$data = array();
				foreach($formaPagamento as $key => $value){
					foreach($value as $chave => $valor){
						$data['id_venda'] = $id_venda;
						$data['id_formaPagamento'] = $valor;
						$formPagamento->alter($data);
					}
				}
				
				
				
				
				
				############### Adicionando ticket venda cliente ###########
				if(isset($_SESSION['tickets'])){
					$arrayTicket = array();
					$id_compraTicket = null;
					foreach($_SESSION['tickets'] as $key => $value){
						foreach($value['id_tickets'] as $k => $v){
							$arrayTicket[] = $CompraTicket->list_once($v);
						}
					}
					
					$data = array();
					foreach($arrayTicket as $key => $value){
						
						$data['id_venda'] = $id_venda;
						$data['id_moeda'] = $value['id_moeda'];
						$data['id_compraTicket'] = $value['id_compraTicket'];
						$id_compraTicket = $value['id_compraTicket'];
						$data['id_clientePF'] = $value['id_clientePF'];
						$id_participacao = array_search($value['id_clientePF'],$_SESSION['id_clientePF']['id']);
						$data['id_participacao'] = $_SESSION['id_clientePF']['participacao'][$id_participacao];
						
						$clienteTicket->add($data);
					}
					
					if(isset($_SESSION['dependentes'])){
						$dependentePFTicket = new DependentePFTicket();
						$sess_dependente = $this->session->getSession('dependentes');
						$data = array();
						foreach ($sess_dependente as $key => $value) {
							foreach($value as $id_dependente){
								$data['id_venda'] = $id_venda;
								$data['id_compraTicket'] = $id_compraTicket;
								$data['id_dependentePF'] = $id_dependente;
								$dependentePFTicket->add($data);
							}
						}
					}
				}
				
				
				############### Adicionando Carros##########
					if(isset($_SESSION['carros'])){
						$carro = new Carro();
						$sess_carro = $this->session->getSession('carros');
						$arrayCarro = array();
						foreach($sess_carro as $key => $value){
							foreach($value['id_carro'] as $k => $v){
								$arrayCarro[] = $carro->list_once($v);
							}
						}
						
						
						$data = array();
						$carroCliente = new CarroClientePF();
						foreach ($arrayCarro as $key => $value) {
							foreach($value as $chave => $valor){
								$data['id_venda'] = $id_venda;
								$data['id_carros'] = $valor['id_carros'];
								$data['id_clientePF'] = $valor['id_clientePF'];
								
								$carroCliente->add($data);
							}
						}
					}
						
				############## Adicionando Seguro ###########
				if(isset($_SESSION['seguro'])){
					$seguro = new Seguro();
					$AsseguradoPF = new AsseguradoPF();
					$sess_seguro = $this->session->getSession('seguro');
					$arraySeguro = array();
						foreach ($sess_seguro as $key => $value) {
							foreach($value['id_seguro'] as $id_seguro){
								$arraySeguro[] = $seguro->list_once($id_seguro);
							}
						}
						$data = array();
						
						foreach ($arraySeguro as $key => $value) {
							foreach ($value as $chave => $valor) {
								$data['id_seguro'] = $valor['id_seguro'];
								$data['id_clientePF'] = $valor['id_clientePF'];
								$data['id_venda'] = $id_venda;
								$id_participacao = array_search($valor['id_clientePF'],$_SESSION['id_clientePF']['id']);
								$data['id_participacao'] = $_SESSION['id_clientePF']['participacao'][$id_participacao];
								
								$AsseguradoPF->add($data);
							}
						}
				}
				
			################ Cruzeiros ################
			
			if(isset($_SESSION['cruzeiros'])){
				$cruzeiroCliente = new CruzeiroClientePF();
				$cruzeiro = new Cruzeiro();
				$arrayCruzeiro = array();
				$id_cruzeiro = null;
				
				$sess_cruz = $this->session->getSession('cruzeiros');
				foreach ($sess_cruz as $key => $value) {
					foreach ($value['id_cruzeiro'] as $chave => $valor) {
						$arrayCruzeiro[] = $cruzeiro->list_once($valor);
					}
				}
				
				$data = array();
				foreach($arrayCruzeiro as $key => $value){
					$data['id_clientePF'] = $value['id_clientePF'];
					$data['id_cruzeiro'] = $value['id_cruzeiro'];
					$id_cruzeiro = $value['id_cruzeiro'];
					$data['id_venda'] = $id_venda;
					$id_participacao = array_search($value['id_clientePF'],$_SESSION['id_clientePF']['id']);
					$data['id_participacao'] = $_SESSION['id_clientePF']['participacao'][$id_participacao];
					$cruzeiroCliente->add($data);
				}
				
				if(isset($_SESSION['dependentes'])){
						$dependenteCruzeiro = new CruzeiroDependentePF();
						$sess_dependente = $this->session->getSession('dependentes');
						$data = array();
						foreach ($sess_dependente as $key => $value) {
							foreach($value as $id_dependente){
								$data['id_venda'] = $id_venda;
								$data['id_cruzeiro'] = $id_cruzeiro;
								$data['id_dependentePF'] = $id_dependente;
								$dependenteCruzeiro->add($data);
							}
						}
					}
				
				
			}
				
				
			############# Hoteis ################	
			if(isset($_SESSION['hotel'])){
				$sess_hotel = $this->session->getSession('hotel');
				$hotel = new Hotel();
				$hotelCliente = new HotelClientePF();
				$arrayHotel = array();
				
				foreach ($sess_hotel as $key => $value) {
					foreach($value['id_hotel'] as $id_hotel){
						$arrayHotel[] = $hotel->list_once($id_hotel);
					}
				}
				
				$data = array();
				$id_clientePF = null;
				$id_hotel = null;
				foreach ($arrayHotel as $key => $value) {
					foreach ($value as $chave => $valor) {
					$data['id_venda'] =  $id_venda;
					$data['id_hotel'] = $valor['id_hoteis'];
					$id_hotel = $valor['id_hoteis'];
					$data['id_clientePF'] = $valor['id_clientePF'];
					$id_participacao = array_search($valor['id_clientePF'],$_SESSION['id_clientePF']['id']);
					$data['id_participacao'] = $_SESSION['id_clientePF']['participacao'][$id_participacao];
					
					$hotelCliente->add($data);
					}
				}
				
				if(isset($_SESSION['dependentes'])){
						$dependenteHotel = new HotelDependentePF();
						$sess_dependente = $this->session->getSession('dependentes');
						$data = array();
						foreach ($sess_dependente as $key => $value) {
							foreach($value as $id_dependente){
								$data['id_hoteis'] = $id_hotel;
								$data['id_dependentePF'] = $id_dependente;
								$data['id_venda'] = $id_venda;
								$dependenteHotel->add($data);
							}
						}
					}
			}
			
			
			############# outros Produtos ################
			if(isset($_SESSION['produtos'])){
				$sess_prod = $this->session->getSession('produtos');
				$arrayProdutos = array();
				$produtosOutros = new ProdutoOutros();
				$outroProdPF = new OutroProdutoPF();
				foreach ($sess_prod as $key => $value) {
					foreach ($value['id_produtos'] as $id_produtos) {
						$arrayProdutos[] = $produtosOutros->list_once($id_produtos);
					}
				}

				$data = array();
				foreach($arrayProdutos as $key => $value){
					$data['id_venda'] = $id_venda;
					$data['id_produto'] = $value['id_produto'];
					$data['id_clientePF'] = $value['id_clientePF'];
					$id_participacao = array_search($value['id_clientePF'],$_SESSION['id_clientePF']['id']);
					$data['id_participacao'] = $_SESSION['id_clientePF']['participacao'][$id_participacao];
					$outroProdPF->add($data);
				}
			}
			
			############# Passagens Aéreas ################		
			if(isset($_SESSION['passagens'])){
				$sess_passagem = $this->session->getSession('passagens');
				$arrayPassagem = array();
				$passagens = new Passagens();
				$adicionaCliente = new AdicionaClientePF();
				
				
				foreach ($sess_passagem as $key => $value) {
					foreach ($value['id_passagens'] as $id_passagens) {
						$arrayPassagem[] = $passagens->list_once($id_passagens);
					}
				}
					
				$data = array();
				$id_passagens = null;
				foreach ($arrayPassagem as $key => $value) {
					$data['id_venda'] = $id_venda;
					$data['id_clientePF'] = $value['id_clientePF'];
					$data['id_passagens'] = $value['id_passagens'];
					$id_passagens = $value['id_passagens'];
					$id_participacao = array_search($value['id_clientePF'],$_SESSION['id_clientePF']['id']);
					$data['id_participacao'] = $_SESSION['id_clientePF']['participacao'][$id_participacao];
					
					$adicionaCliente->add($data);
				}
				
				
				if(isset($_SESSION['dependentes'])){
						$adicionarDependente = new AdicionarDependentePF();
						$sess_dependente = $this->session->getSession('dependentes');
						$data = array();
						foreach ($sess_dependente as $key => $value) {
							foreach($value as $id_dependente){
								$data['id_passagens'] = $id_passagens;
								$data['id_dependentePF'] = $id_dependente;
								$data['id_venda'] = $id_venda;
								$adicionarDependente->add($data);
							}
						}
					}
				}
			
			
			
				
			}### ENDIF Venda alteração
			unset($_SESSION['id_clientePF']);
			unset($_SESSION['formarPagamento']);
			if(isset($_SESSION['tickets'])){
				unset($_SESSION['tickets']);
			}
			
			if(isset($_SESSION['dependentes'])){
				unset($_SESSION['dependentes']);
			}
			
			if(isset($_SESSION['hotel'])){
				unset($_SESSION['hotel']);
			}
			
			if(isset($_SESSION['carros'])){
				unset($_SESSION['carros']);
			}
			
			if(isset($_SESSION['seguro'])){
				unset($_SESSION['seguro']);
			}
			
			if(isset($_SESSION['passagens'])){
				unset($_SESSION['passagens']);
			}
			
			if(isset($_SESSION['produtos'])){
				unset($_SESSION['produtos']);
			}
			
			
			if(isset($_SESSION['cruzeiros'])){
				unset($_SESSION['cruzeiros']);
			}

			$this->session->setFlashMessage('Venda cadastrada com sucesso.','success');
		$this->redirector('/venda/cadVendaPF');
		} ### ENDIF Venda
		
}

	
	public function cadTipoPagamentoAction()
	{
		
		######### Buscando dados na Sessão ############
		$cliente = $this->session->getSession('id_clientePF');
		$usuario = $this->session->getSession('user');
		if(isset($_SESSION['dependentes'])){
			$dependente = $this->session->getSession('dependentes');
		}else{
			$dependente = null;
		}
		
		$formaPagamento = new Application\Models\FormaPagamento();
		
		
		$arrayFormaPgto = array();
		
		$arrayFormaPgto = array();
		foreach($cliente['id'] as $id_cliente ){
			$arrayFormaPgto[]['id_formaPagamento'] = null;
		}
		
		foreach($arrayFormaPgto as $key => $value){
			$arrayFormaPgto[$key]['id_venda'] = null;
		}
		
		
		
		
			### Outras formas de pagamento ###
			$array = array();
			foreach($_POST as $key => $value){
			if(preg_match("/^(\d+)$/", $key)){
				foreach($value as $k => $v){
					foreach($arrayFormaPgto as $chave => $valor){
						if($chave == $k && $v != 0){
							$arrayFormaPgto[$chave]['id_clientePF'] = $_POST['id_clientePF'];
							$arrayFormaPgto[$chave]['id_tipoPagamento'] = $key;
							$arrayFormaPgto[$chave]['valor_formaPagamento'] = $v;
							$arrayFormaPgto[$chave]['id_tipoCartao'] = null;
							$arrayFormaPgto[$chave]['vezes_formaPagamento'] = 1;
								foreach($arrayFormaPgto as $ke => $va){
									if(!isset($va['valor_formaPagamento'])){
										unset($va);
									}
									@$array[] = $va;
								}
							}
						}
					}
				}
			
			} ###ENDIF
				foreach($array as $key => $arr){
					if($array[$key] == null){
						unset($array[$key]);
					}
				}
				
				foreach($array as $key => $value){
					$id_form = $formaPagamento->add($value);
					if($id_form){
						$_SESSION['formarPagamento'][$_POST['id_clientePF']][] = $id_form;
					}
				}
				
				
				
				##################### Forma de Pagamento com Cartão de crédito ###################
				$arrayFormaPgto = array();
		
				$arrayFormaPgto = array();
				foreach($cliente['id'] as $id_cliente ){
					$arrayFormaPgto[]['id_formaPagamento'] = null;
					
				}
				
				foreach($arrayFormaPgto as $key => $value){
					$arrayFormaPgto[$key]['id_venda'] = null;
				}
				
				
				$array = array();
				
				foreach($_POST as $key => $value){
				 if(preg_match("/^([0-9]_[0-9])$/", $key)){
					$type = explode('_', $key);
					$tipopagamento = $type[0];
					$tipocartao = $type[1];
					
					foreach($arrayFormaPgto as $chave => $valor){
						$arrayFormaPgto[$chave]['id_clientePF'] = $_POST['id_clientePF'];
						$arrayFormaPgto[$chave]['id_tipoCartao'] = $tipocartao;
						$arrayFormaPgto[$chave]['id_tipoPagamento'] = $tipopagamento;
						$arrayFormaPgto[$chave]['valor_formaPagamento'] = $value;
					}
						$array[] = $arrayFormaPgto;
				  }
				}
				
				$arrayVezes = array();
				foreach($_POST as $key => $value){
				 if(preg_match("/^([0-9]_[0-9]_.+)/", $key)){
					 $arrayVezes[]=$value;
				  }
				}
					
					foreach($array as $key => $value){
			 			$array[$key][0]['vezes_formaPagamento'] = $arrayVezes[$key];
					}
					
					
					
		 			foreach($array as $key => $value){
		 				if($value[0]['valor_formaPagamento'] != null){
			 				$id_form = $formaPagamento->add($value[0]);
							if($id_form){
								$_SESSION['formarPagamento'][$_POST['id_clientePF']][] = $id_form;
							}
		 				}
		 			}
					$this->redirector('/venda/cadVendaPF');
	}
	
	public function findClientePFAction()
	{
		$clientePF = new ClientePF();
			echo json_encode($clientePF->findClienteCPF($_POST['cpf']));
		
	}
	
	public function getAgenteAction()
	{
		$id_agencia = $_POST['id_agencia'];
		$agente = new Agente();
		echo json_encode($agente->getAgencia($id_agencia));
	}
	
	public function getClientePFAction()
	{
		if($_POST['id_clientePF']){
			$clientePF = new Application\Models\ClientePF();
			$data = $clientePF->list_once($_POST['id_clientePF']);
			echo json_encode($data[0]);
		}
	}
	
	
	public function getTipoCartaoAction()
	{
		if($_POST['id_clientePF']){
			$cartaoPF = new CartaoPF();
			$data = $cartaoPF->lista_cartoes($_POST['id_clientePF']);
			echo json_encode($data);
		}
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
			