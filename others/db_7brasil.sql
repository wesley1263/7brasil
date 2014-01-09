-- phpMyAdmin SQL Dump
-- version 3.5.8.1deb1
-- http://www.phpmyadmin.net
--
-- Máquina: localhost
-- Data de Criação: 09-Jan-2014 às 18:56
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
-- Estrutura da tabela `tbl_adcionarDependentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_adcionarDependentePF` (
  `id_adcionarDependentePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_dependentePF` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_adcionarDependentePF`),
  KEY `fk_tbl_adcionarDependentePF_tbl_dependentePF1` (`id_dependentePF`),
  KEY `fk_tbl_adcionarDependentePF_tbl_participacao1` (`id_participacao`),
  KEY `fk_tbl_adcionarDependentePF_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para adicionar dependente do cliente na venda' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela usada para adicionar cliente pessoa fisica nas passag' AUTO_INCREMENT=1 ;

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
  `status_agencia` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_agencia`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_agencia`
--

INSERT INTO `tbl_agencia` (`id_agencia`, `razaosocial_agencia`, `nomefantasia_agencia`, `cnpj_agencia`, `endereco_agencia`, `numero_agencia`, `complemento_agencia`, `bairro_agencia`, `cidade_agencia`, `uf_agencia`, `cep_agencia`, `site_agencia`, `email_agencia`, `telefone_agencia`, `logotipo_agencia`, `descricao_agencia`, `status_agencia`) VALUES
(1, 'MILESSIS TURISMO', 'MILESSIS TURISMO', '00.000.000/0000-00', 'Avenida Rio Branco', '156', '1º  andar', 'Centro', 'Rio de Janeiro', 'RJ', '20040-003', 'http://www.milessisturismo.com.br/', 'contato@milessisturismo.com.br', '(11) 5555-5555', '/var/www/7brasil/skin/img/uploaded/5524ad8a411afb73a4f39298ee3a03fd.png', 'descrição teste 2', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_asseguradoPF`
--

CREATE TABLE IF NOT EXISTS `tbl_asseguradoPF` (
  `id_seguro` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_seguro`),
  KEY `fk_tbl_seguro_has_tbl_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_seguro_has_tbl_clientePF_tbl_seguro1` (`id_seguro`),
  KEY `fk_tbl_asseguradoPF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_asseguradoPF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_asseguradoPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_asseguradoPJ` (
  `id_seguro` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  `id_dependentePF` int(11) NOT NULL,
  PRIMARY KEY (`id_seguro`,`id_clientePJ`,`id_dependentePJ`),
  KEY `fk_assegurado_cliente` (`id_clientePJ`),
  KEY `fk_assegurado_seguro` (`id_seguro`),
  KEY `fk_assegurado_dependente` (`id_dependentePJ`),
  KEY `fk_tbl_asseguradoPJ_tbl_dependentePF1` (`id_dependentePF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_brokers`
--

INSERT INTO `tbl_brokers` (`id_brokers`, `nome_brokers`, `site_brokers`, `telefone_brokers`, `logotipo_brokers`, `descricao_brokers`, `status_brokers`) VALUES
(1, 'BEST 7 BOOKING', 'http://www.best7booking.com', '(11) 5555-5555', '/var/www/7brasil/skin/img/uploaded/b1cedfa5829bc8ec9b70e538753d27ed.png', 'descrição teste', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela com nomes das moedas internacional' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_cambio`
--

INSERT INTO `tbl_cambio` (`id_cambio`, `titulo_cambio`, `descricao_cambio`, `status_cambio`) VALUES
(1, 'DOLLAR USA', 'Dolar americano dos estado unidos', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_carro`
--

CREATE TABLE IF NOT EXISTS `tbl_carro` (
  `id_carros` int(11) NOT NULL AUTO_INCREMENT,
  `id_locadora` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `dt_inicio_carro` datetime NOT NULL,
  `dt_devolucao_carro` datetime NOT NULL,
  `local_incio_carro` varchar(99) NOT NULL,
  `local_devolucao_carro` varchar(99) NOT NULL,
  `voucher_carro` varchar(199) NOT NULL,
  `descricao_carro` text,
  `valor_carro` decimal(9,2) NOT NULL COMMENT 'Valor cobrado pela empresa \npara alugar o carro.\n',
  `valor_casa_carro` decimal(9,2) NOT NULL COMMENT 'valor do lucro\nda 7Brasil',
  `taxa_carro` decimal(9,2) DEFAULT NULL COMMENT 'Taxa extra cobrado pela \nempresa para alguma \neventualidade.',
  PRIMARY KEY (`id_carros`),
  KEY `fk_carros_locadora` (`id_locadora`),
  KEY `fk_tbl_carro_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='tabela da locação do carro' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de reserva de carro para pessoa fisica' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_carro_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_carro_clientePJ` (
  `id_carro_clientePJ` int(11) NOT NULL,
  `id_carros` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_carro_clientePJ`),
  KEY `fk_tbl_carro_clientePJ_tbl_carro1` (`id_carros`),
  KEY `fk_tbl_carro_clientePJ_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_carro_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_carro_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cartaoPF`
--

CREATE TABLE IF NOT EXISTS `tbl_cartaoPF` (
  `id_cartaoPF` int(11) NOT NULL AUTO_INCREMENT,
  `numero_cartaoPF` varchar(20) NOT NULL,
  `dt_validade_cartaoPF` date NOT NULL,
  `codigo_seguranca_cartaoPF` varchar(10) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_tipoCartao` int(11) NOT NULL,
  PRIMARY KEY (`id_cartaoPF`),
  KEY `id_clientePF` (`id_clientePF`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=9 ;

--
-- Extraindo dados da tabela `tbl_cartaoPF`
--

INSERT INTO `tbl_cartaoPF` (`id_cartaoPF`, `numero_cartaoPF`, `dt_validade_cartaoPF`, `codigo_seguranca_cartaoPF`, `id_clientePF`, `id_tipoCartao`) VALUES
(7, '12345678910', '2016-08-30', '305', 0, 1),
(8, '987654321', '2014-05-25', '304', 0, 2);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cartaoPJ`
--

CREATE TABLE IF NOT EXISTS `tbl_cartaoPJ` (
  `id_cartaoPJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) NOT NULL,
  `numero_cartaoPJ` varchar(20) NOT NULL,
  `bandeira_cartaoPJ` varchar(45) NOT NULL,
  `dt_validade_cartaoPJ` date NOT NULL,
  `codigo_seguranca_cartaoPJ` int(10) NOT NULL,
  PRIMARY KEY (`id_cartaoPJ`),
  KEY `fk_cartao_clientePJ` (`id_clientePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_classe_voo`
--

CREATE TABLE IF NOT EXISTS `tbl_classe_voo` (
  `id_classe` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_classe` varchar(45) NOT NULL,
  `descricao_classe` text,
  `status_classe` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_classe`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='classes de passagens aérea' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_classificacao`
--

CREATE TABLE IF NOT EXISTS `tbl_classificacao` (
  `id_classificacao` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_classificacao` varchar(45) COLLATE utf8_unicode_ci NOT NULL,
  `status_classificacao` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_classificacao`
--

INSERT INTO `tbl_classificacao` (`id_classificacao`, `titulo_classificacao`, `status_classificacao`) VALUES
(1, 'Sr', 1),
(2, 'Sra', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_clientePF` (
  `id_clientePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_classificacao` int(11) NOT NULL,
  `nome_clientePF` varchar(99) NOT NULL,
  `dataNascimento_clientePF` date DEFAULT NULL,
  `rg_clientePF` varchar(20) DEFAULT NULL,
  `cpf_clientePF` varchar(20) NOT NULL,
  `cep_clientePF` varchar(15) NOT NULL,
  `endereco_clientePF` varchar(150) DEFAULT NULL,
  `numero_clientePF` varchar(10) DEFAULT NULL,
  `bairro_clientePF` varchar(45) DEFAULT NULL,
  `cidade_clientePF` varchar(45) DEFAULT NULL,
  `complemento_clientePF` varchar(20) DEFAULT NULL,
  `uf_clientePF` varchar(15) DEFAULT NULL,
  `pais_clientePF` varchar(20) NOT NULL,
  `email_clientePF` varchar(150) DEFAULT NULL,
  `telefone_clientePF` varchar(15) DEFAULT NULL,
  `celular_clientePF` varchar(15) DEFAULT NULL,
  `numero_passaporte_clientePF` varchar(45) DEFAULT NULL,
  `dt_validadePassaporte_clientePF` date DEFAULT NULL,
  `copia_rg_clientePF` varchar(199) DEFAULT NULL,
  `copia_cpf_clientePF` varchar(199) DEFAULT NULL,
  `foto_clientePF` varchar(199) DEFAULT NULL,
  `numero_fidelidade_clientePF` varchar(99) DEFAULT NULL,
  `descricao_clientePF` text CHARACTER SET utf8,
  `status_clientePF` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_clientePF`),
  KEY `fk_tbl_clientePF_tbl_classificacao1` (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=25 ;

--
-- Extraindo dados da tabela `tbl_clientePF`
--

INSERT INTO `tbl_clientePF` (`id_clientePF`, `id_classificacao`, `nome_clientePF`, `dataNascimento_clientePF`, `rg_clientePF`, `cpf_clientePF`, `cep_clientePF`, `endereco_clientePF`, `numero_clientePF`, `bairro_clientePF`, `cidade_clientePF`, `complemento_clientePF`, `uf_clientePF`, `pais_clientePF`, `email_clientePF`, `telefone_clientePF`, `celular_clientePF`, `numero_passaporte_clientePF`, `dt_validadePassaporte_clientePF`, `copia_rg_clientePF`, `copia_cpf_clientePF`, `foto_clientePF`, `numero_fidelidade_clientePF`, `descricao_clientePF`, `status_clientePF`) VALUES
(6, 1, 'WESLEI ANDRADE SOUZA', '1980-10-20', '33.333.333-3', '999.999.999-99', '04431-000', 'Rua Maria Clotilde Martins Rocha', '1026', 'Jardim Selma', 'São Paulo', 'casa 01', 'SP', 'Brasil', 'wesley1263@terra.com.br', '(11) 5555-5555', '(11) 6666-6666', '123456789', '2015-11-30', '/var/www/7brasil/skin/img/uploadedc63ae6bd0579e02be53f3ef9285f591d.jpg', '/var/www/7brasil/skin/img/uploaded/c94ab2f23a844a03dd72aea96d4597ef.png', '/var/www/7brasil/skin/img/uploadeddaf7fc2f9050c84ca08f976ed91d92b4.jpg', '1234561010', 'Descrição', 1),
(7, 1, 'ARTHUR LIMA DE SOUZA ', '2013-01-31', '12.222.222-2', '666.666.666-66', '04429-150', 'Rua Correio Paulistano', '202', 'Americanópolis', 'São Paulo', 'Casa 04', 'SP', 'Brasil', 'wesley1263@terra.com.br', '(11) 5555-5555', '(11) 6666-6666', '123456', '2016-10-25', '/var/www/7brasil/skin/img/uploaded/4d16a0cd1b9d6a90b0d67ad4bfb64588.png', '/var/www/7brasil/skin/img/uploaded/619b92173a9beb35a2daeca3aceaff32.jpg', '/var/www/7brasil/skin/img/uploaded/3893168b58c2d8fa948cdd3bf99f7960.JPG', '123456789123456789', 'Anjinho de Papai', 1),
(24, 1, 'RAQUEL LIMA ANDRADE', '1985-04-30', '33.333.333-3', '777.777.777-77', '04429-150', 'Rua Correio Paulistano', '202', 'Americanópolis', 'São Paulo', '', 'SP', 'Brasil', 'raquel.lima.and@gmail.com', '(11) 5555-5555', '(11) 9999-9999', '', '0001-11-30', NULL, NULL, NULL, '', '', 1);

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='dados da empresa que vai patrocinar a compra de produtos na ' AUTO_INCREMENT=4 ;

--
-- Extraindo dados da tabela `tbl_clientePJ`
--

INSERT INTO `tbl_clientePJ` (`id_clientePJ`, `id_classificacao`, `razaosocial_clientePJ`, `nomefantasia_clientePJ`, `cnpj_clientePJ`, `logotipo_clientePJ`, `telefone_clientePJ`, `telefone2_clientePJ`, `email_clientePJ`, `endereco_clientePJ`, `numero_clientePJ`, `complemento_clientePJ`, `bairro_clientePJ`, `cidade_clientePJ`, `cep_clientePJ`, `uf_clientePJ`, `pais_clientePJ`, `telefone_responsavel_clientePJ`, `nomeresponsavel_clientePJ`, `rg_responsavel_clientePJ`, `email_responsavel_clientePJ`, `cpf_responsavel_clientePJ`, `status_clientePJ`, `descricao_clientePJ`, `credito_clientePJ`) VALUES
(3, 1, 'andwes solution', 'ANDWES SOLUTION ', '00.000.000/0000-00', '/var/www/7brasil/skin/img/uploaded/0351fd6c020367cd3b67c48e6ed875b9.JPG', '(11)5622-2222', '(11)3333-3333', 'contato@andwes.com.br', 'Rua Correio Paulistano', '202', 'Casa 04', 'Americanópolis', 'São Paulo', '04429-150', 'SP', 'Brasil', NULL, 'Weslei Andrade Souza', '33.333.333-3', 'wesley1263@terra.com.br', '555.555.555-55', 1, 'descrição teste', 200000.00);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cliente_ticket`
--

CREATE TABLE IF NOT EXISTS `tbl_cliente_ticket` (
  `id_cliente_ticket` int(11) NOT NULL AUTO_INCREMENT,
  `id_venda` int(11) NOT NULL,
  `id_compraTicket` int(11) NOT NULL,
  `tbl_clientePF_id_clientePF` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_cliente_ticket`,`id_venda`),
  KEY `fk_tbl_cliente_ticket_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_cliente_ticket_tbl_clientePF1` (`tbl_clientePF_id_clientePF`),
  KEY `fk_tbl_cliente_ticket_tbl_compraTicket1` (`id_compraTicket`),
  KEY `fk_tbl_cliente_ticket_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Para adicionar compra de ticket do cliente na venda' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_compania_cruzeiro`
--

CREATE TABLE IF NOT EXISTS `tbl_compania_cruzeiro` (
  `id_compania_cruzeiro` int(11) NOT NULL,
  `nome_compania_cruzeiro` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_compania_cruzeiro` text COLLATE utf8_unicode_ci,
  `status_compania_cruzeiro` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_compania_cruzeiro`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela com nomes de compania de cruzeiro';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_compraTicket`
--

CREATE TABLE IF NOT EXISTS `tbl_compraTicket` (
  `id_compraTicket` int(11) NOT NULL AUTO_INCREMENT,
  `id_ticket` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `valor_compraTicket` decimal(9,2) NOT NULL,
  `comissao_compraTicket` int(11) NOT NULL,
  `voucher_compraTicket` varchar(99) DEFAULT NULL,
  `fornecedor_compraTicket` varchar(99) DEFAULT NULL,
  PRIMARY KEY (`id_compraTicket`),
  KEY `fk_tbl_compraTicket_tbl_ticket1` (`id_ticket`),
  KEY `fk_tbl_compraTicket_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_contas`
--

CREATE TABLE IF NOT EXISTS `tbl_contas` (
  `id_contas` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_subgrupo` int(11) NOT NULL,
  `id_filial` int(11) NOT NULL,
  `valor_contas` decimal(9,2) NOT NULL,
  `validade_conta` date DEFAULT NULL,
  `descricao_contas` text COLLATE utf8_unicode_ci,
  `status_contas` tinyint(1) DEFAULT '0' COMMENT '0 - Pendente\n1 - Paga',
  PRIMARY KEY (`id_contas`),
  KEY `fk_tbl_contas_tbl_grupo1` (`id_grupo`),
  KEY `fk_tbl_contas_tbl_subgrupo1` (`id_subgrupo`),
  KEY `fk_tbl_contas_tbl_filial1` (`id_filial`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela de contas a pagar de cada filial da empresa' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_continente`
--

CREATE TABLE IF NOT EXISTS `tbl_continente` (
  `id_continente` int(11) NOT NULL AUTO_INCREMENT,
  `nome_continente` varchar(45) NOT NULL,
  `descricao_continente` text,
  PRIMARY KEY (`id_continente`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dado do continente da viagem do assegurado' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_continente`
--

INSERT INTO `tbl_continente` (`id_continente`, `nome_continente`, `descricao_continente`) VALUES
(1, 'EUROPEU', 'europa do sul');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro` (
  `id_cruzeiro` int(11) NOT NULL AUTO_INCREMENT,
  `id_compania_cruzeiro` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `navio_cruzeiro` varchar(99) DEFAULT NULL,
  `dt_inicio_cruzeiro` datetime NOT NULL,
  `dt_fim_cruzeiro` datetime NOT NULL,
  `rota_cruzeiro` varchar(99) DEFAULT NULL,
  `nm_confirmacao_cruzeiro` varchar(45) DEFAULT NULL,
  `tipo_cabine_cruzeiro` varchar(45) DEFAULT NULL,
  `valor_cruzeiro` decimal(9,2) NOT NULL,
  `comissao_cruzeiro` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_tbl_compania_cruzeiro1` (`id_compania_cruzeiro`),
  KEY `fk_tbl_cruzeiro_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro_clientePF` (
  `id_cruzeiro_clientePF` int(11) NOT NULL,
  `id_cruzeiro` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_cruzeiro_clientePF`,`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_cruzeiro1` (`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_cruzeiro_clientePF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_cruzeiro_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_cruzeiro_clientePJ` (
  `id_cruzeiro_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_cruzeiro` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_cruzeiro_clientePJ`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_cruzeiro1` (`id_cruzeiro`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_cruzeiro_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para inclusão de dependete PF no cruzeiro' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_departamento`
--

CREATE TABLE IF NOT EXISTS `tbl_departamento` (
  `id_departamento` int(11) NOT NULL AUTO_INCREMENT,
  `id_dependentePJ` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `codigo_centrocusto` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'Código utilizado por algumas \nempresas para indentificar o departartamento (Centro de Custo)',
  `nome_departmento` varchar(60) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_departamento` text COLLATE utf8_unicode_ci,
  `status_departamento` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_departamento`),
  KEY `fk_departamento_dependente` (`id_dependentePJ`),
  KEY `fk_tbl_departamento_tbl_clientePJ1` (`id_clientePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='departamento da empresa e do funcionario que vai viajar' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_dependentePF` (
  `id_dependentePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePF` int(11) NOT NULL,
  `id_classificacao` int(11) NOT NULL,
  `nome_dependentePF` varchar(99) NOT NULL,
  `dt_nascimento_dependentePF` date DEFAULT NULL,
  `cpf_dependentePF` varchar(20) NOT NULL,
  `rg_dependentePF` varchar(20) DEFAULT NULL,
  `telefone_dependentePF` varchar(15) DEFAULT NULL,
  `celular_dependentePF` varchar(15) DEFAULT NULL,
  `email_dependentePF` varchar(99) DEFAULT NULL,
  `numero_passaporte_dependentePF` varchar(20) DEFAULT NULL,
  `dt_validade_passaporte_dependentePF` date DEFAULT NULL,
  `foto_dependentePF` varchar(99) DEFAULT NULL,
  `copia_cpf_dependentePF` varchar(99) DEFAULT NULL,
  `copia_rg_dependentePF` varchar(99) DEFAULT NULL,
  `descricao_dependentePF` text,
  PRIMARY KEY (`id_dependentePF`),
  KEY `fk_dependentePF_clientePF` (`id_clientePF`),
  KEY `fk_tbl_dependentePF_tbl_classificacao1` (`id_classificacao`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_dependentePF`
--

INSERT INTO `tbl_dependentePF` (`id_dependentePF`, `id_clientePF`, `id_classificacao`, `nome_dependentePF`, `dt_nascimento_dependentePF`, `cpf_dependentePF`, `rg_dependentePF`, `telefone_dependentePF`, `celular_dependentePF`, `email_dependentePF`, `numero_passaporte_dependentePF`, `dt_validade_passaporte_dependentePF`, `foto_dependentePF`, `copia_cpf_dependentePF`, `copia_rg_dependentePF`, `descricao_dependentePF`) VALUES
(1, 6, 1, 'JAVA LIMA DE SOUZA', '2012-03-02', '222.222.222-22', '22.222.222-2', '(11) 5622-2919', '(11) 8967-9860', 'java@andwes.com.br', '123456789', '2016-10-20', '/var/www/7brasil/skin/img/uploadedb818652565fcf3b651be0b5a878c9556jpg', '/var/www/7brasil/skin/img/uploaded618f80dcf3c0cb9dbc0385a2fd3c1f6cpng', '/var/www/7brasil/skin/img/uploadedd28f2b73a0841b9d0d35c9c8eee6472epng', 'Meu neguinho do Pai');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependentePF_ticket`
--

CREATE TABLE IF NOT EXISTS `tbl_dependentePF_ticket` (
  `id_dependentePF_ticket` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_compraTicket` int(11) NOT NULL,
  `id_dependentePF` int(11) NOT NULL,
  PRIMARY KEY (`id_dependentePF_ticket`),
  KEY `fk_tbl_dependentePF_ticket_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_dependentePF_ticket_tbl_compraTicket1` (`id_compraTicket`),
  KEY `fk_tbl_dependentePF_ticket_tbl_dependentePF1` (`id_dependentePF`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para compra de ticket de dependente pessoa fisica';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_dependentePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_dependentePJ` (
  `id_dependentePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_clientePJ` int(11) NOT NULL,
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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dados do funcionario da empresa (ClientePJ)' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_dependentePJ`
--

INSERT INTO `tbl_dependentePJ` (`id_dependentePJ`, `id_clientePJ`, `id_classificacao`, `nome_dependentePJ`, `dt_nascimento_dependentePJ`, `cpf_dependentePJ`, `rg_dependentePJ`, `telefone_dependentePJ`, `celular_dependentePJ`, `email_dependentePJ`, `cep_dependentePJ`, `endereco_dependentePJ`, `numero_dependentePJ`, `complemento_dependentePJ`, `bairro_dependentePJ`, `cidade_dependentePJ`, `uf_dependentePJ`, `pais_dependentePJ`, `numero_passaporte_dependentePJ`, `dt_validade_passaporte_dependentePJ`, `foto_dependentePJ`, `copia_rg_dependentePJ`, `copia_cpf_dependentePJ`, `descricao_dependentePJ`, `status_dependentePJ`) VALUES
(1, 3, 1, 'JAVA LIMA SOUZA', '1969-12-31', '333.333.333-33', '33.333.333-33', '(11) 1111-1111', '(55) 5555-5555', 'java@andwes.com.br', '04429-150', 'Rua Correio Paulistano', '202', '', 'Americanópolis', 'São Paulo', 'SP', 'Brasil', '123456789', '0000-00-00', '/var/www/7brasil/skin/img/uploaded/1cb316f1ff254f3364c37e01195dc0cc.jpg', NULL, NULL, '', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_destino`
--

CREATE TABLE IF NOT EXISTS `tbl_destino` (
  `id_destino` int(11) NOT NULL AUTO_INCREMENT,
  `nome_destino` varchar(99) NOT NULL,
  `descricao_destino` text,
  `status_destino` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_destino`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Destino de viagem de passgem aérea' AUTO_INCREMENT=1 ;

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
  `cnpj_empresa` varchar(45) COLLATE utf8_unicode_ci DEFAULT NULL,
  `descricao_empresa` text COLLATE utf8_unicode_ci,
  `logotipo_empresa` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='dados da empresa central' AUTO_INCREMENT=2 ;

--
-- Extraindo dados da tabela `tbl_empresa`
--

INSERT INTO `tbl_empresa` (`id_empresa`, `razaosocial_empresa`, `nomefantasia_empresa`, `cnpj_empresa`, `descricao_empresa`, `logotipo_empresa`) VALUES
(1, 'Agência 7Brasil LTDA', '7BRASIL AGENCIA', '11.111.111/1144-44', 'Descrição da empresa', '/var/www/7brasil/skin/img/uploaded/6283c7a4c0fb0ff1b3d501243645a854.');

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
  `id_formaPagamento` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_tipoPagamento` int(11) NOT NULL,
  `valor_formaPagamento` decimal(9,2) NOT NULL,
  `vezes_formaPagamento` int(2) NOT NULL,
  PRIMARY KEY (`id_formaPagamento`),
  KEY `fk_tbl_formaPagamento_tbl_tipoPagamento1` (`id_tipoPagamento`),
  KEY `fk_tbl_formaPagamento_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela de grupo de contas a pagar' AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_grupo`
--

INSERT INTO `tbl_grupo` (`id_grupo`, `titulo_grupo`, `descricao_grupo`, `status_grupo`) VALUES
(1, 'AGENTE', 'Agentes da agencia 7 brasil', 1),
(2, 'FINANCEIRO', 'descrição teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel` (
  `id_hoteis` int(11) NOT NULL AUTO_INCREMENT,
  `nome_hotel` varchar(99) NOT NULL,
  `endereco_hotel` varchar(199) NOT NULL,
  `numero_hotel` varchar(9) DEFAULT NULL,
  `cep_hotel` varchar(20) DEFAULT NULL,
  `cidade_hotel` varchar(45) DEFAULT NULL,
  `uf_hotel` varchar(10) DEFAULT NULL,
  `telefone_hotel` varchar(45) DEFAULT NULL,
  `email_hotel` varchar(99) DEFAULT NULL,
  `descricao_hotel` text,
  `voucher_hotel` varchar(199) DEFAULT NULL,
  `valor_hotel` decimal(9,2) DEFAULT NULL,
  `valor_casa_hotel` decimal(9,2) DEFAULT NULL COMMENT 'valor de lucro da 7brasil',
  PRIMARY KEY (`id_hoteis`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel_clientePF`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel_clientePF` (
  `id_hotel_clientePF` int(11) NOT NULL,
  `id_hoteis` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_participacao` int(11) NOT NULL,
  PRIMARY KEY (`id_hotel_clientePF`),
  KEY `fk_tbl_hotel_clientePF_tbl_hotel1` (`id_hoteis`),
  KEY `fk_tbl_hotel_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_hotel_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_hotel_clientePF_tbl_participacao1` (`id_participacao`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel_clientePJ` (
  `id_hotel_clientePJ` int(11) NOT NULL,
  `id_hotel` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_hotel_clientePJ`),
  KEY `fk_tbl_hotel_clientePJ_tbl_hotel1` (`id_hotel`),
  KEY `fk_tbl_hotel_clientePJ_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_hotel_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_hotel_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para reserva de hotel para cliente Pessoa Juridica';

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_hotel_depedentePF`
--

CREATE TABLE IF NOT EXISTS `tbl_hotel_depedentePF` (
  `id_hotel_depedentePF` int(11) NOT NULL AUTO_INCREMENT,
  `id_hoteis` int(11) NOT NULL,
  `id_dependentePF_ticket` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_hotel_depedentePF`),
  KEY `fk_tbl_hotel_depedentePF_tbl_hotel1` (`id_hoteis`),
  KEY `fk_tbl_hotel_depedentePF_tbl_dependentePF1` (`id_dependentePF_ticket`),
  KEY `fk_tbl_hotel_depedentePF_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela usada para cadastrar reserva de dependetes Pessoa Fis' AUTO_INCREMENT=1 ;

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
(5, 'RENT CAR', 'http://www.rental-line.com.br/', '(11) 6666-6666', 'contato@rental-line.com.br/', '/var/www/7brasil/skin/img/uploaded/574537cfcb04e417f5496ca26a195159.jpg', 'Rent Car descrição', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_moeda`
--

CREATE TABLE IF NOT EXISTS `tbl_moeda` (
  `id_moeda` int(11) NOT NULL AUTO_INCREMENT,
  `id_cambio` int(11) NOT NULL,
  `dt_moeda` datetime NOT NULL,
  `valor_moeda` decimal(9,2) NOT NULL,
  PRIMARY KEY (`id_moeda`),
  KEY `fk_tbl_moeda_tbl_cambio1` (`id_cambio`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela com valor do cambio no dia da venda' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_origem`
--

CREATE TABLE IF NOT EXISTS `tbl_origem` (
  `id_origem` int(11) NOT NULL AUTO_INCREMENT,
  `nome_origem` varchar(99) NOT NULL,
  `descricao_origem` text,
  `status_origem` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_origem`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='origem de saida de uma passagem aérea' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_outroProd_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_outroProd_clientePJ` (
  `id_outroProd_clientePJ` int(11) NOT NULL AUTO_INCREMENT,
  `id_produto` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_outroProd_clientePJ`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_produtoOutros1` (`id_produto`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_outroProd_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabele usada para adicionar outros produtos na venda de clie' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela para indetificar se o cliente é pagante e participant' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_passagens`
--

CREATE TABLE IF NOT EXISTS `tbl_passagens` (
  `id_passagens` int(11) NOT NULL AUTO_INCREMENT,
  `id_compania` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_classe` int(11) NOT NULL,
  `id_destino` int(11) NOT NULL,
  `id_origem` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `voo_passagens` varchar(45) NOT NULL,
  `data_passagens` date NOT NULL,
  `saida_passagens` time NOT NULL,
  `chegada_passagens` time NOT NULL,
  `bagagem_passagens` int(2) DEFAULT NULL,
  `assento_passagens` varchar(45) DEFAULT NULL,
  `voucher_passagens` varchar(99) DEFAULT NULL,
  `ticket_passagens` varchar(45) DEFAULT NULL,
  `tarifa_passagens` decimal(9,2) NOT NULL COMMENT 'Taxa de embarque da companhia',
  `valor_casa_passagens` decimal(9,2) NOT NULL COMMENT 'Margem de lucro da 7Brasil',
  `tx_embarque_passagens` decimal(9,2) NOT NULL,
  `tx_outras_passagens` decimal(9,2) DEFAULT NULL COMMENT 'taxas extra',
  `tx_repasse_passagens` varchar(45) DEFAULT NULL COMMENT 'Esse campo é o \nDU/RAV\numa taxa repassada\ndas compania aéreas \npara a agencia',
  PRIMARY KEY (`id_passagens`),
  KEY `fk_passagens_compania` (`id_compania`),
  KEY `fk_tbl_passagens_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_passagens_tbl_classe_voo1` (`id_classe`),
  KEY `fk_tbl_passagens_tbl_destino1` (`id_destino`),
  KEY `fk_tbl_passagens_tbl_origem1` (`id_origem`),
  KEY `fk_tbl_passagens_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Dados da passagem aérea\n' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_passagens_clientePJ`
--

CREATE TABLE IF NOT EXISTS `tbl_passagens_clientePJ` (
  `id_passagens_clientePJ` int(11) NOT NULL,
  `id_passagens` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_passagens_clientePJ`),
  KEY `fk_tbl_passagens_clientePJ_tbl_passagens1` (`id_passagens`),
  KEY `fk_tbl_passagens_clientePJ_tbl_venda1` (`id_venda`),
  KEY `fk_tbl_passagens_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_passagens_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela usada para reserva de passagens aére para cliente Pes';

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
  `id_moeda` int(11) NOT NULL,
  `titulo_produto` varchar(99) COLLATE utf8_unicode_ci NOT NULL,
  `valor_produto` decimal(9,2) NOT NULL,
  `fornecedor_produto` varchar(99) COLLATE utf8_unicode_ci DEFAULT NULL,
  `comissao_produto` double DEFAULT NULL,
  `descricao_produto` text COLLATE utf8_unicode_ci,
  `dt_inicio_produto` datetime DEFAULT NULL,
  `dt_final_produto` datetime DEFAULT NULL,
  PRIMARY KEY (`id_produto`),
  KEY `fk_tbl_produtoDesconhecido_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela de produtos desconhecidos' AUTO_INCREMENT=1 ;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='Dados da seguradora cadastra pela 7Brasil' AUTO_INCREMENT=4 ;

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
  `id_seguradora` int(11) NOT NULL,
  `id_tipoSeguro` int(11) NOT NULL,
  `id_continente` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `dt_inicio_seguro` date NOT NULL,
  `dt_fim_seguro` date NOT NULL,
  `valor_seguro` decimal(9,2) NOT NULL,
  `valor_casa_seguro` decimal(9,2) NOT NULL,
  `voucher_seguro` varchar(199) DEFAULT NULL,
  PRIMARY KEY (`id_seguro`),
  KEY `fk_seguro_seguradora` (`id_seguradora`),
  KEY `fk_seguro_tipoSeguro` (`id_tipoSeguro`),
  KEY `fk_seguro_continente` (`id_continente`),
  KEY `fk_tbl_seguro_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Informações de seguro oferecido pela empresa parceira de 7 b' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_subgrupo`
--

CREATE TABLE IF NOT EXISTS `tbl_subgrupo` (
  `id_subgrupo` int(11) NOT NULL,
  `id_grupo` int(11) NOT NULL,
  `titulo_subgrupo` varchar(65) COLLATE utf8_unicode_ci NOT NULL,
  `descricao_subgrupo` text COLLATE utf8_unicode_ci,
  `status_subgrupo` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`id_subgrupo`),
  KEY `fk_tbl_subgrupo_tbl_grupo1` (`id_grupo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='tabela de subgrupo de  grupo de contas a pagar da filial';

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

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
  `id_ticket_clientePJ` int(11) NOT NULL,
  `id_compraTicket` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  `id_venda` int(11) NOT NULL,
  PRIMARY KEY (`id_ticket_clientePJ`),
  KEY `fk_tbl_ticket_clientePJ_tbl_compraTicket1` (`id_compraTicket`),
  KEY `fk_tbl_ticket_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_ticket_clientePJ_tbl_dependentePJ1` (`id_dependentePJ`),
  KEY `fk_tbl_ticket_clientePJ_tbl_venda1` (`id_venda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

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
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_tipoCartao`
--

INSERT INTO `tbl_tipoCartao` (`id_tipoCartao`, `titulo_tipoCartao`, `descricao_tipoCartao`, `status_tipoCartao`) VALUES
(1, 'Master Card', 'Descrição Teste', 1),
(2, 'VIsa', 'Descrição Teste', 1);

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_tipoComp`
--

CREATE TABLE IF NOT EXISTS `tbl_tipoComp` (
  `id_tipocomp` int(11) NOT NULL AUTO_INCREMENT,
  `titulo_tipocomp` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id_tipocomp`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 COMMENT='tabela para especificar se companhia é intermacional ou naci' AUTO_INCREMENT=5 ;

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
(1, 'DINHEIRO', '0', 0, 'Dinheiro vivo', 1),
(2, 'BOLETO ', '0', 0, 'Pagamento pelo boleto bancario', 1),
(3, 'CARTãO DE CRéDITO', '5', 30, '', 1);

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
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COMMENT='Qual o tipo de seguro que a seguradora oferece' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_usuario`
--

CREATE TABLE IF NOT EXISTS `tbl_usuario` (
  `id_usuario` int(11) NOT NULL AUTO_INCREMENT,
  `id_grupo` int(11) NOT NULL,
  `id_empresa` int(11) NOT NULL,
  `nome_usuario` varchar(199) NOT NULL,
  `login_usuario` varchar(45) NOT NULL,
  `senha_usuario` varchar(50) NOT NULL,
  `status_usuario` tinyint(1) DEFAULT '1',
  `porcentagem_usuario` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_usuario`),
  KEY `fk_usuario_grupo` (`id_grupo`),
  KEY `fk_tbl_usuario_tbl_empresa1` (`id_empresa`)
) ENGINE=InnoDB  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Extraindo dados da tabela `tbl_usuario`
--

INSERT INTO `tbl_usuario` (`id_usuario`, `id_grupo`, `id_empresa`, `nome_usuario`, `login_usuario`, `senha_usuario`, `status_usuario`, `porcentagem_usuario`) VALUES
(1, 1, 1, 'WESLEI ANDRADE', 'wesley1263', 'e10adc3949ba59abbe56e057f20f883e', 1, '10'),
(2, 2, 1, 'RAQUEL LIMA ANDRADE', 'raquel1263', 'e10adc3949ba59abbe56e057f20f883e', 1, '');

-- --------------------------------------------------------

--
-- Estrutura da tabela `tbl_venda`
--

CREATE TABLE IF NOT EXISTS `tbl_venda` (
  `id_venda` int(11) NOT NULL AUTO_INCREMENT,
  `id_usuario` int(11) NOT NULL,
  `id_moeda` int(11) NOT NULL,
  `id_agencia` int(11) DEFAULT NULL,
  `id_agente` int(11) DEFAULT NULL,
  `porcentagem_agencia` double DEFAULT NULL,
  `porcentagem_casa` double NOT NULL,
  `total_venda` decimal(9,2) NOT NULL,
  `descricao_venda` text COLLATE utf8_unicode_ci,
  `data_venda` datetime DEFAULT NULL,
  `status_venda` tinyint(1) DEFAULT '0' COMMENT '0 - Processando\n1 - Concluido\n2 - Cancelado',
  `nm_processo_venda` varchar(45) COLLATE utf8_unicode_ci NOT NULL COMMENT 'campo para identificar\no processo da venda\nModelo:\nID_AGENTE.MES.ANO.ID_VENDA\nexemplo:\n001121345',
  PRIMARY KEY (`id_venda`),
  KEY `fk_venda_agencia` (`id_agencia`),
  KEY `fk_tbl_venda_tbl_agentes1` (`id_agente`),
  KEY `fk_tbl_venda_tbl_usuario1` (`id_usuario`),
  KEY `fk_tbl_venda_tbl_moeda1` (`id_moeda`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='Tabela que ira armazenar todas as vendas da empresa' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_clientePF`
--

CREATE TABLE IF NOT EXISTS `venda_clientePF` (
  `id_venda` int(11) NOT NULL,
  `id_clientePF` int(11) NOT NULL,
  `id_dependentePF` int(11) DEFAULT NULL,
  PRIMARY KEY (`id_venda`,`id_clientePF`),
  KEY `fk_tbl_venda_has_tbl_clientePF_tbl_clientePF1` (`id_clientePF`),
  KEY `fk_tbl_venda_has_tbl_clientePF_tbl_venda1` (`id_venda`),
  KEY `fk_venda_clientePF_1_dependentePF` (`id_dependentePF`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Estrutura da tabela `venda_clientePJ`
--

CREATE TABLE IF NOT EXISTS `venda_clientePJ` (
  `id_venda` int(11) NOT NULL,
  `id_clientePJ` int(11) NOT NULL,
  `id_dependentePJ` int(11) NOT NULL,
  PRIMARY KEY (`id_venda`,`id_clientePJ`,`id_dependentePJ`),
  KEY `fk_tbl_venda_has_tbl_clientePJ_tbl_clientePJ1` (`id_clientePJ`),
  KEY `fk_tbl_venda_has_tbl_clientePJ_tbl_venda1` (`id_venda`),
  KEY `fk_venda_clientePJ_1_dependente` (`id_dependentePJ`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Constraints for dumped tables
--

--
-- Limitadores para a tabela `tbl_adcionarDependentePF`
--
ALTER TABLE `tbl_adcionarDependentePF`
  ADD CONSTRAINT `fk_tbl_adcionarDependentePF_tbl_dependentePF1` FOREIGN KEY (`id_dependentePF`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_adcionarDependentePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_adcionarDependentePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Limitadores para a tabela `tbl_asseguradoPF`
--
ALTER TABLE `tbl_asseguradoPF`
  ADD CONSTRAINT `fk_tbl_asseguradoPF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_asseguradoPF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_seguro_has_tbl_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_seguro_has_tbl_clientePF_tbl_seguro1` FOREIGN KEY (`id_seguro`) REFERENCES `tbl_seguro` (`id_seguro`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_asseguradoPJ`
--
ALTER TABLE `tbl_asseguradoPJ`
  ADD CONSTRAINT `fk_assegurado_cliente` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_assegurado_dependente` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_assegurado_seguro` FOREIGN KEY (`id_seguro`) REFERENCES `tbl_seguro` (`id_seguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_asseguradoPJ_tbl_dependentePF1` FOREIGN KEY (`id_dependentePF`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_brokers_hotel`
--
ALTER TABLE `tbl_brokers_hotel`
  ADD CONSTRAINT `fk_tbl_brokers_has_tbl_hotel_tbl_brokers1` FOREIGN KEY (`id_brokers`) REFERENCES `tbl_brokers` (`id_brokers`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_brokers_has_tbl_hotel_tbl_hotel1` FOREIGN KEY (`id_hoteis`) REFERENCES `tbl_hotel` (`id_hoteis`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_carro`
--
ALTER TABLE `tbl_carro`
  ADD CONSTRAINT `fk_carros_locadora` FOREIGN KEY (`id_locadora`) REFERENCES `tbl_locadora` (`id_locadora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_carro_clientePF`
--
ALTER TABLE `tbl_carro_clientePF`
  ADD CONSTRAINT `fk_tbl_carro_clientePF_tbl_carro1` FOREIGN KEY (`id_carros`) REFERENCES `tbl_carro` (`id_carros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_carro_clientePJ`
--
ALTER TABLE `tbl_carro_clientePJ`
  ADD CONSTRAINT `fk_tbl_carro_clientePJ_tbl_carro1` FOREIGN KEY (`id_carros`) REFERENCES `tbl_carro` (`id_carros`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePJ_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_carro_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cartaoPJ`
--
ALTER TABLE `tbl_cartaoPJ`
  ADD CONSTRAINT `fk_cartao_clientePJ` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
  ADD CONSTRAINT `fk_tbl_cliente_ticket_tbl_clientePF1` FOREIGN KEY (`tbl_clientePF_id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cliente_ticket_tbl_compraTicket1` FOREIGN KEY (`id_compraTicket`) REFERENCES `tbl_compraTicket` (`id_compraTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cliente_ticket_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cliente_ticket_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_compania`
--
ALTER TABLE `tbl_compania`
  ADD CONSTRAINT `fk_tbl_compania_tbl_tipoComp1` FOREIGN KEY (`id_tipocomp`) REFERENCES `tbl_tipoComp` (`id_tipocomp`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_compraTicket`
--
ALTER TABLE `tbl_compraTicket`
  ADD CONSTRAINT `fk_tbl_compraTicket_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_compraTicket_tbl_ticket1` FOREIGN KEY (`id_ticket`) REFERENCES `tbl_ticket` (`id_ticket`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_contas`
--
ALTER TABLE `tbl_contas`
  ADD CONSTRAINT `fk_tbl_contas_tbl_filial1` FOREIGN KEY (`id_filial`) REFERENCES `tbl_filial` (`id_filial`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_contas_tbl_grupo1` FOREIGN KEY (`id_grupo`) REFERENCES `tbl_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_contas_tbl_subgrupo1` FOREIGN KEY (`id_subgrupo`) REFERENCES `tbl_subgrupo` (`id_subgrupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cruzeiro`
--
ALTER TABLE `tbl_cruzeiro`
  ADD CONSTRAINT `fk_tbl_cruzeiro_tbl_compania_cruzeiro1` FOREIGN KEY (`id_compania_cruzeiro`) REFERENCES `tbl_compania_cruzeiro` (`id_compania_cruzeiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cruzeiro_clientePF`
--
ALTER TABLE `tbl_cruzeiro_clientePF`
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_cruzeiro1` FOREIGN KEY (`id_cruzeiro`) REFERENCES `tbl_cruzeiro` (`id_cruzeiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cruzeiro_clientePJ`
--
ALTER TABLE `tbl_cruzeiro_clientePJ`
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_cruzeiro1` FOREIGN KEY (`id_cruzeiro`) REFERENCES `tbl_cruzeiro` (`id_cruzeiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_cruzeiro_dependentePF`
--
ALTER TABLE `tbl_cruzeiro_dependentePF`
  ADD CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_cruzeiro1` FOREIGN KEY (`id_cruzeiro`) REFERENCES `tbl_cruzeiro` (`id_cruzeiro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_dependentePF1` FOREIGN KEY (`id_dependentePF`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_departamento`
--
ALTER TABLE `tbl_departamento`
  ADD CONSTRAINT `fk_tbl_departamento_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `tbl_departamento_ibfk_1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`);

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
-- Limitadores para a tabela `tbl_formaPagamento`
--
ALTER TABLE `tbl_formaPagamento`
  ADD CONSTRAINT `fk_tbl_formaPagamento_tbl_tipoPagamento1` FOREIGN KEY (`id_tipoPagamento`) REFERENCES `tbl_tipoPagamento` (`id_tipoPagamento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_formaPagamento_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_hotel_clientePF`
--
ALTER TABLE `tbl_hotel_clientePF`
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_hotel1` FOREIGN KEY (`id_hoteis`) REFERENCES `tbl_hotel` (`id_hoteis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_participacao1` FOREIGN KEY (`id_participacao`) REFERENCES `tbl_participacao` (`id_participacao`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_hotel_clientePJ`
--
ALTER TABLE `tbl_hotel_clientePJ`
  ADD CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_hotel_depedentePF`
--
ALTER TABLE `tbl_hotel_depedentePF`
  ADD CONSTRAINT `fk_tbl_hotel_depedentePF_tbl_dependentePF1` FOREIGN KEY (`id_dependentePF_ticket`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_depedentePF_tbl_hotel1` FOREIGN KEY (`id_hoteis`) REFERENCES `tbl_hotel` (`id_hoteis`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_hotel_depedentePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Limitadores para a tabela `tbl_outroProd_clientePJ`
--
ALTER TABLE `tbl_outroProd_clientePJ`
  ADD CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_produtoOutros1` FOREIGN KEY (`id_produto`) REFERENCES `tbl_produtoOutros` (`id_produto`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_passagens`
--
ALTER TABLE `tbl_passagens`
  ADD CONSTRAINT `fk_passagens_compania` FOREIGN KEY (`id_compania`) REFERENCES `tbl_compania` (`id_compania`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_tbl_classe_voo1` FOREIGN KEY (`id_classe`) REFERENCES `tbl_classe_voo` (`id_classe`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_tbl_destino1` FOREIGN KEY (`id_destino`) REFERENCES `tbl_destino` (`id_destino`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_tbl_origem1` FOREIGN KEY (`id_origem`) REFERENCES `tbl_origem` (`id_origem`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_passagens_clientePJ`
--
ALTER TABLE `tbl_passagens_clientePJ`
  ADD CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_passagens1` FOREIGN KEY (`id_passagens`) REFERENCES `tbl_passagens` (`id_passagens`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_permissoes`
--
ALTER TABLE `tbl_permissoes`
  ADD CONSTRAINT `fk_tbl_permissoes_tbl_grupo1` FOREIGN KEY (`id_grupo`) REFERENCES `tbl_grupo` (`id_grupo`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_produtoOutros`
--
ALTER TABLE `tbl_produtoOutros`
  ADD CONSTRAINT `fk_tbl_produtoDesconhecido_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `tbl_seguro`
--
ALTER TABLE `tbl_seguro`
  ADD CONSTRAINT `fk_seguro_continente` FOREIGN KEY (`id_continente`) REFERENCES `tbl_continente` (`id_continente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seguro_seguradora` FOREIGN KEY (`id_seguradora`) REFERENCES `tbl_seguradora` (`id_seguradora`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_seguro_tipoSeguro` FOREIGN KEY (`id_tipoSeguro`) REFERENCES `tbl_tipoSeguro` (`id_tipoSeguro`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_seguro_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Limitadores para a tabela `tbl_ticket_clientePJ`
--
ALTER TABLE `tbl_ticket_clientePJ`
  ADD CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_compraTicket1` FOREIGN KEY (`id_compraTicket`) REFERENCES `tbl_compraTicket` (`id_compraTicket`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_dependentePJ1` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION;

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
-- Limitadores para a tabela `tbl_venda`
--
ALTER TABLE `tbl_venda`
  ADD CONSTRAINT `fk_tbl_venda_tbl_agentes1` FOREIGN KEY (`id_agente`) REFERENCES `tbl_agentes` (`id_agente`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_venda_tbl_moeda1` FOREIGN KEY (`id_moeda`) REFERENCES `tbl_moeda` (`id_moeda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_venda_tbl_usuario1` FOREIGN KEY (`id_usuario`) REFERENCES `tbl_usuario` (`id_usuario`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_agencia` FOREIGN KEY (`id_agencia`) REFERENCES `tbl_agencia` (`id_agencia`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda_clientePF`
--
ALTER TABLE `venda_clientePF`
  ADD CONSTRAINT `fk_tbl_venda_has_tbl_clientePF_tbl_clientePF1` FOREIGN KEY (`id_clientePF`) REFERENCES `tbl_clientePF` (`id_clientePF`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_venda_has_tbl_clientePF_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_clientePF_1_dependentePF` FOREIGN KEY (`id_dependentePF`) REFERENCES `tbl_dependentePF` (`id_dependentePF`) ON DELETE NO ACTION ON UPDATE NO ACTION;

--
-- Limitadores para a tabela `venda_clientePJ`
--
ALTER TABLE `venda_clientePJ`
  ADD CONSTRAINT `fk_tbl_venda_has_tbl_clientePJ_tbl_clientePJ1` FOREIGN KEY (`id_clientePJ`) REFERENCES `tbl_clientePJ` (`id_clientePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_tbl_venda_has_tbl_clientePJ_tbl_venda1` FOREIGN KEY (`id_venda`) REFERENCES `tbl_venda` (`id_venda`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  ADD CONSTRAINT `fk_venda_clientePJ_1_dependente` FOREIGN KEY (`id_dependentePJ`) REFERENCES `tbl_dependentePJ` (`id_dependentePJ`) ON DELETE NO ACTION ON UPDATE NO ACTION;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
