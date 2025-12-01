BEGIN TRANSACTION;

CREATE TABLE cliente (
    id_cliente INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    telefone TEXT(20),
    endereco TEXT
);

---------- Tabela Veículo ----------
CREATE TABLE veiculo (
    id_veiculo INTEGER PRIMARY KEY AUTOINCREMENT,
    placa TEXT NOT NULL,
    modelo TEXT,
    ano INTEGER
);

---------- Tabela Mecânico ----------
CREATE TABLE mecanico (
    id_mecanico INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    especialidade TEXT
    disponibilidade TEXT		
);

---------- Tabela Ordem de Serviço ----------
CREATE TABLE ordem_servico (
    id_os INTEGER PRIMARY KEY AUTOINCREMENT,
    data_abertura TEXT NOT NULL,
    data_fechamento TEXT NOT NULL,
    status TEXT (20) NOT NULL,
    id_mecanico INTEGER,
    id_veiculo INTEGER NOT NULL,

    FOREIGN KEY (id_mecanico) REFERENCES mecanico(id_mecanico),
    FOREIGN KEY (id_veiculo) REFERENCES veiculo(id_veiculo)
);

---------- Peça ----------
CREATE TABLE peca (
    id_peca INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    preco TEXT 
);

---------- Fornecedor ----------
CREATE TABLE fornecedor (
    id_fornecedor INTEGER PRIMARY KEY AUTOINCREMENT,
    nome TEXT NOT NULL,
    contato TEXT
);

---------- Estoque ----------
CREATE TABLE estoque (
    id_estoque INTEGER PRIMARY KEY AUTOINCREMENT,
    quantidade INTEGER NOT NULL,
    id_fornecedor INT NOT NULL,

    FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor)
);

---------- Serviço Realizado ----------
CREATE TABLE servico_realizado (
    id_servico_realizado INTEGER PRIMARY KEY AUTOINCREMENT,
    data_execucao DATE NOT NULL,

    id_os INTEGER NOT NULL,
    id_peca INTEGER,
    id_mecanico INTEGER,

    FOREIGN KEY (id_os) REFERENCES ordem_servico(id_os),
    FOREIGN KEY (id_peca) REFERENCES peca(id_peca),
    FOREIGN KEY (id_mecanico) REFERENCES mecanico(id_mecanico)
);

---------- Pagamento ----------
CREATE TABLE pagamento (
    id_pagamento INTEGER PRIMARY KEY AUTOINCREMENT,
    valor_total TEXT NOT NULL,
    data_pagamento TEXT (15)

);