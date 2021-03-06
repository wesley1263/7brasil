<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Ticket extends OXE_Model {
		
	protected $_name = 'tbl_ticket';
	protected $_primary = 'id_ticket';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_ticket']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function findTicket($name)
	{
		return $this->select()
					->from()
					->where("nome_ticket = '$name'")
					->result();
	}	
	
}