<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class CompaniaCruzeiro extends OXE_Model {
		
	protected $_name = 'tbl_compania_cruzeiro';
	protected $_primary = 'id_compania_cruzeiro';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_compania_cruzeiro']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	
	public function findCompania($name)
	{
		return $this->select()
					->from()
					->where("nome_compania_cruzeiro = '$name'")
					->result();
	}
	
}