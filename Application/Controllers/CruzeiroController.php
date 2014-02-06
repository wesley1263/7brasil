<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Cruzeiro;

class CruzeiroController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Cruzeiro();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['cruzeiros'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cruzeiro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCruzeiroAction()
	{
		$param = func_get_args();
		if($param){
			$data['cruzeiros'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cruzeiro/cadCruzeiro',$data);
		$this->view('template/footer');
	}
	
	public function saveCruzeiroAction()
	{
		if($_FILES['voucher_cruzeiro']['size'] > 0 && $_FILES['voucher_cruzeiro']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_cruzeiro']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_cruzeiro']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['voucher_cruzeiro'] = UPLOAD_PATH.$name.$ext;
			}
		
		$_POST['navio_cruzeiro'] = strtoupper($_POST['navio_cruzeiro']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_cruzeiro'] == null){
			$id = $this->model->add($_POST);
			if($id){
				$_SESSION['cruzeiros'][$_POST['id_clientePF']]['id_cruzeiro'][] = $id;
				$this->session->setFlashMessage('Cruzeiro Marítimo adicionado na lista de Venda.','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
	}
	
	public function deleteCruzeiroAction()
	{
		$param = func_get_args();
		$id = $param[1];
		$id_cliente = $param[3];
		$foto = $this->model->list_once($id);
		if(in_array($id, $_SESSION['cruzeiros'][$id_cliente]['id_cruzeiro'])){
			$key = array_search($id,  $_SESSION['cruzeiros'][$id_cliente]['id_cruzeiro']);
			unset($_SESSION['cruzeiros'][$id_cliente]['id_cruzeiro'][$key]);
			unlink($foto['voucher_cruzeiro']);
			if($this->model->remove($id)){
				$this->session->setFlashMessage('Cruzeiro removido da lista de venda.','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
		$this->dump($_SESSION['cruzeiros']);
	}
	
	
	public function saveCruzeiroPJAction()
	{
		$cruzeiro = new Application\Models\CruzeiroPJ();
		
		if($_FILES['voucher_cruzeiroPJ']['size'] > 0 && $_FILES['voucher_cruzeiroPJ']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_cruzeiro']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_cruzeiroPJ']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['voucher_cruzeiroPJ'] = UPLOAD_PATH.$name.$ext;
			}
		
		
		$id_cruzeiro = $cruzeiro->add($_POST);
		if($id_cruzeiro){
			$_SESSION['cruzeiro']['id'][] = $id_cruzeiro;
			$this->session->setFlashMessage('Cruzeiro adicionado à lista de venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
		
		$this->dump($_POST);
		$this->dump($_FILES);
	}
	
	public function removeCruzeiroPJAction()
	{
		$cruzeiro = new Application\Models\CruzeiroPJ();
		$param = func_get_args();
		
		$foto = $cruzeiro->list_once($param[1]);
		if($cruzeiro->remove($param[1])){
			$key = array_search($param[1],$_SESSION['cruzeiro']['id']);
			unset($_SESSION['cruzeiro']['id'][$key]);
			if(count($_SESSION['cruzeiro']['id']) == 0){
				unset($_SESSION['cruzeiro']);
			}
			unlink($foto['voucher_cruzeiroPJ']);
			$this->session->setFlashMessage('Cruzeiro removido da lista venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
	}
	
}		