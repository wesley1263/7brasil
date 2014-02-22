<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class FormaPagamento extends OXE_Model {
		
	protected $_name = 'tbl_formaPagamento';
	protected $_primary = 'id_formaPagamento';
	
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
		return $this->fetch($this->_primary.' = '.$id);
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
		return $this->update($data,$this->_primary.' = '.$data['id_formaPagamento']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function getFormasAtual($id_venda)
	{
		$query = "select * 
				from tbl_formaPagamento as forma
				
				left join tbl_tipoPagamento as tipo
				on forma.id_tipoPagamento = tipo.id_tipoPagamento
				
				where forma.id_venda = $id_venda";
		return $this->query($query);
	}
	
}