<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\VendaPJ;

class ProcessosController extends OXE_Controller{
		
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
		$empresa = new Application\Models\ClientePJ();
		$agencia = new Application\Models\Agencia();
		
		$moeda = new Application\Models\Cambio();
		$usuario = new Application\Models\Usuario();
		if($_POST){
			
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
		$this->view('processos/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function findProccessAction()
	{
		$this->dump($_POST);
		if($_POST){
			
		}
	}
	
		
	
}
			