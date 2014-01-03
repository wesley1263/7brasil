<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\Form\Form;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Session\Session;
use Vendor\Library\Table\Table;
use Application\Models\ClientePF;
use Application\Models\ClientePJ;
use Application\Models\Classificacao;
use Application\Models\CartaoPF;

class ClienteController extends OXE_Controller {
	
	public function init()
	{
		$this->model = new ClientePF();
		$this->session = new Session();
	}
	
	public function indexAction()
	{
		
		$data['title'] = 'Gerenciar Clientes';
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/index');
		$this->view('template/footer');
	}
	
	private function dateToMysql($date)
	{
		$data = explode('/', $date);
		return $data[2].'-'.$data[1].'-'.$data[0];
	}
	
	public function fisicaAction()
	{
		$form = new FormStyle();
		$table = new Table();
		$data['title'] = 'Gerenciar Clientes - Pessoa Física';
		$data['form'] = $form;
		$data['table'] = $table;
		$data['clientes'] = $this->model->list_all();
		
		$this->view('template/head',$data);
		$this->view('template/header');
		// $this->view('template/cambio');
		$this->view('cliente/pf/listaFisica',$data);
		$this->view('template/footer');
	}
	
	public function cadfisicaAction()
	{
		$form = new FormStyle();
		$data['title'] = 'Cadastro Clientes - Pessoa Física';
		$data['form'] = $form;
		
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/pf/fisica',$data);
		$this->view('template/footer');
	}

	public function updateFisicaAction()
	{
		
		$param = func_get_args();
		$classif = new Classificacao();
		$cartoes = new CartaoPF();
		
		$form = new FormStyle();
		$data['title'] = 'Cadastro Clientes - Pessoa Física';
		$data['form'] = $form;
		$data['classif'] = $classif->list_all();
		$data['clientes'] = $this->model->list_once($param[1]);
		$data['cartoes'] = $cartoes->findCliente($data['clientes'][0]['id_clientePF']);
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/pf/updatefisica',$data);
		$this->view('template/footer');
	}
	
	public function saveUpdatePFAction()
	{
		$model = $this->model->list_once($_POST['id_clientePF']);
		$_POST['dt_validadePassaporte_clientePF'] = $this->dateToMysql($_POST['dt_validadePassaporte_clientePF']);
		$_POST['dataNascimento_clientePF'] = $this->dateToMysql($_POST['dataNascimento_clientePF']);
		$_POST['nome_clientePF'] = strtoupper($_POST['nome_clientePF']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}

		if($_FILES['copia_rg_clientePF']['size'] > 0){
			unlink($model[0]['copia_rg_clientePF']);
			$extension = explode(".",$_FILES['copia_rg_clientePF']['name']);
			$file = '.'.end($extension);
			$new = md5(time().$extension[0]);
			move_uploaded_file($_FILES['copia_rg_clientePF']['tmp_name'], UPLOAD_PATH.$new.$file);
			$_POST['copia_rg_clientePF'] = UPLOAD_PATH.$new.$file;
		}

		if($_FILES['copia_cpf_clientePF']['size'] > 0){
			unlink($model[0]['copia_cpf_clientePF']);
			$extension = explode(".",$_FILES['copia_cpf_clientePF']['name']);
			$file = '.'.end($extension);
			$new = md5(time().$extension[0]);
			move_uploaded_file($_FILES['copia_cpf_clientePF']['tmp_name'], UPLOAD_PATH.$new.$file);
			$_POST['copia_cpf_clientePF'] = UPLOAD_PATH.$new.$file;
		}

		if($_FILES['foto_clientePF']['size'] > 0){
			unlink($model[0]['foto_clientePF']);
			$extension = explode(".",$_FILES['foto_clientePF']['name']);
			$file = '.'.end($extension);
			$new = md5(time().$extension[0]);
			move_uploaded_file($_FILES['foto_clientePF']['tmp_name'], UPLOAD_PATH.$new.$file);
			$_POST['foto_clientePF'] = UPLOAD_PATH.$new.$file;
		}
		
		############# Iterando names de cartão de crédito  ###########
			$n1 = 0;
			$arr1 = array();
			foreach($_POST as $key => $value){
				if(is_array($value)){
					if($key == 'numero_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['numero_cartaoPF'] = $v;
						}
					}
					
					$n1 = 0;
					if($key == 'codigo_seguranca_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['codigo_seguranca_cartaoPF'] = $v;
						}
					}
					
					$n1 = 0;
					if($key == 'bandeira_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['bandeira_cartaoPF'] = $v;
						}
					}
					
					$n1 = 0;
					if($key == 'dt_validade_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['dt_validade_cartaoPF'] = $this->dateToMysql($v);
						}
					}
					
				}
			}
			############# Iterando names de cartão de crédito  ###########
			
			
			unset($_POST['numero_cartaoPF']);
			unset($_POST['codigo_seguranca_cartaoPF']);
			unset($_POST['bandeira_cartaoPF']);
			unset($_POST['dt_validade_cartaoPF']);
		
		if($this->model->update_cli($_POST)){
			
			$this->session->setFlashMessage('Cliente PF atualizado com sucesso','success');
			$this->redirector('/cliente/fisica');
		}else{
			$this->session->setFlashMessage('Error ao tentar atualizar Cliente PF','error');
			$this->redirector('/cliente/fisica');
		}
	}
	
	public function saveFisicaAction()
	{
		$_POST['nome_clientePF'] = strtoupper($_POST['nome_clientePF']);
		
			foreach($_POST as $key => $value){
				if(!is_array($value)){
					$_POST[$key] = strip_tags($value);
				}
			}
			
			
			############# Iterando names de cartão de crédito  ###########
			$n1 = 0;
			$arr1 = array();
			foreach($_POST as $key => $value){
				if(is_array($value)){
					if($key == 'numero_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['numero_cartaoPF'] = $v;
						}
					}
					
					$n1 = 0;
					if($key == 'codigo_seguranca_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['codigo_seguranca_cartaoPF'] = $v;
						}
					}
					
					$n1 = 0;
					if($key == 'bandeira_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['bandeira_cartaoPF'] = $v;
						}
					}
					
					$n1 = 0;
					if($key == 'dt_validade_cartaoPF'){
						foreach($value as $v){
							$n1++;
							$arr1[$n1]['dt_validade_cartaoPF'] = $this->dateToMysql($v);
						}
					}
					
				}
			}
			############# Iterando names de cartão de crédito  ###########
			
			
			unset($_POST['numero_cartaoPF']);
			unset($_POST['codigo_seguranca_cartaoPF']);
			unset($_POST['bandeira_cartaoPF']);
			unset($_POST['dt_validade_cartaoPF']);
			
		$_POST['dataNascimento_clientePF'] = $this->dateToMysql($_POST['dataNascimento_clientePF']);
		
			if($_POST['dt_validadePassaporte_clientePF']){
				$_POST['dt_validadePassaporte_clientePF'] = $this->dateToMysql($_POST['dt_validadePassaporte_clientePF']);
		}
		
		if($_FILES['copia_rg_clientePF']['error'] == UPLOAD_ERR_OK){
			$extension = explode('.',$_FILES['copia_rg_clientePF']['name']);
			$file = md5(time().$extension[0]);
			$extension = '.'.end($extension);
			$ok = move_uploaded_file($_FILES['copia_rg_clientePF']['tmp_name'], UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension);
			if($ok){
				$_POST['copia_rg_clientePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension;
			}
		}		
		
		if($_FILES['copia_cpf_clientePF']['error'] == UPLOAD_ERR_OK){
			$extension = explode('.',$_FILES['copia_cpf_clientePF']['name']);
			$file = md5(time().$extension[0]);
			$extension = '.'.end($extension);
			$ok = move_uploaded_file($_FILES['copia_cpf_clientePF']['tmp_name'], UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension);
			if($ok){
				$_POST['copia_cpf_clientePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension;
			}
		}
		
		if($_FILES['foto_clientePF']['error'] == UPLOAD_ERR_OK){
			$extension = explode('.',$_FILES['foto_clientePF']['name']);
			$file = md5(time().$extension[0]);
			$extension = '.'.end($extension);
			$ok = move_uploaded_file($_FILES['foto_clientePF']['tmp_name'], UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension);
			if($ok){
				$_POST['foto_clientePF'] = UPLOAD_PATH.DIRECTORY_SEPARATOR.$file.$extension;
			}
		}
		$user = $this->model->findClientePF($_POST['cpf_clientePF']);
		if(!$user){
		$ok = $this->model->insert($_POST);
		if($ok){
			$id = $ok;
			###### Adicionando cartão de crédito do cliente #######
			$cartao = new CartaoPF();
			
			foreach($arr1 as $key => $value){
				$arr1[$key]['id_clientePF'] = $id;
			}
			
			foreach($arr1 as $card){
				$cartao->add($card);
			}
			###### Adicionando cartão de crédito do cliente #######
			$this->session->setFlashMessage('Cadastro de Cliente PF realizado com sucesso','success');
			$this->redirector('/cliente/fisica');
			}
		}else{
			$this->session->setFlashMessage('Cliente PF já cadastrado no sistema!','error');
			$this->redirector('/cliente/fisica');
		}
	}

	public function deleteClientePFAction()
	{
		$param = func_get_args();
		if($this->model->delete_cli($param[1])){
			$this->session->setFlashMessage('Cliente PF removido do sistema','success');
			$this->redirector('/cliente/fisica');
		}
	}
	
	public function juridicaAction()
	{
		$form = new FormStyle();	
		$model = new ClientePJ();
		$table = new Table();
		
		$data['title'] = 'Gerenciar Clientes - Pessoa Física';
		$data['form'] = $form;
		$data['clientes'] = $model->list_all();
		$data['table'] = $table;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cliente/pj/lista_jurdica',$data);
		$this->view('template/footer');
		
	}
	
	public function cadJuridicaAction()
	{
		$form = new FormStyle();	
		$data['title'] = 'Cadastrar Clientes - Pessoa Jurídica';
		$data['form'] = $form;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('template/cambio');
		$this->view('cliente/pj/juridica',$data);
		$this->view('template/footer');
	}
	
	public function findCepAction()
	{
		$cep = file_get_contents("http://clareslab.com.br/ws/cep/json/".$_POST['cep'].'/');
		echo utf8_encode($cep);
	}
	
	public function saveJuridicaAction()
	{
		$model = new ClientePJ();
		$_POST['nomefantasia_clientePJ'] = strtoupper($_POST['nomefantasia_clientePJ']);
		foreach($_POST as $key => $value){
			$_POST[$key] = strip_tags($value);
		}
		
		if($_FILES['logotipo_clientePJ']['error'] == UPLOAD_ERR_OK){
			$file = explode('.',$_FILES['logotipo_clientePJ']['name']);
			$extension = '.'.end($file);
			$arq = UPLOAD_PATH.DIRECTORY_SEPARATOR.md5(time().$file[0]).$extension;
			if(move_uploaded_file($_FILES['logotipo_clientePJ']['tmp_name'],$arq)){
				$_POST['logotipo_clientePJ'] = $arq;
			}
		}
		
		
		if(!$model->findCNPJ($_POST['cnpj_clientePJ'])){
			if($model->insert_cli($_POST)){
			$this->session->setFlashMessage('Empresa cadastrada com sucesso','success');
			$this->redirector('/cliente/juridica');
			}else{
				$this->session->setFlashMessage('Erro ao tentar cadastrar Empresa!','error');
				$this->redirector('/cliente/juridica');
			}
		}else{
			$this->session->setFlashMessage('Empresa já cadastrada no sistema!','error');
			$this->redirector('/cliente/juridica');
		}
		
	}

	public function listClientePFAction()
	{
		return ($this->model->list_once($_POST['id_clientePF']));
	}
	
	public function updateJuridicaAction()
	{
		$model = new ClientePJ();
		$Classificacao = new Classificacao();
		$param = func_get_args();
		$model = $model->list_once($param[1]);
		$form = new FormStyle();	
		$data['title'] = 'Cadastrar Clientes - Pessoa Jurídica';
		$data['form'] = $form;
		$data['clientes'] = $model;
		$data['classificacao'] = $Classificacao->list_all();;
		
		$this->view('template/head',$data);
		$this->view('template/header');
		$this->view('cliente/pj/updatejuridica',$data);
		$this->view('template/footer');
	}
	
	public function saveUpdateJuridicaAction()
	{
		$model = new ClientePJ();
		$clientePJ = $model->list_once($_POST['id_clientePJ']);
		
		if($_FILES['logotipo_clientePJ']['size'] > 0){
			unlink($clientePJ['logotipo_clientePJ']);
			$file = explode('.',$_FILES['logotipo_clientePJ']['name']);
			$extension = '.'.end($file);
			$new_file = md5(time().$file[0]);
			move_uploaded_file($_FILES['logotipo_clientePJ']['tmp_name'],UPLOAD_PATH.$new_file.$extension);
			$_POST['logotipo_clientePJ'] = UPLOAD_PATH.$new_file.$extension;
		}
		
		if($model->update_cli($_POST)){
			$this->session->setFlashMessage('Dados de Empresa atualizado com sucesso.','success');
			$this->redirector('/cliente/juridica');
		}
	}

	public function deleteJuridicaAction()
	{
		$param = func_get_args();
		
		$model = new ClientePJ();
		$cliente = $model->list_once($param[1]);
		
		if($model->delete_cli($param[1])){
			unlink($cliente[0]['logotipo_clientePJ']);
			$this->session->setFlashMessage('Empresa removida do sistema com sucesso.','success');
			$this->redirector('/cliente/juridica');
		}
		 
	}
	
	
}
