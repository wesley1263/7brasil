<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\TipoComp;

class TipoCompController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new TipoComp();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['tipocomps'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tipocomp/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadTipoCompAction()
	{
		$param = func_get_args();
		if($param){
			$data['tipocomps'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('tipocomp/cadTipoComp',$data);
		$this->view('template/footer');
	}
	
	public function saveTipoCompAction()
	{
		$_POST['titulo_tipocomp'] = strtoupper($_POST['titulo_tipocomp']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_tipocomp'] == null){
			if(count($this->model->findTipoComp($_POST['titulo_tipocomp'])) == 0){
				if($this->model->add($_POST)){
					$this->session->setFlashMessage('Tipo de Compania cadastrada com sucesso.','success');
					$this->redirector('/tipoComp');
				}
			}else{
				$this->session->setFlashMessage('Tipo de Compania já cadastrada no sistema!','error');
				$this->redirector('/tipoComp');
			}
		}else{
			if($this->model->alter($_POST)){
					$this->session->setFlashMessage('Dados de Tipo de Compania atualizado com sucesso.','success');
					$this->redirector('/tipoComp');
				}
		}
		
	}
	
	public function deleteTipoCompAction()
	{
		$param = func_get_args();
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('TipoComp removido do sistema','success');
			$this->redirector('/tipoComp');
		}
	}
}
			