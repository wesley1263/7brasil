<?php
use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;

class RoboController extends OXE_Controller {
	
	public function init()
	{
		ini_set('default_charset','utf8');
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
		$name = ucfirst($_POST['name_controller']);
		$dir = VIEW_PATH.strtolower($name);
		$file = strtolower($name);
		if(file_exists(CONTROLLER_PATH.$controller.'.php')){
			exit(utf8_encode('Controller já Existe!'));
		}else{
			$control = <<<html
<?php

use Vendor\Core\OXE_Controller;
use Vendor\Library\FormStyle\FormStyle;
use Vendor\Library\Table\Table;
use Vendor\Library\Session\Session;
use Application\Models\\$name;

class $controller extends OXE_Controller{
		
	public function init()
	{
		\$this->session = new Session();
		\$this->table = new Table();
		\$this->form = new FormStyle();
		\$this->model = new $name();
	}
	
	public function indexAction()
	{
				
		\$data['title'] = 'Titulo da Pagina';
		\$data['departamentos'] = \$this->model->selectAll();
		\$data['form'] = \$this->form;
		\$data['table'] = \$this->table;
		\$data['session'] = \$this->session;
				
		\$this->view('template/head',\$data);
		\$this->view('template/header');
		\$this->view('$name/index',\$data);
		\$this->view('template/footer');	
		
	}
	
	public function cad{$name}Action()
	{
		\$param = func_get_args();
		if(\$param){
			\$data['{$file}s'] = \$this->model->list_once(\$param[1]);
		}
		
		\$data['title'] = 'Titulo da Pagina';
		\$data['departamentos'] = \$this->model->selectAll();
		\$data['form'] = \$this->form;
		\$data['table'] = \$this->table;
		\$data['session'] = \$this->session;
				
		\$this->view('template/head',\$data);
		\$this->view('template/header');
		\$this->view('$file/cad{$name}',\$data);
		\$this->view('template/footer');
	}
	
	public function save{$name}Action()
	{
		
	}
	
	public function delete{$name}Action()
	{
		
	}
}
			
html;
		if(file_put_contents(CONTROLLER_PATH.$controller.'.php',$control)){
			chmod(CONTROLLER_PATH.$controller.'.php', 0777);
			if(mkdir($dir)){
				chmod($dir, 0777);
				file_put_contents($dir.DIRECTORY_SEPARATOR.'index.phtml', 'content list all here');
				file_put_contents($dir.DIRECTORY_SEPARATOR.'cad'.$name.'.phtml', 'Form content here');
				chmod($dir.DIRECTORY_SEPARATOR.'cad'.$name.'.phtml',0777);
				echo 'Controller criado com sucesso';
			}
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

	public function formsAction()
	{
		
		$form = new FormStyle();
		
		$data['form'] = $form;
		$data['title'] = 'Criar Formulários';
		
		$this->view('template/head',$data);
		$this->view('robo/forms',$data);
		$this->view('template/footer',$data);
			
	}
	
	public function createFormsAction()
	{
		$model_file = ucfirst($_POST['name_model']).'.php';
		$model = ucfirst($_POST['name_model']);
		$controller_file = ucfirst($_POST['name_controller']).'Controller.php';
		$controller = ucfirst($_POST['name_controller']);
		$view = VIEW_PATH.strtolower($controller).DIRECTORY_SEPARATOR."cad{$controller}.phtml";
		
		if(!file_exists(CONTROLLER_PATH.$controller_file)){
			echo "$controller_file não encontrado!";
		}else{
			if(!file_exists(MODEL_PATH.$model_file)){
			echo 'Model não encontrado!';
			}else{
				if(!file_exists($view)){
					echo "$view não foi encontrado!";
				}else{
					$namespace = "Application\Models\\$model";
					$model = new $namespace();
				
					foreach($model->DescTables() as $key => $values){
						$this->dump($values);
					}
				}
				
			}
		}
		
		
		
	}

}
