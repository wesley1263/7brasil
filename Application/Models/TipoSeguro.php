<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class TipoSeguro extends OXE_Model {
		
	protected $_name = 'tbl_tipoSeguro';
	protected $_primary = 'id_tipoSeguro';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		return $this->select(array('seg.*','tipo.*'))
					->from($this->_name,'tipo')
					->join(array('tbl_seguradora'=>'seg'),'seg.id_seguradora = tipo.id_seguradora')
					->result();
	}
	
	public function list_once($id)
	{
		return $this->select()
					 ->from($this->_name)
					 ->where($this->_primary.' = '.$id)
					 ->result();
	}
	
	public function getSeguradora()
	{
		return $this->select()
					->from('tbl_seguradora')
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
		return $this->update($data,$this->_primary.' = '.$data['id_tipoSeguro']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function findTipoSeguro($name)
	{
		return $this->select()
					->from()
					->where("nome_tipoSeguro = '$name'")
					->result();
					
	}	
	
}