<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Venda;
use Application\Models\ClientePF;
use Application\Models\Agencia;
use Application\Models\Agente;

class NotaDebitoController extends OXE_Controller{
		
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
		
		$venda = new Venda();
		$cliente = new ClientePF();
		$agencia = new Agencia();
		$agente = new Agente();
		$submit = "<button  type=\"submit\" class=\"btn btn-primary\" id='bt_submit'>Gerar</button>";
		
		if($_POST){
			$data['venda'] = $venda->getFilterNotaDebito($_POST);
			$data['submit'] = $submit;
		}else{
			$data['venda'] = $venda->getNotaDebito();
			$data['submit'] = null;
		}
		
		$data['cliente'] = $cliente->list_all();
		$data['agencia'] = $agencia->list_all();
		$data['agente'] = $agente->list_all();
				
		$data['title'] = 'Nota de Débito';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('notadebito/index',$data);
		$this->view('template/footer');	
		
	}
	
	
	public function detalheAction()
	{
		$venda = new Venda();
		$empresa = new Application\Models\Empresa();
		$dependente = new Application\Models\DependentePF();
		$ticket = new Application\Models\Ticket();
		$locadora = new Application\Models\Locadora();
		$cruzeiro = new Application\Models\CompaniaCruzeiro();
		$compania = new Application\Models\Compania();
		$classe = new Application\Models\Classe();
		$agente = new Agente();
		$cliente = new ClientePF();
		
		
		if(empty($_POST)){
			$this->session->setFlashMessage('Selecione uma venda!','error');
			$this->redirector('/notaDebito');
		}
		$arrayVenda = array();
		foreach ($_POST['id_venda'] as $key => $value) {
			$arrayVenda[] = $venda->list_once($value);
		}
		
		$data['title'] = 'Nota de Débito - Detalhe';
		$data['vendas'] = $arrayVenda;
		$data['produtos'] = $venda;
		$data['empresa'] = $empresa->list_all();
		$data['dependente'] = $dependente->list_all();
		$data['agente'] = $agente->list_all();
		$data['cliente'] = $cliente->list_all();
		$data['ticket'] = $ticket->list_all();
		$data['locadora'] = $locadora->list_all();
		$data['cruzeiro'] = $cruzeiro->list_all();
		$data['compania'] = $compania->list_all();
		$data['classe'] = $classe->list_all();
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('notadebito/detalhe',$data);
		$this->view('template/footer');	
	}
	
	
}
			