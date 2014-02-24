-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 24-Fev-2014 às 01:01
-- Versão do servidor: 5.5.34-0ubuntu0.13.04.1
-- versão do PHP: 5.4.9-4ubuntu2.4

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de Dados: `db_7brasil`
--

-- --------------------------------------------------------

--
-- Estrutura da tabela `compraTicketPJ`
--

CREATE TABLE IF NOT EXISTS `compraTicketPJ` (
  `id_compraTicketPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `valor_compraTicketPj` decimal(9,2) DEFAULT NULL,
  `comissao_compraTicketPJ` decimal(9,2) DEFAULT NULL,
  `voucher_compraTicketPJ` varchar(199) DEFAULT NULL,
  `fornecedor_compraTicketPJ` varchar(99) DEFAULT NULL,
  `valor_cambio_compraTicketPJ` decimal(9,2) DEFAULT NULL,
  `descricao_compraTicketPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_compraTicketPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `compraTicketPJ`
--

INSERT INTO `compraTicketPJ` (`id_compraTicketPJ`, `id_ticket`, `id_clientePJ`, `id_moeda`, `valor_compraTicketPj`, `comissao_compraTicketPJ`, `voucher_compraTicketPJ`, `fornecedor_compraTicketPJ`, `valor_cambio_compraTicketPJ`, `descricao_compraTicketPJ`) VALUES
(12, 1, 6, 1, 1200.00, 600.00, '/var/www/7brasil/skin/img/uploaded/8e5bfc8063b0ff9a521088267c0fad02.pdf', 'Danna White', 2.17, 'descrição teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_adcionarDependentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_adcionarDependentePF` (
  `id_adcionarDependentePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_dependentePF` int(11) DEFAULT NULL,
  `id_passagens` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_adcionarDependentePF`),
  KEY `fk_tbl_adcionarDependentePF_tbl_dependentePF1` (`id_dependentePF`),
  KEY `fk_tbl_adcionarDependentePF_tbl_participacao1` (`id_passagens`),
  KEY `fk_tbl_adcionarDependentePF_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para adicionar dependente do cliente na venda' AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_adcionarDependentePF`
--

INSERT INTO `tbl_adcionarDependentePF` (`id_adcionarDependentePF`, `id_dependentePF`, `id_passagens`, `id_venda`) VALUES
(3, 4, 2, 67),
(4, 2, 2, 67);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_adicionaClientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_adicionaClientePF` (
  `id_adicionaClientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_passagens` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_adicionaClientePF`),
  KEY `fk_tbl_adicionaClientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_adicionaClientePF_tbl_passagens1` (`id_passagens`),
  KEY `fk_tbl_adicionaClientePF_tbl_participacao1` (`id_participacao`),
  KEY `fk_tbl_adicionaClientePF_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela usada para adicionar cliente pessoa fisica nas passag' AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `tbl_adicionaClientePF`
--

INSERT INTO `tbl_adicionaClientePF` (`id_adicionaClientePF`, `id_clientePF`, `id_passagens`, `id_participacao`, `id_venda`) VALUES
(1, 29, 6, 2, 89),
(2, 29, 7, 2, 89),
(3, 29, 8, 2, 91),
(4, 29, 9, 2, 91),
(5, 29, 10, 2, 95),
(6, 29, 11, 2, 95),
(7, 29, 12, 2, 126);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_adicionar_cliente`
--

CREATE TABLE IF NOT EXISTS `tbl_adicionar_cliente` (
  `id_adicionar` int(11) NOT NULL AUTO_INCREMENT,
  `id_dependentePJ` int(11) NOT NULL,
  `id_passagens` int(11) NOT NULL,
  PRIMARY KEY (`id_adicionar`),
  KEY `fk_tbl_adicionar_cliente_tbl_dependentePJ1` (`id_dependentePJ`),
  KEY `fk_tbl_adicionar_cliente_tbl_passagens1` (`id_passagens`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela usada para adicionar cliente cadastrado na reserva de' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_agencia`
--

CREATE TABLE IF NOT EXISTS `tbl_agencia` (
  `id_agencia` int(11) NOT NULL AUTO_INCREMENT,
  `razaosocial_agencia` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomefantasia_agencia` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `cnpj_agencia` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `endereco_agencia` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_agencia` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento_agencia` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `bairro_agencia` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_agencia` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf_agencia` varchar(10) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep_agencia` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `site_agencia` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_agencia` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_agencia` varchar(15) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `logotipo_agencia` varchar(99) NOT NULL,
  `descricao_agencia` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `comissao_agencia` decimal(9,2) NOT NULL,
  `status_agencia` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_agencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_agencia`
--

INSERT INTO `tbl_agencia` (`id_agencia`, `razaosocial_agencia`, `nomefantasia_agencia`, `cnpj_agencia`, `endereco_agencia`, `numero_agencia`, `complemento_agencia`, `bairro_agencia`, `cidade_agencia`, `uf_agencia`, `cep_agencia`, `site_agencia`, `email_agencia`, `telefone_agencia`, `logotipo_agencia`, `descricao_agencia`, `comissao_agencia`, `status_agencia`) VALUES
(1, 'MILESSIS TURISMO', 'MILESSIS TURISMO', '00.000.000/0000-00', 'Avenida Rio Branco', '156', '1º  andar', 'Centro', 'Rio de Janeiro', 'RJ', '20040-003', 'http://www.milessisturismo.com.br/', 'contato@milessisturismo.com.br', '(11) 5555-5555', '/var/www/7brasil/skin/img/uploaded/5524ad8a411afb73a4f39298ee3a03fd.png', 'descrição teste 2', 0.00, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_agentes`
--

CREATE TABLE IF NOT EXISTS `tbl_agentes` (
  `id_agente` int(11) NOT NULL AUTO_INCREMENT,
  `id_agencia` int(11) NOT NULL,
  `nome_agente` varchar(99) NOT NULL,
  `email_agente` varchar(99) DEFAULT NULL,
  `celular_agente` varchar(15) DEFAULT NULL,
  `descricao_agente` text,
  `status_agente` tinyint(1) DEFAULT '1',
  `porcentagem_agente` double(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_agente`),
  KEY `fk_agente_agencia` (`id_agencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_agentes`
--

INSERT INTO `tbl_agentes` (`id_agente`, `id_agencia`, `nome_agente`, `email_agente`, `celular_agente`, `descricao_agente`, `status_agente`, `porcentagem_agente`) VALUES
(1, 1, 'NELSON DA CAPITINGA', 'nelson@tes.com.br', '(11) 9999-9999', 'adASDADASDAdsafsdfsdfsfsdfsdf', 1, NULL),
(2, 1, 'JOAO PE DE FEIJAO', 'joao@teste.com.br', '(11) 7777-7777', 'descrição teste', 1, 10.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_asseguradoPF`
--

CREATE TABLE IF NOT EXISTS `tbl_asseguradoPF` (
  `id_seguro` int(11) DEFAULT NULL,
  `id_assegurado` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_participacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_assegurado`),
  KEY `fk_tbl_seguro_has_tbl_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_seguro_has_tbl_clientePF_tbl_seguro1` (`id_seguro`),
  KEY `fk_tbl_asseguradoPF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_asseguradoPF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_asseguradoPF`
--

INSERT INTO `tbl_asseguradoPF` (`id_seguro`, `id_assegurado`, `id_clientePF`, `id_venda`, `id_participacao`) VALUES
(15, 1, 29, 83, 2),
(16, 2, 29, 85, 2),
(17, 3, 29, 95, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_asseguradoPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_asseguradoPJ` (
  `id_asseguradoPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_seguroPJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_asseguradoPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=8 ;

--
-- Extraindo dados da tabela `tbl_asseguradoPJ`
--

INSERT INTO `tbl_asseguradoPJ` (`id_asseguradoPJ`, `id_seguroPJ`, `id_vendaPJ`, `id_clientePJ`) VALUES
(7, 11, 34, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_brokers`
--

CREATE TABLE IF NOT EXISTS `tbl_brokers` (
  `id_brokers` int(11) NOT NULL AUTO_INCREMENT,
  `nome_brokers` varchar(99) NOT NULL,
  `site_brokers` varchar(99) NOT NULL,
  `telefone_brokers` varchar(20) DEFAULT NULL,
  `logotipo_brokers` varchar(99) DEFAULT NULL,
  `descricao_brokers` text,
  `status_brokers` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_brokers`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_brokers`
--

INSERT INTO `tbl_brokers` (`id_brokers`, `nome_brokers`, `site_brokers`, `telefone_brokers`, `logotipo_brokers`, `descricao_brokers`, `status_brokers`) VALUES
(1, 'BEST 7 BOOKING', 'http://www.best7booking.com', '(11) 5555-5555', '/var/www/7brasil/skin/img/uploaded/8a45a3602f23841b0027edb818778b5d.gif', 'descrição teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_brokers_hotel`
--

CREATE TABLE IF NOT EXISTS `tbl_brokers_hotel` (
  `id_brokers` int(11) NOT NULL,
  `id_hoteis` int(11) NOT NULL,
  PRIMARY KEY (`id_brokers`,`id_hoteis`),
  KEY `fk_tbl_brokers_has_tbl_hotel_tbl_hotel1` (`id_hoteis`),
  KEY `fk_tbl_brokers_has_tbl_hotel_tbl_brokers1` (`id_brokers`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cambio`
--

CREATE TABLE IF NOT EXISTS `tbl_cambio` (
  `id_cambio` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_cambio` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_cambio` text COLLATE utf8_unicode_ci,
  `status_cambio` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_cambio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela com nomes das moedas internacional' AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_cambio`
--

INSERT INTO `tbl_cambio` (`id_cambio`, `titulo_cambio`, `descricao_cambio`, `status_cambio`) VALUES
(1, 'DOLLAR USA', 'Dolar americano dos estado unidos', 1),
(2, 'EURO', 'hfghfhgffghfhgf', 1),
(3, 'LIBRA', 'bla bla bla', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_carro`
--

CREATE TABLE IF NOT EXISTS `tbl_carro` (
  `id_carros` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) DEFAULT NULL,
  `id_locadora` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `dt_inicio_carro` date NOT NULL,
  `dt_devolucao_carro` date NOT NULL,
  `local_inicio_carro` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `local_devolucao_carro` varchar(99) NOT NULL,
  `voucher_carro` varchar(199) NOT NULL,
  `descricao_carro` text,
  `valor_carro` decimal(9,2) NOT NULL COMMENT 'Valor cobrado pela empresa \npara alugar o carro.\n',
  `valor_casa_carro` decimal(9,2) NOT NULL COMMENT 'valor do lucro\nda 7Brasil',
  `taxa_carro` decimal(9,2) DEFAULT NULL COMMENT 'Taxa extra cobrado pela \nempresa para alguma \neventualidade.',
  `valor_cambio_carro` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_carros`),
  KEY `fk_carros_locadora` (`id_locadora`),
  KEY `fk_tbl_carro_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='tabela da locação do carro' AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tbl_carro`
--

INSERT INTO `tbl_carro` (`id_carros`, `id_clientePF`, `id_locadora`, `id_moeda`, `dt_inicio_carro`, `dt_devolucao_carro`, `local_inicio_carro`, `local_devolucao_carro`, `voucher_carro`, `descricao_carro`, `valor_carro`, `valor_casa_carro`, `taxa_carro`, `valor_cambio_carro`) VALUES
(2, 29, 4, 0, '2014-02-18', '2014-02-19', 'São Paulo - SP', 'São Paulo', '/var/www/7brasil/skin/img/uploaded/9544fd0a71ba5776b035f06562c8668b.pdf', 'descrição teste', 600.00, 120.00, 35.00, NULL),
(3, 29, 4, 1, '2014-02-18', '2014-02-22', 'São Paulo - SP', 'São Paulo - SP', '/var/www/7brasil/skin/img/uploaded/bc237f0d606aeeeb3a00271aaf8a41d4.pdf', 'descrição teste.', 600.00, 120.00, 32.00, 2.17),
(4, 29, 4, 1, '2014-02-18', '2014-02-22', 'São Paulo - SP', 'São Paulo - SP', '/var/www/7brasil/skin/img/uploaded/a80069110d1593a4ccaf6bc942d7f9c4.pdf', 'teste', 650.00, 120.00, 12.00, 2.17),
(5, 29, 5, 1, '2014-02-21', '2014-02-23', 'MIAMI - MI', 'MIAMI - MI', '/var/www/7brasil/skin/img/uploaded/8a500537a8b4ab41c63923a4dd08ebc0.pdf', 'descrição de carro', 700.00, 250.00, 12.00, 2.17),
(6, 29, 4, 1, '2014-02-24', '2014-02-28', 'São Paulo - SP', 'São Paulo - SP', '/var/www/7brasil/skin/img/uploaded/510767d3a86d1bd1a264a3cabbe49d02.gif', 'teste', 800.00, 200.00, 1.20, 2.10);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_carroPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_carroPJ` (
  `id_carroPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_locadora` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `dt_inicio_carroPJ` datetime DEFAULT NULL,
  `dt_devolucao_carroPJ` datetime DEFAULT NULL,
  `local_inicio_carroPJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `local_devolucao_carroPJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `voucher_carroPJ` varchar(199) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_carroPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `valor_carroPJ` decimal(9,2) DEFAULT NULL,
  `valor_casa_carroPJ` decimal(9,2) DEFAULT NULL,
  `taxa_carroPJ` decimal(9,2) DEFAULT NULL,
  `valor_cambio` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_carroPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_carroPJ`
--

INSERT INTO `tbl_carroPJ` (`id_carroPJ`, `id_clientePJ`, `id_locadora`, `id_moeda`, `dt_inicio_carroPJ`, `dt_devolucao_carroPJ`, `local_inicio_carroPJ`, `local_devolucao_carroPJ`, `voucher_carroPJ`, `descricao_carroPJ`, `valor_carroPJ`, `valor_casa_carroPJ`, `taxa_carroPJ`, `valor_cambio`) VALUES
(3, 6, 4, 1, '2014-02-15 00:00:00', '2014-02-19 00:00:00', 'NEW YORK - KEMTACK', 'NEW YORK - KEMTACK', '/var/www/7brasil/skin/img/uploaded/bc56fae0b0226a8e11793f6687198da1.pdf', 'descrição de carro', 600.00, 200.00, 12.00, 2.17),
(4, 6, 4, 1, '2014-02-16 00:00:00', '2014-02-19 00:00:00', 'SAO PAULO - SP', 'SAO PAULO -SP', '/var/www/7brasil/skin/img/uploaded/9b360cc77d409a5f2852b230b9d8beee.pdf', 'desvrsrgsfgsdfg', 350.00, 101.00, 12.00, 2.17),
(5, 6, 4, 0, '2014-02-17 00:00:00', '2014-02-12 00:00:00', 'SAO PAULO - SP', 'SAO PAULO -SP', '/var/www/7brasil/skin/img/uploaded/3ea9989c879732c98afbe1dfd0136692.png', 'teste', 380.00, 100.00, 32.00, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_carro_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_carro_clientePF` (
  `id_carro_clientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_carros` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  PRIMARY KEY (`id_carro_clientePF`),
  KEY `fk_tbl_carro_clientePF_tbl_carro1` (`id_carros`),
  KEY `fk_tbl_carro_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_carro_clientePF_tbl_clientePF1` (`id_clientePF`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de reserva de carro para pessoa fisica' AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_carro_clientePF`
--

INSERT INTO `tbl_carro_clientePF` (`id_carro_clientePF`, `id_carros`, `id_venda`, `id_clientePF`) VALUES
(1, 3, 73, 29),
(2, 4, 79, 29),
(3, 5, 95, 29),
(4, 6, 124, 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_carro_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_carro_clientePJ` (
  `id_carro_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_carroPJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_carro_clientePJ`),
  KEY `fk_tbl_carro_clientePJ_tbl_carro1` (`id_carroPJ`),
  KEY `fk_tbl_carro_clientePJ_tbl_venda1` (`id_vendaPJ`),
  KEY `fk_tbl_carro_clientePJ_tbl_clientePJ1` (`id_clientePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tbl_carro_clientePJ`
--

INSERT INTO `tbl_carro_clientePJ` (`id_carro_clientePJ`, `id_carroPJ`, `id_vendaPJ`, `id_clientePJ`) VALUES
(4, 3, 34, 6),
(5, 4, 39, 6),
(6, 5, 40, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cartaoPF`
--

CREATE TABLE IF NOT EXISTS `tbl_cartaoPF` (
  `id_cartaoPF` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cartaoPF` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `dt_validade_cartaoPF` date NOT NULL,
  `codigo_seguranca_cartaoPF` varchar(10) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_tipoCartao` int(11) NOT NULL,
  PRIMARY KEY (`id_cartaoPF`),
  KEY `id_clientePF` (`id_clientePF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=22 ;

--
-- Extraindo dados da tabela `tbl_cartaoPF`
--

INSERT INTO `tbl_cartaoPF` (`id_cartaoPF`, `numero_cartaoPF`, `dt_validade_cartaoPF`, `codigo_seguranca_cartaoPF`, `id_clientePF`, `id_tipoCartao`) VALUES
(9, '12345678910', '2017-10-15', '304', 25, 1),
(15, '11111111111', '2017-10-31', '605', 26, 2),
(16, '12345678910', '2014-10-31', '777', 6, 1),
(17, '2323232323', '2014-10-20', '305', 6, 2),
(18, '9876543212', '2019-10-25', '605', 27, 3),
(19, '12345678910', '2020-12-20', '777', 29, 3),
(20, '9999999999', '2021-11-20', '305', 29, 1),
(21, '', '0000-00-00', '', 30, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cartaoPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_cartaoPJ` (
  `id_cartaoPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) NOT NULL,
  `numero_cartaoPJ` varchar(20) NOT NULL,
  `id_tipoCartao` int(11) DEFAULT NULL,
  `dt_validade_cartaoPJ` date NOT NULL,
  `codigo_seguranca_cartaoPJ` int(10) NOT NULL,
  PRIMARY KEY (`id_cartaoPJ`),
  KEY `fk_cartao_clientePJ` (`id_clientePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `tbl_cartaoPJ`
--

INSERT INTO `tbl_cartaoPJ` (`id_cartaoPJ`, `id_clientePJ`, `numero_cartaoPJ`, `id_tipoCartao`, `dt_validade_cartaoPJ`, `codigo_seguranca_cartaoPJ`) VALUES
(1, 6, '987654321', 1, '2016-10-12', 308),
(8, 6, '12456789', 2, '2017-12-11', 555),
(9, 28, '987654321', 3, '2017-11-20', 308);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_classe_voo`
--

CREATE TABLE IF NOT EXISTS `tbl_classe_voo` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_classe` varchar(45) NOT NULL,
  `descricao_classe` text,
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='classes de passagens aérea' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_classe_voo`
--

INSERT INTO `tbl_classe_voo` (`id_classe`, `titulo_classe`, `descricao_classe`) VALUES
(1, 'CLASSE ECONOMICA', 'descrição teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_classificacao`
--

CREATE TABLE IF NOT EXISTS `tbl_classificacao` (
  `id_classificacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_classificacao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status_classificacao` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_classificacao`
--

INSERT INTO `tbl_classificacao` (`id_classificacao`, `titulo_classificacao`, `status_classificacao`) VALUES
(1, 'SR', 1),
(2, 'SRA', 1),
(3, 'MISS', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_clientePF` (
  `id_clientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_classificacao` int(11) NOT NULL,
  `tipo_cliente` tinyint(1) NOT NULL COMMENT 'Tipo de cliente: 1 - PF; 2 - PJ',
  `nome_clientePF` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `razaosocial_ClientePJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomefantasia_clientePJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `dataNascimento_clientePF` date DEFAULT NULL,
  `rg_clientePF` varchar(20) DEFAULT NULL,
  `cpf_clientePF` varchar(20) DEFAULT NULL,
  `cnpj_clientePJ` varchar(25) DEFAULT NULL,
  `logotipo_clientePJ` varchar(199) DEFAULT NULL,
  `cep_cliente` varchar(15) DEFAULT NULL,
  `endereco_cliente` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_cliente` varchar(10) DEFAULT NULL,
  `bairro_cliente` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_cliente` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento_cliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf_cliente` varchar(15) DEFAULT NULL,
  `pais_cliente` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_cliente` varchar(150) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_clientePF` varchar(15) DEFAULT NULL,
  `celular_clientePF` varchar(15) DEFAULT NULL,
  `telefone1_clientePJ` varchar(25) DEFAULT NULL,
  `telefone2_clientePJ` varchar(20) DEFAULT NULL,
  `numero_passaporte_clientePF` varchar(45) DEFAULT NULL,
  `dt_validadePassaporte_clientePF` date DEFAULT NULL,
  `copia_rg_clientePF` varchar(199) DEFAULT NULL,
  `copia_cpf_clientePF` varchar(199) DEFAULT NULL,
  `foto_clientePF` varchar(199) DEFAULT NULL,
  `numero_fidelidade_clientePF` varchar(99) DEFAULT NULL,
  `descricao_cliente` text CHARACTER SET utf8,
  `telefone_responsavel_clientePJ` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomeresponsavel_clientePJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `rg_responsavel_clientePJ` varchar(20) DEFAULT NULL,
  `email_responsavel_clientePJ` varchar(99) DEFAULT NULL,
  `cpf_responsavel_clientePJ` varchar(20) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `credito_clientePJ` decimal(9,2) DEFAULT NULL,
  `status_cliente` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_clientePF`),
  KEY `fk_tbl_clientePF_tbl_classificacao1` (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=31 ;

--
-- Extraindo dados da tabela `tbl_clientePF`
--

INSERT INTO `tbl_clientePF` (`id_clientePF`, `id_classificacao`, `tipo_cliente`, `nome_clientePF`, `razaosocial_ClientePJ`, `nomefantasia_clientePJ`, `dataNascimento_clientePF`, `rg_clientePF`, `cpf_clientePF`, `cnpj_clientePJ`, `logotipo_clientePJ`, `cep_cliente`, `endereco_cliente`, `numero_cliente`, `bairro_cliente`, `cidade_cliente`, `complemento_cliente`, `uf_cliente`, `pais_cliente`, `email_cliente`, `telefone_clientePF`, `celular_clientePF`, `telefone1_clientePJ`, `telefone2_clientePJ`, `numero_passaporte_clientePF`, `dt_validadePassaporte_clientePF`, `copia_rg_clientePF`, `copia_cpf_clientePF`, `foto_clientePF`, `numero_fidelidade_clientePF`, `descricao_cliente`, `telefone_responsavel_clientePJ`, `nomeresponsavel_clientePJ`, `rg_responsavel_clientePJ`, `email_responsavel_clientePJ`, `cpf_responsavel_clientePJ`, `credito_clientePJ`, `status_cliente`) VALUES
(6, 1, 1, 'WESLEI ANDRADE SOUZA', NULL, NULL, '1980-10-20', '33.333.333-3', '999.999.999-99', '0', NULL, '04431-000', 'Rua Maria Clotilde Martins Rocha', '1026', 'Jardim Selma', 'São Paulo', 'casa 01', 'SP', 'Brasil', 'wesley1263@terra.com.br', '(11) 5555-5555', '(11) 6666-6666', NULL, NULL, '123456789', '2015-11-30', '/var/www/7brasil/skin/img/uploadedc63ae6bd0579e02be53f3ef9285f591d.jpg', '/var/www/7brasil/skin/img/uploaded/c94ab2f23a844a03dd72aea96d4597ef.png', '/var/www/7brasil/skin/img/uploaded/55b039f21cf6c5048d1f8833d073d309.jpg', '1234561010', 'Descrição', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(25, 2, 1, 'RAQUEL LIMA ANDRADE', NULL, NULL, '1985-04-30', '33.333.333-7', '777.777.777-77', '0', NULL, '04429-150', 'Rua Correio Paulistano', '202', 'Americanópolis', 'São Paulo', '', 'SP', 'Brasil', 'raquel.lima.and@gmail.com', '(11) 5555-5555', '(11) 9999-9999', NULL, NULL, '', '0001-11-30', NULL, NULL, NULL, '', 'descrição teste.', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(26, 1, 1, 'RENAN BARDI', NULL, NULL, '1999-10-20', '55.555.555-5', '222.222.222-22', '0', NULL, '05007-001', 'Rua Doutor Homem de Melo', '202020', 'Perdizes', 'São Paulo', '2andar', 'SP', 'Brasil', 'asdadsaAASDsa@terra.com.br', '(11) 1111-1111', '(99) 9999-9999', NULL, NULL, '', '0001-11-30', NULL, NULL, '/var/www/7brasil/skin/img/uploaded//83cb01f738ce240832809e6b02f46b3f.jpg', '', 'tryturytryrytryryrurrytrtyry', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(27, 1, 1, 'JOSE NASCIMENTO', NULL, NULL, '1960-10-25', '56.565.656-5', '123.134.564-89', NULL, NULL, '04431-000', 'Rua Maria Clotilde Martins Rocha', '1026', 'Jardim Selma', 'São Paulo', '', 'SP', 'Brasil', 'seuze@terra.com.br', '(11) 5614-9532', '(11) 7777-7777', NULL, NULL, '1234568979798', '2017-10-25', '/var/www/7brasil/skin/img/uploaded//7d230a9cc354d838ad64df35d3ac4afe.gif', '/var/www/7brasil/skin/img/uploaded//8e0dbe40f4a12b53986fd0c41bd2e5b2.png', '/var/www/7brasil/skin/img/uploaded//2f0a42f88cc7d498c1420a87af08b273.jpg', '', 'descrição do seu Zé.', NULL, NULL, NULL, NULL, NULL, NULL, 1),
(29, 2, 2, '', '', 'CLUBE DO ESMALTE', '0000-00-00', NULL, NULL, '11.111.111/1111-11', '/var/www/7brasil/skin/img/uploaded//d2a7ed2c43a9e8160f3011b3b6d8c5bb.gif', '04431-000', 'Rua Maria Clotilde Martins Rocha', '1026', 'Jardim Selma', 'São Paulo', '', 'SP', 'Brasil', 'raquel@andwes.com.br', '(11) 1656-5656', '(66) 5879-8989', '(11) 5614-7701', '', '', '1969-12-31', NULL, NULL, NULL, '', 'sfafsadf', NULL, 'Raquel Lima da SIlva', '21.454.788-6', 'raquel@andwes.com.br', '123.364.545-47', 86.00, 1),
(30, 1, 1, 'JOAO PE DE FEIJAO', NULL, NULL, '1999-08-15', '45.645.645-6', '564.564.523-12', NULL, NULL, '04429-050', 'Rua Vittório Gui', '25', 'Americanópolis', 'São Paulo', '', 'SP', 'Brasil', 'joao@teste.com.br', '(11) 6666-6666', '(11) 7878-7878', NULL, NULL, '', '0000-00-00', '/var/www/7brasil/skin/img/uploaded//1fe0cb26dabf5cd51e737e56b978f124.pdf', '/var/www/7brasil/skin/img/uploaded//1fe0cb26dabf5cd51e737e56b978f124.pdf', '/var/www/7brasil/skin/img/uploaded//c71ee8e184d8905b8c10fa050f872a4c.pdf', '', 'descrição teste', NULL, NULL, NULL, NULL, NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_clientePJ` (
  `id_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_classificacao` int(11) NOT NULL,
  `razaosocial_clientePJ` varchar(99) DEFAULT NULL,
  `nomefantasia_clientePJ` varchar(99) NOT NULL,
  `cnpj_clientePJ` varchar(25) NOT NULL,
  `logotipo_clientePJ` varchar(99) DEFAULT NULL,
  `telefone_clientePJ` varchar(15) DEFAULT NULL,
  `telefone2_clientePJ` varchar(15) NOT NULL,
  `email_clientePJ` varchar(99) NOT NULL,
  `endereco_clientePJ` varchar(99) DEFAULT NULL,
  `numero_clientePJ` varchar(15) DEFAULT NULL,
  `complemento_clientePJ` varchar(45) DEFAULT NULL,
  `bairro_clientePJ` varchar(45) DEFAULT NULL,
  `cidade_clientePJ` varchar(45) DEFAULT NULL,
  `cep_clientePJ` varchar(15) NOT NULL,
  `uf_clientePJ` varchar(15) DEFAULT NULL,
  `pais_clientePJ` varchar(45) DEFAULT NULL,
  `telefone_responsavel_clientePJ` varchar(15) DEFAULT NULL,
  `nomeresponsavel_clientePJ` varchar(99) NOT NULL,
  `rg_responsavel_clientePJ` varchar(20) DEFAULT NULL,
  `email_responsavel_clientePJ` varchar(99) DEFAULT NULL,
  `cpf_responsavel_clientePJ` varchar(20) DEFAULT NULL,
  `status_clientePJ` tinyint(1) DEFAULT '1',
  `descricao_clientePJ` text,
  `credito_clientePJ` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_clientePJ`),
  KEY `id_classificacao` (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='dados da empresa que vai patrocinar a compra de produtos na ' AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tbl_clientePJ`
--

INSERT INTO `tbl_clientePJ` (`id_clientePJ`, `id_classificacao`, `razaosocial_clientePJ`, `nomefantasia_clientePJ`, `cnpj_clientePJ`, `logotipo_clientePJ`, `telefone_clientePJ`, `telefone2_clientePJ`, `email_clientePJ`, `endereco_clientePJ`, `numero_clientePJ`, `complemento_clientePJ`, `bairro_clientePJ`, `cidade_clientePJ`, `cep_clientePJ`, `uf_clientePJ`, `pais_clientePJ`, `telefone_responsavel_clientePJ`, `nomeresponsavel_clientePJ`, `rg_responsavel_clientePJ`, `email_responsavel_clientePJ`, `cpf_responsavel_clientePJ`, `status_clientePJ`, `descricao_clientePJ`, `credito_clientePJ`) VALUES
(6, 1, 'andwes solution web', 'ANDWES SOLUTION web', '11.111.111/1111-11', '/var/www/7brasil/skin/img/uploaded/c651c596c4f766d4624946d99680300c.jpg', '(11)5555-5555', '(11)9999-9999', 'contato@andwes.com.br', 'Rua Correio Paulistano', '202', '', 'Americanópolis', 'São Paulo', '04429-150', 'SP', 'Brasil', NULL, 'Weslei Andrade Souza', '55.555.555-5', 'wesley1263@terra.com.br', '444.444.444-44', 1, 'descrição teste.', 78555.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cliente_ticket`
--

CREATE TABLE IF NOT EXISTS `tbl_cliente_ticket` (
  `id_cliente_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `id_compraTicket` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente_ticket`,`id_venda`),
  KEY `fk_tbl_cliente_ticket_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_cliente_ticket_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_cliente_ticket_tbl_compraTicket1` (`id_compraTicket`),
  KEY `fk_tbl_cliente_ticket_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Para adicionar compra de ticket do cliente na venda' AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `tbl_cliente_ticket`
--

INSERT INTO `tbl_cliente_ticket` (`id_cliente_ticket`, `id_venda`, `id_moeda`, `id_compraTicket`, `id_clientePF`, `id_participacao`) VALUES
(1, 92, 1, 1, 6, 3),
(2, 95, 0, 2, 29, 2),
(3, 96, 0, 3, 29, 2),
(4, 98, 1, 4, 6, 3),
(5, 114, 1, 5, 6, 3),
(6, 120, 1, 6, 25, 3),
(7, 122, 1, 7, 6, 3),
(8, 123, 0, 9, 25, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_compania`
--

CREATE TABLE IF NOT EXISTS `tbl_compania` (
  `id_compania` int(11) NOT NULL AUTO_INCREMENT,
  `id_tipocomp` int(11) NOT NULL,
  `nome_compania` varchar(99) NOT NULL,
  `logotipo_compania` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id_compania`),
  KEY `fk_tbl_compania_tbl_tipoComp1` (`id_tipocomp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_compania`
--

INSERT INTO `tbl_compania` (`id_compania`, `id_tipocomp`, `nome_compania`, `logotipo_compania`) VALUES
(1, 1, 'TAM', '/var/www/7brasil/skin/img/uploaded/c023403cbbdc5b0e803e025d95f44ba3.gif'),
(3, 3, 'AVIANCA', '/var/www/7brasil/skin/img/uploaded/73b95a4a4088fe78eab681e4b2bcc810.png');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_compania_cruzeiro`
--

CREATE TABLE IF NOT EXISTS `tbl_compania_cruzeiro` (
  `id_compania_cruzeiro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_compania_cruzeiro` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_compania_cruzeiro` text COLLATE utf8_unicode_ci,
  `status_compania_cruzeiro` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_compania_cruzeiro`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela com nomes de compania de cruzeiro' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_compania_cruzeiro`
--

INSERT INTO `tbl_compania_cruzeiro` (`id_compania_cruzeiro`, `nome_compania_cruzeiro`, `descricao_compania_cruzeiro`, `status_compania_cruzeiro`) VALUES
(2, 'CVC BRASIL', 'descrição teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_compraTicket`
--

CREATE TABLE IF NOT EXISTS `tbl_compraTicket` (
  `id_compraTicket` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) DEFAULT NULL,
  `id_clientePF` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `valor_compraTicket` decimal(9,2) NOT NULL,
  `comissao_compraTicket` decimal(9,2) NOT NULL,
  `voucher_compraTicket` varchar(99) DEFAULT NULL,
  `fornecedor_compraTicket` varchar(99) DEFAULT NULL,
  `valor_cambio_compraTicket` decimal(9,2) DEFAULT NULL,
  `descricao_compraTicket` text,
  PRIMARY KEY (`id_compraTicket`),
  KEY `fk_tbl_compraTicket_tbl_ticket1` (`id_ticket`),
  KEY `fk_tbl_compraTicket_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `tbl_compraTicket`
--

INSERT INTO `tbl_compraTicket` (`id_compraTicket`, `id_ticket`, `id_clientePF`, `id_moeda`, `valor_compraTicket`, `comissao_compraTicket`, `voucher_compraTicket`, `fornecedor_compraTicket`, `valor_cambio_compraTicket`, `descricao_compraTicket`) VALUES
(1, 1, 6, 1, 1500.00, 150.00, '/var/www/7brasil/skin/img/uploaded/5aa1bbdf66dec7d4ea932afc0c43bb0e.pdf', 'Danna White', 2.17, 'teste'),
(2, 1, 29, 1, 600.00, 200.00, '/var/www/7brasil/skin/img/uploaded/a53f1c5c2136785f38cbb1effd37eea7.pdf', 'Danna White', 2.17, 'descrição ticket'),
(3, 1, 29, 1, 2000.00, 600.00, '/var/www/7brasil/skin/img/uploaded/8b2fd9e3ce9d70c16e6f2c4677e71636.png', 'Danna White', 2.17, 'desceção teste'),
(4, 1, 6, 1, 2000.00, 600.00, '/var/www/7brasil/skin/img/uploaded/e04d4197b1cfbe102d87680ba7f044f6.png', 'Danna White', 2.17, 'teste'),
(5, 1, 6, 1, 1500.00, 500.00, '/var/www/7brasil/skin/img/uploaded/22b6b2b19cedf3e49bcd315c65794c0d.png', 'Danna White', 2.10, 'descrição teste'),
(6, 1, 25, 1, 1500.00, 500.00, '/var/www/7brasil/skin/img/uploaded/0cdc03b12325f4565172eb957580c3f9.gif', 'Danna White', 2.10, 'descrição teste'),
(7, 1, 6, 1, 1500.00, 500.00, '/var/www/7brasil/skin/img/uploaded/6ec0793c3d5481a0a9ac2f1e31f53eeb.png', 'Danna White', 2.14, 'teste'),
(9, 1, 25, 0, 600.00, 150.00, '/var/www/7brasil/skin/img/uploaded/634119357b541fb803a5a55428e67e36.png', 'Danna White', NULL, 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_contas`
--

CREATE TABLE IF NOT EXISTS `tbl_contas` (
  `id_contas` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_subgrupo` int(11) NOT NULL,
  `id_filial` int(11) NOT NULL,
  `id_cambio` int(11) DEFAULT NULL,
  `valor_contas` decimal(9,2) NOT NULL,
  `validade_conta` date DEFAULT NULL,
  `descricao_contas` text COLLATE utf8_unicode_ci,
  `recibo_conta` varchar(199) COLLATE utf8_unicode_ci DEFAULT NULL,
  `status_contas` tinyint(1) DEFAULT '1' COMMENT '0 - Pendente1 - Paga',
  PRIMARY KEY (`id_contas`),
  KEY `fk_tbl_contas_tbl_grupo1` (`id_grupo`),
  KEY `fk_tbl_contas_tbl_subgrupo1` (`id_subgrupo`),
  KEY `fk_tbl_contas_tbl_filial1` (`id_filial`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela de contas a pagar de cada filial da empresa' AUTO_INCREMENT=37 ;

--
-- Extraindo dados da tabela `tbl_contas`
--

INSERT INTO `tbl_contas` (`id_contas`, `id_grupo`, `id_subgrupo`, `id_filial`, `id_cambio`, `valor_contas`, `validade_conta`, `descricao_contas`, `recibo_conta`, `status_contas`) VALUES
(1, 2, 2, 2, 1, 1200.00, '2014-02-10', 'teste2', NULL, 1),
(2, 3, 2, 2, 1, 580.00, '2014-02-05', 'teste', NULL, 2),
(4, 2, 2, 1, 0, 200.00, '2014-02-10', 'teste', '/var/www/7brasil/skin/img/uploaded/4bb63ca56d9938f6ef8e0e8667ad33d8.doc', 1),
(5, 1, 1, 2, 0, 2500.00, '2014-02-10', 'rwrwerqwerer', '/var/www/7brasil/skin/img/uploaded/86f62d9add19c1f1539ebd98667f902c.doc', 1),
(6, 3, 2, 2, 0, 600.00, '2014-02-11', 'descrição da contas a pagar', '/var/www/7brasil/skin/img/uploaded/c6ed5a00eb4adc1f5f6a4ca018a07d02.doc', 1),
(26, 2, 2, 2, 0, 100.00, '2014-02-21', 'descrição teste.', '/var/www/7brasil/skin/img/uploaded/b6977ebe970aef67e169da20a6e8a14a.pdf', 1),
(27, 2, 2, 2, 0, 100.00, '2014-03-21', 'descrição teste.', NULL, 1),
(28, 2, 2, 2, 0, 100.00, '2014-04-21', 'descrição teste.', NULL, 2),
(29, 2, 2, 2, 0, 100.00, '2014-05-21', 'descrição teste.', NULL, 2),
(30, 2, 2, 2, 0, 100.00, '2014-06-21', 'descrição teste.', NULL, 2),
(31, 2, 2, 2, 0, 100.00, '2014-07-21', 'descrição teste.', NULL, 2),
(32, 5, 5, 2, 0, 1000.00, '2014-02-28', 'descrição de reserva de hotel.', '/var/www/7brasil/skin/img/uploaded/21982c5c845bd0d938ae2d23197cac92.png', 2),
(33, 5, 5, 2, 2, 1000.00, '2014-03-28', 'descrição de reserva de hotel.', NULL, 2),
(34, 5, 5, 2, 1, 1000.00, '2014-04-28', 'descrição de reserva de hotel.', NULL, 2),
(35, 5, 5, 2, 2, 1000.00, '2014-05-28', 'descrição de reserva de hotel.', NULL, 2),
(36, 5, 5, 2, 0, 1000.00, '2014-06-28', 'descrição de reserva de hotel.', NULL, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_continente`
--

CREATE TABLE IF NOT EXISTS `tbl_continente` (
  `id_continente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_continente` varchar(45) NOT NULL,
  `descricao_continente` text,
  PRIMARY KEY (`id_continente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dado do continente da viagem do assegurado' AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_continente`
--

INSERT INTO `tbl_continente` (`id_continente`, `nome_continente`, `descricao_continente`) VALUES
(1, 'EUROPEU', 'europa do sul'),
(2, 'ASIATICO', 'continente asiatico'),
(3, 'AMERICANO', 'america'),
(4, 'AFRICANO', 'africa');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro` (
  `id_cruzeiro` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_compania_cruzeiro` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `navio_cruzeiro` varchar(99) DEFAULT NULL,
  `dt_inicio_cruzeiro` date NOT NULL,
  `dt_fim_cruzeiro` date NOT NULL,
  `rota_cruzeiro` varchar(99) DEFAULT NULL,
  `nm_confirmacao_cruzeiro` varchar(45) DEFAULT NULL,
  `tipo_cabine_cruzeiro` varchar(45) DEFAULT NULL,
  `valor_cruzeiro` decimal(9,2) NOT NULL,
  `comissao_cruzeiro` decimal(9,2) NOT NULL,
  `voucher_cruzeiro` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `valor_cambio_cruzeiro` decimal(9,2) DEFAULT NULL,
  `descricao_cruzeiro` text,
  PRIMARY KEY (`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_tbl_compania_cruzeiro1` (`id_compania_cruzeiro`),
  KEY `fk_tbl_cruzeiro_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_cruzeiro`
--

INSERT INTO `tbl_cruzeiro` (`id_cruzeiro`, `id_clientePF`, `id_compania_cruzeiro`, `id_moeda`, `navio_cruzeiro`, `dt_inicio_cruzeiro`, `dt_fim_cruzeiro`, `rota_cruzeiro`, `nm_confirmacao_cruzeiro`, `tipo_cabine_cruzeiro`, `valor_cruzeiro`, `comissao_cruzeiro`, `voucher_cruzeiro`, `valor_cambio_cruzeiro`, `descricao_cruzeiro`) VALUES
(2, 25, 2, 0, 'TESTE', '2014-02-20', '2014-02-25', 'Atlantico', '123456', 'Classe A', 2200.00, 600.00, '/var/www/7brasil/skin/img/uploaded/0775576d6c2df4fbb5b39f8c7b47336e.pdf', NULL, 'descrição teste.'),
(3, 29, 2, 1, 'teste', '2014-02-20', '2014-02-22', 'Atlantico', '123456', 'Classe A', 4000.00, 1200.00, '/var/www/7brasil/skin/img/uploaded/aaa93a7ac015b6b37873ead6d83b3bc7.pdf', 2.17, 'descrição de cruzeiro teste.'),
(4, 6, 2, 1, 'TESTE', '2014-02-24', '2014-02-28', 'Atlantico', '123456', 'Classe A', 1200.00, 200.00, '/var/www/7brasil/skin/img/uploaded/e8064223dbc869058288dc1a68ff048f.png', 2.10, 'rwarweqrwer');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiroPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiroPJ` (
  `id_cruzeiroPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_compania_cruzeiro` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `navio_cruzeiroPJ` varchar(99) DEFAULT NULL,
  `dt_inicio_cruzeiroPJ` date DEFAULT NULL,
  `dt_fim_cruzeiroPJ` date DEFAULT NULL,
  `rota_cruzeiroPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `nm_confirmacao_cruzeiroPJ` varchar(45) DEFAULT NULL,
  `tipo_cabine_cruzeiroPJ` varchar(45) DEFAULT NULL,
  `valor_cruzeiroPJ` decimal(9,2) DEFAULT NULL,
  `comissao_cruzeiroPJ` decimal(9,2) DEFAULT NULL,
  `voucher_cruzeiroPJ` varchar(199) DEFAULT NULL,
  `valor_cambio_cruzeiroPJ` decimal(9,2) DEFAULT NULL,
  `descricao_cruzeiroPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_cruzeiroPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_cruzeiroPJ`
--

INSERT INTO `tbl_cruzeiroPJ` (`id_cruzeiroPJ`, `id_clientePJ`, `id_compania_cruzeiro`, `id_moeda`, `navio_cruzeiroPJ`, `dt_inicio_cruzeiroPJ`, `dt_fim_cruzeiroPJ`, `rota_cruzeiroPJ`, `nm_confirmacao_cruzeiroPJ`, `tipo_cabine_cruzeiroPJ`, `valor_cruzeiroPJ`, `comissao_cruzeiroPJ`, `voucher_cruzeiroPJ`, `valor_cambio_cruzeiroPJ`, `descricao_cruzeiroPJ`) VALUES
(1, 6, 2, 0, 'Navio XYZ', '2014-02-20', '2014-02-25', 'Atlantico', '41567891', 'Classe A', 2000.00, 450.00, '/var/www/7brasil/skin/img/uploaded/5091b7ac4dfd072a3e96c1561fcf3629.', NULL, 'descrição cruzeiro.'),
(2, 6, 2, 1, 'Navio XYZ', '2014-02-16', '2014-02-19', 'Atlantico', '41567891', 'Classe A', 2500.00, 300.00, '/var/www/7brasil/skin/img/uploaded/c2720f489742dc51508ed4deb4cdb489.', 2.18, 'tertwertwertwe'),
(3, 6, 2, 1, 'Navio XYZ', '2014-02-16', '2014-02-18', 'Atlantico', '41567891', 'Classe A', 2100.00, 370.00, '/var/www/7brasil/skin/img/uploaded/6d1b88be2fad566c44333aef9281ca3f.', 2.17, 'teste');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro_clientePF` (
  `id_cruzeiro_clientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_cruzeiro` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_cruzeiro_clientePF`,`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_cruzeiro1` (`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_cruzeiro_clientePF`
--

INSERT INTO `tbl_cruzeiro_clientePF` (`id_cruzeiro_clientePF`, `id_cruzeiro`, `id_clientePF`, `id_venda`, `id_participacao`) VALUES
(1, 2, 25, 93, 3),
(2, 3, 29, 94, 2),
(3, 4, 6, 125, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro_clientePJ` (
  `id_cruzeiro_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_cruzeiroPJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_cruzeiro_clientePJ`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_cruzeiro1` (`id_cruzeiroPJ`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_venda1` (`id_vendaPJ`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_clientePJ1` (`id_clientePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_cruzeiro_clientePJ`
--

INSERT INTO `tbl_cruzeiro_clientePJ` (`id_cruzeiro_clientePJ`, `id_cruzeiroPJ`, `id_vendaPJ`, `id_clientePJ`) VALUES
(1, 1, 34, 6),
(2, 2, 36, 6),
(3, 3, 38, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro_dependentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro_dependentePF` (
  `id_cruzeiro_dependente` int(11) NOT NULL AUTO_INCREMENT,
  `id_cruzeiro` int(11) NOT NULL,
  `id_dependentePF` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_cruzeiro_dependente`),
  KEY `fk_tbl_cruzeiro_dependentePF_tbl_cruzeiro1` (`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_dependentePF_tbl_dependentePF1` (`id_dependentePF`),
  KEY `fk_tbl_cruzeiro_dependentePF_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para inclusão de dependete PF no cruzeiro' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_cruzeiro_dependentePF`
--

INSERT INTO `tbl_cruzeiro_dependentePF` (`id_cruzeiro_dependente`, `id_cruzeiro`, `id_dependentePF`, `id_venda`) VALUES
(1, 2, 4, 93);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_departamento`
--

CREATE TABLE IF NOT EXISTS `tbl_departamento` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `codigo_centrocusto` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Código utilizado por algumas \nempresas para indentificar o departartamento (Centro de Custo)',
  `nome_departamento` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_departamento` text COLLATE utf8_unicode_ci,
  `status_departamento` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_departamento`),
  KEY `fk_tbl_departamento_tbl_clientePJ1` (`id_clientePF`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='departamento da empresa e do funcionario que vai viajar' AUTO_INCREMENT=10 ;

--
-- Extraindo dados da tabela `tbl_departamento`
--

INSERT INTO `tbl_departamento` (`id_departamento`, `id_clientePF`, `codigo_centrocusto`, `nome_departamento`, `descricao_departamento`, `status_departamento`) VALUES
(7, 29, 'ABC-1263', 'FINANCEIRO', 'teste 2', 1),
(8, 29, 'ABC-1264', 'RH', 'teste', 1),
(9, 29, '2435325345', 'LIMPEZA', 'teste.', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_dependentePF` (
  `id_dependentePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_classificacao` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `nome_dependente` varchar(99) NOT NULL,
  `dt_nascimento_dependente` date DEFAULT NULL,
  `cpf_dependente` varchar(20) DEFAULT NULL,
  `rg_dependente` varchar(20) DEFAULT NULL,
  `telefone_dependente` varchar(15) DEFAULT NULL,
  `celular_dependente` varchar(15) DEFAULT NULL,
  `email_dependente` varchar(99) DEFAULT NULL,
  `cep_dependente` varchar(15) DEFAULT NULL,
  `endereco_dependente` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_dependente` varchar(15) DEFAULT NULL,
  `complemento_dependente` varchar(35) DEFAULT NULL,
  `bairro_dependente` varchar(50) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_dependente` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf_dependente` varchar(25) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `pais_dependente` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_passaporte_dependente` varchar(20) DEFAULT NULL,
  `dt_validade_passaporte_dependente` date DEFAULT NULL,
  `foto_dependente` varchar(99) DEFAULT NULL,
  `copia_cpf_dependente` varchar(99) DEFAULT NULL,
  `copia_rg_dependente` varchar(99) DEFAULT NULL,
  `descricao_dependente` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status_dependente` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_dependentePF`),
  KEY `fk_dependentePF_clientePF` (`id_clientePF`),
  KEY `fk_tbl_dependentePF_tbl_classificacao1` (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Extraindo dados da tabela `tbl_dependentePF`
--

INSERT INTO `tbl_dependentePF` (`id_dependentePF`, `id_clientePF`, `id_classificacao`, `id_departamento`, `nome_dependente`, `dt_nascimento_dependente`, `cpf_dependente`, `rg_dependente`, `telefone_dependente`, `celular_dependente`, `email_dependente`, `cep_dependente`, `endereco_dependente`, `numero_dependente`, `complemento_dependente`, `bairro_dependente`, `cidade_dependente`, `uf_dependente`, `pais_dependente`, `numero_passaporte_dependente`, `dt_validade_passaporte_dependente`, `foto_dependente`, `copia_cpf_dependente`, `copia_rg_dependente`, `descricao_dependente`, `status_dependente`) VALUES
(1, 6, 1, NULL, 'JAVA LIMA DE SOUZA', '2012-03-02', '222.222.222-22', '22.222.222-2', '(11) 5622-2919', '(11) 8967-9860', 'java@andwes.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '123456789', '2016-10-20', '/var/www/7brasil/skin/img/uploadedb818652565fcf3b651be0b5a878c9556jpg', '/var/www/7brasil/skin/img/uploaded618f80dcf3c0cb9dbc0385a2fd3c1f6cpng', '/var/www/7brasil/skin/img/uploadedd28f2b73a0841b9d0d35c9c8eee6472epng', 'Meu neguinho do Pai', 1),
(2, 6, 1, NULL, 'ARTHUR LIMA DE SOUZA', '2013-01-31', '444.444.444-44', '33.333.333-3', '(11) 5622-2919', '(22) 9998-9898', 'arthur@andwes.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '/var/www/7brasil/skin/img/uploaded//ea9beead8581e42c2b6eadea9272a8b7.JPG', NULL, NULL, 'O garoto mais lindo do mundo.', 1),
(3, 6, 1, NULL, 'RAQUEL LIMA ANDRADE', '1985-04-30', '333.333.333-33', '55.555.555-5', '(11) 5622-2919', '(11) 7777-7777', 'raquel.lima.and@gmail.com', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '', '0000-00-00', '/var/www/7brasil/skin/img/uploaded//7df9c444947fe3d79042a2940c25c5e4.jpg', NULL, NULL, 'O grande amor da minha vida.', 1),
(4, 25, 2, NULL, 'ANA BEATRIZ BERNADES', '2003-08-25', '555.555.555-55', '99.999.999-9', '(56) 2222-2222', '(11) 8888-8888', 'anab@teste.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1236354789', '0001-11-30', '/var/www/7brasil/skin/img/uploaded/cdd59bda08fc1bffd252020fbaf1bb8a.jpg', NULL, NULL, 'rweqrewrqwerwererer', 1),
(5, 29, 2, 7, 'WESLEI ANDRADE SOUZA', '1983-10-20', '231.231.657-78', '56.478.963-2', '(11) 5656-5656', '(11) 9999-9999', 'wesley@andwes.com.br', '04431-000', 'Rua Maria Clotilde Martins Rocha', '1026', '', 'Jardim Selma', 'São Paulo', 'SP', 'Brasil', '123456987654', '2014-03-02', '/var/www/7brasil/skin/img/uploaded//a7664524cfc72655b026b3b204bc38f5.jpg', '/var/www/7brasil/skin/img/uploaded//a6e6854ecbb7a06d769875ca75a970d0.png', '/var/www/7brasil/skin/img/uploaded//ff5517879ae45f6a8e55f81aa7030995.png', 'dasdfasdf', 1),
(6, 29, 1, 7, 'RAQUEL LIMA', '1985-04-30', '231.234.578-78', '21.545.457-7', '(11) 5621-4123', '(11) 8787-7897', 'raquel@andwes.com.br', '04431-000', 'Rua Maria Clotilde Martins Rocha', '1026', '', 'Jardim Selma', 'São Paulo', 'SP', 'Brasil', '', '0000-00-00', '/var/www/7brasil/skin/img/uploaded//6155e102bf5c57fdff23ed6861b89263.jpg', '/var/www/7brasil/skin/img/uploaded//494edca532b732dcdff8ea4175c1803e.gif', '/var/www/7brasil/skin/img/uploaded//f1961ec0d2cd672ed997d37e98ff9dc4.png', 'teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependentePF_ticket`
--

CREATE TABLE IF NOT EXISTS `tbl_dependentePF_ticket` (
  `id_dependentePF_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_compraTicket` int(11) NOT NULL,
  `id_dependentePF` int(11) NOT NULL,
  PRIMARY KEY (`id_dependentePF_ticket`),
  KEY `fk_tbl_dependentePF_ticket_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_dependentePF_ticket_tbl_compraTicket1` (`id_compraTicket`),
  KEY `fk_tbl_dependentePF_ticket_tbl_dependentePF1` (`id_dependentePF`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para compra de ticket de dependente pessoa fisica' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_dependentePF_ticket`
--

INSERT INTO `tbl_dependentePF_ticket` (`id_dependentePF_ticket`, `id_venda`, `id_compraTicket`, `id_dependentePF`) VALUES
(1, 92, 1, 2),
(2, 92, 1, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependentePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_dependentePJ` (
  `id_dependentePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) NOT NULL,
  `id_departamento` int(11) DEFAULT NULL,
  `id_classificacao` int(11) NOT NULL,
  `nome_dependentePJ` varchar(99) NOT NULL,
  `dt_nascimento_dependentePJ` date DEFAULT NULL,
  `cpf_dependentePJ` varchar(20) NOT NULL,
  `rg_dependentePJ` varchar(15) DEFAULT NULL,
  `telefone_dependentePJ` varchar(20) DEFAULT NULL,
  `celular_dependentePJ` varchar(15) DEFAULT NULL,
  `email_dependentePJ` varchar(99) DEFAULT NULL,
  `cep_dependentePJ` varchar(15) NOT NULL,
  `endereco_dependentePJ` varchar(99) NOT NULL,
  `numero_dependentePJ` varchar(15) NOT NULL,
  `complemento_dependentePJ` varchar(20) NOT NULL,
  `bairro_dependentePJ` varchar(99) NOT NULL,
  `cidade_dependentePJ` varchar(60) NOT NULL,
  `uf_dependentePJ` varchar(30) NOT NULL,
  `pais_dependentePJ` varchar(60) NOT NULL,
  `numero_passaporte_dependentePJ` varchar(20) DEFAULT NULL,
  `dt_validade_passaporte_dependentePJ` date DEFAULT NULL,
  `foto_dependentePJ` varchar(99) DEFAULT NULL,
  `copia_rg_dependentePJ` varchar(99) DEFAULT NULL,
  `copia_cpf_dependentePJ` varchar(99) DEFAULT NULL,
  `descricao_dependentePJ` text,
  `status_dependentePJ` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_dependentePJ`),
  KEY `fk_dependente_cliente` (`id_clientePJ`),
  KEY `fk_tbl_dependentePJ_tbl_classificacao1` (`id_classificacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Dados do funcionario da empresa (ClientePJ)' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_destino`
--

CREATE TABLE IF NOT EXISTS `tbl_destino` (
  `id_destino` int(11) NOT NULL AUTO_INCREMENT,
  `nome_destino` varchar(99) NOT NULL,
  `codigo_destino` varchar(35) DEFAULT NULL,
  `descricao_destino` text,
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_destino`
--

INSERT INTO `tbl_destino` (`id_destino`, `nome_destino`, `codigo_destino`, `descricao_destino`) VALUES
(1, 'SP- CUMBICA', 'SPCB-17', 'ASDADASDADFASDFSADFasdfsf'),
(3, 'MIAMI - USA', 'MIUSA-07', 'safdfasdf'),
(4, 'TESTE-RJ', 'RJCD-021', '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_email`
--

CREATE TABLE IF NOT EXISTS `tbl_email` (
  `id_email` int(11) NOT NULL AUTO_INCREMENT,
  `id_filial` int(11) NOT NULL,
  `id_usuario` int(11) NOT NULL,
  `email_email` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_email` text COLLATE utf8_unicode_ci,
  `status_email` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_email`),
  KEY `fk_tbl_email_tbl_filial1` (`id_filial`),
  KEY `fk_tbl_email_tbl_usuario1` (`id_usuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='emails das filiais cadastrados' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_empresa`
--

CREATE TABLE IF NOT EXISTS `tbl_empresa` (
  `id_empresa` int(11) NOT NULL AUTO_INCREMENT,
  `razaosocial_empresa` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `nomefantasia_empresa` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco_empresa` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_empresa` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento_empresa` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro_empresa` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_empresa` varchar(35) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cep_empresa` varchar(10) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf_empresa` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cnpj_empresa` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ie_empresa` varchar(25) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email_empresa` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_empresa` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_empresa` text COLLATE utf8_unicode_ci,
  `logotipo_empresa` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='dados da empresa central' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_empresa`
--

INSERT INTO `tbl_empresa` (`id_empresa`, `razaosocial_empresa`, `nomefantasia_empresa`, `endereco_empresa`, `numero_empresa`, `complemento_empresa`, `bairro_empresa`, `cidade_empresa`, `cep_empresa`, `uf_empresa`, `cnpj_empresa`, `ie_empresa`, `email_empresa`, `telefone_empresa`, `descricao_empresa`, `logotipo_empresa`) VALUES
(1, 'Agência 7Brasil LTDA', '7BRASIL AGENCIA', 'Rua Dr. Homem de Melo', '644', 'cj. 41', NULL, 'São Paulo', '05007-001', 'SP', '11.111.111/1144-44', '148.430.840.114', 'teste@7brasil.com', '(11) 5555-5555', 'Descrição da empresa', '/var/www/7brasil/skin/img/uploaded/fe98186803cf9528a3f3aa55408fd224.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_filial`
--

CREATE TABLE IF NOT EXISTS `tbl_filial` (
  `id_filial` int(11) NOT NULL AUTO_INCREMENT,
  `id_empresa` int(11) NOT NULL,
  `nome_filial` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `endereco_filial` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_filial` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `complemento_filial` varchar(20) COLLATE utf8_unicode_ci DEFAULT NULL,
  `bairro_filial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cidade_filial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf_filial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `pais_filial` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_filial` text COLLATE utf8_unicode_ci,
  `status_filial` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_filial`),
  KEY `fk_tbl_filial_tbl_empresa1` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela das filiais da empresa' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_filial`
--

INSERT INTO `tbl_filial` (`id_filial`, `id_empresa`, `nome_filial`, `endereco_filial`, `numero_filial`, `complemento_filial`, `bairro_filial`, `cidade_filial`, `uf_filial`, `pais_filial`, `descricao_filial`, `status_filial`) VALUES
(1, 1, '7 BRASIL RJ', 'rua da 7 brasil no rio de janeiro', '150', '2 º andar', 'leblon', 'Rio de Janeiro', 'RJ', 'Brasil', 'descrição teste', 1),
(2, 1, '7 BRASIL SP', 'Rua da 7 brasil em são paulo', '122', '2º Andar', 'Tremember', 'São Paulo', 'SP', 'Brasil', 'descrição teste2', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_formaPagamento`
--

CREATE TABLE IF NOT EXISTS `tbl_formaPagamento` (
  `id_formaPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_tipoPagamento` int(11) DEFAULT NULL,
  `id_tipoCartao` int(11) DEFAULT NULL,
  `valor_formaPagamento` decimal(9,2) DEFAULT NULL,
  `vezes_formaPagamento` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_formaPagamento`),
  KEY `fk_tbl_formaPagamento_tbl_tipoPagamento1` (`id_tipoPagamento`),
  KEY `fk_tbl_formaPagamento_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=115 ;

--
-- Extraindo dados da tabela `tbl_formaPagamento`
--

INSERT INTO `tbl_formaPagamento` (`id_formaPagamento`, `id_clientePF`, `id_venda`, `id_tipoPagamento`, `id_tipoCartao`, `valor_formaPagamento`, `vezes_formaPagamento`) VALUES
(52, 6, NULL, 1, NULL, 400.00, 1),
(53, 6, NULL, 2, NULL, 1000.00, 1),
(54, 6, NULL, 3, 1, 1000.00, 3),
(55, 6, NULL, 3, 2, 1000.00, 5),
(56, 6, 68, 1, NULL, 820.00, 1),
(57, 6, 68, 3, 1, 1000.00, 3),
(58, 29, 72, 1, NULL, 150.00, 1),
(59, 29, 72, 3, 3, 1000.00, 5),
(60, 29, 72, 3, 1, 1000.00, 10),
(61, 29, 73, NULL, NULL, 752.00, 1),
(62, 29, 79, NULL, NULL, 782.00, 1),
(63, 29, 81, NULL, NULL, 1650.00, 1),
(64, 29, 82, NULL, NULL, 1320.00, 1),
(65, 29, 83, NULL, NULL, 720.00, 1),
(66, 29, 85, NULL, NULL, 1520.00, 1),
(67, 29, 86, 1, NULL, 700.00, 1),
(68, 29, 86, 2, NULL, 1000.00, 2),
(69, 29, 86, 3, 3, 1000.00, 5),
(70, 29, 86, 3, 1, 1000.00, 5),
(71, 29, 87, 1, NULL, 400.00, 1),
(72, 29, 87, 3, 3, 1000.00, 5),
(73, 29, 88, 1, NULL, 609.00, 1),
(74, 29, 88, 2, NULL, 1000.00, 3),
(75, 29, 88, 3, 3, 1000.00, 5),
(76, 29, 88, 3, 1, 1000.00, 10),
(77, 29, NULL, 1, NULL, 308.20, 0),
(78, 29, 89, 3, 3, 1000.00, 5),
(79, 29, 89, 1, NULL, 308.20, 1),
(80, 29, 91, 1, NULL, 1500.00, 1),
(81, 29, 91, 3, 3, 1500.00, 3),
(82, 29, 91, 3, 1, 490.00, 1),
(83, 25, 93, 1, NULL, 800.00, 1),
(84, 25, 93, 2, NULL, 1000.00, 2),
(85, 25, 93, 3, 1, 1000.00, 5),
(86, 29, 94, 1, NULL, 1200.00, 1),
(87, 29, 94, 3, 3, 2000.00, 5),
(88, 29, 94, 3, 1, 2000.00, 2),
(89, 29, 95, 1, NULL, 424.00, 1),
(90, 29, 95, 2, NULL, 2000.00, 2),
(91, 29, 95, 3, 3, 2500.00, 2),
(92, 29, 95, 3, 1, 2500.00, 2),
(93, 29, 96, 1, NULL, 600.00, 2),
(94, 29, 96, 3, 3, 1000.00, 3),
(95, 29, 96, 3, 1, 1000.00, 5),
(96, 6, NULL, 2, NULL, 1000.00, 10),
(97, 6, NULL, 3, 1, 1000.00, 5),
(98, 6, NULL, 3, 2, 1000.00, 2),
(99, 6, 114, 3, 1, 1000.00, 4),
(100, 6, 114, 3, 2, 1000.00, 5),
(103, 25, 120, 1, NULL, 1000.00, 5),
(104, 25, 120, 3, 1, 1000.00, 4),
(105, 6, 122, 1, NULL, 1000.00, 5),
(106, 6, 122, 3, 1, 1000.00, 4),
(107, 25, 123, 3, 1, 750.00, 2),
(108, 29, 124, 3, 3, 1001.20, 2),
(110, 6, 125, 3, 1, 1000.00, 5),
(112, 6, 125, 1, NULL, 400.00, 1),
(113, 29, 126, 2, NULL, 585.00, 1),
(114, 29, 126, 3, 1, 1000.00, 5);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_formaPagamentoPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_formaPagamentoPJ` (
  `id_formaPagamentoPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_tipoPagamento` int(11) DEFAULT NULL,
  `id_tipoCartao` int(11) DEFAULT NULL,
  `valor_formaPagamentoPJ` decimal(9,2) DEFAULT NULL,
  `vezes_formaPagamentoPJ` int(2) DEFAULT NULL,
  PRIMARY KEY (`id_formaPagamentoPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=32 ;

--
-- Extraindo dados da tabela `tbl_formaPagamentoPJ`
--

INSERT INTO `tbl_formaPagamentoPJ` (`id_formaPagamentoPJ`, `id_clientePJ`, `id_vendaPJ`, `id_tipoPagamento`, `id_tipoCartao`, `valor_formaPagamentoPJ`, `vezes_formaPagamentoPJ`) VALUES
(8, 6, NULL, 3, 1, 1000.00, 5),
(9, 6, NULL, 1, NULL, 300.00, 1),
(10, 6, NULL, 3, 2, 1000.00, 5),
(11, 6, NULL, 3, 1, 1300.00, 5),
(12, 6, NULL, 3, 2, 1000.00, 10),
(16, 6, NULL, NULL, NULL, 3900.00, 1),
(17, 6, 26, NULL, NULL, 3800.00, 1),
(18, 6, 30, NULL, NULL, 3000.00, 1),
(19, 6, 31, NULL, NULL, 2200.00, 1),
(20, 6, 32, 3, 1, 811.53, 2),
(21, 6, 33, 1, NULL, 3000.00, 1),
(22, 6, 33, 2, NULL, 3000.00, 3),
(23, 6, 33, 3, 1, 2000.00, 2),
(24, 6, 33, 3, 2, 696.90, 1),
(25, 6, 34, 2, NULL, 5000.00, 1),
(26, 6, 34, 3, 1, 3000.00, 3),
(27, 6, 34, 3, 2, 2382.20, 5),
(28, 6, 36, NULL, NULL, 2800.00, 1),
(29, 6, 38, NULL, NULL, 2470.00, 1),
(30, 6, 39, NULL, NULL, 463.00, 1),
(31, 6, 40, NULL, NULL, 512.00, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_grupo`
--

CREATE TABLE IF NOT EXISTS `tbl_grupo` (
  `id_grupo` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_grupo` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_grupo` text COLLATE utf8_unicode_ci,
  `status_grupo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_grupo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela de grupo de contas a pagar' AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_grupo`
--

INSERT INTO `tbl_grupo` (`id_grupo`, `titulo_grupo`, `descricao_grupo`, `status_grupo`) VALUES
(1, 'AGENTE', 'Agentes da agencia 7 brasil', 1),
(2, 'FINANCEIRO', 'descrição teste', 1),
(3, 'ADMINISTRATIVO', 'bla bla bla', 1),
(4, 'PRODUTO', 'Produtos de venda da agencia.', 1),
(5, 'HOTEL PRO', 'fornecedor de hoteis.', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel` (
  `id_hoteis` int(11) NOT NULL AUTO_INCREMENT,
  `id_brokers` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `codigo_hotel` varchar(35) DEFAULT NULL,
  `id_moeda` int(11) NOT NULL,
  `nome_hotel` varchar(99) NOT NULL,
  `endereco_hotel` varchar(199) NOT NULL,
  `numero_hotel` varchar(9) DEFAULT NULL,
  `cep_hotel` varchar(20) DEFAULT NULL,
  `cidade_hotel` varchar(45) DEFAULT NULL,
  `uf_hotel` varchar(10) DEFAULT NULL,
  `pais_hotel` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `telefone_hotel` varchar(45) DEFAULT NULL,
  `email_hotel` varchar(99) DEFAULT NULL,
  `data_de_hotel` date DEFAULT NULL,
  `checkin_hotel` time DEFAULT NULL,
  `ckeckout_hotel` time DEFAULT NULL,
  `data_ate_hotel` date DEFAULT NULL,
  `tipo_quartos` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `servicos_hotel` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `noites_hotel` int(4) DEFAULT NULL,
  `descricao_hotel` text,
  `voucher_hotel` varchar(199) DEFAULT NULL,
  `valor_hotel` decimal(9,2) DEFAULT NULL,
  `valor_casa_hotel` decimal(9,2) DEFAULT NULL COMMENT 'valor de lucro da 7brasil',
  `valor_cambio_hotel` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_hoteis`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_hotel`
--

INSERT INTO `tbl_hotel` (`id_hoteis`, `id_brokers`, `id_clientePF`, `codigo_hotel`, `id_moeda`, `nome_hotel`, `endereco_hotel`, `numero_hotel`, `cep_hotel`, `cidade_hotel`, `uf_hotel`, `pais_hotel`, `telefone_hotel`, `email_hotel`, `data_de_hotel`, `checkin_hotel`, `ckeckout_hotel`, `data_ate_hotel`, `tipo_quartos`, `servicos_hotel`, `noites_hotel`, `descricao_hotel`, `voucher_hotel`, `valor_hotel`, `valor_casa_hotel`, `valor_cambio_hotel`) VALUES
(1, 1, 29, NULL, 0, 'HOTEL DE MIAMI', 'Rua de Miami', '25a', NULL, 'Nebraska', 'MIAMI', 'UNITED STATES', '+11 56 149 533', 'teste@teste.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'descrição teste.', '/var/www/7brasil/skin/img/uploaded/cd4e092cfbc17bcd607287a8dc35b66a.pdf', 1700.00, 600.00, NULL),
(2, 1, 29, NULL, 0, 'FAVELA PALACE', 'Rua Maria Clotilde Martins Rocha', '1026', '04431-000', 'São Paulo', 'SP', 'BRAZIL', '(11) 5614-9533', 'contao@favelapalace.com.br', '2014-02-20', NULL, NULL, '2014-02-24', 'DOUBLE', 'BREAKFAST', 4, 'descrição teste', '/var/www/7brasil/skin/img/uploaded/e0252b74e4f261f38549dc727b86a8a9.pdf', 780.00, 120.00, NULL),
(3, 1, 29, NULL, 1, 'FAVELA PALACE', 'Rua de Miami', '25a', NULL, 'Nebraska', 'MIAMI', 'UNITED STATES', '+11 56 149 533', 'teste@teste.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'testes', '/var/www/7brasil/skin/img/uploaded/91bcf84615c3ba396d8c8ccb1b88e74c.pdf', 1500.00, 150.00, 2.17),
(4, 1, 29, NULL, 0, 'FAVELA PALACE', 'Rua Maria Clotilde Martins Rocha', '1026', '04431-000', 'São Paulo', 'SP', 'BRAZIL', '+11 56 149 533', 'teste@teste.com.br', NULL, NULL, NULL, NULL, NULL, NULL, NULL, 'teste', '/var/www/7brasil/skin/img/uploaded/4afd30adfba252d0240aec8445c17d65.pdf', 1200.00, 120.00, NULL),
(5, 1, 29, 'XI-HC 61259872', 1, 'HOTEL DE MIAMI', 'Rua de Miami', '25a', NULL, 'Nebraska', 'MIAMI', 'UNITED STATES', '+11 56 149 533', 'teste@teste.com.br', '2014-02-20', '22:00:00', '11:00:00', '2014-02-27', 'DOUBLE', 'BREAKFAST', 8, 'teste de descrição.', '/var/www/7brasil/skin/img/uploaded/a8c6a0234843a7a8ad1794d69f4bbd85.pdf', 1200.00, 600.00, 2.17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotelPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_hotelPJ` (
  `id_hotelPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_brokers` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `nome_hotelPJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `endereco_hotelPJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `numero_hotelPJ` varchar(15) DEFAULT NULL,
  `cep_hotelPJ` varchar(10) DEFAULT NULL,
  `cidade_hotelPJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `uf_hotelPJ` varchar(10) DEFAULT NULL,
  `telefone_hotelPJ` varchar(20) DEFAULT NULL,
  `email_hotelPJ` varchar(99) DEFAULT NULL,
  `descricao_hotelPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `voucher_hotelPJ` varchar(199) DEFAULT NULL,
  `valor_hotelPJ` decimal(9,2) DEFAULT NULL,
  `valor_casa_hotelPJ` decimal(9,2) DEFAULT NULL,
  `valor_cambio_hotelPJ` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_hotelPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_hotelPJ`
--

INSERT INTO `tbl_hotelPJ` (`id_hotelPJ`, `id_brokers`, `id_clientePJ`, `id_moeda`, `nome_hotelPJ`, `endereco_hotelPJ`, `numero_hotelPJ`, `cep_hotelPJ`, `cidade_hotelPJ`, `uf_hotelPJ`, `telefone_hotelPJ`, `email_hotelPJ`, `descricao_hotelPJ`, `voucher_hotelPJ`, `valor_hotelPJ`, `valor_casa_hotelPJ`, `valor_cambio_hotelPJ`) VALUES
(2, 1, 6, 1, 'FAVELA PALACE', '45 STREET ', '12A', NULL, 'OHIO', 'MIAMI', '+55 11 56149533', 'favela@tes.com.br', 'descição teste', '/var/www/7brasil/skin/img/uploaded/e6dcc054dcf4f4a37acdb5bcb51535d3.sql', 2500.00, 250.00, 2.14),
(3, 1, 6, 1, 'FAVELA PALACE', 'Rua Maria Coltilde martins Rocha', '1026', '04431-000', 'São Paulo', 'SP', '+55 11 56149533', 'favela@tes.com.br', 'descrição de hoteis', '/var/www/7brasil/skin/img/uploaded/32385934af9a213b8a61a225343493c5.pdf', 1650.00, 350.00, 2.17),
(4, 1, 6, 1, 'HOTEL WOLRD TRACK CENTER', '45 STREET ', '12A', NULL, 'OHIO', 'NEW YORK', '+55 11 56149533', 'contact@woldtrankcenter.com', 'descrição hotel.', '/var/www/7brasil/skin/img/uploaded/70019aa1a86625b32f525e6c1e922564.pdf', 3200.00, 800.00, 2.17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel_clientePF` (
  `id_hotel_clientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_hotel` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  `id_clientePF` int(11) DEFAULT NULL,
  `id_participacao` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hotel_clientePF`),
  KEY `fk_tbl_hotel_clientePF_tbl_hotel1` (`id_hotel`),
  KEY `fk_tbl_hotel_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_hotel_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_hotel_clientePF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_hotel_clientePF`
--

INSERT INTO `tbl_hotel_clientePF` (`id_hotel_clientePF`, `id_hotel`, `id_venda`, `id_clientePF`, `id_participacao`) VALUES
(1, 3, 81, 29, 2),
(2, 4, 82, 29, 2),
(3, 5, 95, 29, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel_clientePJ` (
  `id_hotel_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_hotelPJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_dependentePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hotel_clientePJ`),
  KEY `fk_tbl_hotel_clientePJ_tbl_hotel1` (`id_hotelPJ`),
  KEY `fk_tbl_hotel_clientePJ_tbl_venda1` (`id_vendaPJ`),
  KEY `fk_tbl_hotel_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_hotel_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para reserva de hotel para cliente Pessoa Juridica' AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `tbl_hotel_clientePJ`
--

INSERT INTO `tbl_hotel_clientePJ` (`id_hotel_clientePJ`, `id_hotelPJ`, `id_vendaPJ`, `id_clientePJ`, `id_dependentePJ`) VALUES
(1, 1, 17, 6, 2),
(2, 1, 18, 6, 2),
(3, 1, 18, 6, 3),
(4, 1, 19, 6, 2),
(5, 1, 19, 6, 3),
(6, 1, 20, 6, 2),
(7, 1, 20, 6, 3),
(8, 2, 22, 6, 2),
(9, 2, 22, 6, 3),
(10, 3, 33, 6, 2),
(11, 3, 33, 6, 3),
(12, 4, 34, 6, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel_depedentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel_depedentePF` (
  `id_hotel_depedentePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_hoteis` int(11) DEFAULT NULL,
  `id_dependentePF` int(11) DEFAULT NULL,
  `id_venda` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_hotel_depedentePF`),
  KEY `fk_tbl_hotel_depedentePF_tbl_hotel1` (`id_hoteis`),
  KEY `fk_tbl_hotel_depedentePF_tbl_dependentePF1` (`id_dependentePF`),
  KEY `fk_tbl_hotel_depedentePF_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela usada para cadastrar reserva de dependetes Pessoa Fis' AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_hotel_depedentePF`
--

INSERT INTO `tbl_hotel_depedentePF` (`id_hotel_depedentePF`, `id_hoteis`, `id_dependentePF`, `id_venda`) VALUES
(1, 4, 4, 67),
(2, 4, 2, 67),
(3, 29, 6, 82),
(4, 29, 5, 95),
(5, 29, 6, 95);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_locadora`
--

CREATE TABLE IF NOT EXISTS `tbl_locadora` (
  `id_locadora` int(11) NOT NULL AUTO_INCREMENT,
  `nome_locadora` varchar(99) NOT NULL,
  `site_locadora` varchar(99) DEFAULT NULL,
  `telefone_locadora` varchar(16) DEFAULT NULL,
  `email_locadora` varchar(199) DEFAULT NULL,
  `logotipo_locadora` varchar(199) NOT NULL,
  `descricao_locadora` text,
  `status_locadora` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_locadora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_locadora`
--

INSERT INTO `tbl_locadora` (`id_locadora`, `nome_locadora`, `site_locadora`, `telefone_locadora`, `email_locadora`, `logotipo_locadora`, `descricao_locadora`, `status_locadora`) VALUES
(4, 'LOCALIZA AUTOMOVEIS', 'http://www.seminovoslocaliza.com.br/site/', '(11) 4444-4444', 'contato@seminovoslocaliza.com.br', '/var/www/7brasil/skin/img/uploaded/5f0dc703c12cdffeb2dbfed89e2fa3ae.gif', 'Localiza automoveis locadora', 1),
(5, 'RENT CAR', 'http://www.rental-line.com.br/', '(11) 6666-6666', 'contato@rental-line.com.br/', '/var/www/7brasil/skin/img/uploaded/574537cfcb04e417f5496ca26a195159.jpg', 'Rent Car descrição\r\nbla blablabla', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_moeda`
--

CREATE TABLE IF NOT EXISTS `tbl_moeda` (
  `id_moeda` int(11) NOT NULL AUTO_INCREMENT,
  `id_cambio` int(11) NOT NULL,
  `dt_moeda` date NOT NULL,
  `valor_moeda` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_moeda`),
  KEY `fk_tbl_moeda_tbl_cambio1` (`id_cambio`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela com valor do cambio no dia da venda' AUTO_INCREMENT=81 ;

--
-- Extraindo dados da tabela `tbl_moeda`
--

INSERT INTO `tbl_moeda` (`id_moeda`, `id_cambio`, `dt_moeda`, `valor_moeda`) VALUES
(1, 1, '2014-01-15', 2.35),
(3, 2, '2014-01-15', 3.21),
(4, 3, '2014-01-15', 3.85),
(5, 1, '2014-01-16', 2.37),
(6, 2, '2014-01-16', 3.22),
(7, 3, '2014-01-16', 3.88),
(8, 1, '2014-01-29', 2.44),
(9, 2, '2014-01-29', 3.34),
(10, 3, '2014-01-29', 3.00),
(11, 1, '2014-01-30', 2.20),
(12, 2, '2014-01-30', 3.12),
(13, 3, '2014-01-30', 2.60),
(14, 1, '2014-01-31', 2.27),
(15, 2, '2014-01-31', 3.10),
(16, 1, '2014-01-31', 3.00),
(17, 1, '2014-02-01', 2.30),
(18, 2, '2014-02-01', 3.10),
(19, 3, '2014-02-01', 3.05),
(20, 1, '2014-02-03', 2.17),
(21, 2, '2014-02-03', 2.89),
(22, 3, '2014-02-03', 3.00),
(23, 1, '2014-02-04', 2.20),
(24, 2, '2014-02-04', 3.00),
(25, 3, '2014-02-04', 2.70),
(26, 1, '2014-02-05', 2.17),
(27, 2, '2014-02-05', 3.11),
(28, 3, '2014-02-05', 2.25),
(29, 1, '2014-02-06', 2.17),
(30, 2, '2014-02-06', 3.02),
(31, 3, '2014-02-06', 2.80),
(32, 1, '2014-02-07', 2.16),
(33, 2, '2014-02-07', 3.00),
(34, 3, '2014-02-07', 2.90),
(35, 1, '2014-02-08', 2.14),
(36, 2, '2014-02-08', 2.99),
(37, 3, '2014-02-08', 2.78),
(38, 1, '2014-02-10', 2.30),
(39, 2, '2014-02-10', 3.00),
(40, 3, '2014-02-10', 2.70),
(41, 1, '2014-02-11', 2.17),
(42, 3, '2014-02-11', 2.88),
(43, 2, '2014-02-11', 3.11),
(44, 1, '2014-02-12', 2.30),
(45, 2, '2014-02-12', 3.00),
(46, 3, '2014-02-12', 2.80),
(47, 1, '2014-02-13', 2.19),
(48, 2, '2014-02-13', 3.00),
(49, 1, '2014-02-13', 2.89),
(50, 1, '2014-02-14', 2.30),
(52, 3, '2014-02-14', 2.77),
(53, 1, '2014-02-15', 2.17),
(54, 2, '2014-02-15', 3.00),
(55, 3, '2014-02-15', 2.88),
(56, 2, '2014-02-14', 2.99),
(57, 1, '2014-02-16', 2.18),
(58, 2, '2014-02-16', 2.97),
(59, 3, '2014-02-16', 2.45),
(60, 1, '2014-02-17', 2.19),
(61, 2, '2014-02-17', 3.09),
(62, 3, '2014-02-17', 2.77),
(63, 1, '2014-02-18', 2.17),
(64, 2, '2014-02-18', 3.01),
(65, 3, '2014-02-18', 2.40),
(66, 1, '2014-02-19', 2.10),
(67, 2, '2014-02-19', 3.00),
(68, 3, '2014-02-19', 2.77),
(69, 1, '2014-02-20', 2.17),
(70, 2, '2014-02-20', 3.00),
(71, 3, '2014-02-20', 2.50),
(72, 1, '2014-02-21', 2.17),
(73, 2, '2014-02-21', 3.00),
(74, 3, '2014-02-21', 2.60),
(75, 1, '2014-02-22', 2.10),
(76, 2, '2014-02-22', 3.00),
(77, 3, '2014-02-22', 2.65),
(78, 1, '2014-02-23', 2.16),
(79, 2, '2014-02-23', 3.01),
(80, 3, '2014-02-23', 2.60);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_origem`
--

CREATE TABLE IF NOT EXISTS `tbl_origem` (
  `id_origem` int(11) NOT NULL AUTO_INCREMENT,
  `nome_origem` varchar(99) NOT NULL,
  `codigo_origem` varchar(35) DEFAULT NULL,
  `descricao_origem` text,
  PRIMARY KEY (`id_origem`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_origem`
--

INSERT INTO `tbl_origem` (`id_origem`, `nome_origem`, `codigo_origem`, `descricao_origem`) VALUES
(1, 'SP - CUMBICA', 'SPCB-17', 'descrição teste'),
(2, 'SP - GUARULHOS', 'SPGR-18', 'descrição teste.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_outroprod_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_outroprod_clientePF` (
  `id_outroprod_clientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_outroprod_clientePF`),
  KEY `fk_tbl_outroprod_clientePF_tbl_produtoOutros1` (`id_produto`),
  KEY `fk_tbl_outroprod_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_outroprod_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_outroprod_clientePF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_outroprod_clientePF`
--

INSERT INTO `tbl_outroprod_clientePF` (`id_outroprod_clientePF`, `id_produto`, `id_clientePF`, `id_venda`, `id_participacao`) VALUES
(2, 18, 6, 67, 3),
(3, 21, 29, 87, 2),
(4, 22, 29, 95, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_outroProd_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_outroProd_clientePJ` (
  `id_outroProd_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_produtoPJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_outroProd_clientePJ`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_produtoOutros1` (`id_produtoPJ`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_venda1` (`id_vendaPJ`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_clientePJ1` (`id_clientePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabele usada para adicionar outros produtos na venda de clie' AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_outroProd_clientePJ`
--

INSERT INTO `tbl_outroProd_clientePJ` (`id_outroProd_clientePJ`, `id_produtoPJ`, `id_vendaPJ`, `id_clientePJ`) VALUES
(5, 3, 34, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_participacao`
--

CREATE TABLE IF NOT EXISTS `tbl_participacao` (
  `id_participacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_participacao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_participacao` text COLLATE utf8_unicode_ci,
  `status_participacao` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_participacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para indetificar se o cliente é pagante e participant' AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_participacao`
--

INSERT INTO `tbl_participacao` (`id_participacao`, `titulo_participacao`, `descricao_participacao`, `status_participacao`) VALUES
(2, 'PAGANTE', 'Cliente que irá pagar as despesas mas não irá participar dos eventos.', 1),
(3, 'PARTICIPANTE E PAGANTE', 'Cliente pagante e que irá participar dos eventos.', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_passagens`
--

CREATE TABLE IF NOT EXISTS `tbl_passagens` (
  `id_passagens` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_dependente` int(11) DEFAULT NULL,
  `id_compania` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `id_origem` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `voo_passagens` varchar(45) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `codigo_reserva_pasagens` varchar(35) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `bagagem_passagens` int(2) NOT NULL DEFAULT '0',
  `dataIda_passagens` date NOT NULL,
  `saidaIda_passagens` time NOT NULL,
  `chegadaIda_passagens` time NOT NULL,
  `dataVolta_passagens` date NOT NULL,
  `saidaVolta_passagens` time NOT NULL,
  `chegadaVolta_passagens` time NOT NULL,
  `voucher_passagens` varchar(99) DEFAULT NULL,
  `ticket_passagens` varchar(45) DEFAULT NULL,
  `tarifa_passagens` decimal(9,2) NOT NULL COMMENT 'Taxa de embarque da companhia',
  `valor_casa_passagens` decimal(9,2) NOT NULL COMMENT 'Margem de lucro da 7Brasil',
  `tx_embarque_passagens` decimal(9,2) NOT NULL,
  `tx_outras_passagens` decimal(9,2) DEFAULT NULL COMMENT 'taxas extra',
  `tx_repasse_passagens` varchar(45) DEFAULT NULL COMMENT 'Esse campo é o \nDU/RAV\numa taxa repassada\ndas compania aéreas \npara a agencia',
  `valor_cambio_passagens` decimal(9,2) DEFAULT NULL,
  `descricao_passagens` text,
  PRIMARY KEY (`id_passagens`),
  KEY `fk_passagens_compania` (`id_compania`),
  KEY `fk_tbl_passagens_tbl_classe_voo1` (`id_classe`),
  KEY `fk_tbl_passagens_tbl_destino1` (`id_destino`),
  KEY `fk_tbl_passagens_tbl_origem1` (`id_origem`),
  KEY `fk_tbl_passagens_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dados da passagem aérea\n' AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `tbl_passagens`
--

INSERT INTO `tbl_passagens` (`id_passagens`, `id_clientePF`, `id_dependente`, `id_compania`, `id_classe`, `id_destino`, `id_origem`, `id_moeda`, `voo_passagens`, `codigo_reserva_pasagens`, `bagagem_passagens`, `dataIda_passagens`, `saidaIda_passagens`, `chegadaIda_passagens`, `dataVolta_passagens`, `saidaVolta_passagens`, `chegadaVolta_passagens`, `voucher_passagens`, `ticket_passagens`, `tarifa_passagens`, `valor_casa_passagens`, `tx_embarque_passagens`, `tx_outras_passagens`, `tx_repasse_passagens`, `valor_cambio_passagens`, `descricao_passagens`) VALUES
(1, 6, NULL, 3, 1, 3, 2, 1, 'teste', NULL, 0, '2014-02-04', '00:00:00', '03:00:00', '2014-02-28', '23:00:00', '04:00:00', '/var/www/7brasil/skin/img/uploaded/751ec103687a4f23af31a944dfb3206f.doc', '123456789', 1200.00, 150.00, 25.00, 0.00, '12.50', NULL, NULL),
(2, 6, NULL, 1, 1, 3, 1, 1, 'teste', NULL, 0, '2014-02-04', '00:00:00', '03:00:00', '2014-02-28', '00:00:00', '04:30:00', '/var/www/7brasil/skin/img/uploaded/05b3412863c65e0781b6affeaf044ac1.odt', '1234568789', 2000.00, 200.00, 35.00, 12.00, '60.00', NULL, NULL),
(3, 29, 5, 3, 1, 3, 2, 1, 'ASTX-201147', NULL, 2, '2014-02-18', '22:00:00', '03:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/b92b17d845f8a9d090335897d6991ad8.pdf', '12345685', 1200.00, 400.00, 35.00, 5.00, '46.00', 2.17, 'descrição teste'),
(4, 29, 5, 3, 1, 1, 1, 1, 'teste', NULL, 3, '2014-02-18', '23:00:00', '04:00:00', '2014-02-23', '06:00:00', '17:00:00', '/var/www/7brasil/skin/img/uploaded/88afe7aea0db6684783038d712ca1f1f.pdf', 'sf000', 1200.00, 500.00, 30.00, 12.00, '65.00', 2.17, 'teste'),
(5, 29, 6, 3, 1, 1, 1, 0, 'ASTX-201147', NULL, 3, '2014-02-18', '23:00:00', '04:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/d78a80063ef834e88d1d887e45bfb581.pdf', '12345685', 1200.00, 500.00, 32.00, 5.00, '65.00', NULL, 'teste'),
(6, 29, 5, 1, 1, 1, 1, 0, 'teste', NULL, 3, '2014-02-18', '23:00:00', '04:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/c41a9ac8940150c108db2e978a1fa271.pdf', '123456758', 700.00, 200.00, 27.00, 0.00, '39.00', NULL, 'teste'),
(7, 29, 6, 3, 1, 1, 1, 0, 'teste', NULL, 3, '2014-02-18', '23:00:00', '04:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/935c7d74aa5c23755a8417d8c0646480.pdf', '147896', 230.00, 60.00, 21.00, 1.20, '30.00', NULL, 'teste'),
(8, 29, 5, 1, 1, 1, 1, 1, 'ASTX-201147', NULL, 3, '2014-02-19', '23:00:00', '03:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/d168ef18e258912340e200f7d23d6ea2.pdf', '12347551', 1200.00, 450.00, 35.00, 0.00, '60.00', 2.10, 'descrição de hoje.'),
(9, 29, 6, 1, 1, 1, 1, 0, '12345ABDR', NULL, 5, '2014-02-19', '23:00:00', '03:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/4126c71cd03a9797bccbe7ab165e4a7a.pdf', '1231546548', 1200.00, 450.00, 35.00, 0.00, '60.00', NULL, 'descrição de hoje.'),
(10, 29, 5, 3, 1, 1, 1, 1, 'ASTX-201147', 'AST-20140232', 2, '2014-02-20', '22:00:00', '03:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/e214b3495e3e760be2cfd4ca7c9316f2.pdf', '123456', 950.00, 350.00, 35.00, 0.00, '46.00', 2.17, 'descrição de passagens.'),
(11, 29, 6, 3, 1, 1, 1, 0, 'ASTX-201147', 'AST-20140231', 3, '2014-02-20', '22:00:00', '03:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/6bbd554e2a95252f03603d2a3925949a.pdf', '1231345', 950.00, 350.00, 35.00, 0.00, '46.00', NULL, 'descrição de passgem raquel.'),
(12, 29, 6, 3, 1, 3, 1, 0, 'ASTX-201147', '', 3, '2014-02-25', '09:00:00', '16:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/86b9df1496d0e852fc3b2f06060c58de.gif', '1212311', 1200.00, 300.00, 35.00, 0.00, '50.00', NULL, 'tertertewrt');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_passagensPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_passagensPJ` (
  `id_passagensPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_compania` int(11) DEFAULT NULL,
  `id_classe` int(11) DEFAULT NULL,
  `id_destino` int(11) DEFAULT NULL,
  `id_origem` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `bagagem_passagensPJ` int(2) DEFAULT NULL,
  `voo_passagensPJ` varchar(60) DEFAULT NULL,
  `dataIda_passagensPJ` date DEFAULT NULL,
  `saidaIda_passagensPJ` time DEFAULT NULL,
  `chegadaIda_passagensPJ` time DEFAULT NULL,
  `dataVolta_passagensPJ` date DEFAULT NULL,
  `saidaVolta_passagensPJ` time DEFAULT NULL,
  `chegadaVolta_passagensPJ` time DEFAULT NULL,
  `voucher_passagensPJ` varchar(199) DEFAULT NULL,
  `ticket_passagensPJ` varchar(45) DEFAULT NULL,
  `codigo_reserva_pasagensPJ` varchar(45) DEFAULT NULL,
  `tarifa_passagensPJ` decimal(9,2) DEFAULT NULL,
  `valor_casa_passagensPJ` decimal(9,2) DEFAULT NULL,
  `tx_embarque_passagensPJ` decimal(9,2) DEFAULT NULL,
  `tx_outras_passagensPJ` decimal(9,2) DEFAULT NULL,
  `tx_repasse_passagensPJ` decimal(9,2) DEFAULT NULL,
  `valor_cambio_passagensPJ` decimal(9,2) DEFAULT NULL,
  `descricao_passagensPJ` text,
  PRIMARY KEY (`id_passagensPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_passagensPJ`
--

INSERT INTO `tbl_passagensPJ` (`id_passagensPJ`, `id_clientePJ`, `id_compania`, `id_classe`, `id_destino`, `id_origem`, `id_moeda`, `bagagem_passagensPJ`, `voo_passagensPJ`, `dataIda_passagensPJ`, `saidaIda_passagensPJ`, `chegadaIda_passagensPJ`, `dataVolta_passagensPJ`, `saidaVolta_passagensPJ`, `chegadaVolta_passagensPJ`, `voucher_passagensPJ`, `ticket_passagensPJ`, `codigo_reserva_pasagensPJ`, `tarifa_passagensPJ`, `valor_casa_passagensPJ`, `tx_embarque_passagensPJ`, `tx_outras_passagensPJ`, `tx_repasse_passagensPJ`, `valor_cambio_passagensPJ`, `descricao_passagensPJ`) VALUES
(2, 6, 3, 1, 3, 2, 1, 5, 'AMC - 788', '2014-02-15', '22:00:00', '04:00:00', '0000-00-00', '00:00:00', '00:00:00', '/var/www/7brasil/skin/img/uploaded/38e07282308ee674ec6f4beb98d984b9.pdf', 'ACD-3598', NULL, 1132.70, 450.00, 35.00, 7.50, 65.00, 2.17, 'descrição de passagens.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_passagens_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_passagens_clientePJ` (
  `id_passagens_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_passagensPJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_passagens_clientePJ`),
  KEY `fk_tbl_passagens_clientePJ_tbl_passagens1` (`id_passagensPJ`),
  KEY `fk_tbl_passagens_clientePJ_tbl_venda1` (`id_vendaPJ`),
  KEY `fk_tbl_passagens_clientePJ_tbl_clientePJ1` (`id_clientePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela usada para reserva de passagens aére para cliente Pes' AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_passagens_clientePJ`
--

INSERT INTO `tbl_passagens_clientePJ` (`id_passagens_clientePJ`, `id_passagensPJ`, `id_vendaPJ`, `id_clientePJ`) VALUES
(3, 2, 34, 6),
(4, 4, 88, 29),
(5, 5, 88, 29);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_permissoes`
--

CREATE TABLE IF NOT EXISTS `tbl_permissoes` (
  `id_permissoes` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `class_permissoes` varchar(15) NOT NULL,
  `method_permissoes` varchar(15) NOT NULL,
  PRIMARY KEY (`id_permissoes`),
  KEY `fk_tbl_permissoes_tbl_grupo1` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produtoOutros`
--

CREATE TABLE IF NOT EXISTS `tbl_produtoOutros` (
  `id_produto` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `titulo_produto` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `valor_produto` decimal(9,2) NOT NULL,
  `fornecedor_produto` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comissao_produto` double DEFAULT NULL,
  `voucher_produto` varchar(199) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_produto` text COLLATE utf8_unicode_ci,
  `dt_inicio_produto` date DEFAULT NULL,
  `dt_final_produto` date DEFAULT NULL,
  `valor_cambio_produto` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tbl_produtoDesconhecido_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de produtos desconhecidos' AUTO_INCREMENT=23 ;

--
-- Extraindo dados da tabela `tbl_produtoOutros`
--

INSERT INTO `tbl_produtoOutros` (`id_produto`, `id_clientePF`, `id_moeda`, `titulo_produto`, `valor_produto`, `fornecedor_produto`, `comissao_produto`, `voucher_produto`, `descricao_produto`, `dt_inicio_produto`, `dt_final_produto`, `valor_cambio_produto`) VALUES
(18, 6, 1, 'TESTE', 670.00, 'Fornecedor teste', 90, NULL, 'rttwrewrwrewtrewterwerw', '2014-02-04', '2014-02-28', NULL),
(20, 29, 0, 'teste', 700.00, 'Fornecedor teste', 152, NULL, 'descrição', '2014-02-18', '2014-02-22', NULL),
(21, 29, 0, 'teste', 1200.00, 'Fornecedor teste', 200, NULL, 'teste', '2014-02-18', '2014-02-23', NULL),
(22, 29, 1, 'Café da Manhã', 400.00, 'Coffe Break', 150, NULL, 'descrição produto.', '2014-02-20', '2014-02-23', 2.17);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_produtoOutrosPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_produtoOutrosPJ` (
  `id_produtoPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `titulo_produtoPJ` varchar(99) DEFAULT NULL,
  `valor_produtoPJ` decimal(9,2) DEFAULT NULL,
  `fornecedor_produtoPJ` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL,
  `comissao_produtoPJ` varchar(65) DEFAULT NULL,
  `voucher_produtoPJ` varchar(199) DEFAULT NULL,
  `descricao_produtoPJ` text,
  `dt_inicio_produtoPJ` datetime DEFAULT NULL,
  `dt_final_produtoPJ` datetime DEFAULT NULL,
  `valor_cambio_produtoPJ` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`id_produtoPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_produtoOutrosPJ`
--

INSERT INTO `tbl_produtoOutrosPJ` (`id_produtoPJ`, `id_clientePJ`, `id_moeda`, `titulo_produtoPJ`, `valor_produtoPJ`, `fornecedor_produtoPJ`, `comissao_produtoPJ`, `voucher_produtoPJ`, `descricao_produtoPJ`, `dt_inicio_produtoPJ`, `dt_final_produtoPJ`, `valor_cambio_produtoPJ`) VALUES
(3, 6, 0, 'Produto novo', 320.00, 'Tramontina', '65.00', NULL, 'descrição outro produto.', '2014-02-20 00:00:00', '2014-02-21 00:00:00', NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_receber`
--

CREATE TABLE IF NOT EXISTS `tbl_receber` (
  `id_receber` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) DEFAULT NULL,
  `id_formaPagamento` int(11) DEFAULT NULL,
  `id_filial` int(11) DEFAULT NULL,
  `valor_receber` decimal(9,2) DEFAULT NULL,
  `data_receber` date DEFAULT NULL,
  `status_receber` tinyint(1) DEFAULT '2',
  PRIMARY KEY (`id_receber`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=68 ;

--
-- Extraindo dados da tabela `tbl_receber`
--

INSERT INTO `tbl_receber` (`id_receber`, `id_venda`, `id_formaPagamento`, `id_filial`, `valor_receber`, `data_receber`, `status_receber`) VALUES
(43, 122, 105, 2, 200.00, '2014-02-22', 1),
(44, 122, 105, 2, 200.00, '2014-03-22', 2),
(45, 122, 105, 2, 200.00, '2014-04-22', 2),
(46, 122, 105, 2, 200.00, '2014-05-22', 2),
(47, 122, 105, 2, 200.00, '2014-06-22', 2),
(48, 122, 106, 2, 250.00, '2014-02-23', 1),
(49, 122, 106, 2, 250.00, '2014-03-22', 2),
(50, 122, 106, 2, 250.00, '2014-04-22', 2),
(51, 122, 106, 2, 250.00, '2014-05-22', 2),
(52, 123, 107, 2, 375.00, '2014-02-23', 2),
(53, 123, 107, 2, 375.00, '2014-03-23', 2),
(54, 124, 108, NULL, 500.60, '2014-02-23', 2),
(55, 124, 108, NULL, 500.60, '2014-03-23', 2),
(56, 125, 110, 2, 200.00, '2014-02-24', 2),
(57, 125, 110, 2, 200.00, '2014-03-24', 2),
(58, 125, 110, 2, 200.00, '2014-04-24', 2),
(59, 125, 110, 2, 200.00, '2014-05-24', 2),
(60, 125, 110, 2, 200.00, '2014-06-24', 2),
(61, 125, 112, 2, 400.00, '2014-02-24', 2),
(62, 126, 113, NULL, 585.00, '2014-02-24', 2),
(63, 126, 114, NULL, 200.00, '2014-02-24', 2),
(64, 126, 114, NULL, 200.00, '2014-03-24', 2),
(65, 126, 114, NULL, 200.00, '2014-04-24', 2),
(66, 126, 114, NULL, 200.00, '2014-05-24', 2),
(67, 126, 114, NULL, 200.00, '2014-06-24', 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_seguradora`
--

CREATE TABLE IF NOT EXISTS `tbl_seguradora` (
  `id_seguradora` int(11) NOT NULL AUTO_INCREMENT,
  `nome_seguradora` varchar(99) NOT NULL,
  `logo_seguradora` varchar(199) DEFAULT NULL,
  `status_seguradora` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_seguradora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dados da seguradora cadastra pela 7Brasil' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_seguradora`
--

INSERT INTO `tbl_seguradora` (`id_seguradora`, `nome_seguradora`, `logo_seguradora`, `status_seguradora`) VALUES
(1, 'ALLIANZ', '/var/www/7brasil/skin/img/uploaded/bade43e70ebbeb0fb97f63431445ff63.gif', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_seguro`
--

CREATE TABLE IF NOT EXISTS `tbl_seguro` (
  `id_seguro` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_seguradora` int(11) NOT NULL,
  `id_tipoSeguro` int(11) NOT NULL,
  `id_continente` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `dt_inicio_seguro` date NOT NULL,
  `dt_fim_seguro` date NOT NULL,
  `valor_seguro` decimal(9,2) NOT NULL,
  `valor_casa_seguro` decimal(9,2) NOT NULL,
  `voucher_seguro` varchar(199) DEFAULT NULL,
  `valor_cambio_seguro` decimal(9,2) DEFAULT NULL,
  `descricao_seguro` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_seguro`),
  KEY `fk_seguro_seguradora` (`id_seguradora`),
  KEY `fk_seguro_tipoSeguro` (`id_tipoSeguro`),
  KEY `fk_seguro_continente` (`id_continente`),
  KEY `fk_tbl_seguro_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Informações de seguro oferecido pela empresa parceira de 7 b' AUTO_INCREMENT=18 ;

--
-- Extraindo dados da tabela `tbl_seguro`
--

INSERT INTO `tbl_seguro` (`id_seguro`, `id_clientePF`, `id_seguradora`, `id_tipoSeguro`, `id_continente`, `id_moeda`, `dt_inicio_seguro`, `dt_fim_seguro`, `valor_seguro`, `valor_casa_seguro`, `voucher_seguro`, `valor_cambio_seguro`, `descricao_seguro`) VALUES
(10, 25, 1, 1, 3, 1, '2014-02-03', '2014-02-03', 500.00, 100.00, '/var/www/7brasil/skin/img/uploaded/51e8c87e8c90cb71ca68a85e7f7c9a8a.odt', NULL, NULL),
(11, 25, 1, 1, 3, 1, '2014-02-04', '2014-02-28', 600.00, 120.00, '/var/www/7brasil/skin/img/uploaded/b997982f2ec43e3990f232cfc7c2022c.doc', NULL, NULL),
(12, 6, 1, 4, 3, 1, '2014-02-12', '2014-02-16', 3200.00, 200.00, '/var/www/7brasil/skin/img/uploaded/302d20462ba67bfdcc40028cb23ee18d.doc', 3.20, 'sadfsdfsdfsdf'),
(14, 29, 1, 3, 3, 0, '2014-02-18', '2014-02-21', 350.00, 90.00, '/var/www/7brasil/skin/img/uploaded/0159af00925dd20a9b662321d117bdb3.pdf', NULL, 'descrições teste'),
(15, 29, 1, 3, 3, 1, '2014-02-18', '2014-02-20', 600.00, 120.00, '/var/www/7brasil/skin/img/uploaded/a34dd2b191ed239870c51ae31a2d5129.pdf', 2.17, 'teste'),
(16, 29, 1, 3, 3, 1, '2014-02-18', '2014-02-22', 1200.00, 320.00, '/var/www/7brasil/skin/img/uploaded/5b42bf7b77f035deff90c4cadbfa16b9.pdf', 2.17, 'teste'),
(17, 29, 1, 3, 3, 1, '2014-02-20', '2014-02-23', 450.00, 100.00, '/var/www/7brasil/skin/img/uploaded/22ebbccdc4b97ddf0b58d0ddd52a0856.pdf', 2.17, 'descrição teste.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_seguroPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_seguroPJ` (
  `id_seguroPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_seguradora` int(11) DEFAULT NULL,
  `id_tipoSeguro` int(11) DEFAULT NULL,
  `id_continente` int(11) DEFAULT NULL,
  `id_moeda` int(11) DEFAULT NULL,
  `dt_inicio_seguroPJ` date DEFAULT NULL,
  `dt_fim_seguroPJ` date DEFAULT NULL,
  `valor_seguroPJ` decimal(9,2) DEFAULT NULL,
  `valor_casa_seguroPJ` decimal(9,2) DEFAULT NULL,
  `voucher_seguroPJ` varchar(199) DEFAULT NULL,
  `valor_cambio_seguroPJ` decimal(9,2) DEFAULT NULL,
  `descricao_seguroPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id_seguroPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=12 ;

--
-- Extraindo dados da tabela `tbl_seguroPJ`
--

INSERT INTO `tbl_seguroPJ` (`id_seguroPJ`, `id_clientePJ`, `id_seguradora`, `id_tipoSeguro`, `id_continente`, `id_moeda`, `dt_inicio_seguroPJ`, `dt_fim_seguroPJ`, `valor_seguroPJ`, `valor_casa_seguroPJ`, `voucher_seguroPJ`, `valor_cambio_seguroPJ`, `descricao_seguroPJ`) VALUES
(11, 6, 1, 3, 3, 1, '2014-02-15', '2014-02-19', 180.00, 65.00, '/var/www/7brasil/skin/img/uploaded/ea094b47198f62b16545cb0b70a23574.pdf', 2.15, 'descrição seguro.');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_subgrupo`
--

CREATE TABLE IF NOT EXISTS `tbl_subgrupo` (
  `id_subgrupo` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `titulo_subgrupo` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_subgrupo` text COLLATE utf8_unicode_ci,
  `status_subgrupo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_subgrupo`),
  KEY `fk_tbl_subgrupo_tbl_grupo1` (`id_grupo`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela de subgrupo de  grupo de contas a pagar da filial' AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_subgrupo`
--

INSERT INTO `tbl_subgrupo` (`id_subgrupo`, `id_grupo`, `titulo_subgrupo`, `descricao_subgrupo`, `status_subgrupo`) VALUES
(1, 1, 'SALARIO', 'teste2', 1),
(2, 1, 'MATERIAL', 'teste', 1),
(3, 1, 'CELULAR', 'descrição do celular', 1),
(4, 4, 'FORNECEDOR', 'Fornecedores da agencia', 1),
(5, 5, 'RESERVA DE HOTEL', 'teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_telefone`
--

CREATE TABLE IF NOT EXISTS `tbl_telefone` (
  `id_telefone` int(11) NOT NULL AUTO_INCREMENT,
  `id_filial` int(11) NOT NULL,
  `numero_telefone` varchar(20) NOT NULL,
  `descricao_telefone` text,
  `status_telefone` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_telefone`),
  KEY `fk_tbl_telefone_tbl_filial1` (`id_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_ticket`
--

CREATE TABLE IF NOT EXISTS `tbl_ticket` (
  `id_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `nome_ticket` varchar(45) NOT NULL,
  `descricao_ticket` text,
  `status_ticket` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_ticket`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_ticket`
--

INSERT INTO `tbl_ticket` (`id_ticket`, `nome_ticket`, `descricao_ticket`, `status_ticket`) VALUES
(1, 'UCF LAS VEGAS', 'Tickets de desconto para entrada no ufc.', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_ticket_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_ticket_clientePJ` (
  `id_ticket_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_compraTicketPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_vendaPJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_ticket_clientePJ`),
  KEY `fk_tbl_ticket_clientePJ_tbl_compraTicket1` (`id_compraTicketPJ`),
  KEY `fk_tbl_ticket_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_ticket_clientePJ_tbl_venda1` (`id_vendaPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=13 ;

--
-- Extraindo dados da tabela `tbl_ticket_clientePJ`
--

INSERT INTO `tbl_ticket_clientePJ` (`id_ticket_clientePJ`, `id_compraTicketPJ`, `id_clientePJ`, `id_vendaPJ`) VALUES
(12, 12, 6, 34);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipoCartao`
--

CREATE TABLE IF NOT EXISTS `tbl_tipoCartao` (
  `id_tipoCartao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_tipoCartao` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `descricao_tipoCartao` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status_tipoCartao` tinyint(1) NOT NULL DEFAULT '1',
  PRIMARY KEY (`id_tipoCartao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_tipoCartao`
--

INSERT INTO `tbl_tipoCartao` (`id_tipoCartao`, `titulo_tipoCartao`, `descricao_tipoCartao`, `status_tipoCartao`) VALUES
(1, 'MASTER CARD', 'Descrição Teste2', 1),
(2, 'VISA', 'Descrição Teste', 1),
(3, 'AMERICA EXPRESS', 'teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipoComp`
--

CREATE TABLE IF NOT EXISTS `tbl_tipoComp` (
  `id_tipocomp` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_tipocomp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipocomp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='tabela para especificar se companhia é intermacional ou naci' AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_tipoComp`
--

INSERT INTO `tbl_tipoComp` (`id_tipocomp`, `titulo_tipocomp`) VALUES
(1, 'NACIONAL'),
(3, 'INTERNACIONAL');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipoPagamento`
--

CREATE TABLE IF NOT EXISTS `tbl_tipoPagamento` (
  `id_tipoPagamento` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_tipoPagamento` varchar(99) NOT NULL,
  `porcentagem_tipoPagamento` varchar(6) NOT NULL,
  `dias_recebimento_tipoPagamento` int(2) NOT NULL,
  `descricao_Pagamento` text,
  `status_tipoPagamento` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_tipoPagamento`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Formas de pagamento oferecido pela 7Brasil' AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_tipoPagamento`
--

INSERT INTO `tbl_tipoPagamento` (`id_tipoPagamento`, `titulo_tipoPagamento`, `porcentagem_tipoPagamento`, `dias_recebimento_tipoPagamento`, `descricao_Pagamento`, `status_tipoPagamento`) VALUES
(1, 'DEPOSITO BANCARIO', '0', 0, 'Dinheiro vivo', 1),
(2, 'BOLETO BANCÁRIO', '0', 0, 'Pagamento pelo boleto bancario', 1),
(3, 'CARTÃO DE CRÉDITO', '6', 30, 'Forma de pagamento mais usada pelos cliente pessoa física.', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipoSeguro`
--

CREATE TABLE IF NOT EXISTS `tbl_tipoSeguro` (
  `id_tipoSeguro` int(11) NOT NULL AUTO_INCREMENT,
  `nome_tipoSeguro` varchar(99) NOT NULL,
  `id_seguradora` int(11) NOT NULL,
  PRIMARY KEY (`id_tipoSeguro`),
  KEY `fk_tipoSeguro_seguradora` (`id_seguradora`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Qual o tipo de seguro que a seguradora oferece' AUTO_INCREMENT=5 ;

--
-- Extraindo dados da tabela `tbl_tipoSeguro`
--

INSERT INTO `tbl_tipoSeguro` (`id_tipoSeguro`, `nome_tipoSeguro`, `id_seguradora`) VALUES
(1, 'DIAMANTE', 1),
(2, 'OURO', 1),
(3, 'PRATA', 1),
(4, 'BRONZE', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `id_filial` int(11) DEFAULT NULL,
  `nome_usuario` varchar(199) NOT NULL,
  `login_usuario` varchar(45) NOT NULL,
  `senha_usuario` varchar(50) NOT NULL,
  `email_usuario` varchar(99) CHARACTER SET utf8 COLLATE utf8_unicode_ci NOT NULL,
  `status_usuario` tinyint(1) DEFAULT '1',
  `porcentagem_usuario` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_grupo` (`id_grupo`),
  KEY `fk_tbl_usuario_tbl_empresa1` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `id_grupo`, `id_empresa`, `id_filial`, `nome_usuario`, `login_usuario`, `senha_usuario`, `email_usuario`, `status_usuario`, `porcentagem_usuario`) VALUES
(1, 1, 1, 2, 'WESLEI ANDRADE', 'wesley1263', 'e10adc3949ba59abbe56e057f20f883e', 'wesle1263@7brasil.com', 1, '6'),
(2, 1, 1, 2, 'RAQUEL LIMA ANDRADE', 'raquel1263', 'e10adc3949ba59abbe56e057f20f883e', 'raquel1263@7brasil.com', 1, '6'),
(3, 3, 1, 2, 'RENAN BARDY', 'renan123', 'e10adc3949ba59abbe56e057f20f883e', 'renan@7brasil.com', 1, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_venda`
--

CREATE TABLE IF NOT EXISTS `tbl_venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_agencia` int(11) DEFAULT NULL,
  `id_agente` int(11) DEFAULT NULL,
  `valor_agencia` decimal(9,2) DEFAULT NULL,
  `valor_agente` decimal(9,2) DEFAULT NULL,
  `valor_casa` decimal(9,2) NOT NULL,
  `total_venda` decimal(9,2) NOT NULL,
  `data_venda` date DEFAULT NULL,
  `descricao_venda` text COLLATE utf8_unicode_ci NOT NULL,
  `status_venda` tinyint(1) DEFAULT '0' COMMENT '0 - Processando\n1 - Concluido\n2 - Cancelado',
  `nm_processo_venda` int(11) NOT NULL COMMENT 'campo para identificaro processo da vendaModelo:ID_AGENTE.MES.ANO.ID_VENDAexemplo:001121345',
  `faturado_venda` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_venda`),
  KEY `fk_venda_agencia` (`id_agencia`),
  KEY `fk_tbl_venda_tbl_agentes1` (`id_agente`),
  KEY `fk_tbl_venda_tbl_usuario1` (`id_usuario`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela que ira armazenar todas as vendas da empresa' AUTO_INCREMENT=127 ;

--
-- Extraindo dados da tabela `tbl_venda`
--

INSERT INTO `tbl_venda` (`id_venda`, `id_usuario`, `id_agencia`, `id_agente`, `valor_agencia`, `valor_agente`, `valor_casa`, `total_venda`, `data_venda`, `descricao_venda`, `status_venda`, `nm_processo_venda`, `faturado_venda`) VALUES
(67, 1, 1, 2, 0.00, 85.70, 1268.00, 10857.00, '2014-02-04', 'teste', 1, 102201467, NULL),
(68, 1, 1, 2, 120.00, 45.00, 320.00, 1820.00, '2014-02-12', 'teste', 0, 102201468, 1),
(69, 1, 1, 1, 120.00, 46.00, 150.00, 2150.00, '2014-02-18', 'descrição teste', 0, 102201469, NULL),
(70, 1, 1, 2, 120.00, 450.00, 150.00, 2150.00, '2014-02-18', 'teste', 0, 102201470, 2),
(71, 1, 1, 2, 120.00, 450.00, 150.00, 2150.00, '2014-02-18', 'teste', 0, 102201471, 2),
(72, 1, 1, 2, 120.00, 450.00, 150.00, 2150.00, '2014-02-18', 'teste', 0, 102201472, 2),
(73, 1, 1, 1, 120.00, 35.00, 155.00, 752.00, '2014-02-18', 'descrição teste.', 0, 102201473, 2),
(79, 1, 0, NULL, 0.00, 0.00, 120.00, 782.00, '2014-02-18', 'descrição teste', 0, 102201479, NULL),
(80, 1, 1, 1, 100.00, 10.00, 150.00, 1650.00, '2014-02-18', 'descrição teste.', 0, 102201480, 1),
(81, 1, 1, 1, 100.00, 10.00, 150.00, 1650.00, '2014-02-18', 'descrição teste.', 0, 102201481, 1),
(82, 1, 1, 1, 100.00, 50.00, 120.00, 1320.00, '2014-02-18', 'teste', 0, 102201482, 1),
(83, 1, 0, NULL, 0.00, 0.00, 120.00, 720.00, '2014-02-18', 'teste', 0, 102201483, NULL),
(84, 1, 0, NULL, 0.00, 0.00, 320.00, 1520.00, '2014-02-18', 'teste', 0, 102201484, NULL),
(85, 1, 0, NULL, 0.00, 0.00, 320.00, 1520.00, '2014-02-18', 'teste', 0, 102201485, NULL),
(86, 1, 1, 2, 120.00, 59.00, 500.00, 3700.00, '2014-02-18', 'teste', 0, 102201486, 1),
(87, 1, 0, NULL, 0.00, 0.00, 200.00, 1400.00, '2014-02-18', 'teste', 0, 102201487, NULL),
(88, 1, 0, NULL, 0.00, 0.00, 1000.00, 3609.00, '2014-02-18', 'teste', 0, 102201488, NULL),
(89, 1, 0, NULL, 0.00, 0.00, 260.00, 1308.20, '2014-02-18', 'teste', 0, 102201489, NULL),
(90, 1, 0, NULL, 0.00, 0.00, 900.00, 3490.00, '2014-02-19', 'descrição de hoje.', 0, 102201490, NULL),
(91, 1, 0, NULL, 0.00, 0.00, 900.00, 3490.00, '2014-02-19', 'descrição de hoje.', 0, 102201491, NULL),
(92, 1, 1, 1, 150.00, 46.00, 150.00, 1650.00, '2014-02-20', 'descrição teste', 0, 102201492, 1),
(93, 1, NULL, NULL, 0.00, 0.00, 600.00, 2800.00, '2014-02-20', 'descrição teste', 0, 102201493, NULL),
(94, 1, 0, NULL, 0.00, 0.00, 1200.00, 5200.00, '2014-02-20', 'descrição teste de venda cruzeiro', 0, 102201494, NULL),
(95, 1, 1, 1, 120.00, 46.00, 2000.00, 7424.00, '2014-02-20', 'descrição de venda com quase todos os produtos.', 0, 102201495, 2),
(96, 1, 0, NULL, 0.00, 0.00, 600.00, 2600.00, '2014-02-21', 'teste', 0, 102201496, NULL),
(97, 1, NULL, NULL, 0.00, 0.00, 600.00, 2600.00, '2014-02-21', 'teste', 0, 102201497, NULL),
(98, 1, NULL, NULL, 0.00, 0.00, 600.00, 2600.00, '2014-02-21', 'teste', 0, 102201498, NULL),
(99, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 102201499, NULL),
(100, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 1022014100, NULL),
(101, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 1022014101, NULL),
(102, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 1022014102, NULL),
(103, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 1022014103, NULL),
(104, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 1022014104, NULL),
(105, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 0, 1022014105, NULL),
(106, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-21', 'teste', 1, 1022014106, NULL),
(107, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014107, NULL),
(108, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014108, NULL),
(109, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014109, NULL),
(110, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014110, NULL),
(111, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014111, NULL),
(112, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014112, NULL),
(113, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014113, NULL),
(114, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014114, NULL),
(115, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014115, NULL),
(116, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'teste', 0, 1022014116, NULL),
(117, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', '', 0, 1022014117, NULL),
(118, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', '', 0, 1022014118, NULL),
(119, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', '', 0, 1022014119, NULL),
(120, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', '', 0, 1022014120, NULL),
(121, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'tesdte', 0, 1022014121, NULL),
(122, 1, NULL, NULL, 0.00, 0.00, 500.00, 2000.00, '2014-02-22', 'tesdte', 0, 1022014122, NULL),
(123, 1, 1, 1, 150.00, 35.00, 150.00, 750.00, '2014-02-23', '', 0, 1022014123, 1),
(124, 1, 1, 1, 100.00, 35.00, 200.00, 1001.20, '2014-02-23', 'teste', 0, 1022014124, 1),
(125, 1, 1, 1, 90.00, 25.00, 200.00, 1400.00, '2014-02-24', 'qwerqerqwerwr', 0, 1022014125, 1),
(126, 1, 1, 1, 110.00, 47.00, 300.00, 1585.00, '2014-02-24', 'rtwreqrerqwer', 0, 1022014126, 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_vendaPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_vendaPJ` (
  `id_vendaPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) DEFAULT NULL,
  `id_agencia` int(11) DEFAULT NULL,
  `id_agente` int(11) DEFAULT NULL,
  `valor_agencia` decimal(9,2) DEFAULT NULL,
  `valor_agente` decimal(9,2) DEFAULT NULL,
  `valor_casa` decimal(9,2) DEFAULT NULL,
  `total_venda` decimal(9,2) DEFAULT NULL,
  `data_venda` date DEFAULT NULL,
  `descricao_vendaPJ` text CHARACTER SET utf8 COLLATE utf8_unicode_ci,
  `status_vendaPJ` tinyint(1) DEFAULT '0',
  `nm_processo_vendaPJ` int(11) DEFAULT NULL,
  `faturado_vendaPJ` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_vendaPJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=41 ;

--
-- Extraindo dados da tabela `tbl_vendaPJ`
--

INSERT INTO `tbl_vendaPJ` (`id_vendaPJ`, `id_usuario`, `id_agencia`, `id_agente`, `valor_agencia`, `valor_agente`, `valor_casa`, `total_venda`, `data_venda`, `descricao_vendaPJ`, `status_vendaPJ`, `nm_processo_vendaPJ`, `faturado_vendaPJ`) VALUES
(34, 2, 1, 2, 117.00, 70.00, 2630.00, 10382.20, '2014-02-15', 'descrição venda testa todos.', 0, 202201434, 2),
(36, 1, 1, 2, 140.00, 60.00, 300.00, 2800.00, '2014-02-16', 'descriçãoi teste', 0, 102201436, 2),
(39, 1, 1, 1, 50.00, 12.00, 101.00, 463.00, '2014-02-16', 'etetsdfgdfgf', 0, 102201439, 1),
(40, 1, 0, NULL, 0.00, 0.00, 100.00, 512.00, '2014-02-16', 'teste', 0, 102201440, NULL);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_venda_dependentePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_venda_dependentePJ` (
  `id_venda_dependentePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_vendaPJ` int(11) DEFAULT NULL,
  `id_clientePJ` int(11) DEFAULT NULL,
  `id_dependentePJ` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda_dependentePJ`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=6 ;

--
-- Extraindo dados da tabela `tbl_venda_dependentePJ`
--

INSERT INTO `tbl_venda_dependentePJ` (`id_venda_dependentePJ`, `id_vendaPJ`, `id_clientePJ`, `id_dependentePJ`) VALUES
(1, 38, 6, 2),
(2, 38, 6, 3),
(3, 39, 6, 2),
(4, 39, 6, 3),
(5, 40, 6, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_clientePF`
--

CREATE TABLE IF NOT EXISTS `venda_clientePF` (
  `id_venda` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_participacaoPF` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda`,`id_clientePF`),
  KEY `fk_tbl_venda_has_tbl_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_venda_has_tbl_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_venda_clientePF_1_dependentePF` (`id_participacaoPF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda_clientePF`
--

INSERT INTO `venda_clientePF` (`id_venda`, `id_clientePF`, `id_participacaoPF`) VALUES
(69, 29, NULL),
(70, 29, NULL),
(71, 29, NULL),
(72, 29, NULL),
(73, 29, NULL),
(79, 29, NULL),
(80, 29, NULL),
(81, 29, NULL),
(82, 29, NULL),
(83, 29, NULL),
(84, 29, NULL),
(85, 29, NULL),
(86, 29, NULL),
(87, 29, NULL),
(88, 29, NULL),
(89, 29, NULL),
(90, 29, NULL),
(91, 29, NULL),
(94, 29, NULL),
(95, 29, NULL),
(96, 29, NULL),
(124, 29, NULL),
(126, 29, NULL),
(67, 6, 3),
(67, 25, 3),
(68, 6, 3),
(92, 6, 3),
(93, 25, 3),
(97, 6, 3),
(98, 6, 3),
(99, 25, 3),
(100, 25, 3),
(101, 25, 3),
(102, 25, 3),
(103, 25, 3),
(104, 25, 3),
(105, 25, 3),
(106, 25, 3),
(107, 6, 3),
(108, 6, 3),
(109, 6, 3),
(110, 6, 3),
(111, 6, 3),
(112, 6, 3),
(113, 6, 3),
(114, 6, 3),
(115, 25, 3),
(116, 25, 3),
(117, 25, 3),
(118, 25, 3),
(119, 25, 3),
(120, 25, 3),
(121, 6, 3),
(122, 6, 3),
(123, 25, 3),
(125, 6, 3);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_clientePJ`
--

CREATE TABLE IF NOT EXISTS `venda_clientePJ` (
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_venda`,`id_clientePJ`),
  KEY `fk_tbl_venda_has_tbl_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_venda_has_tbl_clientePJ_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda_clientePJ`
--

INSERT INTO `venda_clientePJ` (`id_venda`, `id_clientePJ`) VALUES
(36, 6),
(37, 6),
(38, 6),
(39, 6),
(40, 6);

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_dependentePF`
--

CREATE TABLE IF NOT EXISTS `venda_dependentePF` (
  `id_venda` int(11) NOT NULL,
  `id_dependentePF` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Extraindo dados da tabela `venda_dependentePF`
--

INSERT INTO `venda_dependentePF` (`id_venda`, `id_dependentePF`) VALUES
(71, 5),
(71, 6),
(72, 5),
(72, 6),
(73, 5),
(73, 6),
(79, 6),
(80, 5),
(81, 5),
(82, 6),
(83, 5),
(83, 6),
(84, 5),
(84, 6),
(85, 5),
(85, 6),
(86, 5),
(86, 6),
(87, 5),
(87, 6),
(88, 5),
(88, 6),
(89, 5),
(89, 6),
(90, 5),
(90, 6),
(91, 5),
(91, 6),
(92, 2),
(92, 3),
(93, 4),
(94, 5),
(94, 6),
(95, 5),
(95, 6),
(96, 5),
(124, 5),
(124, 6),
(126, 6);

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_adicionaClientePF`
--
ALTER TABLE `tbl_adicionaClientePF`
  ADD CONSTRAINT `fk_tbl_adicionaClientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_adicionaClientePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_adicionaClientePF_tbl_passagens1` FOREIGN KEY (`id_passagens`) REFERENCES `tbl_passagens` (`id_passagens`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_adicionaClientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_adicionar_cliente`
--
ALTER TABLE `tbl_adicionar_cliente`
  ADD CONSTRAINT `fk_tbl_adicionar_cliente_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_adicionar_cliente_tbl_passagens1` FOREIGN KEY (`id_passagens`) REFERENCES `tbl_passagens` (`id_passagens`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_agentes`
--
ALTER TABLE `tbl_agentes`
  ADD CONSTRAINT `fk_agente_agencia` FOREIGN KEY (`id_agencia`) REFERENCES `tbl_agencia` (`id_agencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_brokers_hotel`
--
ALTER TABLE `tbl_brokers_hotel`
  ADD CONSTRAINT `fk_tbl_brokers_has_tbl_hotel_tbl_brokers1` FOREIGN KEY (`id_brokers`) REFERENCES `tbl_brokers` (`id_brokers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_brokers_has_tbl_hotel_tbl_hotel1` FOREIGN KEY (`id_hoteis`) REFERENCES `tbl_hotel` (`id_hoteis`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_carro_clientePF`
--
ALTER TABLE `tbl_carro_clientePF`
  ADD CONSTRAINT `fk_tbl_carro_clientePF_tbl_carro1` FOREIGN KEY (`id_carros`) REFERENCES `tbl_carro` (`id_carros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_clientePF`
--
ALTER TABLE `tbl_clientePF`
  ADD CONSTRAINT `fk_tbl_clientePF_tbl_classificacao1` FOREIGN KEY (`id_classificacao`) REFERENCES `tbl_classificacao` (`id_classificacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_clientePJ`
--
ALTER TABLE `tbl_clientePJ`
  ADD CONSTRAINT `tbl_clientePJ_ibfk_1` FOREIGN KEY (`id_classificacao`) REFERENCES `tbl_classificacao` (`id_classificacao`);

--
-- Limitadores para a tabela `tbl_cliente_ticket`
--
ALTER TABLE `tbl_cliente_ticket`
  ADD CONSTRAINT `fk_tbl_cliente_ticket_tbl_compraTicket1` FOREIGN KEY (`id_compraTicket`) REFERENCES `tbl_compraTicket` (`id_compraTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cliente_ticket_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_cliente_ticket_ibfk_1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`);

--
-- Limitadores para a tabela `tbl_compania`
--
ALTER TABLE `tbl_compania`
  ADD CONSTRAINT `fk_tbl_compania_tbl_tipoComp1` FOREIGN KEY (`id_tipocomp`) REFERENCES `tbl_tipoComp` (`id_tipocomp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_contas`
--
ALTER TABLE `tbl_contas`
  ADD CONSTRAINT `fk_tbl_contas_tbl_filial1` FOREIGN KEY (`id_filial`) REFERENCES `tbl_filial` (`id_filial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_contas_tbl_grupo1` FOREIGN KEY (`id_grupo`) REFERENCES `tbl_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_contas_tbl_subgrupo1` FOREIGN KEY (`id_subgrupo`) REFERENCES `tbl_subgrupo` (`id_subgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cruzeiro_clientePF`
--
ALTER TABLE `tbl_cruzeiro_clientePF`
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_cruzeiro1` FOREIGN KEY (`id_cruzeiro`) REFERENCES `tbl_cruzeiro` (`id_cruzeiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cruzeiro_dependentePF`
--
ALTER TABLE `tbl_cruzeiro_dependentePF`
  ADD CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_cruzeiro1` FOREIGN KEY (`id_cruzeiro`) REFERENCES `tbl_cruzeiro` (`id_cruzeiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_dependentePF1` FOREIGN KEY (`id_dependentePF`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_dependentePF`
--
ALTER TABLE `tbl_dependentePF`
  ADD CONSTRAINT `fk_dependentePF_clientePF` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_dependentePF_tbl_classificacao1` FOREIGN KEY (`id_classificacao`) REFERENCES `tbl_classificacao` (`id_classificacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_dependentePF_ticket`
--
ALTER TABLE `tbl_dependentePF_ticket`
  ADD CONSTRAINT `fk_tbl_dependentePF_ticket_tbl_compraTicket1` FOREIGN KEY (`id_compraTicket`) REFERENCES `tbl_compraTicket` (`id_compraTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_dependentePF_ticket_tbl_dependentePF1` FOREIGN KEY (`id_dependentePF`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_dependentePF_ticket_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_dependentePJ`
--
ALTER TABLE `tbl_dependentePJ`
  ADD CONSTRAINT `fk_dependente_cliente` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_dependentePJ_tbl_classificacao1` FOREIGN KEY (`id_classificacao`) REFERENCES `tbl_classificacao` (`id_classificacao`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_email`
--
ALTER TABLE `tbl_email`
  ADD CONSTRAINT `fk_tbl_email_tbl_filial1` FOREIGN KEY (`id_filial`) REFERENCES `tbl_filial` (`id_filial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_email_tbl_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_filial`
--
ALTER TABLE `tbl_filial`
  ADD CONSTRAINT `fk_tbl_filial_tbl_empresa1` FOREIGN KEY (`id_empresa`) REFERENCES `tbl_empresa` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_hotel_clientePF`
--
ALTER TABLE `tbl_hotel_clientePF`
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_moeda`
--
ALTER TABLE `tbl_moeda`
  ADD CONSTRAINT `fk_tbl_moeda_tbl_cambio1` FOREIGN KEY (`id_cambio`) REFERENCES `tbl_cambio` (`id_cambio`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_outroprod_clientePF`
--
ALTER TABLE `tbl_outroprod_clientePF`
  ADD CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_produtoOutros1` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produtoOutros` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_passagens`
--
ALTER TABLE `tbl_passagens`
  ADD CONSTRAINT `fk_passagens_compania` FOREIGN KEY (`id_compania`) REFERENCES `tbl_compania` (`id_compania`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_tbl_classe_voo1` FOREIGN KEY (`id_classe`) REFERENCES `tbl_classe_voo` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_permissoes`
--
ALTER TABLE `tbl_permissoes`
  ADD CONSTRAINT `fk_tbl_permissoes_tbl_grupo1` FOREIGN KEY (`id_grupo`) REFERENCES `tbl_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_subgrupo`
--
ALTER TABLE `tbl_subgrupo`
  ADD CONSTRAINT `fk_tbl_subgrupo_tbl_grupo1` FOREIGN KEY (`id_grupo`) REFERENCES `tbl_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_telefone`
--
ALTER TABLE `tbl_telefone`
  ADD CONSTRAINT `fk_tbl_telefone_tbl_filial1` FOREIGN KEY (`id_filial`) REFERENCES `tbl_filial` (`id_filial`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_tipoSeguro`
--
ALTER TABLE `tbl_tipoSeguro`
  ADD CONSTRAINT `fk_tipoSeguro_seguradora` FOREIGN KEY (`id_seguradora`) REFERENCES `tbl_seguradora` (`id_seguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_usuario`
--
ALTER TABLE `tbl_usuario`
  ADD CONSTRAINT `fk_tbl_usuario_tbl_empresa1` FOREIGN KEY (`id_empresa`) REFERENCES `tbl_empresa` (`id_empresa`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_usuario_grupo` FOREIGN KEY (`id_grupo`) REFERENCES `tbl_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda_clientePF`
--
ALTER TABLE `venda_clientePF`
  ADD CONSTRAINT `fk_tbl_venda_has_tbl_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_venda_has_tbl_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
