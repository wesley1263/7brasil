<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class ClienteTicket extends OXE_Model {
		
	protected $_name = 'tbl_cliente_ticket';
	protected $_primary = 'id_cliente_ticket';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_cliente_ticket']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
}