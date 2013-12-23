SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='TRADITIONAL';

CREATE SCHEMA IF NOT EXISTS `db_7brasil` DEFAULT CHARACTER SET utf8 COLLATE utf8_unicode_ci ;
USE `db_7brasil` ;

-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_grupo` (
  `id_grupo` INT NOT NULL ,
  `titulo_grupo` VARCHAR(45) NOT NULL ,
  `descricao_grupo` TEXT NULL ,
  `status_grupo` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_grupo`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'tabela de grupo de contas a pagar';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_empresa`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_empresa` (
  `id_empresa` INT NOT NULL AUTO_INCREMENT ,
  `razaosocial_empresa` VARCHAR(99) NULL ,
  `nomefantasia_empresa` VARCHAR(99) NULL ,
  `cnpj_empresa` VARCHAR(45) NULL ,
  `descricao_empresa` TEXT NULL ,
  `logotipo_empresa` VARCHAR(99) NULL ,
  PRIMARY KEY (`id_empresa`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'dados da empresa central';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_usuario`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_usuario` (
  `id_usuario` INT NOT NULL AUTO_INCREMENT ,
  `id_grupo` INT NOT NULL ,
  `id_empresa` INT NOT NULL ,
  `nome_usuario` VARCHAR(199) NOT NULL ,
  `login_usuario` VARCHAR(45) NOT NULL ,
  `senha_usuario` VARCHAR(50) NOT NULL ,
  `status_usuario` TINYINT(1) NULL DEFAULT 1 ,
  `porcentagem_usuario` DOUBLE(9,2) NULL ,
  PRIMARY KEY (`id_usuario`) ,
  INDEX `fk_usuario_grupo` (`id_grupo` ASC) ,
  INDEX `fk_tbl_usuario_tbl_empresa1` (`id_empresa` ASC) ,
  CONSTRAINT `fk_usuario_grupo`
    FOREIGN KEY (`id_grupo` )
    REFERENCES `db_7brasil`.`tbl_grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_usuario_tbl_empresa1`
    FOREIGN KEY (`id_empresa` )
    REFERENCES `db_7brasil`.`tbl_empresa` (`id_empresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_permissoes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_permissoes` (
  `id_permissoes` INT NOT NULL AUTO_INCREMENT ,
  `id_grupo` INT NOT NULL ,
  `class_permissoes` VARCHAR(15) NOT NULL ,
  `method_permissoes` VARCHAR(15) NOT NULL ,
  PRIMARY KEY (`id_permissoes`) ,
  INDEX `fk_tbl_permissoes_tbl_grupo1` (`id_grupo` ASC) ,
  CONSTRAINT `fk_tbl_permissoes_tbl_grupo1`
    FOREIGN KEY (`id_grupo` )
    REFERENCES `db_7brasil`.`tbl_grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_agencia`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_agencia` (
  `id_agencia` INT NOT NULL AUTO_INCREMENT ,
  `razaosocial_agencia` VARCHAR(99) NULL ,
  `nomefantasia_agencia` VARCHAR(99) NOT NULL ,
  `cnpj_agencia` VARCHAR(45) NOT NULL ,
  `endereco_agencia` VARCHAR(45) NULL ,
  `numero_agencia` VARCHAR(10) NULL ,
  `bairro_agencia` VARCHAR(45) NULL ,
  `cidade_agencia` VARCHAR(45) NULL ,
  `uf_agencia` VARCHAR(10) NULL ,
  `cep_agencia` VARCHAR(15) NULL ,
  `site_agencia` VARCHAR(99) NULL ,
  `email_agencia` VARCHAR(99) NULL ,
  `telefone_agencia` VARCHAR(15) NULL ,
  `descricao_agencia` TEXT NULL ,
  `status_agencia` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_agencia`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_clientePJ` (
  `id_clientePJ` INT NOT NULL AUTO_INCREMENT ,
  `razaosocial_ClientePJ` VARCHAR(99) NULL ,
  `nomefantasia_clientePJ` VARCHAR(99) NOT NULL ,
  `cnpj_clientePJ` VARCHAR(25) NOT NULL ,
  `logotipo_clientePJ` VARCHAR(99) NULL ,
  `telefone_clientePJ` VARCHAR(15) NULL ,
  `endereco_clientePJ` VARCHAR(99) NULL ,
  `numero_clientePJ` VARCHAR(15) NULL ,
  `complemento_clientePJ` VARCHAR(45) NULL ,
  `bairro_clientePJ` VARCHAR(45) NULL ,
  `cidade_clientePJ` VARCHAR(45) NULL ,
  `uf_clientePJ` VARCHAR(15) NULL ,
  `pais_clientePJ` VARCHAR(45) NULL ,
  `telefone_responsavel_clientePJ` VARCHAR(15) NULL ,
  `nomeresponsavel_clientePJ` VARCHAR(99) NOT NULL ,
  `rg_responsavel_clientePJ` VARCHAR(20) NULL ,
  `email_responsavel_clientePJ` VARCHAR(99) NULL ,
  `cpf_responsavel_clientePJ` VARCHAR(20) NULL ,
  `status_clientePJ` TINYINT(1) NULL DEFAULT 1 ,
  `descricao_clientePJ` TEXT NULL ,
  `credito_clientePJ` DECIMAL(9,2) NULL ,
  PRIMARY KEY (`id_clientePJ`) )
ENGINE = InnoDB
COMMENT = 'dados da empresa que vai patrocinar a compra de produtos na ' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_brokers`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_brokers` (
  `id_brokers` INT NOT NULL AUTO_INCREMENT ,
  `site_brokers` VARCHAR(99) NOT NULL ,
  `email_brokers` VARCHAR(99) NULL ,
  `telefone_brokers` VARCHAR(16) NULL ,
  `logotipo_brokers` VARCHAR(199) NULL ,
  `descricao_brokers` TEXT NULL DEFAULT '1' ,
  `status_brokers` TINYINT(1) NULL ,
  PRIMARY KEY (`id_brokers`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_locadora`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_locadora` (
  `id_locadora` INT NOT NULL AUTO_INCREMENT ,
  `nome_locadora` VARCHAR(99) NOT NULL ,
  `site_locadora` VARCHAR(99) NULL ,
  `telefone_locadora` VARCHAR(16) NULL ,
  `email_locadora` VARCHAR(199) NULL ,
  `descricao_locadora` TEXT NULL ,
  `status_locadora` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_locadora`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_dependentePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_dependentePJ` (
  `id_dependentePJ` INT NOT NULL AUTO_INCREMENT ,
  `id_clientePJ` INT NOT NULL ,
  `nome_dependentePJ` VARCHAR(99) NOT NULL ,
  `dt_nascimento_dependentePJ` DATE NULL ,
  `cpf_dependentePJ` VARCHAR(20) NOT NULL ,
  `rg_dependentePJ` VARCHAR(15) NULL ,
  `telefone_dependentePJ` VARCHAR(20) NULL ,
  `celular_dependentePJ` VARCHAR(15) NULL ,
  `email_dependentePJ` VARCHAR(99) NULL ,
  `numero_passaporte_dependentePJ` VARCHAR(20) NULL ,
  `dt_validade_passaporte_dependentePJ` DATE NULL ,
  `foto_dependentePJ` VARCHAR(99) NULL ,
  `copia_rg_dependentePJ` VARCHAR(99) NULL ,
  `copia_cpf_dependentePJ` VARCHAR(99) NULL ,
  `descricao_dependentePJ` TEXT NULL ,
  `status_dependentePJ` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_dependentePJ`) ,
  INDEX `fk_dependente_cliente` (`id_clientePJ` ASC) ,
  CONSTRAINT `fk_dependente_cliente`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Dados do funcionario da empresa (ClientePJ)';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_hotel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_hotel` (
  `id_hoteis` INT NOT NULL AUTO_INCREMENT ,
  `nome_hotel` VARCHAR(99) NOT NULL ,
  `endereco_hotel` VARCHAR(199) NOT NULL ,
  `numero_hotel` VARCHAR(9) NULL ,
  `cep_hotel` VARCHAR(20) NULL ,
  `cidade_hotel` VARCHAR(45) NULL ,
  `uf_hotel` VARCHAR(10) NULL ,
  `telefone_hotel` VARCHAR(45) NULL ,
  `email_hotel` VARCHAR(99) NULL ,
  `descricao_hotel` TEXT NULL ,
  `voucher_hotel` VARCHAR(199) NULL ,
  `valor_hotel` DECIMAL(9,2) NULL ,
  `valor_casa_hotel` DECIMAL(9,2) NULL COMMENT 'valor de lucro da 7brasil' ,
  PRIMARY KEY (`id_hoteis`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cambio`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cambio` (
  `id_cambio` INT NOT NULL AUTO_INCREMENT ,
  `titulo_cambio` VARCHAR(45) NOT NULL ,
  `descricao_cambio` TEXT NULL ,
  `status_cambio` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_cambio`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela com nomes das moedas internacional';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_moeda`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_moeda` (
  `id_moeda` INT NOT NULL AUTO_INCREMENT ,
  `id_cambio` INT NOT NULL ,
  `dt_moeda` DATETIME NOT NULL ,
  `valor_moeda` DECIMAL(9,2) NOT NULL ,
  PRIMARY KEY (`id_moeda`) ,
  INDEX `fk_tbl_moeda_tbl_cambio1` (`id_cambio` ASC) ,
  CONSTRAINT `fk_tbl_moeda_tbl_cambio1`
    FOREIGN KEY (`id_cambio` )
    REFERENCES `db_7brasil`.`tbl_cambio` (`id_cambio` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela com valor do cambio no dia da venda';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_carro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_carro` (
  `id_carros` INT NOT NULL AUTO_INCREMENT ,
  `id_locadora` INT NOT NULL ,
  `id_moeda` INT NOT NULL ,
  `dt_inicio_carro` DATETIME NOT NULL ,
  `dt_devolucao_carro` DATETIME NOT NULL ,
  `local_incio_carro` VARCHAR(99) NOT NULL ,
  `local_devolucao_carro` VARCHAR(99) NOT NULL ,
  `voucher_carro` VARCHAR(199) NOT NULL ,
  `descricao_carro` TEXT NULL ,
  `valor_carro` DECIMAL(9,2) NOT NULL COMMENT 'Valor cobrado pela empresa \npara alugar o carro.\n' ,
  `valor_casa_carro` DECIMAL(9,2) NOT NULL COMMENT 'valor do lucro\nda 7Brasil' ,
  `taxa_carro` DECIMAL(9,2) NULL COMMENT 'Taxa extra cobrado pela \nempresa para alguma \neventualidade.' ,
  PRIMARY KEY (`id_carros`) ,
  INDEX `fk_carros_locadora` (`id_locadora` ASC) ,
  INDEX `fk_tbl_carro_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_carros_locadora`
    FOREIGN KEY (`id_locadora` )
    REFERENCES `db_7brasil`.`tbl_locadora` (`id_locadora` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_carro_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'tabela da locação do carro';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_tipoComp`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_tipoComp` (
  `id_tipocomp` INT NOT NULL AUTO_INCREMENT ,
  `titulo_tipocomp` VARCHAR(45) NULL ,
  PRIMARY KEY (`id_tipocomp`) )
ENGINE = InnoDB
COMMENT = 'tabela para especificar se companhia é intermacional ou naci' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_compania`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_compania` (
  `id_compania` INT NOT NULL AUTO_INCREMENT ,
  `id_tipocomp` INT NOT NULL ,
  `nome_compania` VARCHAR(99) NOT NULL ,
  `logotipo_compania` VARCHAR(99) NULL ,
  PRIMARY KEY (`id_compania`) ,
  INDEX `fk_tbl_compania_tbl_tipoComp1` (`id_tipocomp` ASC) ,
  CONSTRAINT `fk_tbl_compania_tbl_tipoComp1`
    FOREIGN KEY (`id_tipocomp` )
    REFERENCES `db_7brasil`.`tbl_tipoComp` (`id_tipocomp` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_agentes`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_agentes` (
  `id_agente` INT NOT NULL AUTO_INCREMENT ,
  `id_agencia` INT NOT NULL ,
  `nome_agente` VARCHAR(99) NOT NULL ,
  `email_agente` VARCHAR(99) NULL ,
  `celular_agente` VARCHAR(15) NULL ,
  `descricao_agente` TEXT NULL ,
  `status_agente` TINYINT(1) NULL DEFAULT 1 ,
  `porcentagem_agente` DOUBLE(9,2) NULL ,
  PRIMARY KEY (`id_agente`) ,
  INDEX `fk_agente_agencia` (`id_agencia` ASC) ,
  CONSTRAINT `fk_agente_agencia`
    FOREIGN KEY (`id_agencia` )
    REFERENCES `db_7brasil`.`tbl_agencia` (`id_agencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_venda`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_venda` (
  `id_venda` INT NOT NULL AUTO_INCREMENT ,
  `id_usuario` INT NOT NULL ,
  `id_moeda` INT NOT NULL ,
  `id_agencia` INT NULL ,
  `id_agente` INT NULL ,
  `porcentagem_agencia` DOUBLE NULL ,
  `porcentagem_casa` DOUBLE NOT NULL ,
  `total_venda` DECIMAL(9,2) NOT NULL ,
  `descricao_venda` TEXT NULL ,
  `data_venda` DATETIME NULL ,
  `status_venda` TINYINT(1) NULL DEFAULT 0 COMMENT '0 - Processando\n1 - Concluido\n2 - Cancelado' ,
  `nm_processo_venda` VARCHAR(45) NOT NULL COMMENT 'campo para identificar\no processo da venda\nModelo:\nID_AGENTE.MES.ANO.ID_VENDA\nexemplo:\n001121345' ,
  PRIMARY KEY (`id_venda`) ,
  INDEX `fk_venda_agencia` (`id_agencia` ASC) ,
  INDEX `fk_tbl_venda_tbl_agentes1` (`id_agente` ASC) ,
  INDEX `fk_tbl_venda_tbl_usuario1` (`id_usuario` ASC) ,
  INDEX `fk_tbl_venda_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_venda_agencia`
    FOREIGN KEY (`id_agencia` )
    REFERENCES `db_7brasil`.`tbl_agencia` (`id_agencia` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_venda_tbl_agentes1`
    FOREIGN KEY (`id_agente` )
    REFERENCES `db_7brasil`.`tbl_agentes` (`id_agente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_venda_tbl_usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `db_7brasil`.`tbl_usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_venda_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela que ira armazenar todas as vendas da empresa';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_classe_voo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_classe_voo` (
  `id_classe` INT NOT NULL AUTO_INCREMENT ,
  `titulo_classe` VARCHAR(45) NOT NULL ,
  `descricao_classe` TEXT NULL ,
  `status_classe` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_classe`) )
ENGINE = InnoDB
COMMENT = 'classes de passagens aérea';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_destino`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_destino` (
  `id_destino` INT NOT NULL AUTO_INCREMENT ,
  `nome_destino` VARCHAR(99) NOT NULL ,
  `descricao_destino` TEXT NULL ,
  `status_destino` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_destino`) )
ENGINE = InnoDB
COMMENT = 'Destino de viagem de passgem aérea';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_origem`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_origem` (
  `id_origem` INT NOT NULL AUTO_INCREMENT ,
  `nome_origem` VARCHAR(99) NOT NULL ,
  `descricao_origem` TEXT NULL ,
  `status_origem` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_origem`) )
ENGINE = InnoDB
COMMENT = 'origem de saida de uma passagem aérea';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_passagens`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_passagens` (
  `id_passagens` INT NOT NULL AUTO_INCREMENT ,
  `id_compania` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_classe` INT NOT NULL ,
  `id_destino` INT NOT NULL ,
  `id_origem` INT NOT NULL ,
  `id_moeda` INT NOT NULL ,
  `voo_passagens` VARCHAR(45) NOT NULL ,
  `data_passagens` DATE NOT NULL ,
  `saida_passagens` TIME NOT NULL ,
  `chegada_passagens` TIME NOT NULL ,
  `bagagem_passagens` INT(2) NULL ,
  `assento_passagens` VARCHAR(45) NULL ,
  `voucher_passagens` VARCHAR(99) NULL ,
  `ticket_passagens` VARCHAR(45) NULL ,
  `tarifa_passagens` DECIMAL(9,2) NOT NULL COMMENT 'Taxa de embarque da companhia' ,
  `valor_casa_passagens` DECIMAL(9,2) NOT NULL COMMENT 'Margem de lucro da 7Brasil' ,
  `tx_embarque_passagens` DECIMAL(9,2) NOT NULL ,
  `tx_outras_passagens` DECIMAL(9,2) NULL COMMENT 'taxas extra' ,
  `tx_repasse_passagens` VARCHAR(45) NULL COMMENT 'Esse campo é o \nDU/RAV\numa taxa repassada\ndas compania aéreas \npara a agencia' ,
  PRIMARY KEY (`id_passagens`) ,
  INDEX `fk_passagens_compania` (`id_compania` ASC) ,
  INDEX `fk_tbl_passagens_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_passagens_tbl_classe_voo1` (`id_classe` ASC) ,
  INDEX `fk_tbl_passagens_tbl_destino1` (`id_destino` ASC) ,
  INDEX `fk_tbl_passagens_tbl_origem1` (`id_origem` ASC) ,
  INDEX `fk_tbl_passagens_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_passagens_compania`
    FOREIGN KEY (`id_compania` )
    REFERENCES `db_7brasil`.`tbl_compania` (`id_compania` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_tbl_classe_voo1`
    FOREIGN KEY (`id_classe` )
    REFERENCES `db_7brasil`.`tbl_classe_voo` (`id_classe` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_tbl_destino1`
    FOREIGN KEY (`id_destino` )
    REFERENCES `db_7brasil`.`tbl_destino` (`id_destino` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_tbl_origem1`
    FOREIGN KEY (`id_origem` )
    REFERENCES `db_7brasil`.`tbl_origem` (`id_origem` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Dados da passagem aérea\n';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_seguradora`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_seguradora` (
  `id_seguradora` INT NOT NULL AUTO_INCREMENT ,
  `nome_seguradora` VARCHAR(99) NOT NULL ,
  `logo_seguradora` VARCHAR(199) NULL ,
  PRIMARY KEY (`id_seguradora`) )
ENGINE = InnoDB
COMMENT = 'Dados da seguradora cadastra pela 7Brasil';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_tipoSeguro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_tipoSeguro` (
  `id_tipoSeguro` INT NOT NULL AUTO_INCREMENT ,
  `nome_tipoSeguro` VARCHAR(99) NOT NULL ,
  `id_seguradora` INT NOT NULL ,
  PRIMARY KEY (`id_tipoSeguro`) ,
  INDEX `fk_tipoSeguro_seguradora` (`id_seguradora` ASC) ,
  CONSTRAINT `fk_tipoSeguro_seguradora`
    FOREIGN KEY (`id_seguradora` )
    REFERENCES `db_7brasil`.`tbl_seguradora` (`id_seguradora` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Qual o tipo de seguro que a seguradora oferece';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_continente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_continente` (
  `id_continente` INT NOT NULL AUTO_INCREMENT ,
  `nome_continente` VARCHAR(45) NOT NULL ,
  `descricao_continente` TEXT NULL ,
  PRIMARY KEY (`id_continente`) )
ENGINE = InnoDB
COMMENT = 'Dado do continente da viagem do assegurado';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_seguro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_seguro` (
  `id_seguro` INT NOT NULL AUTO_INCREMENT ,
  `id_seguradora` INT NOT NULL ,
  `id_tipoSeguro` INT NOT NULL ,
  `id_continente` INT NOT NULL ,
  `id_moeda` INT NOT NULL ,
  `dt_inicio_seguro` DATE NOT NULL ,
  `dt_fim_seguro` DATE NOT NULL ,
  `valor_seguro` DECIMAL(9,2) NOT NULL ,
  `valor_casa_seguro` DECIMAL(9,2) NOT NULL ,
  `voucher_seguro` VARCHAR(199) NULL ,
  PRIMARY KEY (`id_seguro`) ,
  INDEX `fk_seguro_seguradora` (`id_seguradora` ASC) ,
  INDEX `fk_seguro_tipoSeguro` (`id_tipoSeguro` ASC) ,
  INDEX `fk_seguro_continente` (`id_continente` ASC) ,
  INDEX `fk_tbl_seguro_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_seguro_seguradora`
    FOREIGN KEY (`id_seguradora` )
    REFERENCES `db_7brasil`.`tbl_seguradora` (`id_seguradora` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguro_tipoSeguro`
    FOREIGN KEY (`id_tipoSeguro` )
    REFERENCES `db_7brasil`.`tbl_tipoSeguro` (`id_tipoSeguro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_seguro_continente`
    FOREIGN KEY (`id_continente` )
    REFERENCES `db_7brasil`.`tbl_continente` (`id_continente` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_seguro_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
COMMENT = 'Informações de seguro oferecido pela empresa parceira de 7 b' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_tipoPagamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_tipoPagamento` (
  `id_tipoPagamento` INT NOT NULL AUTO_INCREMENT ,
  `titulo_tipoPagamento` VARCHAR(99) NOT NULL ,
  `porcentagem_tipoPagamento` DOUBLE(2,2) NOT NULL ,
  `dias_recebimento_tipoPagamento` INT(2) NOT NULL ,
  `descricao_Pagamento` TEXT NULL ,
  `status_tipoPagamento` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_tipoPagamento`) )
ENGINE = InnoDB
COMMENT = 'Formas de pagamento oferecido pela 7Brasil';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cartaoPJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cartaoPJ` (
  `id_cartaoPJ` INT NOT NULL AUTO_INCREMENT ,
  `id_clientePJ` INT NOT NULL ,
  `numero_cartaoPJ` VARCHAR(20) NOT NULL ,
  `bandeira_cartaoPJ` VARCHAR(45) NOT NULL ,
  `dt_validade_cartaoPJ` DATE NOT NULL ,
  `codigo_seguranca_cartaoPJ` INT(10) NOT NULL ,
  PRIMARY KEY (`id_cartaoPJ`) ,
  INDEX `fk_cartao_clientePJ` (`id_clientePJ` ASC) ,
  CONSTRAINT `fk_cartao_clientePJ`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_departamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_departamento` (
  `id_departamento` INT NOT NULL AUTO_INCREMENT ,
  `id_dependente` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `codigo_centrocusto` VARCHAR(45) NULL COMMENT 'Código utilizado por algumas \nempresas para indentificar o departartamento (Centro de Custo)' ,
  `nome_departmento` VARCHAR(60) NOT NULL ,
  `descricao_departamento` TEXT NULL ,
  `status_departamento` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_departamento`) ,
  INDEX `fk_departamento_dependente` (`id_dependente` ASC) ,
  INDEX `fk_tbl_departamento_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  CONSTRAINT `fk_departamento_dependente`
    FOREIGN KEY (`id_dependente` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_departamento_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'departamento da empresa e do funcionario que vai viajar';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_clientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_clientePF` (
  `id_clientePF` INT NOT NULL AUTO_INCREMENT ,
  `nome_clientePF` VARCHAR(99) NOT NULL ,
  `dataNascimento_clientePF` DATE NULL ,
  `rg_clientePF` VARCHAR(20) NULL ,
  `cpf_clientePF` VARCHAR(20) NOT NULL ,
  `endereco_cliente` VARCHAR(150) NULL ,
  `numero_clientePF` VARCHAR(10) NULL ,
  `bairro_clientePF` VARCHAR(45) NULL ,
  `cidade_clientePF` VARCHAR(45) NULL ,
  `complemento_clientePF` VARCHAR(20) NULL ,
  `uf_clientePF` VARCHAR(15) NULL ,
  `email_clientePF` VARCHAR(150) NULL ,
  `telefone_clientePF` VARCHAR(15) NULL ,
  `celular_clientePF` VARCHAR(15) NULL ,
  `numero_passaporte_clientePF` VARCHAR(45) NULL ,
  `dt_validadePassaporte_clientePF` DATE NULL ,
  `copia_rg_clientePF` VARCHAR(199) NULL ,
  `copia_cpf_clientePF` VARCHAR(199) NULL ,
  `foto_clientePF` VARCHAR(199) NULL ,
  `numero_fidelidade_clientePF` VARCHAR(99) NULL ,
  `descricao_clientePF` TEXT NULL ,
  `status_clientePF` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_clientePF`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_dependentePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_dependentePF` (
  `id_dependentePF` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  `nome_dependentePF` VARCHAR(99) NOT NULL ,
  `dt_nascimento_dependentePF` DATE NULL ,
  `cpf_dependentePF` VARCHAR(20) NOT NULL ,
  `rg_dependentePF` VARCHAR(20) NULL ,
  `telefone_dependentePF` VARCHAR(15) NULL ,
  `celular_dependentePF` VARCHAR(15) NULL ,
  `email_dependentePF` VARCHAR(99) NULL ,
  `numero_passaporte_dependentePF` VARCHAR(20) NULL ,
  `dt_validade_passaporte_dependentePF` DATE NULL ,
  `foto_dependentePF` VARCHAR(99) NULL ,
  `copia_cpf_dependentePF` VARCHAR(99) NULL ,
  `copia_rg_dependentePF` VARCHAR(99) NULL ,
  `descricao_dependentePF` TEXT NULL ,
  PRIMARY KEY (`id_dependentePF`) ,
  INDEX `fk_dependentePF_clientePF` (`id_clientePF` ASC) ,
  CONSTRAINT `fk_dependentePF_clientePF`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_asseguradoPJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_asseguradoPJ` (
  `id_seguro` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  `id_dependentePF` INT NOT NULL ,
  PRIMARY KEY (`id_seguro`, `id_clientePJ`, `id_dependentePJ`) ,
  INDEX `fk_assegurado_cliente` (`id_clientePJ` ASC) ,
  INDEX `fk_assegurado_seguro` (`id_seguro` ASC) ,
  INDEX `fk_assegurado_dependente` (`id_dependentePJ` ASC) ,
  INDEX `fk_tbl_asseguradoPJ_tbl_dependentePF1` (`id_dependentePF` ASC) ,
  CONSTRAINT `fk_assegurado_seguro`
    FOREIGN KEY (`id_seguro` )
    REFERENCES `db_7brasil`.`tbl_seguro` (`id_seguro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assegurado_cliente`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_assegurado_dependente`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_asseguradoPJ_tbl_dependentePF1`
    FOREIGN KEY (`id_dependentePF` )
    REFERENCES `db_7brasil`.`tbl_dependentePF` (`id_dependentePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_participacao`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_participacao` (
  `id_participacao` INT NOT NULL AUTO_INCREMENT ,
  `titulo_participacao` VARCHAR(45) NOT NULL ,
  `descricao_participacao` TEXT NULL ,
  `status_participacao` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_participacao`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela para indetificar se o cliente é pagante e participant' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_asseguradoPF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_asseguradoPF` (
  `id_seguro` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  PRIMARY KEY (`id_seguro`) ,
  INDEX `fk_tbl_seguro_has_tbl_clientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  INDEX `fk_tbl_seguro_has_tbl_clientePF_tbl_seguro1` (`id_seguro` ASC) ,
  INDEX `fk_tbl_asseguradoPF_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_asseguradoPF_tbl_participacao1` (`id_participacao` ASC) ,
  CONSTRAINT `fk_tbl_seguro_has_tbl_clientePF_tbl_seguro1`
    FOREIGN KEY (`id_seguro` )
    REFERENCES `db_7brasil`.`tbl_seguro` (`id_seguro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_seguro_has_tbl_clientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_asseguradoPF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_asseguradoPF_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cartaoPF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cartaoPF` (
  `tbl_cartaoPF` INT NOT NULL ,
  `numero_cartaoPF` VARCHAR(20) NOT NULL ,
  `bandeira_cartaoPF` VARCHAR(45) NOT NULL ,
  `dt_validade_cartaoPF` DATE NOT NULL ,
  `codigo_seguranca_cartaoPF` VARCHAR(10) NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  PRIMARY KEY (`tbl_cartaoPF`) ,
  INDEX `fk_tbl_cartaPF_tbl_clientePF1` (`id_clientePF` ASC) ,
  CONSTRAINT `fk_tbl_cartaPF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`venda_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`venda_clientePJ` (
  `id_venda` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  PRIMARY KEY (`id_venda`, `id_clientePJ`, `id_dependentePJ`) ,
  INDEX `fk_tbl_venda_has_tbl_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_venda_has_tbl_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_venda_clientePJ_1_dependente` (`id_dependentePJ` ASC) ,
  CONSTRAINT `fk_tbl_venda_has_tbl_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_venda_has_tbl_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_clientePJ_1_dependente`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`venda_clientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`venda_clientePF` (
  `id_venda` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  `id_dependentePF` INT NULL ,
  PRIMARY KEY (`id_venda`, `id_clientePF`) ,
  INDEX `fk_tbl_venda_has_tbl_clientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  INDEX `fk_tbl_venda_has_tbl_clientePF_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_venda_clientePF_1_dependentePF` (`id_dependentePF` ASC) ,
  CONSTRAINT `fk_tbl_venda_has_tbl_clientePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_venda_has_tbl_clientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_venda_clientePF_1_dependentePF`
    FOREIGN KEY (`id_dependentePF` )
    REFERENCES `db_7brasil`.`tbl_dependentePF` (`id_dependentePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_brokers_hotel`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_brokers_hotel` (
  `id_brokers` INT NOT NULL ,
  `id_hoteis` INT NOT NULL ,
  PRIMARY KEY (`id_brokers`, `id_hoteis`) ,
  INDEX `fk_tbl_brokers_has_tbl_hotel_tbl_hotel1` (`id_hoteis` ASC) ,
  INDEX `fk_tbl_brokers_has_tbl_hotel_tbl_brokers1` (`id_brokers` ASC) ,
  CONSTRAINT `fk_tbl_brokers_has_tbl_hotel_tbl_brokers1`
    FOREIGN KEY (`id_brokers` )
    REFERENCES `db_7brasil`.`tbl_brokers` (`id_brokers` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_brokers_has_tbl_hotel_tbl_hotel1`
    FOREIGN KEY (`id_hoteis` )
    REFERENCES `db_7brasil`.`tbl_hotel` (`id_hoteis` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_formaPagamento`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_formaPagamento` (
  `id_formaPagamento` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_tipoPagamento` INT NOT NULL ,
  `valor_formaPagamento` DECIMAL(9,2) NOT NULL ,
  `vezes_formaPagamento` INT(2) NOT NULL ,
  PRIMARY KEY (`id_formaPagamento`) ,
  INDEX `fk_tbl_formaPagamento_tbl_tipoPagamento1` (`id_tipoPagamento` ASC) ,
  INDEX `fk_tbl_formaPagamento_tbl_venda1` (`id_venda` ASC) ,
  CONSTRAINT `fk_tbl_formaPagamento_tbl_tipoPagamento1`
    FOREIGN KEY (`id_tipoPagamento` )
    REFERENCES `db_7brasil`.`tbl_tipoPagamento` (`id_tipoPagamento` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_formaPagamento_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_adicionar_cliente`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_adicionar_cliente` (
  `id_adicionar` INT NOT NULL AUTO_INCREMENT ,
  `id_dependentePJ` INT NOT NULL ,
  `id_passagens` INT NOT NULL ,
  PRIMARY KEY (`id_adicionar`) ,
  INDEX `fk_tbl_adicionar_cliente_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  INDEX `fk_tbl_adicionar_cliente_tbl_passagens1` (`id_passagens` ASC) ,
  CONSTRAINT `fk_tbl_adicionar_cliente_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_adicionar_cliente_tbl_passagens1`
    FOREIGN KEY (`id_passagens` )
    REFERENCES `db_7brasil`.`tbl_passagens` (`id_passagens` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'tabela usada para adicionar cliente cadastrado na reserva de' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_adicionaClientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_adicionaClientePF` (
  `id_adicionaClientePF` INT NOT NULL AUTO_INCREMENT ,
  `id_clientePF` INT NOT NULL ,
  `id_passagens` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  PRIMARY KEY (`id_adicionaClientePF`) ,
  INDEX `fk_tbl_adicionaClientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  INDEX `fk_tbl_adicionaClientePF_tbl_passagens1` (`id_passagens` ASC) ,
  INDEX `fk_tbl_adicionaClientePF_tbl_participacao1` (`id_participacao` ASC) ,
  INDEX `fk_tbl_adicionaClientePF_tbl_venda1` (`id_venda` ASC) ,
  CONSTRAINT `fk_tbl_adicionaClientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_adicionaClientePF_tbl_passagens1`
    FOREIGN KEY (`id_passagens` )
    REFERENCES `db_7brasil`.`tbl_passagens` (`id_passagens` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_adicionaClientePF_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_adicionaClientePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'tabela usada para adicionar cliente pessoa fisica nas passag' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_filial`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_filial` (
  `id_filial` INT NOT NULL AUTO_INCREMENT ,
  `id_empresa` INT NOT NULL ,
  `nome_fillial` VARCHAR(99) NOT NULL ,
  `endereco_filial` VARCHAR(99) NULL ,
  `numero_filial` VARCHAR(20) NULL ,
  `complemento_filial` VARCHAR(20) NULL ,
  `bairro_filial` VARCHAR(45) NULL ,
  `cidade_filial` VARCHAR(45) NULL ,
  `uf_filial` VARCHAR(45) NULL ,
  `pais_fililal` VARCHAR(45) NULL ,
  `descricao_filial` TEXT NULL ,
  `status_fillal` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_filial`) ,
  INDEX `fk_tbl_filial_tbl_empresa1` (`id_empresa` ASC) ,
  CONSTRAINT `fk_tbl_filial_tbl_empresa1`
    FOREIGN KEY (`id_empresa` )
    REFERENCES `db_7brasil`.`tbl_empresa` (`id_empresa` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela das filiais da empresa';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_telefone`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_telefone` (
  `id_telefone` INT NOT NULL AUTO_INCREMENT ,
  `id_filial` INT NOT NULL ,
  `numero_telefone` VARCHAR(20) NOT NULL ,
  `descricao_telefone` TEXT NULL ,
  `status_telefone` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_telefone`) ,
  INDEX `fk_tbl_telefone_tbl_filial1` (`id_filial` ASC) ,
  CONSTRAINT `fk_tbl_telefone_tbl_filial1`
    FOREIGN KEY (`id_filial` )
    REFERENCES `db_7brasil`.`tbl_filial` (`id_filial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_grupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_grupo` (
  `id_grupo` INT NOT NULL ,
  `titulo_grupo` VARCHAR(45) NOT NULL ,
  `descricao_grupo` TEXT NULL ,
  `status_grupo` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_grupo`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'tabela de grupo de contas a pagar';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_subgrupo`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_subgrupo` (
  `id_subgrupo` INT NOT NULL ,
  `id_grupo` INT NOT NULL ,
  `titulo_subgrupo` VARCHAR(65) NOT NULL ,
  `descricao_subgrupo` TEXT NULL ,
  `status_subgrupo` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_subgrupo`) ,
  INDEX `fk_tbl_subgrupo_tbl_grupo1` (`id_grupo` ASC) ,
  CONSTRAINT `fk_tbl_subgrupo_tbl_grupo1`
    FOREIGN KEY (`id_grupo` )
    REFERENCES `db_7brasil`.`tbl_grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'tabela de subgrupo de  grupo de contas a pagar da filial';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_contas`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_contas` (
  `id_contas` INT NOT NULL AUTO_INCREMENT ,
  `id_grupo` INT NOT NULL ,
  `id_subgrupo` INT NOT NULL ,
  `id_filial` INT NOT NULL ,
  `valor_contas` DECIMAL(9,2) NOT NULL ,
  `validade_conta` DATE NULL ,
  `descricao_contas` TEXT NULL ,
  `status_contas` TINYINT(1) NULL DEFAULT 0 COMMENT '0 - Pendente\n1 - Paga' ,
  PRIMARY KEY (`id_contas`) ,
  INDEX `fk_tbl_contas_tbl_grupo1` (`id_grupo` ASC) ,
  INDEX `fk_tbl_contas_tbl_subgrupo1` (`id_subgrupo` ASC) ,
  INDEX `fk_tbl_contas_tbl_filial1` (`id_filial` ASC) ,
  CONSTRAINT `fk_tbl_contas_tbl_grupo1`
    FOREIGN KEY (`id_grupo` )
    REFERENCES `db_7brasil`.`tbl_grupo` (`id_grupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_contas_tbl_subgrupo1`
    FOREIGN KEY (`id_subgrupo` )
    REFERENCES `db_7brasil`.`tbl_subgrupo` (`id_subgrupo` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_contas_tbl_filial1`
    FOREIGN KEY (`id_filial` )
    REFERENCES `db_7brasil`.`tbl_filial` (`id_filial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'tabela de contas a pagar de cada filial da empresa';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_email`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_email` (
  `id_email` INT NOT NULL AUTO_INCREMENT ,
  `id_filial` INT NOT NULL ,
  `id_usuario` INT NOT NULL ,
  `email_email` VARCHAR(99) NOT NULL ,
  `descricao_email` TEXT NULL ,
  `status_email` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_email`) ,
  INDEX `fk_tbl_email_tbl_filial1` (`id_filial` ASC) ,
  INDEX `fk_tbl_email_tbl_usuario1` (`id_usuario` ASC) ,
  CONSTRAINT `fk_tbl_email_tbl_filial1`
    FOREIGN KEY (`id_filial` )
    REFERENCES `db_7brasil`.`tbl_filial` (`id_filial` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_email_tbl_usuario1`
    FOREIGN KEY (`id_usuario` )
    REFERENCES `db_7brasil`.`tbl_usuario` (`id_usuario` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'emails das filiais cadastrados';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_produtoOutros`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_produtoOutros` (
  `id_produto` INT NOT NULL AUTO_INCREMENT ,
  `id_moeda` INT NOT NULL ,
  `titulo_produto` VARCHAR(99) NOT NULL ,
  `valor_produto` DECIMAL(9,2) NOT NULL ,
  `fornecedor_produto` VARCHAR(99) NULL ,
  `comissao_produto` DOUBLE NULL ,
  `descricao_produto` TEXT NULL ,
  `dt_inicio_produto` DATETIME NULL ,
  `dt_final_produto` DATETIME NULL ,
  PRIMARY KEY (`id_produto`) ,
  INDEX `fk_tbl_produtoDesconhecido_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_tbl_produtoDesconhecido_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela de produtos desconhecidos';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_adcionarDependentePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_adcionarDependentePF` (
  `id_adcionarDependentePF` INT NOT NULL AUTO_INCREMENT ,
  `id_dependentePF` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  PRIMARY KEY (`id_adcionarDependentePF`) ,
  INDEX `fk_tbl_adcionarDependentePF_tbl_dependentePF1` (`id_dependentePF` ASC) ,
  INDEX `fk_tbl_adcionarDependentePF_tbl_participacao1` (`id_participacao` ASC) ,
  INDEX `fk_tbl_adcionarDependentePF_tbl_venda1` (`id_venda` ASC) ,
  CONSTRAINT `fk_tbl_adcionarDependentePF_tbl_dependentePF1`
    FOREIGN KEY (`id_dependentePF` )
    REFERENCES `db_7brasil`.`tbl_dependentePF` (`id_dependentePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_adcionarDependentePF_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_adcionarDependentePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela para adicionar dependente do cliente na venda';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_ticket`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_ticket` (
  `id_ticket` INT NOT NULL AUTO_INCREMENT ,
  `nome_ticket` VARCHAR(45) NOT NULL ,
  `descricao_ticket` TEXT NULL ,
  `status_ticket` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_ticket`) )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_compraTicket`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_compraTicket` (
  `id_compraTicket` INT NOT NULL AUTO_INCREMENT ,
  `id_ticket` INT NOT NULL ,
  `id_moeda` INT NOT NULL ,
  `valor_compraTicket` DECIMAL(9,2) NOT NULL ,
  `comissao_compraTicket` INT NOT NULL ,
  `voucher_compraTicket` VARCHAR(99) NULL ,
  `fornecedor_compraTicket` VARCHAR(99) NULL ,
  PRIMARY KEY (`id_compraTicket`) ,
  INDEX `fk_tbl_compraTicket_tbl_ticket1` (`id_ticket` ASC) ,
  INDEX `fk_tbl_compraTicket_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_tbl_compraTicket_tbl_ticket1`
    FOREIGN KEY (`id_ticket` )
    REFERENCES `db_7brasil`.`tbl_ticket` (`id_ticket` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_compraTicket_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cliente_ticket`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cliente_ticket` (
  `id_cliente_ticket` INT NOT NULL AUTO_INCREMENT ,
  `id_venda` INT NOT NULL ,
  `id_compraTicket` INT NOT NULL ,
  `tbl_clientePF_id_clientePF` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  PRIMARY KEY (`id_cliente_ticket`, `id_venda`) ,
  INDEX `fk_tbl_cliente_ticket_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_cliente_ticket_tbl_clientePF1` (`tbl_clientePF_id_clientePF` ASC) ,
  INDEX `fk_tbl_cliente_ticket_tbl_compraTicket1` (`id_compraTicket` ASC) ,
  INDEX `fk_tbl_cliente_ticket_tbl_participacao1` (`id_participacao` ASC) ,
  CONSTRAINT `fk_tbl_cliente_ticket_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cliente_ticket_tbl_clientePF1`
    FOREIGN KEY (`tbl_clientePF_id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cliente_ticket_tbl_compraTicket1`
    FOREIGN KEY (`id_compraTicket` )
    REFERENCES `db_7brasil`.`tbl_compraTicket` (`id_compraTicket` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cliente_ticket_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Para adicionar compra de ticket do cliente na venda';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_compania_cruzeiro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_compania_cruzeiro` (
  `id_compania_cruzeiro` INT NOT NULL ,
  `nome_compania_cruzeiro` VARCHAR(99) NOT NULL ,
  `descricao_compania_cruzeiro` TEXT NULL ,
  `status_compania_cruzeiro` TINYINT(1) NULL DEFAULT 1 ,
  PRIMARY KEY (`id_compania_cruzeiro`) )
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela com nomes de compania de cruzeiro';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cruzeiro`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cruzeiro` (
  `id_cruzeiro` INT NOT NULL AUTO_INCREMENT ,
  `id_compania_cruzeiro` INT NOT NULL ,
  `id_moeda` INT NOT NULL ,
  `navio_cruzeiro` VARCHAR(99) NULL ,
  `dt_inicio_cruzeiro` DATETIME NOT NULL ,
  `dt_fim_cruzeiro` DATETIME NOT NULL ,
  `rota_cruzeiro` VARCHAR(99) NULL ,
  `nm_confirmacao_cruzeiro` VARCHAR(45) NULL ,
  `tipo_cabine_cruzeiro` VARCHAR(45) NULL ,
  `valor_cruzeiro` DECIMAL(9,2) NOT NULL ,
  `comissao_cruzeiro` DECIMAL(9,2) NOT NULL ,
  PRIMARY KEY (`id_cruzeiro`) ,
  INDEX `fk_tbl_cruzeiro_tbl_compania_cruzeiro1` (`id_compania_cruzeiro` ASC) ,
  INDEX `fk_tbl_cruzeiro_tbl_moeda1` (`id_moeda` ASC) ,
  CONSTRAINT `fk_tbl_cruzeiro_tbl_compania_cruzeiro1`
    FOREIGN KEY (`id_compania_cruzeiro` )
    REFERENCES `db_7brasil`.`tbl_compania_cruzeiro` (`id_compania_cruzeiro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_tbl_moeda1`
    FOREIGN KEY (`id_moeda` )
    REFERENCES `db_7brasil`.`tbl_moeda` (`id_moeda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_dependentePF_ticket`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_dependentePF_ticket` (
  `id_dependentePF_ticket` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_compraTicket` INT NOT NULL ,
  `id_dependentePF` INT NOT NULL ,
  PRIMARY KEY (`id_dependentePF_ticket`) ,
  INDEX `fk_tbl_dependentePF_ticket_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_dependentePF_ticket_tbl_compraTicket1` (`id_compraTicket` ASC) ,
  INDEX `fk_tbl_dependentePF_ticket_tbl_dependentePF1` (`id_dependentePF` ASC) ,
  CONSTRAINT `fk_tbl_dependentePF_ticket_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_dependentePF_ticket_tbl_compraTicket1`
    FOREIGN KEY (`id_compraTicket` )
    REFERENCES `db_7brasil`.`tbl_compraTicket` (`id_compraTicket` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_dependentePF_ticket_tbl_dependentePF1`
    FOREIGN KEY (`id_dependentePF` )
    REFERENCES `db_7brasil`.`tbl_dependentePF` (`id_dependentePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela para compra de ticket de dependente pessoa fisica';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cruzeiro_clientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cruzeiro_clientePF` (
  `id_cruzeiro_clientePF` INT NOT NULL ,
  `id_cruzeiro` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  PRIMARY KEY (`id_cruzeiro_clientePF`, `id_cruzeiro`) ,
  INDEX `fk_tbl_cruzeiro_clientePF_tbl_cruzeiro1` (`id_cruzeiro` ASC) ,
  INDEX `fk_tbl_cruzeiro_clientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  INDEX `fk_tbl_cruzeiro_clientePF_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_cruzeiro_clientePF_tbl_participacao1` (`id_participacao` ASC) ,
  CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_cruzeiro1`
    FOREIGN KEY (`id_cruzeiro` )
    REFERENCES `db_7brasil`.`tbl_cruzeiro` (`id_cruzeiro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_clientePF_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cruzeiro_dependentePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cruzeiro_dependentePF` (
  `id_cruzeiro_dependente` INT NOT NULL AUTO_INCREMENT ,
  `id_cruzeiro` INT NOT NULL ,
  `id_dependentePF` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  PRIMARY KEY (`id_cruzeiro_dependente`) ,
  INDEX `fk_tbl_cruzeiro_dependentePF_tbl_cruzeiro1` (`id_cruzeiro` ASC) ,
  INDEX `fk_tbl_cruzeiro_dependentePF_tbl_dependentePF1` (`id_dependentePF` ASC) ,
  INDEX `fk_tbl_cruzeiro_dependentePF_tbl_venda1` (`id_venda` ASC) ,
  CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_cruzeiro1`
    FOREIGN KEY (`id_cruzeiro` )
    REFERENCES `db_7brasil`.`tbl_cruzeiro` (`id_cruzeiro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_dependentePF1`
    FOREIGN KEY (`id_dependentePF` )
    REFERENCES `db_7brasil`.`tbl_dependentePF` (`id_dependentePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_dependentePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela para inclusão de dependete PF no cruzeiro';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_outroprod_clientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_outroprod_clientePF` (
  `id_outroprod_clientePF` INT NOT NULL AUTO_INCREMENT ,
  `id_produto` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  PRIMARY KEY (`id_outroprod_clientePF`) ,
  INDEX `fk_tbl_outroprod_clientePF_tbl_produtoOutros1` (`id_produto` ASC) ,
  INDEX `fk_tbl_outroprod_clientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  INDEX `fk_tbl_outroprod_clientePF_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_outroprod_clientePF_tbl_participacao1` (`id_participacao` ASC) ,
  CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_produtoOutros1`
    FOREIGN KEY (`id_produto` )
    REFERENCES `db_7brasil`.`tbl_produtoOutros` (`id_produto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_outroprod_clientePF_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_passagens_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_passagens_clientePJ` (
  `id_passagens_clientePJ` INT NOT NULL ,
  `id_passagens` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  PRIMARY KEY (`id_passagens_clientePJ`) ,
  INDEX `fk_tbl_passagens_clientePJ_tbl_passagens1` (`id_passagens` ASC) ,
  INDEX `fk_tbl_passagens_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_passagens_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_passagens_clientePJ_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_passagens1`
    FOREIGN KEY (`id_passagens` )
    REFERENCES `db_7brasil`.`tbl_passagens` (`id_passagens` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_passagens_clientePJ_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela usada para reserva de passagens aére para cliente Pes' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_cruzeiro_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_cruzeiro_clientePJ` (
  `id_cruzeiro_clientePJ` INT NOT NULL AUTO_INCREMENT ,
  `id_cruzeiro` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  PRIMARY KEY (`id_cruzeiro_clientePJ`) ,
  INDEX `fk_tbl_cruzeiro_clientePJ_tbl_cruzeiro1` (`id_cruzeiro` ASC) ,
  INDEX `fk_tbl_cruzeiro_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_cruzeiro_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_cruzeiro_clientePJ_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_cruzeiro1`
    FOREIGN KEY (`id_cruzeiro` )
    REFERENCES `db_7brasil`.`tbl_cruzeiro` (`id_cruzeiro` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_cruzeiro_clientePJ_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_outroProd_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_outroProd_clientePJ` (
  `id_outroProd_clientePJ` INT NOT NULL AUTO_INCREMENT ,
  `id_produto` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  PRIMARY KEY (`id_outroProd_clientePJ`) ,
  INDEX `fk_tbl_outroProd_clientePJ_tbl_produtoOutros1` (`id_produto` ASC) ,
  INDEX `fk_tbl_outroProd_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_outroProd_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_outroProd_clientePJ_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_produtoOutros1`
    FOREIGN KEY (`id_produto` )
    REFERENCES `db_7brasil`.`tbl_produtoOutros` (`id_produto` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_outroProd_clientePJ_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabele usada para adicionar outros produtos na venda de clie' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_ticket_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_ticket_clientePJ` (
  `id_ticket_clientePJ` INT NOT NULL ,
  `id_compraTicket` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  PRIMARY KEY (`id_ticket_clientePJ`) ,
  INDEX `fk_tbl_ticket_clientePJ_tbl_compraTicket1` (`id_compraTicket` ASC) ,
  INDEX `fk_tbl_ticket_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_ticket_clientePJ_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  INDEX `fk_tbl_ticket_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_compraTicket1`
    FOREIGN KEY (`id_compraTicket` )
    REFERENCES `db_7brasil`.`tbl_compraTicket` (`id_compraTicket` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_ticket_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_carro_clientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_carro_clientePF` (
  `id_carro_clientePF` INT NOT NULL AUTO_INCREMENT ,
  `id_carros` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  PRIMARY KEY (`id_carro_clientePF`) ,
  INDEX `fk_tbl_carro_clientePF_tbl_carro1` (`id_carros` ASC) ,
  INDEX `fk_tbl_carro_clientePF_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_carro_clientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  CONSTRAINT `fk_tbl_carro_clientePF_tbl_carro1`
    FOREIGN KEY (`id_carros` )
    REFERENCES `db_7brasil`.`tbl_carro` (`id_carros` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_carro_clientePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_carro_clientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela de reserva de carro para pessoa fisica';


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_carro_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_carro_clientePJ` (
  `id_carro_clientePJ` INT NOT NULL ,
  `id_carros` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  PRIMARY KEY (`id_carro_clientePJ`) ,
  INDEX `fk_tbl_carro_clientePJ_tbl_carro1` (`id_carros` ASC) ,
  INDEX `fk_tbl_carro_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_carro_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_carro_clientePJ_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  CONSTRAINT `fk_tbl_carro_clientePJ_tbl_carro1`
    FOREIGN KEY (`id_carros` )
    REFERENCES `db_7brasil`.`tbl_carro` (`id_carros` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_carro_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_carro_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_carro_clientePJ_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_hotel_clientePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_hotel_clientePF` (
  `id_hotel_clientePF` INT NOT NULL ,
  `id_hoteis` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePF` INT NOT NULL ,
  `id_participacao` INT NOT NULL ,
  PRIMARY KEY (`id_hotel_clientePF`) ,
  INDEX `fk_tbl_hotel_clientePF_tbl_hotel1` (`id_hoteis` ASC) ,
  INDEX `fk_tbl_hotel_clientePF_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_hotel_clientePF_tbl_clientePF1` (`id_clientePF` ASC) ,
  INDEX `fk_tbl_hotel_clientePF_tbl_participacao1` (`id_participacao` ASC) ,
  CONSTRAINT `fk_tbl_hotel_clientePF_tbl_hotel1`
    FOREIGN KEY (`id_hoteis` )
    REFERENCES `db_7brasil`.`tbl_hotel` (`id_hoteis` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_clientePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_clientePF_tbl_clientePF1`
    FOREIGN KEY (`id_clientePF` )
    REFERENCES `db_7brasil`.`tbl_clientePF` (`id_clientePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_clientePF_tbl_participacao1`
    FOREIGN KEY (`id_participacao` )
    REFERENCES `db_7brasil`.`tbl_participacao` (`id_participacao` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_hotel_depedentePF`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_hotel_depedentePF` (
  `id_hotel_depedentePF` INT NOT NULL AUTO_INCREMENT ,
  `id_hoteis` INT NOT NULL ,
  `id_dependentePF_ticket` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  PRIMARY KEY (`id_hotel_depedentePF`) ,
  INDEX `fk_tbl_hotel_depedentePF_tbl_hotel1` (`id_hoteis` ASC) ,
  INDEX `fk_tbl_hotel_depedentePF_tbl_dependentePF1` (`id_dependentePF_ticket` ASC) ,
  INDEX `fk_tbl_hotel_depedentePF_tbl_venda1` (`id_venda` ASC) ,
  CONSTRAINT `fk_tbl_hotel_depedentePF_tbl_hotel1`
    FOREIGN KEY (`id_hoteis` )
    REFERENCES `db_7brasil`.`tbl_hotel` (`id_hoteis` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_depedentePF_tbl_dependentePF1`
    FOREIGN KEY (`id_dependentePF_ticket` )
    REFERENCES `db_7brasil`.`tbl_dependentePF` (`id_dependentePF` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_depedentePF_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela usada para cadastrar reserva de dependetes Pessoa Fis' /* comment truncated */;


-- -----------------------------------------------------
-- Table `db_7brasil`.`tbl_hotel_clientePJ`
-- -----------------------------------------------------
CREATE  TABLE IF NOT EXISTS `db_7brasil`.`tbl_hotel_clientePJ` (
  `id_hotel_clientePJ` INT NOT NULL ,
  `tbl_hotel_id_hoteis` INT NOT NULL ,
  `id_venda` INT NOT NULL ,
  `id_clientePJ` INT NOT NULL ,
  `id_dependentePJ` INT NOT NULL ,
  PRIMARY KEY (`id_hotel_clientePJ`) ,
  INDEX `fk_tbl_hotel_clientePJ_tbl_hotel1` (`tbl_hotel_id_hoteis` ASC) ,
  INDEX `fk_tbl_hotel_clientePJ_tbl_venda1` (`id_venda` ASC) ,
  INDEX `fk_tbl_hotel_clientePJ_tbl_clientePJ1` (`id_clientePJ` ASC) ,
  INDEX `fk_tbl_hotel_clientePJ_tbl_dependentePJ1` (`id_dependentePJ` ASC) ,
  CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_hotel1`
    FOREIGN KEY (`tbl_hotel_id_hoteis` )
    REFERENCES `db_7brasil`.`tbl_hotel` (`id_hoteis` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_venda1`
    FOREIGN KEY (`id_venda` )
    REFERENCES `db_7brasil`.`tbl_venda` (`id_venda` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_clientePJ1`
    FOREIGN KEY (`id_clientePJ` )
    REFERENCES `db_7brasil`.`tbl_clientePJ` (`id_clientePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tbl_hotel_clientePJ_tbl_dependentePJ1`
    FOREIGN KEY (`id_dependentePJ` )
    REFERENCES `db_7brasil`.`tbl_dependentePJ` (`id_dependentePJ` )
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_unicode_ci
COMMENT = 'Tabela para reserva de hotel para cliente Pessoa Juridica';



SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
