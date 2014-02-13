<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\TipoCartao;

class TipoCartaoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new TipoCartao();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['tipocartaos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tipocartao/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadTipoCartaoAction()
	{
		$param = func_get_args();
		if($param){
			$data['tipoCartaos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tipocartao/cadTipoCartao',$data);
		$this->view('template/footer');
	}
	
	public function saveTipoCartaoAction()
	{
		$_POST['titulo_tipoCartao'] = strtoupper($_POST['titulo_tipoCartao']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_tipoCartao'] == null){
			if(count($this->model->findTipoCard($_POST['titulo_tipoCartao'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Tipo de Cartão acadastrado com sucesso.','success');
					$this->redirector('/tipoCartao');
				}
			}else{
				$this->session->setFlashMessage('Tipo de Cartão já acadastrado no sistema!','error');
				$this->redirector('/tipoCartao');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Tipo de Cartão atualizado com sucesso.','success');
					$this->redirector('/tipoCartao');
				}
		}
		
	}
	
	public function deleteTipoCartaoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('TipoCartao removido do sistema','success');
			$this->redirector('/tipoCartao');
		}
	}
}
			