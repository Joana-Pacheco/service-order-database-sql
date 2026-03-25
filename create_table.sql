create database Empresa;
USE Empresa;

create table Tecnico (
idTecnico int primary key,
nome varchar(50) not null,
telefone varchar(50) not null,
email varchar(50) not null,
endereco varchar(100) not null,
especialidade varchar(50) not null,
dataAdmissao date not null
);
create table Cliente (
idCliente int primary key,
nome varchar(50) not null,
telefone varchar(20) not null,
email varchar(50) not null,
endereco varchar(100) not null,
dataCadastro date not null
);
create table Servico (
idServico int primary key,
descricao varchar(100) not null,
valorPadrao decimal(7,2) not null,
tempoEstimado time not null
);
create table Finalizacao (
idFinalizacao int primary key,
dataFinalizacao datetime not null,
dataEntrega date not null,
valorTotal decimal(7,2) not null,
formaPagamento enum('Dinheiro', 'Pix', 'Cartao') not null,
garantiaDias int not null,
observacao varchar(200) not null
);
create table OrdemServico (
    idOrdem int primary key,
    dataAbertura datetime not null,
    equipamento varchar(50) not null,
    problema varchar(100) not null,
    observacao varchar(200) not null,
    prioridade enum('Baixa', 'Media', 'Alta') not null,
    estado enum('Aberta', 'Em execucao', 'Concluida') not null,
    idCliente int not null,
    idTecnico int not null,
    idFinalizacao int null,
    constraint fk_ordem_Cliente
        foreign key (idCliente) references Cliente(idCliente),
    constraint fk_ordem_tecnico
        foreign key (idTecnico) references Tecnico(idTecnico),
    constraint fk_ordem_finalizacao
        foreign key (idFinalizacao) references Finalizacao(idFinalizacao)
);
create table OrdemServico_Servico (
idOrdem int not null,
idServico int not null,
quantidade int not null,
valorUnitario decimal(7,2) not null,
primary key (idOrdem, idServico),
constraint fk_oss_ordem
	foreign key (idOrdem) references OrdemServico(idOrdem),
constraint fk_oss_Servico
	foreign key (idServico) references Servico(idServico)
);