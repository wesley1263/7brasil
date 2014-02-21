<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\VendaPJ;

class ProcessosPJController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
		$vendaPJ = new Application\Models\Venda();
		$empresa = new Application\Models\ClientePF();
		$agencia = new Application\Models\Agencia();
		
		$moeda = new Application\Models\Cambio();
		$usuario = new Application\Models\Usuario();
		if($_POST){
			// $this->dump($_POST);
			if(!isset($_POST['id_agente'])){
				$_POST['id_agente'] = null;
			}
			$data['processos'] = $vendaPJ->listaProcessos($_POST);
		}else{
			$data['processos'] = $vendaPJ->lista_todosProcessos();
		}	
		
				
		$data['title'] = 'Processos Empresas';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		
		$data['empresa'] = $empresa->list_all(); 
		$data['agencia'] = $agencia->list_all(); 
		$data['moeda'] = $moeda->list_all(); 
		$data['usuario'] = $usuario->list_all(); 
		
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('processospj/index',$data);
		$this->view('template/footer');	
		
	}
	
	
	public function getAgenteAction()
	{
		$agente = new Application\Models\Agente();
		echo json_encode($agente->getAgencia($_POST['id_agencia']));
	}
	
	public function detalheAction()
	{
		$vendaPJ = new  Application\Models\Venda();
		$empresa = new Application\Models\ClientePF();
		$agencia = new Application\Models\Agencia();
		$agente = new Application\Models\Agente();
		
		$cambio = new Application\Models\Cambio();
		$moeda = new Application\Models\Moeda();
		$usuario = new Application\Models\Usuario();
		$passagens = new Application\Models\Passagens();
		$seguro = new Application\Models\SeguroPJ();
		$carro = new Application\Models\CarroPJ();
		$hotel = new Application\Models\HotelPJ();
		$ticket = new Application\Models\CompraTicket();
		$produtos = new Application\Models\ProdutoOutros();
		$cruzeiro = new Application\Models\Cruzeiro();
		$brokers = new Application\Models\Brokers();
		$locadora = new Application\Models\Locadora();
		$seguradora = new Application\Models\Seguradora();
		$tipo = new Application\Models\TipoSeguro();
		$continente = new Application\Models\Continente();
		$tipoTicket = new Application\Models\Ticket();
		$companiaCruzeiro = new Application\Models\CompaniaCruzeiro();
		$compania = new Application\Models\Compania();
		$classe = new Application\Models\Classe();
		$destino = new Application\Models\Destino();
		$origem = new Application\Models\Origem();
		$dependente = new Application\Models\VendaDependentePF();
		$funcionario = new Application\Models\DependentePF();
		$departamento = new Application\Models\Departamento();
		$vendaCliente = new Application\Models\VendaClientePF();
		
		$param = func_get_args();
		
		$data['title'] = 'Detalhe de Venda';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		
		$data['empresa'] = $empresa->list_all(); 
		$data['agencia'] = $agencia->list_all(); 
		$data['moeda'] = $moeda->list_all(); 
		$data['usuario'] = $usuario->list_all(); 
		$data['vendaPJ'] = $vendaPJ->list_once($param[1]);
		$data['cambio'] = $cambio->list_all();
		$data['agente'] = $agente->list_all();
		$data['brokers'] = $brokers->list_all();
		$data['locadora'] = $locadora->list_all();
		$data['seguradora'] = $seguradora->list_all();
		$data['tipoSeguro'] = $tipo->list_all();
		$data['continente'] = $continente->list_all();
		$data['ticket'] = $tipoTicket->list_all();
		$data['companiaCruzeiro'] = $companiaCruzeiro->list_all();
		$data['compania'] = $compania->list_all();
		$data['classe'] = $classe->list_all();
		$data['destino'] = $destino->list_all();
		$data['origem'] = $origem->list_all();
		$data['funcionario'] = $funcionario->list_all();
		$data['departamento'] = $departamento->list_all();
		$data['vendas'] = $vendaPJ;
		$data['vendaCliente'] = $vendaCliente->list_vendaCliente($param[1]);
		
		// $data['passagem'] = $passagens;
		// $data['carro'] = $carro;
		// $data['seguro'] = $seguro;
		// $data['cruzeiro'] = $cruzeiro;
		// $data['hotel'] = $hotel;
		// $data['ticket'] = $ticket;
		// $data['produto'] = $produtos;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('processospj/detalhe',$data);
		$this->view('template/footer');	
	}
	
	
	
	
}
			