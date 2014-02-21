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
		$passagens = new Application\Models\Passagens();
		$empresa = new Application\Models\Empresa();
		$agencia = new Application\Models\Agencia();
		$compania = new Application\Models\Compania();
		$origem = new Application\Models\Origem();
		$destino = new Application\Models\Destino();
		$vendaDependente = new Application\Models\VendaDependentePF();
		$funcionario = new Application\Models\DependentePF();
		
		$venda = $vendaDependente->getFunc($id_venda);
		$arrayFunc = array();
		foreach ($venda as $key => $value) {
			$arrayFunc[] = $funcionario->list_once($value['id_dependentePF']);	
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
		$this->view('voucher/passagens',$data);
		$this->view('template/footer');	
	}
	
	public function hotelPJAction()
	{
		$param = func_get_args();
		$id_venda = $param[5];
		$venda = new Application\Models\Venda();
		$vendaDependente = new Application\Models\VendaDependentePF();
		$hotel = new Application\Models\Hotel();
		$funcionario = new Application\Models\DependentePF();
		$agencia = new Application\Models\Agencia();
		$empresa = new Application\Models\Empresa();
		$brokers = new Application\Models\Brokers();
		
		
		// $vendas = $vendaDependente->getFunc($id_venda);
		// $arrayFunc = array();
		// foreach ($vendas as $key => $value) {
			// $arrayFunc[] = $funcionario->list_once($value['id_dependentePF']);	
		// }
		
		
		$data['title'] = 'Voucher Hotel';
		$data['hospedes'] = $venda->getFuncionario($id_venda);
		$data['hotel'] = $venda->getHotel($id_venda);
		$data['dependentes'] = $funcionario->list_all();
		$data['venda'] = $venda->list_once($id_venda);
		$data['agencia'] = $agencia->list_all();
		$data['empresa'] = $empresa->list_all();
		$data['brokers'] = $brokers->list_all();
		
		
		$this->view('template/head',$data);
		$this->view('voucher/hotel',$data);
		$this->view('template/footer');	
		
	}
	
	
	
}
			