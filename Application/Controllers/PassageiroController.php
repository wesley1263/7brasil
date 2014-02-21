<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\ClientePF;
use Application\Models\DependentePF;
use Application\Models\Classificacao;

class PassageiroController extends OXE_Controller{
		
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
		$dependente = new DependentePF();
		$cliente = new ClientePF();
			
		if($_POST){
			$data['dependente'] = $dependente->filterPassageiro($_POST);
		}else{
			$data['dependente'] = $dependente->getListaPassageiro();
		}	
				
		$data['title'] = 'Lista de Passageiros';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('passageiro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function detalheAction()
	{
		$dependente = new DependentePF();
		$classificacao = new Classificacao();
		$param = func_get_args();
		$id_dependente = $param[1];
		
		$data['title'] = 'Detalhe Passageiro';
		$data['passageiro'] = $dependente->getPassageiro($id_dependente);
		$data['classificacao'] = $classificacao->list_all();
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('passageiro/detalhe',$data);
		$this->view('template/footer');	
		
	}
	
	
	
}
			