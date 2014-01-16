<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Carro extends OXE_Model {
		
	protected $_name = 'tbl_carro';
	protected $_primary = 'id_carro';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_carro']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	public function getCambio()
	{
		return $this->select(array('moe.*','cam.*'))
					->from('tbl_moeda','moe')
					->join(array('tbl_cambio'=>'cam'),'cam.id_cambio = moe.id_cambio')
					->result();
	}
	
}