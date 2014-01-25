<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\CompraTicket;

class CompraTicketController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new CompraTicket();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['compratickets'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('compraticket/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadCompraTicketAction()
	{
		$param = func_get_args();
		if($param){
			$data['compratickets'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('compraticket/cadCompraTicket',$data);
		$this->view('template/footer');
	}
	
	public function saveCompraTicketAction()
	{
		if($_FILES['voucher_compraTicket']['size'] > 0 && $_FILES['voucher_compraTicket']['error'] == UPLOAD_ERR_OK){
			
			$file = explode('.',$_FILES['voucher_compraTicket']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_compraTicket']['tmp_name'], UPLOAD_PATH.$name.$ext);
			$_POST['voucher_compraTicket'] = UPLOAD_PATH.$name.$ext;
		}
		
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_compraTicket'] == null){
			$id = $this->model->add($_POST);
			if($id){
				$_SESSION['tickets'][$_POST['id_clientePF']]['id_tickets'][] = $id;
				$this->session->setFlashMessage('Ticket Adicionado a lista de Venda.','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
	}
	
	public function deleteCompraTicketAction()
	{
		$param = func_get_args();
		$id = $param[1];
		$id_cliente = $param[3];
		$file  = $this->model->list_once($id);
		if(in_array($id,$_SESSION['tickets'][$id_cliente]['id_tickets'])){
			$key = array_search($id,$_SESSION['tickets'][$id_cliente]['id_tickets']);
			unset($_SESSION['tickets'][$id_cliente]['id_tickets'][$key]);
			unlink($file[0]['voucher_compraTicket']);
		}
		
		if($this->model->remove($param[1])){
			$this->session->setFlashMessage('CompraTicket removido da lista venda','success');
			$this->redirector('/venda/cadVendaPF');
		}
	}
}
			