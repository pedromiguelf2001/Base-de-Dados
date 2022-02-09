-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`funcionario` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_nas` DATE NULL DEFAULT NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`medicamento` (
  `idMedicamento` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `forma_farm` VARCHAR(45) NOT NULL,
  `dosagem` INT NOT NULL,
  `substancia_ativa` VARCHAR(100) NOT NULL,
  `fabricante` VARCHAR(100) NOT NULL,
  `venda_livre` TINYINT NOT NULL,
  `validade` DATE NOT NULL,
  `stock` INT NOT NULL,
  `quantidade_emb` INT NOT NULL,
  `preco` DECIMAL(6,2) NOT NULL,
  PRIMARY KEY (`idMedicamento`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`venda` (
  `idVenda` INT NOT NULL,
  `preco_receita` DECIMAL(6,2) NOT NULL,
  `preco_tabelado` DECIMAL(6,2) NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `balcao` INT NOT NULL,
  `data_venda` DATE NOT NULL,
  PRIMARY KEY (`idVenda`, `Funcionario_idFuncionario`, `Cliente_idCliente`),
  INDEX `fk_Venda_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`cliente` (`idCliente`),
  CONSTRAINT `fk_Venda_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`funcionario` (`idFuncionario`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


-- -----------------------------------------------------
-- Table `mydb`.`itens_de_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`itens_de_venda` (
  `idItens_de_venda` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `Venda_idVenda` INT NOT NULL,
  `Medicamento_idMedicamento` INT NOT NULL,
  PRIMARY KEY (`idItens_de_venda`, `Venda_idVenda`, `Medicamento_idMedicamento`),
  INDEX `fk_Itens_de_venda_Venda_idx` (`Venda_idVenda` ASC) VISIBLE,
  INDEX `fk_Itens_de_venda_Medicamento1_idx` (`Medicamento_idMedicamento` ASC) VISIBLE,
  CONSTRAINT `fk_Itens_de_venda_Medicamento1`
    FOREIGN KEY (`Medicamento_idMedicamento`)
    REFERENCES `mydb`.`medicamento` (`idMedicamento`),
  CONSTRAINT `fk_Itens_de_venda_Venda`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `mydb`.`venda` (`idVenda`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb3;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;











    
    
    

    
    

    

    


    
    