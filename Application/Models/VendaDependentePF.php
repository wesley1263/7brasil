<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class VendaDependentePF extends OXE_Model {
		
	protected $_name = 'venda_dependentePF';
	protected $_primary = 'id_venda';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		return $this->fetchAll();
	}
	
	
	public function add(array $data)
	{
		return $this->insert($data);
	}
	
	
	public function alter(array $data)
	{
		return $this->update($data,$this->_primary.' = '.$data['id_venda']);
	}
	
	
	public function getFunc($id_venda)
	{
		return $this->select()
					->from()
					->where("id_venda = $id_venda")
					->result();
	}
	
}