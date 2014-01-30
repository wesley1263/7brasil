<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Moeda;
use Application\Models\Cambio;

class MoedaController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Moeda();
		$this->cambio = new Cambio();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['moedas'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['cambios'] = $this->model->list_all();
		$data['moedas'] = $this->cambio->list_all();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('moeda/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadMoedaAction()
	{
		$param = func_get_args();
		if($param){
			$data['cambios'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['moedas'] = $this->cambio->list_all();
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('moeda/cadMoeda',$data);
		$this->view('template/footer');
	}
	
	public function saveMoedaAction()
	{
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		$_POST['dt_moeda'] = $this->dateToMysql($_POST['dt_moeda']).' '.date('H:i:s');
		if($_POST['id_moeda'] == null){
			if($this->model->add($_POST)){
				$this->session->setFlashMessage('Valor de cambio adicionado com sucesso.','success');
				$this->redirector('/moeda');
			}
		}else{
			if($this->model->alter($_POST)){
				$this->session->setFlashMessage('Valor de cambio alterado com sucesso.','success');
				$this->redirector('/moeda');
			}
		}
		
	}
	
	public function deleteMoedaAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Moeda removido do sistema','success');
			$this->redirector('/moeda');
		}
	}
	
	private function dateToMysql($date)
	{
		$data = explode('/',$date);
		return $data[2].'-'.$data[1].'-'.$data[0];
	}
}
			