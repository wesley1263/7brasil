<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Contas extends OXE_Model {
		
	protected $_name = 'tbl_contas';
	protected $_primary = 'id_contas';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_contas']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	
	public function findContas($data)
	{
		$query = "SELECT * FROM `tbl_contas` WHERE 1
					AND id_grupo = ".$data['id_grupo']."
					AND id_subgrupo = ".$data['id_subgrupo']."
					AND id_filial = ".$data['id_filial']."
					AND valor_contas = ".$data['valor_contas']."
					AND validade_conta = '".$data['validade_conta']."'
					AND status_contas = ".$data['status_contas'];
		
		return $this->query($query);
	}
	
	public function lista_tudo(array $data)
	{
		$grupo = $data['id_grupo'] == '0' ? null :'AND id_grupo = '.$data['id_grupo'];
		$subgrupo = $data['id_subgrupo'] == '0' ? null :'AND id_subgrupo = '.$data['id_subgrupo'];
		$filial = $data['id_filial'] == '0' ? null :'AND id_filial = '.$data['id_filial'];
		$status = $data['status_contas'] == '0' ? null :'AND status_contas = '.$data['status_contas'];
		
		  $query = "SELECT DISTINCT * 
					FROM $this->_name WHERE 1
					$grupo
					$subgrupo
					$filial
					AND validade_conta BETWEEN '".$data['de']."' AND '".$data['ate']."'
					$status";
					
		
		
		// echo $query;
		return $this->query($query);
	}
	
	public function listaContasMesPaga()
	{
		return $this->select()
					->from()
					->where("validade_conta BETWEEN '".date('Y-m-01')."' AND '".date('Y-m-t')."'")
					->where("status_contas = 1")
					->result();
	}
	
	public function filterContasMesPaga(array $data)
	{
		$filial = $data['id_filial'] == '0' ? null : ' AND id_filial = '.$data['id_filial'];
		$query = "SELECT * FROM $this->_name
				 WHERE TRUE
				 AND validade_conta BETWEEN '".$data['dt_de']."' AND '".$data['dt_ate']."'
				 AND status_contas = 1 
				 $filial";
				
		return $this->query($query);
	}
	
}