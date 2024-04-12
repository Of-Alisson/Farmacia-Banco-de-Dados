-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema Farmacia
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `Farmacia` DEFAULT CHARACTER SET utf8 ;
USE `Farmacia` ;

-- -----------------------------------------------------
-- Table `Farmacia`.`tipos_produto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`tipos_produto` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`tipos_produto` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `tipo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`fabricantes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`fabricantes` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`fabricantes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`produtos`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`produtos` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`produtos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `designcao` VARCHAR(200) NOT NULL,
  `composicao` VARCHAR(200) NOT NULL,
  `id_fabricante` INT NOT NULL,
  `preco` DECIMAL(8,2) NOT NULL,
  `id_tipo_produto` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tipos_produto_idx` (`id_tipo_produto` ASC),
  INDEX `fk_produtos_2_idx` (`id_fabricante` ASC),
  CONSTRAINT `fk_produtos_1`
    FOREIGN KEY (`id_tipo_produto`)
    REFERENCES `Farmacia`.`tipos_produto` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_2`
    FOREIGN KEY (`id_fabricante`)
    REFERENCES `Farmacia`.`fabricantes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`cliente`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`cliente` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`cliente` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(45) NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(20) NOT NULL,
  `cep` VARCHAR(20) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`compra` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `data` DATE NOT NULL,
  `id_cliente` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_cliente_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_cliente`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `Farmacia`.`cliente` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`produtos_compra`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`produtos_compra` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`produtos_compra` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_compra` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `id_produtos_compra_1_idx` (`id_compra` ASC),
  INDEX `fk_produtos_compra_2_idx` (`id_produto` ASC),
  CONSTRAINT `fk_produtos_compra_1`
    FOREIGN KEY (`id_compra`)
    REFERENCES `Farmacia`.`compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_produtos_compra_2`
    FOREIGN KEY (`id_produto`)
    REFERENCES `Farmacia`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`medico`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`medico` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`medico` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  `especialidade` VARCHAR(100) NOT NULL,
  `crm` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `Farmacia`.`receitas_medica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `Farmacia`.`receitas_medica` ;

CREATE TABLE IF NOT EXISTS `Farmacia`.`receitas_medica` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `id_produto_compra` INT NOT NULL,
  `id_medico` INT NOT NULL,
  `receita` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_receitas_medicas_idx` (`id_produto_compra` ASC),
  INDEX `fk_receitas_medicas_02_idx` (`id_medico` ASC),
  CONSTRAINT `fk_receitas_medicas_01`
    FOREIGN KEY (`id_produto_compra`)
    REFERENCES `Farmacia`.`produtos_compra` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_receitas_medicas_02`
    FOREIGN KEY (`id_medico`)
    REFERENCES `Farmacia`.`medico` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
