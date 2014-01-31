<?php
use Vendor\Core\OXE_Controller;
use Vendor\Library\Session\Session;
use Application\Models\Usuario;

class LoginController extends OXE_Controller {
	
	public function init()
	{
		$this->session = new Session();
		$this->model = new Usuario();
	}
	
	
	public function indexAction()
	{
		$data['title'] = 'Login de usuário';
		$this->view('template/head',$data);
		$this->view('login/index');
		$this->view('template/footer');
	}
	
	public function validarAction()
	{
		
		$ok = $this->model->validaUser($_POST);
		if($ok){
			if($ok[0]['status_usuario'] == '0'){
				$this->session->setFlashMessage('Esse usuário foi desativado, entre em contato com o administrador do sistema!','error');
				$this->Redirector('/login');
			}else{
				$user = array(
					'id_usuario' => $ok[0]['id_usuario'],
					'id_grupo' => $ok[0]['id_grupo'],
					'id_empresa' => $ok[0]['id_empresa'],
					'nome_usuario' => $ok[0]['nome_usuario'],
					'email_usuario' => $ok[0]['email_usuario'],
					'porcentagem_usuario' => $ok[0]['porcentagem_usuario'],
					'logado' => true,
				);
				
				$this->session->addSessionArray('user',$user);
				$this->redirector('/');
			}
			
		}else{
			$this->session->setFlashMessage('Usuário ou senha inválido!','error');
			$this->Redirector('/login');
		}
		
	}
	
	
	public function logoutAction()
	{
		$this->session->destroySession();
		$this->redirector('/login');
	}
	
}
