<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Seguro extends OXE_Model {
		
	protected $_name = 'tbl_seguro';
	protected $_primary = 'id_seguro';
	
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
		$query = "SELECT * FROM $this->_name WHERE $this->_primary = $id";
		return $this->query($query);
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
		return $this->update($data,$this->_primary.' = '.$data['id_seguro']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
}