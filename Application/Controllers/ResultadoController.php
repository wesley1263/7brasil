<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\Filial;
use Application\Models\Receber;
use Application\Models\Contas;
use Application\Models\Grupo;
use Application\Models\Subgrupo;
use Application\Models\Cambio;
use Application\Models\Usuario;

class ResultadoController extends OXE_Controller{
		
	public function init()
	{
		$this->session = new Session();
		$this->table = new Table();
		$this->form = new FormStyle();
	}
	
	public function indexAction()
	{
		$filial = new Filial();
		$receber = new Receber();
		$contas = new Contas();
		$grupo = new Grupo();
		$subgrupo = new Subgrupo();
		$moeda = new Cambio();
		$usuario = new Usuario();
		
		if($_POST){
			$data['contas'] = $contas->filterContasMesPaga($_POST);
			$data['receber'] = $receber->filterReceberMesPago($_POST);
		}else{
			$data['receber'] = $receber->listaReceberMesPago();
			$data['contas'] = $contas->listaContasMesPaga();
		}
				
		$data['title'] = 'Demonstrativo de Resultado';
		$data['form'] = $this->form;
		$data['table'] = $this->table;
		$data['session'] = $this->session;
		$data['filial'] = $filial->list_all();
		$data['grupo'] = $grupo->list_all();
		$data['subgrupo'] = $subgrupo->list_all();
		$data['moeda'] = $moeda->list_all();
		$data['usuario'] = $usuario->list_all();
				
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('resultado/index',$data);
		$this->view('template/footer');	
		
	}
	
	
	
	
	
	
}
			