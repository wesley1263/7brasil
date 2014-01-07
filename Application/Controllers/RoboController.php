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
		\$data['{$file}s'] = \$this->model->list_all();
		\$data['form'] = \$this->form;
		\$data['table'] = \$this->table;
		\$data['session'] = \$this->session;
				
		\$this->view('template/head',\$data);
		\$this->view('template/header');
		\$this->view('$file/index',\$data);
		\$this->view('template/footer');	
		
	}
	
	public function cad{$name}Action()
	{
		\$param = func_get_args();
		if(\$param){
			\$data['{$file}s'] = \$this->model->list_once(\$param[1]);
		}
		
		\$data['title'] = 'Titulo da Pagina';
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
		\$this->dump(\$_POST);
	}
	
	public function delete{$name}Action()
	{
		\$param = func_get_args();
		if(\$this->model->remove(\$param[1])){
			\$this->session->setFlashMessage('$name removido do sistema','success');
			\$this->redirector('/$file');
		}
	}
}
			
html;

$form = "<?php
	if(isset(\$_SESSION['success'])){
		echo '<div class=\"alert alert-success\">'.\$this->session->getFlashMessage('success').'</div>';
	}
	
	if(isset(\$_SESSION['error'])){
		echo '<div class=\"alert alert-danger\">'.\$this->session->getFlashMessage('error').'</div>';
	}
	

	\$form->init('form_$file','/$file/save{$name}');";


$index = <<<index
<a href="#" class="btn btn-primary"><span class="glyphicon glyphicon-plus-sign"></span> Novo</a>
	<form class="navbar-form navbar-right" role="search">
		<div class="form-group">
			<input type="text" class="form-control" placeholder="Teste" name="teste">
		</div>
		<div class="form-group">
			<select name="id_cliente" class="form-control">
				<option>Locadora</option>
				<option value="3">ANDWES SOLUTION </option>
			</select>
		</div>
		<button type="submit" class="btn btn-default">
			<span class="glyphicon glyphicon-search"></span> Buscar
		</button>
	</form>
	<?php 
	\$table->t_init('class="table table-bordered"');
	\$table->t_head(array('Teste','Teste','Status','Editar','Remover'));
	\$table->t_row(array(
						'teste',
						'teste',
						'Ativo',
						'<center><a href="#"><span class="glyphicon glyphicon-pencil"></span></a></center>',
						'<center><a href="#" onclick=" return confirm(\'Deseja realmente remover ?\')"><span class="glyphicon glyphicon-remove"></span></a></center>'
						));
	\$table->generate();
	?>
</div>

index;

		if(file_put_contents(CONTROLLER_PATH.$controller.'.php',$control)){
			chmod(CONTROLLER_PATH.$controller.'.php', 0777);
			if(mkdir($dir)){
				chmod($dir, 0777);
				file_put_contents($dir.DIRECTORY_SEPARATOR.'index.phtml', $index);
				file_put_contents($dir.DIRECTORY_SEPARATOR.'cad'.$name.'.phtml', $form);
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
					$inputs = array();
					
					
					foreach($model->DescTables() as $key => $values){
						
						if(preg_match("/^(varchar)|(decimal)|(datetime)/",$values['Type'])){
							$inputs['text'][] = $this->formInput('text', $values['Field']);
						}else if(preg_match("/^(int)/",$values['Type'])){
							$inputs['hidden'][] = $this->formInput('hidden', $values['Field']);
						}else if(preg_match("/^(text)/",$values['Type'])){
							$inputs['textarea'][] = $this->formSelect($values['Field']);
						}
						
					}
					
					//$this->dump($inputs);
					foreach($inputs['hidden'] as $key => $value){
						file_put_contents($view, $value."\n",FILE_APPEND);
					}
					
					foreach($inputs['text'] as $key => $value){
						file_put_contents($view,$value."\n",FILE_APPEND);
					}
					
					foreach($inputs['textarea'] as $key => $value){
						file_put_contents($view,$value,FILE_APPEND);
					}
					$content = "echo str_repeat('<br />',3);
								\$form->groupOpen();		
								\$form->submit('Salvar','style=\"padding:5% 13%\"');
								\$form->groupClose();"."\n".
								"\$form->close();";
								
					if(file_put_contents($view,$content,FILE_APPEND)){
						echo "Formulário criado com sucesso";
					}
				}
				
			}
		}
		
		
		
	}
	
	private function formInput($type, $name,$required = 'true')
	{
		$return = "
			\$form->groupOpen();	
			\$form->input(array(
				'name' =>'$name',
				'type' =>'$type',
				'placeholder' => '$name',
				'num_label' =>'2',
				'num_input' =>'5',
				'label' =>'$name',
				'value' =>'',
				'required' => $required
				));
		\$form->groupClose();";
		
		return $return;
	}
	
	
	public function formSelect($name)
	{
		return "\$form->textarea('$name','$name','','$name',2,8);";
	}

}
