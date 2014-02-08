<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Venda;
use Application\Models\ClientePJ;
use Application\Models\Locadora;


class VendaPJController extends OXE_Controller{
		
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
		$empresa = new ClientePJ();
		$dependente = new Application\Models\DependentePJ();
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
			$carroPJ = new Application\Models\CarroPJ(); 
			$sess_carro = $this->session->getSession('carro');
			$arrayCarro = array();
			foreach ($sess_carro['id'] as $key => $value) {
				$arrayCarro[] = $carroPJ->list_once($value);
			}
			
			$data['carros'] = $arrayCarro;
		}
		
		
		############## Populando Hotel ###############
		if(isset($_SESSION['hotel'])){
			$hotelPJ = new Application\Models\HotelPJ();
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
			$seguro = new Application\Models\SeguroPJ();
			foreach ($sess_seguro['id'] as $key => $value) {
				$arraySeguro[] = $seguro->list_once($value);
			}
			
			$data['seguros'] = $arraySeguro;
		}
		
		
		############# Populando Ticket #############
		if(isset($_SESSION['ticket'])){
			$sess_ticket = $this->session->getSession('ticket');
			$arrayTicket = array();
			$compTicket = new Application\Models\CompraTicketPJ();
			foreach ($sess_ticket['id'] as $key => $value) {
				$arrayTicket[] = $compTicket->list_once($value);
			}
			
			$data['compTicket'] = $arrayTicket;
		}
		
		############# Populando Cruzeiro #############
		if(isset($_SESSION['cruzeiro'])){
			$sess_cruzeiro = $this->session->getSession('cruzeiro');
			$arrayCruzeiro = array();
			$cruzeiro = new Application\Models\CruzeiroPJ();
			foreach ($sess_cruzeiro['id'] as $key => $value) {
				$arrayCruzeiro[] = $cruzeiro->list_once($value);
			}
			
			$data['cruzeiro'] = $arrayCruzeiro;
		}
		
		############# Populando Produtos #############
		if(isset($_SESSION['produto'])){
			$sess_produto = $this->session->getSession('produto');
			$arrayProduto = array();
			$produto = new Application\Models\ProdutoOutrosPJ();
			foreach ($sess_produto['id'] as $key => $value) {
				$arrayProduto[] = $produto->list_once($value);
			}
			
			$data['produto'] = $arrayProduto;
		}
		
		############# Populando Passagens #############
		if(isset($_SESSION['passagens'])){
			$sess_passagem = $this->session->getSession('passagens');
			$arrayPassagem = array();
			$passagem = new Application\Models\PassagensPJ();
			foreach ($sess_passagem['id'] as $key => $value) {
				$arrayPassagem[] = $passagem->list_once($value);
			}
			
			$data['passagens'] = $arrayPassagem;
		}
		
		
		############# Populando Forma Pagamento #############
		if(isset($_SESSION['formaPagamento'])){
			$sess_forma = $this->session->getSession('formaPagamento');
			$arrayForma = array();
			$forma = new Application\Models\FormaPagamentoPJ();
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
		$data['cartaoPJ'] = new Application\Models\CartaoPJ();
		
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('vendapj/cadVendaPJ',$data);
		$this->view('template/footer');
	}
	
	public function saveVendaPJAction()
	{
		
		$this->dump($_POST);
		$data = array();
		$user = $this->session->getSession('user');
		$data['id_usuario'] = $user['id_usuario'];
		$data['id_agencia'] = $_POST['id_agencia'];
		$data['id_agente'] = $_POST['id_agente'];
		$data['valor_agencia'] = $_POST['valor_agencia'];
		$data['valor_agente'] = $_POST['valor_agente'];
		$data['valor_casa'] = $_POST['total_comissao'];
		$data['total_venda'] = $_POST['total_venda'];
		$data['data_venda'] = date('Y-m-d H:i');
		$data['descricacao_vendaPJ'] = $_POST['descricao_venda'];
		$data['nm_processo_vendaPJ'] = str_pad($user['id_usuario'], 3,0,STR_PAD_LEFT).date('mY').'1';
		
		$this->dump($data);
		
		
	}
	
	public function findClientePJAction()
	{
		$empresa = new ClientePJ();
		echo json_encode($empresa->getCNPJ($_POST['cnpj']));
		
	}
	
	public function findFuncionarioAction()
	{
		
		$dependente = new Application\Models\DependentePJ();
		$this->dump($dependente->getDependentePJ($_POST['id_clientePJ']));
	}
	
	public function addClientePJAction()
	{
		$empresa = new ClientePJ();
		$id_clientePJ = $empresa->list_once($_POST['id_PJ']);
		$_SESSION['empresa']['id'] = $id_clientePJ[0]['id_clientePJ'] ;
		
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	public function addDependentePJAction()
	{
		
		foreach ($_POST['id_dependentePJ'] as $key => $value) {
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
		$this->redirector('/vendaPJ/cadVendaPJ');
	}
	
	public function findAgenciaAction()
	{
		$agente = new Application\Models\Agente();
		
		echo json_encode($agente->getAgencia($_POST['id_agencia']));
		
	}
	
	public function cadTipoPagamentoPJAction()
	{
		$formaPagamento = new Application\Models\FormaPagamentoPJ();
		$empresa = new Application\Models\ClientePJ();
		$credito = $empresa->lista_um($_SESSION['empresa']['id']);
		$array = array();
		
		if(isset($_POST['creadito_empresa'])){
			$array['id_clientePJ'] = $_POST['id_clientePJ'];
			$array['id_vendaPJ'] = null;
			$array['valor_formaPagamentoPJ'] = $_POST['creadito_empresa'];
			$array['vezes_formaPagamentoPJ'] = 1;
			$array['id_tipoCartao'] = null;
			$array['id_tipoPagamento'] = null;
			
			$id = $formaPagamento->add($array);
			$_SESSION['formaPagamento']['id'][]= $id;
		}
		
		
		$arrayForm = array();
		$data = array();
		$arrayForm['id_clientePJ'] = $_POST['id_clientePJ'];
		$arrayForm['id_vendaPJ'] = null;
		
		
		$arrayForm2 = array();
		$data2 = array();
		$arrayForm2['id_clientePJ'] = $_POST['id_clientePJ'];
		$arrayForm2['id_vendaPJ'] = null;
		
		foreach($_POST as $key => $value){
			if(preg_match("/^([a-z]+_[\d])$/", $key)){
				if(preg_match("/^([tipo_])/", $key)){
					$tipo = explode('_',$key);
					$arrayForm['id_tipoPagamento'] = $tipo[1];
					$arrayForm['id_tipoCartao'] = null;
					$arrayForm['valor_formaPagamentoPJ'] = $value;
				}
				
				if(preg_match("/^([vezes_])/", $key)){
					$vezes = explode('_',$key);
					$arrayForm['vezes_formaPagamentoPJ'] = $value;
					$data[] = $arrayForm;
				}
			}
			
			if(preg_match("/^([a-z]+_3)/", $key)){
				if(preg_match("/^([tipo_])/",$key)){
					$tipo = explode('_',$key);
					$arrayForm2['id_tipoPagamento'] = $tipo[1];
					$arrayForm2['id_tipoCartao'] = $tipo[2];
					$arrayForm2['valor_formaPagamentoPJ'] = $value;
				}
				
				if(preg_match("/^([vezes_])/", $key)){
					$vezes = explode('_',$key);
					$arrayForm2['vezes_formaPagamentoPJ'] = $value;
					$data2[] = $arrayForm2;
					
				}
			}
		}
		
		
		
		foreach ($data as $key => $value) {
			if($value['valor_formaPagamentoPJ'] == null){
				unset($data[$key]);
			}
		}
		
		foreach ($data2 as $key => $value) {
			if($value['valor_formaPagamentoPJ'] == null){
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
			