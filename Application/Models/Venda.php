<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Venda extends OXE_Model {
		
	protected $_name = 'tbl_venda';
	protected $_primary = 'id_venda';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_venda']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	public function getDependentes($id)
	{
		return $this->select()
					->from('tbl_dependentePF')
					->where("id_clientePF = '$id'")
					->result();
	}
}