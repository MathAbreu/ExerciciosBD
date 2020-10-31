Create database Ativ02Renan;
use Ativ02Renan;

CREATE TABLE clientes(
codcliente int not null,
nome varchar(30),
cpf varchar (15),
endereço varchar (40),
cidade varchar(20),
Bairro varchar (20),
uf varchar (3),
cep varchar(15),
ddd int,
fone int,
email varchar (30),
senha varchar (12),
obs varchar (30),

constraint pk_clientes primary key (codcliente));

CREATE TABLE categorias(
codcategoria int not null,
categoria varchar (20),
constraint pk_categorias primary key (codcategoria));

CREATE TABLE fretes(
uf varchar(5),
nomeEst varchar(20),
valor decimal(7,2),

constraint pk_fretes primary key (uf));

CREATE TABLE livros(
codlivro int not null,
isbn varchar(15),
codcategoria int not null,
titulo varchar(15),
autor varchar (40),
Npaginas int,
formato varchar(20),
preco decimal (7,2),
resenha varchar(20),
capa varchar(10),
DtLanc date,
Desconto varchar (10),

constraint pk_livros primary key (codlivro),
constraint fk_codcategoria foreign key (codcategoria) references categorias(codcategoria));

CREATE TABLE pedido(
codpedido int not null,
codcliente int not null,
dtpedido date,
statusped varchar (10),
cartao varchar (10),
numcartao int,
vencimento date,
valorpedido decimal (7,2),
valordesconto decimal (7,2),
valorfrete decimal (7,2),

constraint pk_pedido primary key (codpedido),
constraint fk_codcliente foreign key (codcliente) references clientes(codcliente));

CREATE TABLE itens(
coditem int not null,
codpedido int not null,
codlivro int not null,
qtlivros int,
constraint pk_itens primary key(coditem),
constraint fk_codpedido foreign key (codpedido) references pedido(codpedido),
constraint fk_codlivro foreign key (codlivro) references livros(codlivro)
);	

insert into clientes values ( 1, "Matheus Barreto", '111.424.323.00', "rua 4", "Jaboatao", "Candeias", "PE", '54450-020', '81', '999990554', "mathB22@gmail.com", "Mb8233", "...");
insert into clientes values ( 2, "Iago Benone", '656.323.546.32', "rua 1", "Jaboatão", "Piedade", "PE", '54555-355', '81', '999924548', "iagoB@gmail.com", "Ib03547", "...");
insert into clientes values ( 3, "Mariana Alves", '123.124.125.26', "rua 3", "Jaboatão", "DH", "PE", '54855-365', '81', '986266524', "marianaA@gmail.com", "MA123124", "...");
insert into clientes values ( 4, "Lucas P", '189.999.788.23', "rua 4", "Jaboatão", "Jardim Piedade", "PE", '54668-778', '81', '988909296', "LucasP@gmail.com", "LP231244", "...");
insert into clientes values ( 5, "Renan Costa", '121.122.123.45', "rua 4", "Recife", "Derby", "PE", '54540-323', '81', '987458476', "RenanCosta@gmail.com", "RC12312412", "...");
insert into clientes values ( 6, "Ana Maria", '122.564.908.87', "rua 3", "Jaboatão", "piedade", "PE", '53555-444', '81', '999353516', "anaM@gmail.com", "Am00077787", "...");


insert into categorias values(1, "Drama");
insert into categorias values (2, "Suspense");
insert into categorias values (3, "Ficção");
insert into categorias values (4, "Romance");
insert into categorias values (5, "Jogos");

insert into fretes values("MG", "Mato Gr", '30.00');
insert into fretes values("PE", "Pernambuco", '24.00');
insert into fretes values("BA", "Bahia", '50.00');

insert into livros values (1, "192865986", 1, "A cabana", "William P Young", 200, "Digital", '50.00',"...","Capa dura", '1999-05-23', '10%');
insert into livros values (2, "192865986", 2, "Percy jackson", "Rick Riordan", 196, "Físico", '30.00',"...","Capa dura", '1965-06-23','40%');
insert into livros values (3, "192865986", 3, "Rangers", "Jonh Flanagan", 380, "Digital", '59.90',"...","Capa dura", '1998-08-12','15%');
insert into livros values (4, "192865986", 4, "A culpa é stars", "Jonh Green", 230, "Digital", '28.90',"...","Capa dura", '2011-09-10','50%');

-- letra A
select titulo, preco from livros;

-- letra B 
select livros.titulo, livros.autor, categorias.categoria from livros inner join categorias
on livros.codcategoria = categorias.codcategoria;

-- letra C 
select livros.titulo, livros.autor,livros.preco, categorias.categoria from livros inner join categorias
on livros.codcategoria = categorias.codcategoria
where livros.preco < 50.00;

-- letra D 
select nome, ddd, fone from clientes where nome like "%ana%";

-- Letra E 
select codlivro, titulo, autor, preco from  livros where preco between 50 and 90;

-- letra F 
select codlivro, titulo, autor, preco from  livros where preco = 30.00;

-- letra G 
select titulo, dtlanc from livros where dtlanc > '2000-06-23';

-- letra H
select livros.titulo, livros.autor, categorias.categoria from livros inner join categorias
on livros.codcategoria = categorias.codcategoria
where categorias.categoria = "internet";

-- Letra I
select nome, endereço, cidade, bairro, uf, cep, codcliente from clientes where clientes.codcliente = 01;

-- Letra J
select  SUM(preco) as total_livros_cadastrados from livros;