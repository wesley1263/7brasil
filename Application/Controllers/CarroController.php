<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Carro;

class CarroController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Carro();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['carros'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('carro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCarroAction()
	{
		$param = func_get_args();
		if($param){
			$data['carros'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('carro/cadCarro',$data);
		$this->view('template/footer');
	}
	
	public function saveCarroAction()
	{
		
		if($_FILES['voucher_carro']['size'] > 0 && $_FILES['voucher_carro']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_carro']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_carro']['tmp_name'], UPLOAD_PATH.$name.$ext);
			$_POST['voucher_carro'] = UPLOAD_PATH.$name.$ext;
		}
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		$_POST['dt_inicio_carro'] = $_POST['dt_inicio_carro'].' '.$_POST['hora_inicio_carro'];
		$_POST['dt_devolucao_carro'] = $_POST['dt_devolucao_carro'].' '.$_POST['hora_devolucao_carro'];
		$id_cliente = $_POST['id_clientePF'];
		unset($_POST['hora_inicio_carro']);
		unset($_POST['hora_devolucao_carro']);
		
		// $this->dump($_POST);
		// exit;
		if($_POST['id_carro'] == null){
			$ok = $this->model->add($_POST);
			if($ok){
				$_SESSION['carros'][$id_cliente]['id_carro'][] = $ok;
				$this->session->setFlashMessage('Aluguel de carro adicionado a listan de venda','success');
				$this->redirector('/venda/CadVendaPF');
			}
		}else{
			if($this->model->alter($_POST)){
				$this->session->setFlashMessage('Aluguel de carro alterado a listan de venda','success');
				$this->redirector('/venda/CadVendaPF');
			}
		}
	}
	
	public function deleteCarroAction()
	{
		$param  = func_get_args();
		
		if(in_array($param[1], $_SESSION['carros'][$param[3]]['id_carro'])){
			$key = array_search($param[1], $_SESSION['carros'][$param[3]]['id_carro']);
			unset($_SESSION['carros'][$param[3]]['id_carro'][$key]);
			
			if($this->model->remove($param[1])){
				$this->session->setFlashMessage('Carro removido do sistema','success');
				$this->redirector('/venda/CadVendaPF');
			}
		}
			
	}
	
	private function dateToMysql($date)
	{
		$date = explode("/",$date);
		return $date[2].'-'.$date[1].'-'.$date[0];
	}
	
	public function saveCarroPJAction()
	{
		
		$carroPJ = new Application\Models\CarroPJ();
		
		if($_FILES['voucher_carroPJ']['size'] > 0 && $_FILES['voucher_carroPJ']['error'] == UPLOAD_ERR_OK){
			$file = explode('.', $_FILES['voucher_carroPJ']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_carroPJ']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['voucher_carroPJ'] = UPLOAD_PATH.$name.$ext;
		}
		$ini = $_POST['dt_inicio_carroPJ'].' '.$_POST['hora_inicio_carroPJ'];
		$fim = $_POST['dt_devolucao_carroPJ'].' '.$_POST['hora_devolucao_carroPJ'];
		
		$_PÒST['dt_inicio_carroPJ'] = $ini;
		$_PÒST['dt_devolucao_carroPJ'] = $fim;
		unset($_POST['hora_inicio_carroPJ']);
		unset($_POST['hora_devolucao_carroPJ']);
		$id_carro = $carroPJ->add($_POST);
		
		if($id_carro){
			$_SESSION['carro']['id'][] = $id_carro;
			$this->session->setFlashMessage('Aluguel de carro adicionado a lista de venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}

	}
	
	public function removeCarroPJAction()
	{
		$carroPJ = new Application\Models\CarroPJ();
		$param = func_get_args();
		$voucher = $carroPJ->list_once($param[1]);
		if($carroPJ->remove($param[1])){
			unlink($voucher['voucher_carroPJ']);
			 $key = array_search($param[1], $_SESSION['carro']['id']);
			unset($_SESSION['carro']['id'][$key]);
			if(count($_SESSION['carro']['id']) == 0){
				unset($_SESSION['carro']);
			}
			$this->session->setFlashMessage('Carro removido da lista de Venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
	}
}
			