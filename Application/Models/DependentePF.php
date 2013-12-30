<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class DependentePF extends OXE_Model {
		
	protected $_name = 'tbl_dependentePF';
	protected $_primary = 'id_dependentePF';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		return $this->select(array('dep.*','cli.*'))
					->from($this->_name, 'dep')
					->join(array('tbl_clientePF' => 'cli'),'cli.id_clientePF = dep.id_clientePF')
					->result();
	}
	
	public function list_once($id)
	{
		$query= "SELECT dep.*,cli.* 
				FROM tbl_dependentePF AS dep 
				INNER JOIN tbl_clientePF AS cli 
				ON (cli.id_clientePF = dep.id_clientePF) 
				WHERE TRUE 
				AND (dep.id_dependentePF = '$id')";
				
		return $this->query($query);
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
		return $this->update($data,$this->_primary.' = '.$data['id_dependentePF']);
	}
	
	public function clientePF()
	{
		return $this->select()
					->from('tbl_clientePF')
					->result();
	}	
	
	
}