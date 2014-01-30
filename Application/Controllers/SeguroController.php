<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Seguro;

class SeguroController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Seguro();
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['seguros'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('seguro/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadSeguroAction()
	{
		$param = func_get_args();
		if($param){
			$data['seguros'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('seguro/cadSeguro',$data);
		$this->view('template/footer');
	}
	
	public function saveSeguroAction()
	{
		if($_FILES['voucher_seguro']['size'] > 0 && $_FILES['voucher_seguro']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_seguro']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_seguro']['tmp_name'], UPLOAD_PATH.$name.$ext);
			$_POST['voucher_seguro'] = UPLOAD_PATH.$name.$ext;
		}
		
		$_POST['dt_inicio_seguro'] = $this->dateToMysql($_POST['dt_inicio_seguro']);
		$_POST['dt_fim_seguro'] = $this->dateToMysql($_POST['dt_fim_seguro']);
		
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_seguro'] == null){
			$id_seguro = $this->model->add($_POST);
			if($id_seguro){
				$_SESSION['seguro'][$_POST['id_clientePF']]['id_seguro'][] = $id_seguro;
				$this->session->setFlashMessage('Seguro adicionado à lista de venda','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
		
	}
	
	public function deleteSeguroAction()
	{
		$param = func_get_args();
		
		foreach($_SESSION['seguro'] as $key => $value){
				$foto = $this->model->list_once($param[1]);
			foreach($value['id_seguro'] as $k => $val){
				if(in_array($param[1],$_SESSION['seguro'][$param[3]]['id_seguro'])){
					$id_seguro = array_search($param[1],$_SESSION['seguro'][$param[3]]['id_seguro']);
				unset($_SESSION['seguro'][$param[3]]['id_seguro'][$id_seguro]);
				$this->model->remove($param[1]);
				unlink($foto[0]['voucher_seguro']);
				$this->session->setFlashMessage('Seguro removido da lista de venda.','success');
				$this->redirector('/venda/cadVendaPF');
				}
			}
		}
	}
	
	public function dateToMysql($date)
	{
		$data = explode('/',$date);
		return $data[2].'-'.$data[1].'-'.$data[0];
	}
}
			