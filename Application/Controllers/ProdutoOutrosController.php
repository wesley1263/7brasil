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
		
		//Verifica se o usuário está logado
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		}
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
			
			if($this->model->remove($param[1])){
				$this->session->setFlashMessage('ProdutoOutros removido do sistema','success');
				$this->redirector('/venda/cadVendaPF');
			}
		}
	}
	
	
	public function saveProdutoOutrosPJAction()
	{
		$produto = new Application\Models\ProdutoOutrosPJ();
		$id_produto = $produto->add($_POST);
		
		if($id_produto){
			$_SESSION['produto']['id'][] = $id_produto;
			$this->session->setFlashMessage('Produto adicionado a lista de venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
	}
	
	
	public function removeProdutoOutrosPJAction()
	{
		$produto = new Application\Models\ProdutoOutrosPJ();
		
		$param = func_get_args();
		 
		if($produto->remove($param[1])){
			$key = array_search($param[1], $_SESSION['produto']['id']);
			unset($_SESSION['produto']['id'][$key]);
			if(count($_SESSION['produto']['id']) == 0){
				unset($_SESSION['produto']);
			}
			$this->session->setFlashMessage('Produto removido da lista de Venda.','success');
			$this->redirector('/vendaPJ/cadVendaPJ');
		}
	}
}
			