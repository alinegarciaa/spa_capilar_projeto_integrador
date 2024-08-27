-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Spa_Capilar
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Spa_Capilar
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Spa_Capilar` DEFAULT CHARACTER SET utf8 ;
USE `Spa_Capilar` ;

-- -----------------------------------------------------
-- Table `Spa_Capilar`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `endereco` VARCHAR(255) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  `data_nasci` DATE NOT NULL,
  `historico_capilar` TEXT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`profissionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`profissionais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(100) NOT NULL,
  `especializacao` VARCHAR(100) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `email` VARCHAR(254) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` TEXT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  `quantidade_estoque` INT NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`servicos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`servicos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `descricao` TEXT NULL,
  `duracao` TIME NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`disponibilidade_profissionais`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`disponibilidade_profissionais` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `dia_semana` VARCHAR(20) NOT NULL,
  `hora_inicio` TIME NOT NULL,
  `hora_fim` TIME NOT NULL,
  `profissionais_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_profissionais_idx` (`profissionais_id` ASC) VISIBLE,
  CONSTRAINT `fk_disponibilidades_profissionais`
    FOREIGN KEY (`profissionais_id`)
    REFERENCES `Spa_Capilar`.`profissionais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`agendamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`agendamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data_hora` DATETIME NOT NULL,
  `status` VARCHAR(50) NOT NULL,
  `clientes_id` INT NOT NULL,
  `profissionais_id` INT NOT NULL,
  `servicos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_clientes_idx` (`clientes_id` ASC) VISIBLE,
  INDEX `fk_profissionais_idx` (`profissionais_id` ASC) VISIBLE,
  INDEX `fk_servicos_idx` (`servicos_id` ASC) VISIBLE,
  CONSTRAINT `fk_clientes`
    FOREIGN KEY (`clientes_id`)
    REFERENCES `Spa_Capilar`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_agendamentos_profissionais`
    FOREIGN KEY (`profissionais_id`)
    REFERENCES `Spa_Capilar`.`profissionais` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_servicos`
    FOREIGN KEY (`servicos_id`)
    REFERENCES `Spa_Capilar`.`servicos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`pagamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`pagamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `metodo_pagamento` VARCHAR(45) NOT NULL,
  `valor` DECIMAL(10,2) NOT NULL,
  `data_pagamento` DATETIME NOT NULL,
  `agendamentos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agendamentos_idx` (`agendamentos_id` ASC) VISIBLE,
  CONSTRAINT `fk_pagamentos_agendamentos`
    FOREIGN KEY (`agendamentos_id`)
    REFERENCES `Spa_Capilar`.`agendamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`agendamentos_produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`agendamentos_produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `agendamentos_id` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_agendamentos_idx` (`agendamentos_id` ASC) VISIBLE,
  INDEX `fk_produtos_idx` (`produtos_id` ASC) VISIBLE,
  CONSTRAINT `fk_agendamentos_produtos`
    FOREIGN KEY (`agendamentos_id`)
    REFERENCES `Spa_Capilar`.`agendamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_agendamentos`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `Spa_Capilar`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Spa_Capilar`.`estoque`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `Spa_Capilar`.`estoque` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `quantidade` INT NOT NULL,
  `produtos_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_idx` (`produtos_id` ASC) VISIBLE,
  CONSTRAINT `fk_estoque_produtos`
    FOREIGN KEY (`produtos_id`)
    REFERENCES `Spa_Capilar`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
