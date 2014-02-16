<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
// use Vendor\Library\HTML2PDF\HTML2PDF;

class VoucherController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
		$this->library('HTML2PDF');
	}
	
	public function indexAction()
	{
				
		$data['title'] = 'Titulo da Pagina';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('voucher/index',$data);
		$this->view('template/footer');	
		
	}
	
	public function passagensPJAction()
	{
		$param = func_get_args();
		$id_venda = $param[5];
		$passagens = new Application\Models\PassagensPJ();
		$empresa = new Application\Models\Empresa();
		$agencia = new Application\Models\Agencia();
		$compania = new Application\Models\Compania();
		$origem = new Application\Models\Origem();
		$destino = new Application\Models\Destino();
		$vendaDependente = new Application\Models\VendaDependentePJ();
		$funcionario = new Application\Models\DependentePJ();
		
		$venda = $vendaDependente->getFunc($id_venda);
		$arrayFunc = array();
		foreach ($venda as $key => $value) {
			$arrayFunc[] = $funcionario->list_once($value['id_dependentePJ']);	
		}
		// $this->HTML2PDF->init();
		// $this->dump($arrayFunc);
		
		$data['title'] = 'Voucher Passagem aérea';
		$data['passagem'] = $passagens->list_once($param[1]);
		$data['param'] = $param;
		$data['agencia'] = $agencia;
		$data['empresa'] = $empresa;
		$data['compania'] = $compania;
		$data['origem'] = $origem->list_all();
		$data['destino'] = $destino->list_all();
		$data['dependentePJ'] = $arrayFunc;
		
		$this->view('template/head',$data);
		$this->view('voucher/hotelPJ',$data);
		$this->view('template/footer');	
	}
	
	public function hotelPJAction()
	{
		$param = func_get_args();
		$hotel = new Application\Models\HotelPJ();
		
	}
	
	public function passagensPFAction()
	{
		$param = func_get_args();
		$passagens = new Application\Models\Passagens();
		
	}
	
	public function hotelPFAction()
	{
		$param = func_get_args();
		$hotel = new Application\Models\Hotel();
		
	}
	
}
			