<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Departamento extends OXE_Model {
		
	protected $_name = 'tbl_departamento';
	protected $_primary = 'id_departamento';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_departamento']);
	}
	
	public function selectAll()
	{
		return $this->select(array('dep.*','cli.*'))
					->from($this->_name,'dep')
					->join(array('tbl_clientePF'=>'cli'),'cli.id_clientePF = dep.id_clientePF')
					->result();
	}
	
	public function findDepart(array $data)
	{
		$nomeDep = $data['nome_departamento'];
		$id_empresa = $data['id_clientePF'];
		$codigo = $data['codigo_centrocusto'];
		
		$query = "SELECT * FROM $this->_name WHERE TRUE 
				 AND id_clientePF = $id_empresa
				 AND codigo_centrocusto = '$codigo'";
		
		return $this->query($query);	
					
	}
	
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	public function getDepartamento($id_clientePF)
	{
		return $this->select()
					->from()
					->where("id_clientePF = $id_clientePF")
					->result();
	}
	
}