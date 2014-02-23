<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Receber extends OXE_Model {
		
	protected $_name = 'tbl_receber';
	protected $_primary = 'id_receber';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_receber']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function listaReceberMes()
	{
		$query = "SELECT receber.*, venda.nm_processo_venda, forma.id_tipoCartao,forma.id_tipoPagamento,tipo.porcentagem_tipoPagamento,venda.id_usuario
					FROM tbl_receber as receber
					
					inner join tbl_venda as venda
					on receber.id_venda = venda.id_venda 
					
					left join tbl_formaPagamento as forma
					on receber.id_formaPagamento = forma.id_formaPagamento
					
					left join tbl_tipoPagamento as tipo
					on forma.id_tipoPagamento = tipo.id_tipoPagamento
					
					WHERE TRUE 
					 AND (data_receber BETWEEN '".date('Y-m-01')."' AND '".date('Y-m-t')."')";
		return $this->query($query);
	}
	
	public function listaReceberMesPago()
	{
		 $query = "SELECT receber.*, venda.nm_processo_venda, forma.id_tipoCartao,forma.id_tipoPagamento,tipo.porcentagem_tipoPagamento,venda.id_usuario
					FROM tbl_receber as receber
					
					inner join tbl_venda as venda
					on receber.id_venda = venda.id_venda 
					
					left join tbl_formaPagamento as forma
					on receber.id_formaPagamento = forma.id_formaPagamento
					
					left join tbl_tipoPagamento as tipo
					on forma.id_tipoPagamento = tipo.id_tipoPagamento
					
					WHERE TRUE 
					 AND (data_receber BETWEEN '".date('Y-m-01')."' AND '".date('Y-m-t')."') 
					 
					 AND status_receber = 1";
					 
			return $this->query($query);
	}
	
	
	public function filterReceberMesPago(array $data)
	{
		$filial = $data['id_filial'] == '0' ? null : ' AND receber.id_filial = '.$data['id_filial'];	
		
		 $query = "SELECT receber.*, venda.nm_processo_venda, forma.id_tipoCartao,forma.id_tipoPagamento,tipo.porcentagem_tipoPagamento,venda.id_usuario
					FROM tbl_receber as receber
					
					inner join tbl_venda as venda
					on receber.id_venda = venda.id_venda 
					
					left join tbl_formaPagamento as forma
					on receber.id_formaPagamento = forma.id_formaPagamento
					
					left join tbl_tipoPagamento as tipo
					on forma.id_tipoPagamento = tipo.id_tipoPagamento
					
					WHERE TRUE 
					 AND (data_receber BETWEEN '".$data['dt_de']."' AND '".$data['dt_ate']."') 
					 
					 AND status_receber = 1
					 $filial";
					 
			return $this->query($query);
	}
	
	
	public function filterReceber(array $data)
	{
		$processo = $data['nm_processo'] == null ? null : ' AND venda.nm_processo_venda = '.$data['nm_processo'];
		$tipoCartao = $data['id_tipoCartao'] == null? null : ' AND forma.id_tipoCartao = '.$data['id_tipoCartao'];
		$tipoPagamento = $data['id_tipoPagamento'] == null ? null : ' AND forma.id_tipoPagamento = '.$data['id_tipoPagamento'];
		$filial = $data['id_filial'] == null ? null : ' AND receber.id_filial = '.$data['id_filial'];
		$status = $data['status_receber'] == '0' ? null : ' AND receber.status_receber = '.$data['status_receber'];
		
		$query = "SELECT receber.*, venda.nm_processo_venda, forma.id_tipoCartao,tipo.porcentagem_tipoPagamento,forma.id_tipoPagamento
					FROM tbl_receber as receber
					
					inner join tbl_venda as venda
					on receber.id_venda = venda.id_venda 
					
					left join tbl_formaPagamento as forma
					on receber.id_formaPagamento = forma.id_formaPagamento
					
					left join tbl_tipoPagamento as tipo
					on forma.id_tipoPagamento = tipo.id_tipoPagamento
					
					WHERE TRUE 
					 AND (data_receber BETWEEN '".$data['dt_de']."' AND '".$data['dt_ate']."') ".
					 $processo.
					 $tipoCartao.
					 $tipoPagamento.
					 $filial.
					 $status;
					 
		 return $this->query($query);
	}	
	
}