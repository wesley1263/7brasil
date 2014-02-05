<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class DependentePJ extends OXE_Model {
		
	protected $_name = 'tbl_dependentePJ';
	protected $_primary = 'id_dependentePJ';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		$query = "SELECT cli.*,fun.*
				  FROM tbl_dependentePJ as fun
				  JOIN tbl_clientePJ as cli
				  ON cli.id_clientePJ = fun.id_clientePJ";
		return $this->query($query);
	}
	
	public function list_once($id)
	{
		$query = "SELECT cli.*,fun.*
				  FROM tbl_dependentePJ as fun
				  JOIN tbl_clientePJ as cli
				  ON cli.id_clientePJ = fun.id_clientePJ
				  WHERE fun.id_dependentePJ = $id";
		return $this->query($query);
	}
	
	public function lista_um($id)
	{
		return $this->fetch($this->_primary." = $id");
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
		return $this->update($data,$this->_primary.' = '.$data['id_dependentePJ']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	public function clientePJ()
	{
		return $this->select()
					->from('tbl_clientePJ')
					->result();
	}
	
	public function findCPF($cpf)
	{
		return $this->select()
					->from()
					->where("cpf_dependentePJ = '$cpf'")
					->result();
	}
	
	public function getDependentePJ($id)
	{
		$query = "SELECT dep.id_dependentePJ, dep.nome_dependentePJ,dep.cpf_dependentePJ, dp.id_departamento, dp.nome_departamento
					FROM tbl_dependentePJ as dep

					LEFT JOIN tbl_departamento as dp
					ON dp.id_departamento = dep.id_departamento
					
					WHERE dep.id_clientePJ = $id";
		return $this->query($query);
					
	}
	
}