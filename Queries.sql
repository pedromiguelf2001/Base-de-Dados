#TABELA DE COMPRAS DE UM CLIENTE, NESTE CASO O CLIENTE Nº 12
create view comprasCliente_12 as
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome, medicamento.preco*quantidade as Preço,venda.data_venda as Data 
	from medicamento,itens_de_venda,venda
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.Cliente_idCliente = 12 and  itens_de_venda.Venda_idVenda = venda.idVenda;
select * from comprasCliente_12;
#TABELA DE VENDAS DE UM DETERMINADO FARMACEUTICO
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome,venda.preco_receita*quantidade as Preço,venda.data_venda as Data
	from medicamento,itens_de_venda,venda
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.Funcionario_idFuncionario = 3 and  itens_de_venda.Venda_idVenda = venda.idVenda 
    group by venda.idVenda;
    
#TABELA DE MEDICAMENTOS
select * from medicamento;

#TABELA DE VENDAS NUM DIA
create view dia5_11_21 as
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome,medicamento.preco*quantidade as Preço,venda.data_venda as Data, cliente.nif as NIF
	from medicamento,itens_de_venda,venda,cliente
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.data_venda = '2021-11-05' and  itens_de_venda.Venda_idVenda = venda.idVenda
    group by idVenda;
select * from dia5_11_21;
#TABELA DE CLIENTES DE UM DETERMINADA LOCALIDADE
select cliente.nome AS Nome , cliente.nif as NIF
	from cliente
    where cliente.localidade = 'Edral';

#TABELA DE RANKING DE LUCRO DE VENDAS DOS FUNCIONARIOS
create view ranking as
select funcionario.nome as Nome, sum(medicamento.preco*itens_de_venda.quantidade)  as Total
	from funcionario,itens_de_venda,medicamento,venda 
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento 
    and itens_de_venda.Venda_idVenda = venda.idVenda 
    and funcionario.idFuncionario = venda.Funcionario_idFuncionario
    
    group by funcionario.nome;
select * from ranking;


select funcionario.nome as Nome, sum(preco_receita*itens_de_venda.quantidade) as Total
	from funcionario
    inner join venda on  venda.Funcionario_idFuncionario = funcionario.idFuncionario 
    inner join itens_de_venda on venda.idVenda = itens_de_venda.Venda_idVenda
    #inner join medicamento on itens_de_venda.Medicamento_idMedicamento = medicamento.idMedicamento
    group by funcionario.idFuncionario;
    



#Procedure
#WICKED
DELIMITER $$
CREATE PROCEDURE ClienteEsp (in NumeroCliente int) 
begin
select itens_de_venda.quantidade as Quantidade, medicamento.nome as Nome, medicamento.preco*quantidade as Preço,venda.data_venda as Data 
	from medicamento,itens_de_venda,venda
    where medicamento.idMedicamento = itens_de_venda.Medicamento_idMedicamento and venda.Cliente_idCliente = NumeroCliente and  itens_de_venda.Venda_idVenda = venda.idVenda;
end$$

call ClienteEsp(1);



create index Forma on Medicamento (forma_farm);


explain select * from Medicamento where forma_farm = 'Comprimido';