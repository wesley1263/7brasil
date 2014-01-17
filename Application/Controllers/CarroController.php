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
			$file = explode('/',$_FILES['voucher_carro']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_carro']['tmp_name'], UPLOAD_PATH.$name.$ext);
			$_POST['voucher_carro'] = UPLOAD_PATH.$name.$ext;
		}
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		$_POST['dt_inicio_carro'] = $this->dateToMysql($_POST['dt_inicio_carro']).' '.$_POST['hora_inicio_carro'];
		$_POST['dt_devolucao_carro'] = $this->dateToMysql($_POST['dt_devolucao_carro']).' '.$_POST['hora_devolucao_carro'];
		$id_cliente = $_POST['id_clientePF'];
		unset($_POST['id_clientePF']);
		unset($_POST['hora_inicio_carro']);
		unset($_POST['hora_devolucao_carro']);
		
		// $this->dump($_POST);
		// exit;
		if($_POST['id_carro'] == null){
			$ok = $this->model->add($_POST);
			if($ok){
				$_SESSION['carros'][$id_cliente]['id_carro'][] = $ok;
				$_SESSION['carros'][$id_cliente]['id_locadora'][] = $_POST['id_locadora'];
				$_SESSION['carros'][$id_cliente]['valor_carro'][] = $_POST['valor_carro'];
				$_SESSION['carros'][$id_cliente]['valor_casa'][] = $_POST['valor_casa_carro'];
				$_SESSION['carros'][$id_cliente]['valor_taxa'][] = $_POST['taxa_carro'];
				
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
		$param = func_get_args();
		$this->dump($param);
		// if($this->model->remove($param[1])){
			// $this->session->setFlashMessage('Carro removido do sistema','success');
			// $this->redirector('/venda/CadVenda');
		// }
	}
	
	private function dateToMysql($date)
	{
		$date = explode("/",$date);
		return $date[2].'-'.$date[1].'-'.$date[0];
	}
}
			