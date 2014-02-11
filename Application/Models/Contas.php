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
	
	public function lista_tudo(array $data,$ini, $limit)
	{
		$grupo = $data['id_grupo'] == '0' ? null :'AND id_grupo = '.$data['id_grupo'];
		$subgrupo = $data['id_subgrupo'] == '0' ? null :'AND id_subgrupo = '.$data['id_subgrupo'];
		$filial = $data['id_filial'] == '0' ? null :'AND id_filial = '.$data['id_filial'];
		$status = $data['status_contas'] == null ? null :'AND status_contas = '.$data['status_contas'];
		
		$query = "SELECT DISTINCT * 
					FROM $this->_name WHERE 1
					$grupo
					$subgrupo
					$filial
					AND validade_conta BETWEEN '".$data['de']."' AND '".$data['ate']."'
					$status
					LIMIT $ini,$limit";
		
		$this->query($query);
	}
	
}