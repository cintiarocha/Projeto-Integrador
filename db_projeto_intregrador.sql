-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema db_projeto_integrador
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema db_projeto_integrador
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `db_projeto_integrador` DEFAULT CHARACTER SET utf8 ;
USE `db_projeto_integrador` ;

-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_categoria` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Modelo` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_usuario` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255) NOT NULL,
  `Email` VARCHAR(255) NOT NULL,
  `Senha` VARCHAR(255) NOT NULL,
  `Pronome` VARCHAR(30) NULL,
  `Foto` VARCHAR(255) NULL,
  `Data_nascimento` DATE NOT NULL,
  `Celular` VARCHAR(25) NOT NULL,
  `Endereco` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_parceiros`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_parceiros` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Nome` VARCHAR(255) NOT NULL,
  `Descricao` VARCHAR(300) NOT NULL,
  `Quantidade_vagas` INT NOT NULL,
  `CNPJ` VARCHAR(255) NOT NULL,
  `Descricao_vagas` VARCHAR(300) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `db_projeto_integrador`.`tb_cursos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `db_projeto_integrador`.`tb_cursos` (
  `id` BIGINT NOT NULL AUTO_INCREMENT,
  `Nome_curso` VARCHAR(255) NOT NULL,
  `Periodo_curso` VARCHAR(255) NOT NULL,
  `Professor_curso` VARCHAR(255) NOT NULL,
  `Quantidade_vagas` INT NOT NULL,
  `Duracao` VARCHAR(255) NOT NULL,
  `tb_categoria_id` BIGINT NOT NULL,
  `tb_usuario_id` BIGINT NOT NULL,
  `tb_parceiros_id` BIGINT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_tb_cursos_tb_categoria_idx` (`tb_categoria_id` ASC) VISIBLE,
  INDEX `fk_tb_cursos_tb_usuario1_idx` (`tb_usuario_id` ASC) VISIBLE,
  INDEX `fk_tb_cursos_tb_parceiros1_idx` (`tb_parceiros_id` ASC) VISIBLE,
  CONSTRAINT `fk_tb_cursos_tb_categoria`
    FOREIGN KEY (`tb_categoria_id`)
    REFERENCES `db_projeto_integrador`.`tb_categoria` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cursos_tb_usuario1`
    FOREIGN KEY (`tb_usuario_id`)
    REFERENCES `db_projeto_integrador`.`tb_usuario` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_tb_cursos_tb_parceiros1`
    FOREIGN KEY (`tb_parceiros_id`)
    REFERENCES `db_projeto_integrador`.`tb_parceiros` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
