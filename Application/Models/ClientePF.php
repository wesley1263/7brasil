<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class ClientePF extends OXE_Model {
	
	protected $_name = 'tbl_clientePF';
	protected $_primary = 'id_clientePF';
	
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
	
	public function insert_cli(array $data)
	{
		return $this->insert($data);
	}
	
	public function delete_cli($id)
	{
		return $this->delete($id);
	}
	
	public function update_cli(array $data)
	{
		return $this->update($data, $this->_primary.' = '.$data['id_clientePF']);
	}
	
	public function findClientePF($cpf)
	{
		$query = $this->select('cpf_clientePF')
					  ->from($this->_name)
					  ->where("cpf_clientePF = '$cpf'")
					  ->result();
					  
					  return $query;
	}
	
	public function showTable()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function max()
	{
		return $this->query("SELECT MAX(id_clientePF) AS id_clientePF FROM $this->_name");
	}
}
