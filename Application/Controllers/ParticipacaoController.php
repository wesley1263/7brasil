<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Participacao;

class ParticipacaoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Participacao();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['participacaos'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('participacao/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadParticipacaoAction()
	{
		$param = func_get_args();
		if($param){
			$data['participacaos'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('participacao/cadParticipacao',$data);
		$this->view('template/footer');
	}
	
	public function saveParticipacaoAction()
	{
		$_POST['titulo_participacao'] = strtoupper($_POST['titulo_participacao']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_participacao'] == null){
			if(count($this->model->findParticipacao($_POST['titulo_participacao'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Participação cadastrados com sucesso.','success');
					$this->redirector("/participacao");
				}
			}else{
				$this->session->setFlashMessage('Participação já cadastrados no sistema.','error');
				$this->redirector("/participacao");
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Participação atualizados com sucesso.','success');
					$this->redirector("/participacao");
				}
		}
		
	}
	
	public function deleteParticipacaoAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('Participacao removido do sistema','success');
			$this->redirector('/participacao');
		}
	}
}
			