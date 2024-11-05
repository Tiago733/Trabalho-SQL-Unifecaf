CREATE DATABASE bd_supermercado;
USE bd_supermercado;

CREATE TABLE Cliente (
    id_cli INT PRIMARY KEY AUTO_INCREMENT,
    nome_cli VARCHAR(80),
    endereco_cli VARCHAR(200),
    cpf_cli VARCHAR(200)
);

CREATE TABLE Fornecedor (
    id_for INT PRIMARY KEY AUTO_INCREMENT,
    nome_for VARCHAR(80),
    cnpj_for VARCHAR(50)
);

CREATE TABLE Caixa (
    id_cai INT PRIMARY KEY AUTO_INCREMENT,
    saldo_inicial_cai FLOAT,
    total_recebimento_cai FLOAT,
    total_retirada_cai FLOAT,
    saldo_final_cai FLOAT
);

CREATE TABLE Setor (
    id_set INT PRIMARY KEY AUTO_INCREMENT,
    nome_set VARCHAR(100)
);

CREATE TABLE Funcionario (
    id_fun INT PRIMARY KEY AUTO_INCREMENT,
    nome_fun VARCHAR(80),
    funcao_fun VARCHAR(100),
    id_set_fk INT,
    FOREIGN KEY (id_set_fk) REFERENCES Setor (id_set)
);

CREATE TABLE Produto (
    id_prod INT PRIMARY KEY AUTO_INCREMENT,
    nome_prod VARCHAR(80),
    valor_prod FLOAT,
    estoque_prod FLOAT
);

CREATE TABLE Venda (
    id_ven INT PRIMARY KEY AUTO_INCREMENT,
    valor_ven FLOAT,
    data_ven DATE,
    id_cli_fk INT,
    FOREIGN KEY (id_cli_fk) REFERENCES Cliente (id_cli),
    id_fun_fk INT,
    FOREIGN KEY (id_fun_fk) REFERENCES Funcionario (id_fun)
);

CREATE TABLE Venda_Produto (
    id_ven_prod INT PRIMARY KEY AUTO_INCREMENT,
    id_prod_fk INT,
    FOREIGN KEY (id_prod_fk) REFERENCES Produto (id_prod),
    id_ven_fk INT,
    FOREIGN KEY (id_ven_fk) REFERENCES Venda (id_ven),
    quant_ven FLOAT
);

create table Entrega (
id_ent INT PRIMARY KEY AUTO_INCREMENT,
data_ent DATE,
endereco_alternativo_ent VARCHAR(200),
hora_ent TIME,
id_ven_fk INT,
FOREIGN KEY (id_ven_fk) REFERENCES Venda (id_ven)
);

CREATE TABLE Recebimento (
id_rec INT PRIMARY KEY AUTO_INCREMENT,
tipo_rec VARCHAR(100),
data_rec DATE,
id_cai_fk INT,
id_ven_fk INT,
FOREIGN KEY (id_cai_fk) REFERENCES Caixa (id_cai),
FOREIGN KEY (id_ven_fk) REFERENCES Venda (id_ven)
);

CREATE TABLE Compra (
id_com INT PRIMARY KEY AUTO_INCREMENT,
valor_com FLOAT,
data_com DATE,
id_fun_fk INT,
FOREIGN KEY (id_fun_fk) REFERENCES Funcionario (id_fun),
id_for_fk INT,
FOREIGN KEY (id_for_fk) REFERENCES Fornecedor (id_for)
);

CREATE TABLE Despesa (
id_des INT PRIMARY KEY AUTO_INCREMENT,
nome_des VARCHAR(100),
valor_des FLOAT,
id_com_fk INT,
FOREIGN KEY (id_com_fk) REFERENCES Compra (id_com)
);
CREATE TABLE Pagamento (
id_pag INT PRIMARY KEY AUTO_INCREMENT,
tipo_pag VARCHAR(100),
data_pag DATE
);