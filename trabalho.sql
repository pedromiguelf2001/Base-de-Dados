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


insert into Funcionario
		(idFuncionario,nome,data_nas)
        values
		('1','Alan Turing','1912-06-23'),
        ('2','John von Neumann','1903-12-28'),
        ('3','Charles Antony Richard Hoare','1934-01-11');
select * from Funcionario;


insert into Cliente
	(idCliente,nome,nif,localidade,codigo_postal)
    values
    ('1','João António', '250223112', 'Edral','5320-032'),
	('2','José Sócrates', '251330412', 'Edral','5320-032'), 
	('3','Ana Rosa', '322430002', 'Edral','5320-032'), 
	('4','Pedro Miguel', '250224712', 'Edral','5320-032'),
	('5','Bruno Jardim', '237010968', 'Negreiros','4775-190'),
	('6','Maria Martins', '238677737', 'Edral','5320-032'), 
	('7','Eduardo Teniz', '530224767', 'Edral','5320-032'), 
	('8','Rosa Silva', '667890223', 'Edral','5320-032'), 
	('9','Lucélia Martins', '453218556', 'Edral','5320-032'), 
	('10','Catarina Quintas', '113687905', 'Edral','5320-032'), 
	('11','João Carlos', '223445980', 'Edral','5320-032'), 
	('12','Ricardo Salgado', '690680222', 'Edral','5320-032'), 
	('13','Rosa Martins', '789456998', 'Edral','5320-032'), 
	('14','Manuel Brandão', '576340098', 'Edral','5320-032'), 
	('15','Manuel Marques', '665125340', 'Edral','5320-032'), 
	('16','Maria Silva', '309870456', 'Edral','5320-032'), 
	('17','Pedro Silva', '217673284', 'Edral','5320-032'), 
	('18','Miguel António', '411868057', 'Edral','5320-032'), 
	('19','Ana Marques', '184636443', 'Edral','5320-032'), 
	('20','Fátima Antunes', '358859459', 'Edral','5320-032'),
	('21','Felício Miguel', '114811408', 'Edral','5320-032'), 
	('22','Carlos Costa', '483594097', 'Edral','5320-032'), 
	('23','Mariana Antunes', '705932771', 'Edral','5320-032'), 
	('24','Filipe Antunes', '217163918', 'Edral','5320-032'), 
	('25','José Filipe', '325387396', 'Edral','5320-032');
    
select * from Cliente;

insert into Medicamento
	(idMedicamento,nome,forma_farm,dosagem,substancia_ativa,fabricante,venda_livre,validade,stock,quantidade_emb,preco)
    values
    ('1','Brufen','Comprimido','600','Ibuprofeno','Bayer','1','2022-06-20','10','20','3.50'),
    ('2','Ben-U-Ron','Comprimido','1000','Paracetamol','Bene Farmacêutica, Lda.','1','2022-06-20','10','20','2.50'),
    ('3','Alprazolam Labesfal','Comprimido','0.25','Alprazolam','Generis Farmacêutica, S.A','0','2023-05-14','5','20','1.90'),
    ('4','Eutirox','Comprimido','0.13','Levotiroxina sódica','Merck,S.A.','0','2024-08-30','10','60','3.33'),
    ('5','AAS','Comprimido','500','Ácido acetilsalicílico','Perrigo Portugal, Lda.','1','2020-07-30','50','20','2.99'),
    ('6','Voltaren Emulgelex','Gel','20','Diclofenac','GlaxoSmithKline Consumer Healthcare Produtos para a Saúde e Higiene Lda.','1','2025-11-30','30','1','3.33'),
	('7','Actifed','Xarope','6','Pseudoefedrina + Triprolidina','Johnson & Johnson,Lda.','0','202-12-03','10','1','2.23'),
	('8','BAQSIMI','Pó nasal','3','Glucagom','Eli Lilly Nederland, B.V.','0','2022-06-21','5','1','100.57'),
    ('9','Advantan','Creme','1','Aceponato de metilprednisolona','Leo Pharma A/S','0','2023-05-11','5','1','5.16'),
	('10','Zovirax','Suspensão oral','80','Aciclovir','Laboratórios Wellcome de Portugal, Lda.','0','2026-03-30','15','1','17.02'),
	('11','Strepsils','Pastilha','1.2','Álcool diclorobenzílico + Amilmetacresol','Reckitt Benckiser Healthcare, Lda.','1','2022-04-02','15','24','4.53'),
	('12','Zonisamida Mylan','Cápsula','25','Zonisamida','Mylan SAS','0','2024-10-20','5','14','2.85'),
	('13','Zonisamida Mylan','Cápsula','50','Zonisamida','Mylan SAS','0','2024-10-20','5','14','5.46'),
	('14','Zonisamida Mylan','Cápsula','100','Zonisamida','Mylan SAS','0','2024-10-20','5','56','36.24'),
	('15','Tropicil Top','Colírio, solução','10','Tropicamida','Laboratório Edol - Produtos Farmacêuticos, S.A.','0','2022-03-13','5','1','5.83'),
	('16','Niquitin Menta','Comprimido para chupar','4','Nicotina','Perrigo Portugal, Lda.','1','2024-07-30','5','1','4.87'),
    ('17','Brufen','Granulado efervescente','600','Ibuprofeno','BGP Products, Unipessoal Lda.','0','2022-08-17','10','20','4.79'),
	('18','Brufen','Granulado efervescente','400','Ibuprofeno','BGP Products, Unipessoal Lda.','0','2022-08-17','10','20','4.79'),
    ('19','Brufen','Granulado efervescente','200','Ibuprofeno','BGP Products, Unipessoal Lda.','0','2022-08-17','10','20','4.79'),
    ('20','Aerius','Comprimido orodispersível','2.5','Desloratadina','N.V. Organon','0','2023-11-25','10','20','3.52'),
	('21','Aerius','Comprimido orodispersível','5','Desloratadina','N.V. Organon','0','2023-11-25','10','20','3.52'),
    ('22','Xanax','Comprimido','1','Alprozolam','Upjohn EESV','0','2023-07-14','5','20','3.99'),
	('23','Xanax','Comprimido','0.5','Alprozolam','Upjohn EESV','0','2023-07-14','5','20','3.21'),
	('24','Humira','Solução injetável','40','Adalimumab','AbbVie Deutschland GmbH & Co. KG','0','2022-04-24','5','1','15.02'),
	('25','Eliquis','Comprimido revestido por película','5','Apixabano','Bristol-Myers Squibb / Pfizer EEIG','0','2024-10-20','5','20','24.59'),
	('26','Revlimid','Cápsula','10','Lenalidomida','Bristol-Myers Squibb Pharma EEIG','0','2024-10-20','5','21','36.21'),
    ('27','Ben-U-Ron','Comprimido','750','Paracetamol','Bene Farmacêutica, Lda.','1','2022-06-20','10','20','2.50'),
	('28','Ben-U-Ron','Comprimido','500','Paracetamol','Bene Farmacêutica, Lda.','1','2022-06-20','10','20','2.50'),
    ('29','Eutirox','Comprimido','0.10','Levotiroxina sódica','Merck,S.A.','0','2024-08-30','10','60','3.33'),
    ('30','Eutirox','Comprimido','0.15','Levotiroxina sódica','Merck,S.A.','0','2024-08-30','10','60','3.33');

select * from Medicamento;
select * from Cliente;
select * from Funcionario;


insert into Venda
	(idVenda,preco_receita,preco_tabelado,Funcionario_idFuncionario,Cliente_idCliente,balcao,data_venda)
    values
    ('1', '7.90' , '7.90', '1', '1', '1', '2021-11-05'),
	('2', '4.49','4.49', '3', '21',  '2', '2021-11-05' ),
	('3','10.69','21.39', '2', '15',  '3', '2021-11-05'),
	('4','3.33','3.33', '1', '2',  '1', '2021-10-20'),
	('5','7.78','7.78', '2', '20',  '2', '2021-10-21' ),
	('6','5.83','5.83', '1', '11',  '3' , '2021-01-20'),
	('7','15.52','15.52', '3', '15',  '1', '2021-10-20' ),
	('8','4.79','4.79', '1', '2',  '3', '2021-02-01' ),
	('9','8.34','12.56', '3', '11',  '1', '2021-12-01' ),
	('10','4.99','16.78', '2', '9',  '2' , '2021-10-20'),
	('11','21.04','50.99', '3', '19',  '1', '2021-11-03' ),
	('12','26.42','26.42', '2', '25',  '3', '2021-03-03' ),
	('13','13.31','13.75', '1', '15',  '1', '2020-11-03' ),
	('14','17.84','17.84', '1', '11',  '3', '2021-02-03' ),
	('15','30.24','34.70', '2', '21',  '2', '2021-11-03' ),
	('16','25.41','44.57', '1', '22',  '1', '2021-11-03' ),
	('17','34.53','34.53', '3', '24',  '3', '2021-07-04' ),
	('18','12.43','12.43', '1', '3',  '2', '2021-07-04' ),
	('19','8.94','16.87', '3', '19',  '2', '2021-01-04' ),
	('20','15.62','45.24', '1', '3',  '3', '2021-07-04' ),
	('21','4.96','8.75', '2', '25',  '1', '2021-07-04' ),
	('22','7.56','19.75', '1', '20',  '3', '2021-06-05' ),
	('23','4.54','6.89', '2', '2',  '2' , '2021-08-11' ),
	('24','9.65','9.65', '3', '12',  '1' , '2021-07-12' ),
	('25', '17.32', '22.21', '2', '2',  '2' , '2021-02-11' ),
	('26', '3.21', '3.21', '1', '1',  '2' , '2021-02-13' ),
	('27', '21.90', '25.99', '2', '10',  '2' , '2021-11-12' ),
	('28', '9.21' ,  '17.76', '1', '10',  '3' , '2021-01-21' ),
	('29', '8.32' ,'8.32', '2', '24',  '1' , '2021-12-11' ),
	('30', '45.54', '72.21', '2', '24',  '1' , '2021-03-30' ),
	('31', '11.65', '11.65', '1', '21',  '3' , '2021-01-01' ),
	('32', '8.91', '8.95' , '1', '17',  '2' , '2021-05-11' ),
	('33', '16.84', '16.99', '1', '12',  '2' , '2021-11-11' ),
	('34', '5.40' ,'5.40', '1', '17',  '3' , '2021-05-11' ),
	('35', '6.32', '7.40', '1', '17',  '4' , '2021-04-12' ),
	('36', '7.32', '7.32', '1', '14',  '2' , '2021-12-31' ),
	('37', '36.77' , '36.80', '1', '2',  '2' , '2021-05-11' ),
	('38', '3.89', '3.89', '1', '20',  '3' , '2021-02-27' ),
	('39', '9.91' ,'9.91' , '1', '1',  '2' , '2021-05-11' ),
	('40', '17.58' ,'23.49', '1', '17',  '2' , '2021-01-13' );
insert into Venda
	(idVenda,preco_receita,preco_tabelado,Funcionario_idFuncionario,Cliente_idCliente,balcao,data_venda)
    values
    ('41','0.00','0.00','1','12','1',curdate());

insert into Itens_de_venda
	(idItens_de_venda,quantidade,Venda_idVenda,Medicamento_idMedicamento)
	values
	('1','1','1','1'),
	('2','2','2','2'),
	('3','2','3','3'),
	('4','2','4','4'),
	('5','3','5','5'),
	('6','3','6','6'),
	('7','1','7','7'),
	('8','2','8','8'),
	('9','3','9','9'),
	('10','1','10','10'),
	('11','1','11','11'),
	('12','1','12','12'),
	('13','2','13','13'),
	('14','3','14','14'),
	('15','1','15','15'),
	('16','3','16','16'),
	('17','2','17','17'),
	('18','2','18','18'),
	('19','1','19','19'),
	('20','1','20','20'),
	('21','1','21','21'),
	('22','1','22','22'),
	('23','1','23','23'),
	('24','2','24','24'),
	('25','2','25','25'),
	('26','2','26','26'),
	('27','3','27','27'),
	('28','3','28','28'),
	('29','3','29','29'),
	('30','1','30','30'),
	('31','1','31','13'),
	('32','1','32','15'),
	('33','1','33','16'),
	('34','1','34','18'),
	('35','2','35','19'),
	('36','2','36','12'),
	('37','1','37','11'),
	('38','2','38','10'),
	('39','3','39','1'),
	('40','3','40','2'),
	('41','2','1','2'),
	('42','1','1','3'),
	('43','2','23','7'),
	('44','3','40','9'),
	('45','3','33','13'),
	('46','2','2','22'),
	('47','1','3','13'),
	('48','2','20','27'),
	('49','3','29','25'),
	('50','3','3','30'),
	('51','2','5','18'),
	('52','1','7','3'),
	('53','2','12','21'),
	('54','3','12','25'),
	('55','3','38','30'),
	('56','2','6','2'),
	('57','1','9','3'),
	('58','2','3','5'),
	('59','3','17','30'),
	('60','3','16','12');
insert into Itens_de_venda
	(idItens_de_venda,quantidade,Venda_idVenda,Medicamento_idMedicamento)
	values
    ('61','10','41','3');
select * from Cliente;

select * from venda;


#TABELA DE COMPRAS DE UM CLIENTE, NESTE CASO O CLIENTE Nº 12
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome, medicamento.preco*quantidade as Preço,venda.data_venda as Data 
	from medicamento,itens_de_venda,venda
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.Cliente_idCliente = 12 and  itens_de_venda.Venda_idVenda = venda.idVenda;
    
#TABELA DE VENDAS DE UM DETERMINADO FARMACEUTICO
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome,medicamento.preco*quantidade as Preço,venda.data_venda as Data
	from medicamento,itens_de_venda,venda
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.Funcionario_idFuncionario = 1 and  itens_de_venda.Venda_idVenda = venda.idVenda 
    group by venda.idVenda;
    
#TABELA DE MEDICAMENTOS
select * from medicamento;

#TABELA DE VENDAS NUM DIA
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome,medicamento.preco*quantidade as Preço,venda.data_venda as Data, cliente.nif as NIF
	from medicamento,itens_de_venda,venda,cliente
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.data_venda = '2021-11-05' and  itens_de_venda.Venda_idVenda = venda.idVenda
    group by idVenda;

#TABELA DE CLIENTES DE UM DETERMINADA LOCALIDADE
select cliente.nome AS Nome , cliente.nif as NIF
	from cliente
    where cliente.localidade = 'Edral';

#TABELA DE RANKING DE LUCRO DE VENDAS DOS FUNCIONARIOS
select funcionario.nome as Nome, sum(medicamento.preco*itens_de_venda.quantidade)  as Total
	from funcionario,itens_de_venda,medicamento,venda 
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento 
    and itens_de_venda.Venda_idVenda = venda.idVenda 
    and funcionario.idFuncionario = venda.Funcionario_idFuncionario
    
    group by funcionario.nome;
    

    
    
    

    
    

    

    


    
    