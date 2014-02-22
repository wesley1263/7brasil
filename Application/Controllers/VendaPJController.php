<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\VendaPJ;
use Application\Models\ClientePJ;
use Application\Models\ClientePF;
use Application\Models\Locadora;


class VendaPJController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new VendaPJ();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Venda Pessoa Júridica';
		$data['vendapjs'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('vendapj/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadVendaPJAction()
	{
		########### Estanciando Entidades ##########
		$empresa = new ClientePF();
		$dependente = new Application\Models\DependentePF();
		$departamento = new Application\Models\Departamento();
		$moedas = new Application\Models\Moeda();
		$cambio = new Application\Models\Cambio();
		$brokers = new Application\Models\Brokers();
		$seguro = new Application\Models\SeguroPJ();
		$seguradora = new Application\Models\Seguradora();
		$tipoSeguro = new Application\Models\TipoSeguro();
		$continente = new Application\Models\Continente();
		$ticket = new Application\Models\Ticket();
		$companiaCruzeiro = new Application\Models\CompaniaCruzeiro();
		$compania = new Application\Models\Compania();
		$classe = new Application\Models\Classe();
		$origem = new Application\Models\Origem();
		$destino = new Application\Models\Destino();
		$agencia = new Application\Models\Agencia();
		$tipoPagamento = new Application\Models\TipoPagamento();
		$tipoCartao = new Application\Models\TipoCartao();
		$locadora = new Locadora();
		
		
		######## Populando cliente Pesso Jurídica ############
		if(isset($_SESSION['empresa'])){
			$sess_empresa = $this->session->getSession('empresa');
			$data['empresa'] = $empresa->list_once($sess_empresa['id']);
		}
		
		
		########## Populando Funcionarios ##########
		if(isset($_SESSION['funcionarios'])){
			$sess_func = $this->session->getSession('funcionarios');
			$arrayFunc = array();
			foreach ($sess_func['id'] as $key => $value) {
				$arrayFunc[] = $dependente->lista_um($value);
			}
			
			$data['dependentes'] = $arrayFunc;
		}
		
		
		############ Populando Carros #################
		if(isset($_SESSION['carro'])){
			$carroPJ = new Application\Models\Carro(); 
			$sess_carro = $this->session->getSession('carro');
			$arrayCarro = array();
			foreach ($sess_carro['id'] as $key => $value) {
				$arrayCarro[] = $carroPJ->list_once($value);
			}
			$data['carros'] = $arrayCarro;
		}
		
		
		############## Populando Hotel ###############
		if(isset($_SESSION['hotel'])){
			$hotelPJ = new Application\Models\Hotel(); 
			$arrayHotel = array();
			$sess_hotel = $this->session->getSession('hotel');
			
			foreach ($sess_hotel['id'] as $key => $value) {
				$arrayHotel[] = $hotelPJ->list_once($value);
			}
			$data['hotels'] = $arrayHotel;
		}
		
		############## Populando Seguro ###############
		if(isset($_SESSION['seguro'])){
			$sess_seguro = $this->session->getSession('seguro');
			$arraySeguro = array();
			$seguro = new Application\Models\Seguro();
			foreach ($sess_seguro['id'] as $key => $value) {
				$arraySeguro[] = $seguro->list_once($value);
			}
			
			$data['seguros'] = $arraySeguro;
		}
		
		
		############# Populando Ticket #############
		if(isset($_SESSION['ticket'])){
			$sess_ticket = $this->session->getSession('ticket');
			$arrayTicket = array();
			$compTicket = new Application\Models\CompraTicket();
			foreach ($sess_ticket['id'] as $key => $value) {
				$arrayTicket[] = $compTicket->list_once($value);
			}
			
			$data['compTicket'] = $arrayTicket;
		}
		
		############# Populando Cruzeiro #############
		if(isset($_SESSION['cruzeiro'])){
			$sess_cruzeiro = $this->session->getSession('cruzeiro');
			$arrayCruzeiro = array();
			$cruzeiro = new Application\Models\Cruzeiro();
			foreach ($sess_cruzeiro['id'] as $key => $value) {
				$arrayCruzeiro[] = $cruzeiro->list_once($value);
			}
			
			$data['cruzeiro'] = $arrayCruzeiro;
		}
		
		############# Populando Produtos #############
		if(isset($_SESSION['produto'])){
			$sess_produto = $this->session->getSession('produto');
			$arrayProduto = array();
			$produto = new Application\Models\ProdutoOutros();
			foreach ($sess_produto['id'] as $key => $value) {
				$arrayProduto[] = $produto->list_once($value);
			}
			
			$data['produto'] = $arrayProduto;
		}
		
		############# Populando Passagens #############
		if(isset($_SESSION['passagens'])){
			$sess_passagem = $this->session->getSession('passagens');
			$arrayPassagem = array();
			$passagem = new Application\Models\Passagens();
			foreach ($sess_passagem['id'] as $key => $value) {
				$arrayPassagem[] = $passagem->list_once($value);
			}
			
			$data['passagens'] = $arrayPassagem;
		}
		
		
		############# Populando Forma Pagamento #############
		if(isset($_SESSION['formaPagamento'])){
			$sess_forma = $this->session->getSession('formaPagamento');
			$arrayForma = array();
			$forma = new Application\Models\FormaPagamento();
			foreach ($sess_forma['id'] as $key => $value) {
				$arrayForma[] = $forma->list_once($value);
			}
			
			$data['formaPagamento'] = $arrayForma;
		}
		
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['funcionarios'] = $dependente;
		$data['departamento'] = $departamento;
		$data['locadoras'] = $locadora->list_all();
		$data['moedas'] = $moedas->list_all();
		$data['cambios'] = $cambio->list_all();
		$data['brokers'] = $brokers->list_all();
		$data['seguradora'] = $seguradora->list_all();
		$data['tipoSeguro'] = $tipoSeguro->list_all();
		$data['continente'] = $continente->list_all();
		$data['ticket'] = $ticket->list_all();
		$data['companiaCruzeiro'] = $companiaCruzeiro->list_all();
		$data['compania'] = $compania->list_all();
		$data['classe'] = $classe->list_all();
		$data['origem'] = $origem->list_all();
		$data['destino'] = $destino->list_all();
		$data['agencia'] = $agencia->list_all();
		$data['tipoPagamento'] = $tipoPagamento->list_all();
		$data['tipoCartao'] = $tipoCartao->list_all();
		$data['cartaoPJ'] = new Application\Models\CartaoPF();
		
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('vendapj/cadVendaPJ',$data);
		$this->view('template/footer');
	}
	
	public function saveVendaPJAction()
	{
		
		$data = array();
		$user = $this->session->getSession('user');
		$data['id_usuario'] = $user['id_usuario'];
		$data['id_agencia'] = isset($_POST['id_agencia']) ? $_POST['id_agencia'] : null;
		$data['id_agente'] = isset($_POST['id_agente']) ? $_POST['id_agente'] : null;
		$data['valor_agencia'] = isset($_POST['valor_agencia']) ? $_POST['valor_agencia'] : null;
		$data['valor_agente'] = isset($_POST['valor_agente']) ? $_POST['valor_agente'] : null;
		$data['valor_casa'] = $_POST['total_comissao'];
		$data['total_venda'] = $_POST['total_venda'];
		$data['data_venda'] = date('Y-m-d H:i');
		$data['descricao_venda'] = $_POST['descricao_venda'];
		$data['faturado_venda'] = isset($_POST['faturado_venda']) ? $_POST['faturado_venda'] : null;
		
		
		$venda = new Application\Models\Venda();
		
		$id_venda = $venda->add($data);
		if($id_venda){
			$data2['id_venda'] = $id_venda;
			$data2['nm_processo_venda'] = $user['id_usuario'].date('mY').$id_venda;
			if($venda->alter($data2)){
				
				$id_empresa = $_SESSION['empresa']['id'];
				
				############ Adicionando Funcionários para tabela venda  #############
				$vendaCliente = new Application\Models\VendaClientePF();
				$dependente = new Application\Models\VendaDependentePF();
				$funcionario = $this->session->getSession('funcionarios');
				$arrayVendaPJ = array();
				
					$arrayVendaPJ['id_venda'] = $id_venda;
					$arrayVendaPJ['id_clientePF'] = $id_empresa;
					$vendaCliente->add($arrayVendaPJ);
					
					$arrayDependente = array();
					
				foreach ($funcionario['id'] as $key => $value) {
					$arrayDependente['id_venda'] = $id_venda;
					// $arrayDependente['id_clientePF'] = $id_empresa;
					$arrayDependente['id_dependentePF'] = $value;
					
					$dependente->add($arrayDependente);
				}
				
				###### Formas de pagamento ###########
				if(isset($_SESSION['formaPagamento'])){
					$sess_forma = $this->session->getSession('formaPagamento');
					$forma = new Application\Models\FormaPagamento();
					// se forma de pagamento for o crédito da empresa
					foreach ($sess_forma['id'] as $key => $value) {
						//Array vázio para forma de pagamento
						$arrayForma = array();
						//Busca os dados de rateio cadastrado na tbl forma de pagamento
						$id_form = $forma->list_once($value);
						//Array vázio para alterar o valor de credito da empresa
						$array = array();
						if($id_form['id_tipoPagamento'] == null){
							$clientePJ = new ClientePF();
							$cliente = $clientePJ->list_once($id_form['id_clientePF']);
							
							$array['id_clientePF'] = $id_form['id_clientePF'];
							$array['credito_clientePJ'] = ($cliente[0]['credito_clientePJ'] - $data['total_venda']);
							$clientePJ->update_cli($array);
						}
						$arrayForma['id_formaPagamento'] = $value;
						$arrayForma['id_venda'] = $id_venda;
						$forma->alter($arrayForma);
						 
					}
					
					$arrayReceber = array();
				$receber = new Application\Models\Receber();
				foreach($forma->getFormasAtual($id_venda) as $key => $value){
					$valor = $value['valor_formaPagamento'] / $value['vezes_formaPagamento'];
					$dataReceber = new DateTime();
					for($i = 0;$i < $value['vezes_formaPagamento'];$i++){
						$arrayReceber['id_formaPagamento'] = $value['id_formaPagamento'];
						$arrayReceber['id_venda'] = $value['id_venda'];
						$arrayReceber['id_filial'] = @$usuario['id_filial'];
						$arrayReceber['valor_receber'] = $valor;
						$arrayReceber['data_receber'] = $dataReceber->format('Y-m-d');
						$dataReceber->modify('+ 1 month');
						$receber->add($arrayReceber);
						// $this->dump($arrayReceber);
					}
				}
					
				}
				
				
				############ Para Ticket #############
				if(isset($_SESSION['ticket'])){
				$sess_ticket = $this->session->getSession('ticket');
				$arrayTicket = array();
				$compTicket = new Application\Models\CompraTicket();
				$clienteTicket = new Application\Models\ClienteTicket();
				foreach ($sess_ticket['id'] as $key => $value) {
						$arrayTicket['id_compraTicket'] = $value;
						$arrayTicket['id_clientePF'] = $id_empresa;
						$arrayTicket['id_participacao'] = 2;
						$arrayTicket['id_venda'] = $id_venda;
						
						$clienteTicket->add($arrayTicket);
				}
			}
			
			
				############ Populando Carros #################
				if(isset($_SESSION['carro'])){
					$carroPJ = new Application\Models\Carro(); 
					$carroCliente = new Application\Models\CarroClientePF();
					$sess_carro = $this->session->getSession('carro');
					$arrayCarro = array();
					foreach ($sess_carro['id'] as $key => $value) {
							$arrayCarro['id_carros'] = $value;
							$arrayCarro['id_venda'] = $id_venda;
							$arrayCarro['id_clientePF'] = $id_empresa;
							
							$carroCliente->add($arrayCarro);
				}
				
			  }

			
			
			############ Populando Hotel #################
				if(isset($_SESSION['hotel'])){
					$hotelCliente = new Application\Models\HotelClientePF();
					$sess_hotel = $this->session->getSession('hotel');
					$arrayHotel = array();
					$id_hotel = null;
					foreach ($sess_hotel['id'] as $key => $value) {
							$arrayHotel['id_hotel'] = $value;
							$arrayHotel['id_venda'] = $id_venda;
							$arrayHotel['id_clientePF'] = $id_empresa;
							$arrayHotel['id_participacao'] = 2;
							
							$id_hotel = $hotelCliente->add($arrayHotel);
				}
					$data = array();
					$modelDependente = new Application\Models\HotelDependentePF();
					foreach ($funcionario['id'] as $key => $value) {
						$data['id_hoteis'] = $id_empresa;
						$data['id_dependentePF'] = $value;
						$data['id_venda'] = $id_venda;
						
						$modelDependente->add($data);
					}
				
			  }
				
			
			
			############ Populando Seguro #################
				if(isset($_SESSION['seguro'])){
					$seguroCliente = new Application\Models\AsseguradoPF();
					$sess_seguro = $this->session->getSession('seguro');
					$arraySeguro = array();
					foreach ($sess_seguro['id'] as $key => $value) {
							$arraySeguro['id_seguro'] = $value;
							$arraySeguro['id_venda'] = $id_venda;
							$arraySeguro['id_clientePF'] = $id_empresa;
							$arraySeguro['id_participacao'] = 2;
							
							$seguroCliente->add($arraySeguro);
				}
				
			  }
				
				
				
				############ Populando Cruzeiro #################
				if(isset($_SESSION['cruzeiro'])){
					$cruzeiroCliente = new Application\Models\CruzeiroClientePF();
					$sess_cruzeiro = $this->session->getSession('cruzeiro');
					$arrayCruzeiro = array();
					foreach ($sess_cruzeiro['id'] as $key => $value) {
							$arrayCruzeiro['id_cruzeiro'] = $value;
							$arrayCruzeiro['id_venda'] = $id_venda;
							$arrayCruzeiro['id_clientePF'] = $id_empresa;
							$arrayCruzeiro['id_participacao'] = 2;
							
							$cruzeiroCliente->add($arrayCruzeiro);
				}
				
			  }
				
				
			
			############ Populando Produto #################
				if(isset($_SESSION['produto'])){
					$produtoCliente = new Application\Models\OutroProdutoPF();
					$sess_produto = $this->session->getSession('produto');
					$arrayProduto = array();
					foreach ($sess_produto['id'] as $key => $value) {
							$arrayProduto['id_produto'] = $value;
							$arrayProduto['id_venda'] = $id_venda;
							$arrayProduto['id_clientePF'] = $id_empresa;
							$arrayProduto['id_participacao'] = 2;
							
							$produtoCliente->add($arrayProduto);
				}
				
			  }
		
			
			############ Populando Passagend #################
				if(isset($_SESSION['passagens'])){
					$passagensCliente = new Application\Models\AdicionaClientePF();
					$passagens = new Application\Models\Passagens();
					
					
					$sess_passagens = $this->session->getSession('passagens');
					$arrayPassagem = array();
					foreach ($sess_passagens['id'] as $key => $value) {
						
							$arrayPassagem['id_passagens'] = $value;
							$arrayPassagem['id_venda'] = $id_venda;
							$arrayPassagem['id_clientePF'] = $id_empresa;
							$arrayPassagem['id_participacao'] = 2;
							
							$passagensCliente->add($arrayPassagem);
				}
				
			  }
			
			
		
				
			} //End alter venda
		} // End add Venda
		
		
		if(isset($_SESSION['empresa'])){
			unset($_SESSION['empresa']);
		}
		
		if(isset($_SESSION['funcionarios'])){
			unset($_SESSION['funcionarios']);
		}
		
		if(isset($_SESSION['ticket'])){
			unset($_SESSION['ticket']);
		}

		if(isset($_SESSION['carro'])){
			unset($_SESSION['carro']);
		}
		
		if(isset($_SESSION['hotel'])){
			unset($_SESSION['hotel']);
		}
			
		if(isset($_SESSION['seguro'])){
			unset($_SESSION['seguro']);
		}
				
		if(isset($_SESSION['cruzeiro'])){
			unset($_SESSION['cruzeiro']);
		}
		
		if(isset($_SESSION['produto'])){
			unset($_SESSION['produto']);
		}
		
		if(isset($_SESSION['passagens'])){
			unset($_SESSION['passagens']);
		}
		
		if(isset($_SESSION['formaPagamento'])){
			unset($_SESSION['formaPagamento']);
		}	
		
		$this->session->setFlashMessage('Venda registrada com sucesso.','success');
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	public function findClientePJAction()
	{
		$empresa = new ClientePF();
		echo json_encode($empresa->getCNPJ($_POST['cnpj']));
		
	}
	
	public function findFuncionarioAction()
	{
		
		$dependente = new Application\Models\DependentePJ();
		$this->dump($dependente->getDependentePJ($_POST['id_clientePJ']));
	}
	
	public function addClientePJAction()
	{
		$empresa = new ClientePF();
		$id_clientePJ = $empresa->list_once($_POST['id_PJ']);
		$_SESSION['empresa']['id'] = $id_clientePJ[0]['id_clientePF'] ;
		
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	public function addDependentePJAction()
	{
		
		foreach ($_POST['id_dependente'] as $key => $value) {
			if(in_array($value,$_SESSION['funcionarios']['id'])){
				$this->session->setFlashMessage('Funcionário já adicionado a lista!','error');
				$this->redirector('/vendaPJ/cadVendaPJ');
				exit;
			}
			$_SESSION['funcionarios']['id'][] = $value;
			
		}
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	
	public function removeDependentePJAction()
	{
		$param = func_get_args();
		$key = array_search($param[1], $_SESSION['funcionarios']['id']);
		unset($_SESSION['funcionarios']['id'][$key]);
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	public function removeClientePJAction()
	{
		unset($_SESSION['empresa']);
		unset($_SESSION['funcionarios']);
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	public function findAgenciaAction()
	{
		$agente = new Application\Models\Agente();
		
		echo json_encode($agente->getAgencia($_POST['id_agencia']));
		
	}
	
	public function cadTipoPagamentoPJAction()
	{
		$formaPagamento = new Application\Models\FormaPagamento();
		$empresa = new Application\Models\ClientePF();
		$credito = $empresa->lista_um($_SESSION['empresa']['id']);
		$array = array();
		
		if(isset($_POST['creadito_empresa'])){
			$array['id_clientePF'] = $_POST['id_clientePF'];
			$array['id_venda'] = null;
			$array['valor_formaPagamento'] = $_POST['creadito_empresa'];
			$array['vezes_formaPagamento'] = 1;
			$array['id_tipoCartao'] = null;
			$array['id_tipoPagamento'] = null;
			
			$id = $formaPagamento->add($array);
			$_SESSION['formaPagamento']['id'][]= $id;
		}
		
		
		$arrayForm = array();
		$data = array();
		$arrayForm['id_clientePF'] = $_POST['id_clientePF'];
		$arrayForm['id_venda'] = null;
		
		
		$arrayForm2 = array();
		$data2 = array();
		$arrayForm2['id_clientePF'] = $_POST['id_clientePF'];
		$arrayForm2['id_venda'] = null;
		
		foreach($_POST as $key => $value){
			if(preg_match("/^([a-z]+_[\d])$/", $key)){
				if(preg_match("/^([tipo_])/", $key)){
					$tipo = explode('_',$key);
					$arrayForm['id_tipoPagamento'] = $tipo[1];
					$arrayForm['id_tipoCartao'] = null;
					$arrayForm['valor_formaPagamento'] = $value;
				}
				
				if(preg_match("/^([vezes_])/", $key)){
					$vezes = explode('_',$key);
					$arrayForm['vezes_formaPagamento'] = $value;
					$data[] = $arrayForm;
				}
			}
			
			if(preg_match("/^([a-z]+_3)/", $key)){
				if(preg_match("/^([tipo_])/",$key)){
					$tipo = explode('_',$key);
					$arrayForm2['id_tipoPagamento'] = $tipo[1];
					$arrayForm2['id_tipoCartao'] = $tipo[2];
					$arrayForm2['valor_formaPagamento'] = $value;
				}
				
				if(preg_match("/^([vezes_])/", $key)){
					$vezes = explode('_',$key);
					$arrayForm2['vezes_formaPagamento'] = $value;
					$data2[] = $arrayForm2;
					
				}
			}
		}
		
		
		
		foreach ($data as $key => $value) {
			if($value['valor_formaPagamento'] == null){
				unset($data[$key]);
			}
		}
		
		foreach ($data2 as $key => $value) {
			if($value['valor_formaPagamento'] == null){
				unset($data2[$key]);
			}
		}
		
		
		foreach ($data as $key => $value) {
			$id = $formaPagamento->add($value);
			$_SESSION['formaPagamento']['id'][]= $id;
		}
		
		foreach ($data2 as $key => $value) {
			$id = $formaPagamento->add($value);
			$_SESSION['formaPagamento']['id'][]= $id;
		}
		
		$this->session->setFlashMessage('Rateio registrado com sucesso.','success');
		$this->redirector('/vendaPJ/cadVendaPJ');
		
		
	}

	public function removeFormaPagamentoPJAction()
	{
		$formaPagamento = new Application\Models\FormaPagamentoPJ();
		$param = func_get_args();
		
		if($formaPagamento->remove($param[1])){
			
			$key = array_search($param[1],$_SESSION['formaPagamento']['id']);
			unset($_SESSION['formaPagamento']['id'][$key]);
			if(count($_SESSION['formaPagamento']['id']) == 0){
				unset($_SESSION['formaPagamento']);
			}
			$this->session->setFlashMessage('Formas de pagamento removido da lista venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
	}
	
	
}
			