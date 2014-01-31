<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Usuario extends OXE_Model {
		
	protected $_name = 'tbl_usuario';
	protected $_primary = 'id_usuario';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		$query = "SELECT grup.*,user.* FROM tbl_usuario AS user INNER JOIN tbl_grupo AS grup ON (user.id_grupo = grup.id_grupo) WHERE TRUE";
		return $this->query($query);
	}
	
	
	public function list_once($id)
	{
		return $this->fetch($this->_primary.' = '.$id);
	}
	
	public function add(array $data)
	{
		return $this->insert($data);
	}
	
	public function remove($id)
	{
		return $this->delete($id);
	}
	
	public function alter(array $data)
	{
		return $this->update($data,$this->_primary.' = '.$data['id_usuario']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	
	public function getGrupo()
	{
		return $this->select()
					->from('tbl_grupo')
					->result();
	}
	
	public function getEmpresa()
	{
		return $this->select('id_empresa')
					->from('tbl_empresa')
					->result();
	}
	
	public function findUsuario($name)
	{
		return $this->select()
					->from()
					->where("nome_usuario = '$name'")
					->result();
	}
	
	public function validaUser(array $data)
	{
		$user = $data['usuario_login'];
		$pass = md5($data['senha_login']);
		$query = "SELECT * FROM $this->_name WHERE login_usuario = '$user' AND senha_usuario = '$pass'";
		
		return $this->query($query);
	}
}