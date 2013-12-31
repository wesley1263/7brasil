<?php
use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;

class RoboController extends OXE_Controller {
	
	public function init()
	{
		
	}
	
	public function indexAction()
	{
		
	}
	
	public function ControllerAction()
	{
		$form = new FormStyle();
		
		$data['form'] = $form;
		$data['title'] = 'Criar Controller';
		
		$this->view('template/head',$data);
		$this->view('robo/controller',$data);
		$this->view('template/footer',$data);
	}
	
	public function createControllerAction()
	{
		$controller = ucfirst($_POST['name_controller']).'Controller';
		if(file_exists(CONTROLLER_PATH.$controller.'.php')){
			exit(utf8_encode('Controller já Existe!'));
		}else{
			$control = <<<html
<?php

use Vendor\Core\OXE_Controller;

class $controller extends OXE_Controller{
		
	public function init()
	{
		
	}
	
	public function indexAction()
	{
		
	}
}
			
html;
			if(file_put_contents(CONTROLLER_PATH.$controller.'.php',$control)){
				chmod(CONTROLLER_PATH.$controller.'.php', 0777);
				echo 'Arquivo criado com sucesso';
			}
		}
	}
	
	
	public function modelAction()
	{
		$form = new FormStyle();
		
		$data['form'] = $form;
		$data['title'] = 'Criar Model';
		
		$this->view('template/head',$data);
		$this->view('robo/model',$data);
		$this->view('template/footer',$data);
	}
	
	
	public function createModelAction()
	{
		
		$file = ucfirst($_POST['name_model']).'.php';
		$table = $_POST['name_table'];
		$id = $_POST['primary'];
		$class = ucfirst($_POST['name_model']);
		
		$model = <<<model
<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class $class extends OXE_Model {
		
	protected \$_name = '$table';
	protected \$_primary = '$id';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		return \$this->fetchAll();
	}
	
	public function list_once(\$id)
	{
		return \$this->select()
					 ->from(\$this->_name)
					 ->where(\$this->_primary.' = '.\$id)
					 ->result();
	}
	
	public function add(array \$data)
	{
		return \$this->insert(\$data);
	}
	
	public function remove(\$id)
	{
		return \$this->delete(\$id);
	}
	
	public function alter(array \$data)
	{
		return \$this->update(\$data,\$this->_primary.' = '.\$data['$id']);
	}
	
	public function DescTables()
	{
		return \$this->query("DESC \$this->_name");
	}	
	
}
model;
		if(file_exists(MODEL_PATH.$file)){
			exit("$file já existe!");
		}else{
			if(file_put_contents(MODEL_PATH.$file,$model)){
			chmod(MODEL_PATH.$file,0777);
				echo "$file criado com sucesso.";	
			}
		}

	}

}
