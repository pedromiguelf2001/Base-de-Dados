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
-- Table `mydb`.`Funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Funcionario` (
  `idFuncionario` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `data_nas` DATE NULL,
  PRIMARY KEY (`idFuncionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Cliente`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Cliente` (
  `idCliente` INT NOT NULL,
  `nome` VARCHAR(100) NOT NULL,
  `nif` VARCHAR(45) NOT NULL,
  `localidade` VARCHAR(45) NOT NULL,
  `codigo_postal` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idCliente`),
  UNIQUE INDEX `nif_UNIQUE` (`nif` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Venda` (
  `idVenda` INT NOT NULL,
  `preco_receita` DECIMAL(6,2) NOT NULL,
  `preco_tabelado` DECIMAL(6,2) NOT NULL,
  `Funcionario_idFuncionario` INT NOT NULL,
  `Cliente_idCliente` INT NOT NULL,
  `balcao` INT NOT NULL,
  PRIMARY KEY (`idVenda`, `Funcionario_idFuncionario`, `Cliente_idCliente`),
  INDEX `fk_Venda_Funcionario1_idx` (`Funcionario_idFuncionario` ASC) VISIBLE,
  INDEX `fk_Venda_Cliente1_idx` (`Cliente_idCliente` ASC) VISIBLE,
  CONSTRAINT `fk_Venda_Funcionario1`
    FOREIGN KEY (`Funcionario_idFuncionario`)
    REFERENCES `mydb`.`Funcionario` (`idFuncionario`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Venda_Cliente1`
    FOREIGN KEY (`Cliente_idCliente`)
    REFERENCES `mydb`.`Cliente` (`idCliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Medicamento`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Medicamento` (
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
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Itens_de_venda`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Itens_de_venda` (
  `idItens_de_venda` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `Venda_idVenda` INT NOT NULL,
  `Medicamento_idMedicamento` INT NOT NULL,
  PRIMARY KEY (`idItens_de_venda`, `Venda_idVenda`, `Medicamento_idMedicamento`),
  INDEX `fk_Itens_de_venda_Venda_idx` (`Venda_idVenda` ASC) VISIBLE,
  INDEX `fk_Itens_de_venda_Medicamento1_idx` (`Medicamento_idMedicamento` ASC) VISIBLE,
  CONSTRAINT `fk_Itens_de_venda_Venda`
    FOREIGN KEY (`Venda_idVenda`)
    REFERENCES `mydb`.`Venda` (`idVenda`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_Itens_de_venda_Medicamento1`
    FOREIGN KEY (`Medicamento_idMedicamento`)
    REFERENCES `mydb`.`Medicamento` (`idMedicamento`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

insert into Funcionario
		(idFuncionario,nome,data_nas)
        values

        ('2','Tiago',null),
        ('3','Eduardo Teniz','1906-06-05');
select * from Funcionario;
delete from Funcionario where idFuncionario = null;

insert into Medicamento
	(idMedicamento,nome,forma_farm,dosagem,substancia_ativa,fabricante,venda_livre,validade,stock,quantidade_emb,preco)
    values
    ('1','Brufen','Comprimido','600','Ibuprofeno','Bayer','1','2022-06-20','10','20','3.50');
select * from Medicamento;
insert into Cliente
	(idCliente,nome,nif,localidade,codigo_postal)
    values
    ('1','Eduardo Tenis','123456789','Negreiros','4775-190');
select * from Cliente;
insert into Venda
	(idVenda,preco_receita,preco_tabelado,Funcionario_idFuncionario,Cliente_idCliente,balcao)
    values
    ('1','7.00','7.00','1','1','1');

insert into Itens_de_venda
	(idItens_de_venda,quantidade,Venda_idVenda,Medicamento_idMedicamento)
    values
    ('1','2','1','1');
select * from Venda;
select * from Itens_de_venda where Venda_idVenda =1;
select * from Cliente;

insert into Cliente
	(idCliente,nome,nif,localidade,codigo_postal)
    values
    ('2','Bruno Jardim','237010968','Negreiros','4775-190'),
    ('3','Jose Socrates','741852963','Elvas','4472-250'),
    ('4','Ricardo Salgado','852741963','Lisboa','4500-100'),
    ('5','Francisco Teofilo','963741852','Braga','4700-200'),
    ('6','Pedro Fernandes','250224712','Braga','4700-200'),
    ('7','Catarina Quintas','789821567','Fragoso','4702-320'),
    ('8','Tiago Carriço','789456123','Braga','4700-200'),
    ('9','David Machado','147852369','Viana do Castelo','4500-100'),
    ('10','Luís Filipe Vieira','862479319','Benfica','4200-250');
    
insert into Cliente
	(idCliente,nome,nif,localidade,codigo_postal)
    values
    
insert into Medicamento
	(idMedicamento,nome,forma_farm,dosagem,substancia_ativa,fabricante,venda_livre,validade,stock,quantidade_emb,preco)
    values
    ('2','Ben-U-Ron','Comprimido','1000','Paracetamol','Bayer','1','2022-06-20','10','20','3.50'),