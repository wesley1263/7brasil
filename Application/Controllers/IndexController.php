<?php
use Vendor\Core\OXE_Controller;



class IndexController extends OXE_Controller {

	public function init() {

	}

	public function indexAction() 
	{
		
		$data['title'] = 'Pagina inicial';
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('index/index');
		$this->view('template/footer');
	}
	


}
