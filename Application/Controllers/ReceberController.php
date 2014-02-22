<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Receber;
use Application\Models\Venda;
use Application\Models\FormaPagamento;
use Application\Models\Filial;
use Application\Models\Cambio;
use Application\Models\TipoPagamento;
use Application\Models\TipoCartao;

class ReceberController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Receber();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
		$venda = new Venda();
		$formaPagamento = new FormaPagamento();
		$tipo = new TipoPagamento();
		$tipoCartao = new TipoCartao();
		$filial = new Filial();
		$moeda = new Cambio();
		
		if($_POST){
			$data['receber'] = $this->model->filterReceber($_POST);
		}else{
			$data['receber'] = $this->model->listaReceberMes();
			
		}
		
		$data['venda'] = $venda->list_all();
		$data['formaPagamento'] = $formaPagamento->list_all();
		$data['tipoPagamento'] = $tipo->list_all();
		$data['tipoCartao'] = $tipoCartao->list_all();
		$data['filial'] = $filial->list_all();
		$data['moeda'] = $moeda->list_all();
				
		$data['title'] = 'Contas a Receber';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('receber/index',$data);
		$this->view('template/footer');	
		
	}
	
	
	public function alterStatusAction()
	{
		$data['id_receber'] = $_POST['id_receber'];
		$data['status_receber'] = '1';
		
		if($this->model->alter($data)){
			echo 1;
		}else{
			echo 0;
		}
	}
	
	public function findTipoCartaoAction()
	{
		$tipoCartao = new TipoCartao();
		echo json_encode($tipoCartao->list_all());
	}
	
	
}
			