<?php
use Vendor\Core\OXE_Controller;
use Application\Models\Moeda;
use Application\Models\Cambio;
use Vendor\Library\Session\Session;



class IndexController extends OXE_Controller {

	public function init() {
		$this->session = new Session();
		$user = $this->session->getSession('user');
		if(!$user['logado']){
			$this->redirector('/login');
		} 
	}

	public function indexAction() 
	{
		$moeda = new Moeda();
		$cambio = new Cambio();
		
		$data['moedas'] = $moeda->list_all();
		$data['cambios'] = $cambio->list_all();
		$data['title'] = 'Pagina inicial';
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio',$data);
		$this->view('index/index');
		$this->view('template/footer');
	}
	


}
