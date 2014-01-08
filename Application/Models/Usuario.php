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
		return $this->fetchAll();
	}
	
	public function list_once($id)
	{
		return $this->select()
					 ->from($this->_name)
					 ->where($this->_primary.' = '.$id)
					 ->result();
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
}