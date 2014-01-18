<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Hotel;

class HotelController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new Hotel();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['hotels'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('hotel/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadHotelAction()
	{
		$param = func_get_args();
		if($param){
			$data['hotels'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('hotel/cadHotel',$data);
		$this->view('template/footer');
	}
	
	public function saveHotelAction()
	{
		unset($_POST['is_br']);
		if($_FILES['voucher_hotel']['size'] > 0 && $_FILES['voucher_hotel']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['voucher_hotel']['name']);
			$ext = '.'.end($file);
			$name = md5(time().$file[0]);
			move_uploaded_file($_FILES['voucher_hotel']['tmp_name'],UPLOAD_PATH.$name.$ext);
			$_POST['voucher_hotel'] = UPLOAD_PATH.$name.$ext;
		}
		
		$_POST['nome_hotel'] = strtoupper($_POST['nome_hotel']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_POST['id_hoteis'] == null){
			$id_hotel = $this->model->add($_POST);
			if($id_hotel){
				$_SESSION['hotel'][$_POST['id_clientePF']]['id_hotel'][] = $id_hotel;
				$this->session->setFlashMessage('Hotel adicionado a lista de venda.','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
	}
	
	public function deleteHotelAction()
	{
		$param = func_get_args();
		$foto = $this->model->list_once($param[1]);
		unlink($foto[0]['voucher_hotel']);
		foreach($_SESSION['hotel'] as $key => $value){
			foreach($value as $k => $val){
				if(in_array($param[1],$_SESSION['hotel'][$key]['id_hotel'])){
					$id_hotel = array_search($param[1],$_SESSION['hotel'][$key]['id_hotel']);
					unset($_SESSION['hotel'][$key]['id_hotel'][$id_hotel]);
					$this->model->remove($param[1]);
					$this->session->setFlashMessage('Hotel removido da lista de venda.','success');
					$this->redirector('/venda/cadVendaPF');
				}
			}
		}
	}
}
			