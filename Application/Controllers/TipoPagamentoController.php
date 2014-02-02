<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\TipoPagamento;

class TipoPagamentoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new TipoPagamento();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['tipopagamentos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tipopagamento/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadTipoPagamentoAction()
	{
		$param = func_get_args();
		if($param){
			$data['tipopagamentos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tipopagamento/cadTipoPagamento',$data);
		$this->view('template/footer');
	}
	
	public function saveTipoPagamentoAction()
	{
		$this->dump($_POST);
		
		$_POST['titulo_tipoPagamento'] = strtoupper($_POST['titulo_tipoPagamento']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_tipoPagamento'] == null){
			if(!$this->model->findTipo($_POST['titulo_tipoPagamento'])){
				$this->model->add($_POST);
				$this->session->setFlashMessage('Tipo de pagamento cadastro com sucesso','success');
				$this->redirector('/tipoPagamento');
			}else{
				$this->session->setFlashMessage('Tipo de pagamento já cadastrado no sistema','error');
				$this->redirector('/tipoPagamento');
			}
		}else{
			if($_POST['id_tipoPagamento'] == 3){
				$_POST['titulo_tipoPagamento'] = 'CARTÃO DE CRÉDITO';
			}
			$this->model->alter($_POST);
				$this->session->setFlashMessage('Tipo de pagamento atualizado com sucesso','success');
				$this->redirector('/tipoPagamento');
		}
	}
	
	public function deleteTipoPagamentoAction()
	{
		$param = func_get_args();
		if($param[1] == '3'){
			$this->session->setFlashMessage('CARTÃO DE CRÉDITO não pode ser removido!','error');
			$this->redirector('/tipoPagamento');
			exit;
		}
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('TipoPagamento removido do sistema','success');
			$this->redirector('/tipoPagamento');
		}
	}
}
			