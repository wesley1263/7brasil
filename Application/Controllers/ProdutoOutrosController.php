<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\ProdutoOutros;

class ProdutoOutrosController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->model = new ProdutoOutros();
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['produtoOutross'] = $this->model->list_all();
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('produtooutros/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function cadProdutoOutrosAction()
	{
		$param = func_get_args();
		if($param){
			$data['produtoOutross'] = $this->model->list_once($param[1]);
		}
		
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('produtooutros/cadProdutoOutros',$data);
		$this->view('template/footer');
	}
	
	public function saveProdutoOutrosAction()
	{
		$_POST['titulo_produto'] = strtoupper($_POST['titulo_produto']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		$id_cliente = $_POST['id_clientePF'];
		unset($_POST['id_clientePF']);
		if($_POST['id_produto'] == null){
			$id = $this->model->add($_POST);
			if($id){
				$_SESSION['produtos'][$id_cliente]['id_produtos'][] = $id;
				$this->session->setFlashMessage($_POST['titulo_produto'].' adicionado à lista de venda.','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
		
	}
	
	public function deleteProdutoOutrosAction()
	{
		$param = func_get_args();
		
		$id = $param[1];
		$id_cliente = $param[3];
		if(in_array($id, $_SESSION['produtos'][$id_cliente]['id_produtos'])){
			$key = array_search($id, $_SESSION['produtos'][$id_cliente]['id_produtos']);
			unset($_SESSION['produtos'][$id_cliente]['id_produtos'][$key]);
			if(count($_SESSION['produtos'][$id_cliente]['id_produtos']) == 0){
				unset($_SESSION['produtos']);
			}
			
			if($this->model->remove($param[1])){
				$this->session->setFlashMessage('ProdutoOutros removido do sistema','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
	}
}
			