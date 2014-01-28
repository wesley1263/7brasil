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
		$query = "SELECT * FROM $this->_name WHERE $this->_primary = '$id'";
		return $this->query($query);
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
		return  $this->select('cpf_clientePF')
					  ->from($this->_name)
					  ->where("cpf_clientePF = '$cpf'")
					  ->result();
	}
	
	public function findClienteCPF($cpf)
	{
		return  $this->select()
					  ->from($this->_name)
					  ->where("cpf_clientePF = '$cpf'")
					  ->result();
					  
					 
	}
	
	public function showTable()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function max()
	{
		return $this->query("SELECT MAX(id_clientePF) AS id_clientePF FROM $this->_name");
	}
	
	public function lista_one($id)
	{
		return $this->fetch($this->_primary.' = '.$id);
	}
}
