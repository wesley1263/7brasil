<?php
namespace Application\Models;

use Vendor\Core\OXE_Model;

class Venda extends OXE_Model {
		
	protected $_name = 'tbl_venda';
	protected $_primary = 'id_venda';
	
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
		return $this->update($data,$this->_primary.' = '.$data['id_venda']);
	}
	
	public function DescTables()
	{
		return $this->query("DESC $this->_name");
	}	
	
	public function getDependentes($id)
	{
		$query = "SELECT * FROM tbl_dependentePF WHERE id_clientePF = '$id'";
		return $this->query($query);
	}
	
	public function listaProcessos(array $data)
	{
		$numerprocesso = $data['nm_processo_venda'] == null ? null:  " AND venda.nm_processo_venda = ".$data['nm_processo_venda'];
		$nomefantasia = $data['nomefantasia_clientePJ'] == null ? null :  " AND cli.nomefantasia_clientePJ LIKE '".$data['nomefantasia_clientePJ']."%'";
		$id_vendador = $data['id_usuario'] == '0' ? null : " AND user.id_usuario = ".$data['id_usuario'];
		$id_agencia = $data['id_agencia'] == null ? null : " AND venda.id_agencia = ".$data['id_agencia'];
		$id_agente = null;
		if($data['id_agente'] == null){
			$id_agente = null;
		}else if($data['id_agente'] == '0'){
			$id_agente = null;
			
		}else{
			$id_agente = " AND venda.id_agente = ".$data['id_agente'];
		}
		$status = $data['status_venda'] == null ? null : " AND venda.status_venda = ".$data['status_venda'];
		$tipoCliente = $data['tipoCliente'] == '0' ? null : " AND cli.tipo_cliente = ".$data['tipoCliente'];
		
		$query = "SELECT venda.*, vcli.*, cli.tipo_cliente, cli.nome_clientePF, cli.nomefantasia_clientePJ, age.id_agencia, age.razaosocial_agencia, user.nome_usuario 

				FROM tbl_venda as venda 
				
				LEFT JOIN venda_clientePF as vcli 
				ON venda.id_venda = vcli.id_venda 
				
				LEFT JOIN tbl_clientePF as cli 
				ON vcli.id_clientePF = cli.id_clientePF
				
				LEFT JOIN tbl_agencia as age 
				ON venda.id_agencia = age.id_agencia 
				
				LEFT JOIN tbl_usuario as user 
				ON venda.id_usuario = user.id_usuario 
				
				WHERE 1
				
				AND venda.data_venda BETWEEN '".$data['dt_de']."' AND '".$data['dt_ate']."'".
				$numerprocesso.
				$nomefantasia.
				$id_vendador.
				$id_agencia.
				$id_vendador.
				$id_agente.
				$status.
				$tipoCliente;
				// echo $query;
		
		return $this->query($query);
	}


	public function lista_todosProcessos()
	{
		
		$query = "SELECT DISTINCT venda. * , vcli. * , cli.nome_clientePF, cli.nomefantasia_clientePJ, age.id_agencia, age.razaosocial_agencia, user.nome_usuario, venda.status_venda
				FROM tbl_venda AS venda
				
				LEFT JOIN venda_clientePF AS vcli 
				ON venda.id_venda = vcli.id_venda
				
				LEFT JOIN tbl_clientePF AS cli 
				ON vcli.id_clientePF = cli.id_clientePF
				
				LEFT JOIN tbl_agencia AS age 
				ON venda.id_agencia = age.id_agencia
				
				LEFT JOIN tbl_usuario AS user 
				ON venda.id_usuario = user.id_usuario
				
				WHERE 1 
				
				AND venda.data_venda
				
				BETWEEN  '".date('Y-m-01')."' AND  '".date('Y-m-d')."'";
				
		return $this->query($query);
	}
	
	public function getHotel($id_venda)
	{
		$query = "select  hotel.*, venda.id_venda

		from tbl_venda as venda
		
		left join tbl_hotel_clientePF as hotcli
		on hotcli.id_venda = venda.id_venda
		
		left join tbl_hotel as hotel
		on hotcli.id_hotel = hotel.id_hoteis
		
		where hotcli.id_venda = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getCarros($id_venda)
	{
		$query = "select   carro.*

				from tbl_carro_clientePF as carrocli
				
				left join tbl_carro as carro
				on carrocli.id_carros = carro.id_carros
				
				where carrocli.id_venda = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getSeguro($id_venda)
	{
		$query = "select seguro.*

				from tbl_asseguradoPF as assegurado
				
				left join tbl_seguro as seguro
				on assegurado.id_seguro = seguro.id_seguro
				
				where assegurado.id_venda = ".$id_venda;
		
		return $this->query($query);
	}	
	
	public function getTicket($id_venda)
	{
		$query = "select ticket.*

				from tbl_cliente_ticket as tickCli
				
				left join tbl_compraTicket as ticket
				on tickCli.id_compraTicket = ticket.id_compraTicket
				
				where tickCli.id_venda = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getCruzeiro($id_venda)
	{
		$query = "select cruzeiro.*

				from tbl_cruzeiro_clientePF as cruzCli
				
				left join tbl_cruzeiro as cruzeiro
				on cruzCli.id_cruzeiro = cruzeiro.id_cruzeiro
				
				where cruzCli.id_venda = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getProdutos($id_venda)
	{
		$query = "select produto.*

				from tbl_outroprod_clientePF as prodClie
				
				left join tbl_produtoOutros as produto
				on prodClie.id_produto = produto.id_produto
				
				where prodClie.id_venda = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getPassagens($id_venda)
	{
		$query = "select passagem.*

				from tbl_adicionaClientePF as passCli
				
				left join tbl_passagens as passagem
				on passCli.id_passagens = passagem.id_passagens
				
				where passCli.id_venda = ".$id_venda;
		
		return $this->query($query);
	}
	
	public function getFuncionario($id_venda)
	{
		$query = "select venFunc.*, cliente.*

				from tbl_venda as venda
				
				left join venda_dependentePF as venFunc
				on venda.id_venda = venFunc.id_venda
				
				left join venda_clientePF as venCli
				on venda.id_venda = venCli.id_venda
				
				left join tbl_clientePF as cliente
				on venCli.id_clientePF = cliente.id_clientePF
				
				where venFunc.id_venda = ".$id_venda;
		return $this->query($query);
	}
	
	public function listaClienteDep()
	{
		$query = "select distinct cli.id_clientePF ,cli.nome_clientePF,cli.nomefantasia_clientePJ, dep.id_dependentePF, dep.nome_dependente
					from tbl_clientePF as cli
					
					inner join tbl_dependentePF as dep
					on cli.id_clientePF = dep.id_clientePF";
		return $this->query($query);
	}
	
	
	public function listaClienteDepVenda($id_venda)
	{
		$query = "select cli.*, venDep.*
					from tbl_clientePF as cli
					
					inner join tbl_dependentePF as dep
					on cli.id_clientePF = dep.id_clientePF
					
					
					left join venda_clientePF as venCli
					on  cli.id_clientePF = venCli.id_clientePF
					
					left join venda_dependentePF as venDep
					on  venCli.id_venda = venDep.id_venda
					
					WHERE TRUE
					AND venCli.id_venda = $id_venda";
		return $this->query($query);
	}
	
	public function getNotaDebito()
	{
		$query = "SELECT * 
					FROM tbl_venda as venda
		
					left join venda_clientePF as venCli
					on  venda.id_venda = venCli.id_venda
					
					WHERE TRUE
					
					AND faturado_venda = 1
					AND data_venda BETWEEN '".date('Y-m-01')."' AND '".date('Y-m-t')."'";
		return $this->query($query);
	}
	
	public function getFilterNotaDebito(array $data)
	{
		$cliente = $data['id_agencia'] == null ? null : ' AND venda.id_agencia = '.$data['id_agencia'];
		$query = "SELECT * 
					FROM tbl_venda as venda
		
					left join venda_clientePF as venCli
					on  venda.id_venda = venCli.id_venda
					
					WHERE TRUE
					AND id_agencia IS NOT NULL
					AND faturado_venda = 1
					AND data_venda BETWEEN '".$data['dt_de']."' AND '".$data['dt_ate']."'".
					$cliente;
				  
		return $this->query($query);
	}
	
	public function getAgencia($id_agencia)
	{
		return $this->select()
					->from('tbl_agencia')
					->where("id_agencia = $id_agencia")
					->result();
	}
	
	public function getCliente($id_venda)
	{
		$query = "SELECT * 
					FROM tbl_venda as venda
		
					left join venda_clientePF as venCli
					on  venda.id_venda = venCli.id_venda
					
					left join tbl_clientePF as cliente
					on venCli.id_clientePF = cliente.id_clientePF
					
					WHERE venda.id_venda = $id_venda";
					
		return $this->query($query);
	}
}