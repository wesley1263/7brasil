<?php
namespace Vendor\Library\Route;
use Vendor\Core\OXE_Controller;
/**
 * @name Route
 * @access public 
 * @author Weslei A. Souza
 * @link http://www.andwes.com.br
 * 
 * */
 
 class Route {
 	
	private $_controller;
	private $_action;
	private $_alias;
	
	
	public function route(array $data)
	{
		$this->_controller = $data['controller'];
		$this->_action = $data['action'];
		$this->_alias = $data['alias'];
		
		$uri = explode('/',$_GET['url']);
		
		$controller = array_shift($uri);
		$action = array_shift($uri);
		
		if($controller == $this->_controller){
			$controller = $controller.'Controller';
			
			include(CONTROLLER_PATH.ucfirst($controller).'.php');
			
			// $controller = new $controller();
			if($this->_alias == $action){
				call_user_func(array($this->_controller.'Controller',$this->_action.'Action'));
			}
		}else{
			exit('Error de route');
		}
		
	}
 }
