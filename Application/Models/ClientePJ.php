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
		return $this->select()
					->from()
					->where($this->_primary." = '$id'")
					->result();
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
		$id = $data['id_clientePJ'];
		return $this->update($data, $this->_primary." = '$id'");
	}
	
	public function findCNPJ($cnpj)
	{
		return $this->select('cnpj_clientePJ')
				      ->from($this->_name)
					  ->where("cnpj_clientePJ = '$cnpj'")
					  ->result();
					  
	}
	
	public function getTipoCartao()
	{
		return $this->select()
					->from('tbl_tipoCartao')
					->result();
	}
	
	public function getCNPJ($cnpj)
	{
		return $this->fetch("cnpj_clientePJ = '$cnpj'");
	}
	
	public function lista_um($id)
	{
		return $this->fetch($this->_primary." = '$id'");
	}
	
}
