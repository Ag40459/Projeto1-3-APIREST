create database didin

create table usuarios (
    id serial primary key,
    nome text,
    email text unique,
    senha text
);

create table categorias (
    id serial primary key,
    descricao text
);

create table transacoes (
    id serial primary key,
    tipo text
    descricao text,
    valor integer,
    data date,
    categoria_id integer references categorias(id),
    usuario_id integer references usuarios(id),
)

insert into categorias (descricao) values 
('Alimentação'),
('Assinaturas e Serviços'), 
('Casa'),
('Mercado'),
('Cuidados Pessoais'),
('Educação'),
('Família'),
('Lazer'),
('Pets'),
('Presentes'),
('Roupas'),
('Saúde'),
('Transporte'),
('Salário'),
('Vendas'),
('Outras receitas'),
('Outras despesas');


update usuarios set nome = 'Raja W. Coffey Thomas' where email = 'raja.feugiat@nonummy.com';