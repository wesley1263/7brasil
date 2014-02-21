<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class VendaClientePF extends OXE_Model {
		
	protected $_name = 'venda_clientePF';
	protected $_primary = 'id_venda';
	
	public function __construct()
	{
		parent::__construct();
	}
	
	public function list_all()
	{
		return $this->fetchAll();
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
		return $this->update($data,$this->_primary.' = '.$data['id_venda']);
	}
	
	public function list_vendaCliente($id_venda)
	{
		$query = "select cliVen.*, cli.nome_clientePF, cli.nomefantasia_clientePJ, cli.tipo_cliente 

				from venda_clientePF as cliVen
				
				inner join tbl_clientePF as cli
				on cliVen.id_clientePF = cli.id_clientePF
				
				where true
				
				and cliVen.id_venda = $id_venda";
				
				return $this->query($query);
	}
	
	
}