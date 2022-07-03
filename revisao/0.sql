DROP TABLE tb_cadastro;
DROP TABLE tb_nota_produto;
DROP TABLE tb_nota;
DROP TABLE tb_cidade;

DROP SEQUENCE sq_cadastro;
DROP SEQUENCE sq_nota_produto;
DROP SEQUENCE sq_nota;
DROP SEQUENCE sq_cidade;

CREATE TABLE tb_cidade (
  cod_cidade NUMBER(6,0) NOT NULL,
  desc_cidade VARCHAR2(30) NOT NULL
);

CREATE TABLE tb_cadastro (
  cod_cadastro NUMBER(6,0) NOT NULL,
  nome VARCHAR2(30) NOT NULL,
  cod_cidade NUMBER(6,0) NOT NULL,
  celular VARCHAR2(15) NOT NULL,
  cpf VARCHAR2(19),
  CONSTRAINT pk_cadastro PRIMARY KEY (cod_cadastro),
  CONSTRAINT fk_cadastroXcidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade)
);

CREATE SEQUENCE sq_cidade
  START WITH 1
  INCREMENT BY 1;

INSERT INTO tb_cidade (cod_cidade, desc_cidade) VALUES (sq_cidade.nextval, 'Medianeira');