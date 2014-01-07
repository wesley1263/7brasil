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
			$this->model->alter($_POST);
				$this->session->setFlashMessage('Tipo de pagamento atualizado com sucesso','success');
				$this->redirector('/tipoPagamento');
		}
	}
	
	public function deleteTipoPagamentoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('TipoPagamento removido do sistema','success');
			$this->redirector('/tipoPagamento');
		}
	}
}
			