<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class VendaPJ extends OXE_Model {
		
	protected $_name = 'tbl_vendaPJ';
	protected $_primary = 'id_vendaPJ';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_vendaPJ']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}
	
	public function listaProcessos(array $data)
	{
		$numerprocesso = $data['nm_processo_vendaPJ'] == null ? null:  " AND venda.nm_processo_vendaPJ = ".$data['nm_processo_vendaPJ'];
		$nomefantasia = $data['razaosocial_clientePJ'] == null ? null :  " AND cli.nomefantasia_clientePJ LIKE '".$data['razaosocial_clientePJ']."%'";
		$id_vendador = $data['id_usuario'] == '0' ? null : " AND user.id_usuario = ".$data['id_usuario'];
		$id_agencia = $data['id_agencia'] == null ? null : " AND venda.id_agencia = ".$data['id_agencia'];
		$id_agente = $data['id_agente'] == null ? null : " AND venda.id_agente = ".$data['id_agente'];
		$status = $data['status_vendaPJ'] == null ? null : " AND venda.status_vendaPJ = ".$data['status_vendaPJ'];
		
		$query = "SELECT venda.*, vcli.*, cli.razaosocial_clientePJ, age.id_agencia, age.razaosocial_agencia, user.nome_usuario  
		FROM $this->_name as venda
		
		LEFT JOIN venda_clientePJ as vcli
		ON venda.id_vendaPJ =  vcli.id_venda
		
		LEFT JOIN tbl_clientePJ as cli
		ON vcli.id_clientePJ = cli.id_clientePJ
		
		LEFT JOIN tbl_agencia as age
		ON venda.id_agencia = age.id_agencia
		
		LEFT JOIN tbl_usuario as user
		ON  venda.id_usuario = user.id_usuario
		
		WHERE 1
		AND venda.data_venda BETWEEN '".$data['dt_de']."' AND '".$data['dt_ate']."'".
		$numerprocesso.
		$nomefantasia.
		$id_vendador.
		$id_agencia.
		$id_vendador.
		$id_agente.
		$status;
		
		// echo $query;
		return $this->query($query);
	}


	public function lista_todosProcessos()
	{
		$query = "SELECT DISTINCT venda.*, vcli.*, cli.razaosocial_clientePJ, age.id_agencia, age.razaosocial_agencia, user.nome_usuario, venda.status_vendaPJ 
		FROM $this->_name as venda
		
		LEFT JOIN venda_clientePJ as vcli
		ON venda.id_vendaPJ =  vcli.id_venda
		
		LEFT JOIN tbl_clientePJ as cli
		ON vcli.id_clientePJ = cli.id_clientePJ
		
		LEFT JOIN tbl_agencia as age
		ON venda.id_agencia = age.id_agencia
		
		LEFT JOIN tbl_usuario as user
		ON  venda.id_usuario = user.id_usuario
		
		WHERE 1
		
		AND venda.data_venda BETWEEN '".date('Y-m-01')."' AND '".date('Y-m-d')."'";
		
		return $this->query($query);
	}
	
	public function getHotel($id_venda)
	{
		$query = "select  hotel.*

		from tbl_hotel_clientePJ as venda
		
		left join tbl_hotel_clientePJ as hotcli
		on hotcli.id_vendaPJ = venda.id_vendaPJ
		
		left join tbl_hotelPJ as hotel
		on hotcli.id_hotelPJ = hotel.id_hotelPJ
		
		where hotcli.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getCarros($id_venda)
	{
		$query = "select   carro.*

				from tbl_carro_clientePJ as carrocli
				
				left join tbl_carroPJ as carro
				on carrocli.id_carroPJ = carro.id_carroPJ
				
				where carrocli.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getSeguro($id_venda)
	{
		$query = "select seguro.*

				from tbl_asseguradoPJ as assegurado
				
				left join tbl_seguroPJ as seguro
				on assegurado.id_seguroPJ = seguro.id_seguroPJ
				
				where assegurado.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}	
	
	public function getTicket($id_venda)
	{
		$query = "select ticket.*

				from tbl_ticket_clientePJ as tickCli
				
				left join compraTicketPJ as ticket
				on tickCli.id_compraTicketPJ = ticket.id_compraTicketPJ
				
				where tickCli.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getCruzeiro($id_venda)
	{
		$query = "select cruzeiro.*

				from tbl_cruzeiro_clientePJ as cruzCli
				
				left join tbl_cruzeiroPJ as cruzeiro
				on cruzCli.id_cruzeiroPJ = cruzeiro.id_cruzeiroPJ
				
				where cruzCli.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getProdutos($id_venda)
	{
		$query = "select produto.*

				from tbl_outroProd_clientePJ as prodClie
				
				left join tbl_produtoOutrosPJ as produto
				on prodClie.id_produtoPJ = produto.id_produtoPJ
				
				where prodClie.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getPassagens($id_venda)
	{
		$query = "select passagem.*

				from tbl_passagens_clientePJ as passCli
				
				left join tbl_passagensPJ as passagem
				on passCli.id_passagensPJ = passagem.id_passagensPJ
				
				where passCli.id_vendaPJ = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getFuncionario($id_venda)
	{
		$query = "select venFunc.*

				from tbl_vendaPJ as venda
				
				left join tbl_venda_dependentePJ as venFunc
				on venda.id_vendaPJ = venFunc.id_vendaPJ
				
				where venFunc.id_vendaPJ = ".$id_venda;
		return $this->query($query);
	}
	
}