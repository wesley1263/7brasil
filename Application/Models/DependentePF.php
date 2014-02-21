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
		return $this->fetchAll();
	}
	
	public function list_once($id)
	{
		if(is_array($id)){
			$query = "SELECT dep.*,cli.* 
				FROM tbl_dependentePF AS dep 
				INNER JOIN tbl_clientePF AS cli 
				ON (cli.id_clientePF = dep.id_clientePF) 
				WHERE TRUE AND dep.id_dependentePF IN (".implode(',',$id).")";
		}else{
			$query= "SELECT dep.*,cli.* 
				FROM tbl_dependentePF AS dep 
				INNER JOIN tbl_clientePF AS cli 
				ON (cli.id_clientePF = dep.id_clientePF) 
				WHERE TRUE 
				AND dep.id_dependentePF = '$id'";
		}
		
				
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
	
	public function findCPF($cpf)
	{
		return $this->select()
					->from()
					->where("cpf_dependente = '$cpf'")
					->result();
	}
	
	public function lista_tudo()
	{
		return $this->select()
			        ->from('tbl_clientePF')
			        ->result();
	}
	
	public function getDependentePF($id)
	{
		$query = "SELECT dep.id_dependentePF, dep.nome_dependente,dep.cpf_dependente, dp.id_departamento, dp.nome_departamento
					FROM tbl_dependentePF as dep

					LEFT JOIN tbl_departamento as dp
					ON dp.id_departamento = dep.id_departamento
					
					WHERE dep.id_clientePF = $id";
		return $this->query($query);
					
	}
	
	
	
	public function lista_um($id)
	{
		return $this->fetch($this->_primary." = $id");
	}
	
	public function getListaPassageiro()
	{
		$query = "select dep.*,cli.* 

				from tbl_dependentePF as dep
				
				join tbl_clientePF as cli
				on dep.id_clientePF = cli.id_clientePF";
				
		return $this->query($query);
	}
	
	
	public function getPassageiro($id)
	{
		
		$query = "select dep.*,cli.* 

				from tbl_dependentePF as dep
				
				join tbl_clientePF as cli
				on dep.id_clientePF = cli.id_clientePF
				where dep.id_dependentePF = $id";
				
		return $this->query($query);
		
	}
	
	public function filterPassageiro(array $data)
	{
		$tipo_cliente = $data['tipo_cliente'] == '0' ? null : ' AND cli.tipo_cliente = '.$data['tipo_cliente'];
		$cpf_cnpj = $data['cpf_cnpj'] == null ? null : ' AND cli.cnpj_clientePJ = \''.$data['cpf_cnpj'].'\' OR cli.cpf_clientePF = \''.$data['cpf_cnpj']."'";
		$status = $data['status'] == null ? null : " AND status_cliente = ".$data['status'];
		
		$query = "select dep.*,cli.* 

				from tbl_dependentePF as dep
				
				join tbl_clientePF as cli
				on dep.id_clientePF = cli.id_clientePF
				where TRUE ".
				$tipo_cliente.
				$cpf_cnpj.
				$status;
		return $this->query($query);
		
	}
	
}