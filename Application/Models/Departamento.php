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
		return $this->update($data,$this->_primary.' = '.$data['id_departamento']);
	}
	
	public function selectAll()
	{
		return $this->select(array('dep.*','cli.*'))
					->from($this->_name,'dep')
					->join(array('tbl_clientePJ'=>'cli'),'cli.id_clientePJ = dep.id_clientePJ')
					->result();
	}
	
	public function findDepart(array $data)
	{
		$nomeDep = $data['nome_departamento'];
		$id_empresa = $data['id_clientePJ'];
		$codigo = $data['codigo_centrocusto'];
		
		return $this->select()
					->from()
					->where("nome_departamento = '$nomeDep'")
					->where("id_clientePJ = '$id_empresa'")
					->where_or("codigo_centrocusto = '$codigo'")
					->result();	
	}
	
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
}