<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Venda;
use Application\Models\ClientePF;
use Application\Models\ClientePJ;

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
		
		if($_SESSION){
			$this->dump($_SESSION);
		}
		
		$data['title'] = '7 Brasil - Vendas';
		
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('venda/pf/cadVendaPF',$data);
		$this->view('template/footer');
	}
	
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
	
	public function addClientePFAction()
	{
		$_SESSION['id_clientePF'][] = $_POST['id_clientePF'];
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
	
	
	
}
			