<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Passagens;

class PassagensController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Passagens();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['passagens'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('passagens/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadPassagensAction()
	{
		$param = func_get_args();
		if($param){
			$data['passagens'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('passagens/cadPassagens',$data);
		$this->view('template/footer');
	}
	
	public function savePassagensAction()
	{
		if($_FILES['voucher_passagens']['size'] > 0 & $_FILES['voucher_passagens']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_passagens']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_passagens']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['voucher_passagens'] = UPLOAD_PATH.$name.$ext;
		}
		
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_passagens'] == null){
			$id = $this->model->add($_POST);
			if($id){
				$_SESSION['passagens'][$_POST['id_clientePF']]['id_passagens'][] = $id;
				$this->session->setFlashMessage('Passagem aérea adicionada a lista de venda.','success');
				$this->redirector('/venda/cadVendaPF');
			}	
		}
		
		
	}
	
	public function deletePassagensAction()
	{
		$param = func_get_args();
		$id = $param[1];
		$id_cliente = $param[3];
		if(in_array($id, $_SESSION['passagens'][$id_cliente]['id_passagens'])){
			$key = array_search($id,$_SESSION['passagens'][$id_cliente]['id_passagens']);
			unset($_SESSION['passagens'][$id_cliente]['id_passagens'][$key]);
			if($this->model->remove($id)){
				$this->session->setFlashMessage('Passagens removido do sistema','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
	}
	
	public function savePassagensPJAction()
	{
		$passagens = new Application\Models\PassagensPJ();
		
		if($_FILES['voucher_passagensPJ']['size'] > 0 && $_FILES['voucher_passagensPJ']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_passagensPJ']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_passagensPJ']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['voucher_passagensPJ'] = UPLOAD_PATH.$name.$ext;
		}
		
		$id_passagens = $passagens->add($_POST);
		if($id_passagens){
			$_SESSION['passagens']['id'][] = $id_passagens;
			$this->session->setFlashMessage('Passagens aérea adicionado à lista de venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
		
	
	}
	
	public function removePassagensPJAction()
	{
		$passagens = new Application\Models\PassagensPJ();
		$param = func_get_args();
		$foto = $passagens->list_once($param[1]);
		if($passagens->remove($param[1])){
			$key = array_search($param[1],$_SESSION['passagens']['id']);
			unset($_SESSION['passagens']['id'][$key]);
			if(count($_SESSION['passagens']['id']) == 0){
				unset($_SESSION['passagens']);
			}
			unlink($foto['voucher_passagensPJ']);
			$this->session->setFlashMessage('Passagem aérea removido da lista venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
	}
}
			