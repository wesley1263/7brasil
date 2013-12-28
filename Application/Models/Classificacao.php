<?php
namespace Application\Models;
use Vendor\Core\OXE_Model;

class Classificacao extends OXE_Model {
	
	protected $_name = 'tbl_classificacao';
	protected $_primary = 'id_classificacao';
	
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
					->where($this->_primary." = '$id'")
					->result();
	}
	
	public function add_classificacao(array $data)
	{
		return $this->insert($data);
	}
	
	public function delete_classificacao($id)
	{
		return $this->delete($id);
	}
	
	public function update_classificacao(array $data)
	{
		return $this->update($data,$this->_primary." = ".$data['id_classificacao']);
	}
}
