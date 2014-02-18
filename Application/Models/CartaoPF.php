<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class CartaoPF extends OXE_Model {
		
	protected $_name = 'tbl_cartaoPF';
	protected $_primary = 'id_cartaoPF';
	
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
	
	public function del($id_cliente)
	{
		$query = "DELETE FROM $this->_name WHERE id_clientePF = $id_cliente";
		return $this->query($query);
	}
	
	public function alter(array $data)
	{
		return $this->update($data,$this->_primary.' = '.$data['id_cartaoPF']);
	}
	
	public function findCliente($id)
	{
		return $this->select()
					->from()
					->where("id_clientePF = '$id'")
					->result();
	}
	
	public function lista_um($id)
	{
		$query = "SELECT * FROM $this->_name WHERE id_clientePF = $id";
		return $this->query($query);
	}
	
	public function lista_cartoes($id)
	{
		$query = "select distinct tip.id_tipoCartao,tip.titulo_tipoCartao
				  from tbl_cartaoPF as cart
				
				  inner join tbl_clientePF as cli
				  ON cart.id_clientePF = cli.id_clientePF
				
				  inner join tbl_tipoCartao as tip
				  on cart.id_tipoCartao = tip.id_tipoCartao
				
				  WHERE cli.id_clientePF = $id";
				  
		return $this->query($query);
					
	}
	
	public function listCartCli($id)
	{
		return $this->select()
					->from()
					->where("id_clientePF = '$id'")
					->result();
	}
}