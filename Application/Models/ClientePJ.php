<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class ClientePJ extends OXE_Model {
	
	protected $_name = 'tbl_clientePJ';
	protected $_primary = 'id_clientePJ';
	
	public function __construtc()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		return $this->fetchAll();
	}
	
	public function list_once($id)
	{
		return $this->fetch($this->_primary." = '$id'");
	}
	
	public function delete_cli($id)
	{
		return $this->delete($id);
	}
	
	public function insert_cli(array $data)
	{
		return $this->insert($data);
	}
	
	public function update_cli(array $data)
	{
		return $this->update($data, $data['id_clientePF']." = ");
	}
	
	public function findCNPJ($cnpj)
	{
		$query = $this->select('cnpj_clientePJ')
				      ->from($this->_name)
					  ->where("cnpj_clientePJ = '$cnpj'")
					  ->result();
					  
		return $query;
	}
	
}
