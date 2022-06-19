CREATE TABLE tb_caixa

CREATE TABLE tb_cidade (
  cod_cidade NUMBER(6,0) NOT NULL,
  desc_cidade VARCHAR2(45) NOT NULL,
  cod_estado CHAR(2) NOT NULL,
  CONSTRAINT pk_cidade PRIMARY KEY (cod_cidade),
  CONSTRAINT fk_estado FOREIGN KEY (cod_estado) REFERENCES tb_estado (cod_estado)
);

CREATE TABLE tb_conta_receber

CREATE TABLE tb_convidado

CREATE TABLE tb_dependente

CREATE TABLE tb_entrada_saida

CREATE TABLE tb_estado (
  cod_estado CHAR(2) NOT NULL,
  desc_estado VARCHAR2(35) NOT NULL,
  CONSTRAINT pk_estado PRIMARY KEY (cod_estado)
);

CREATE TABLE tb_exame_medico

CREATE TABLE tb_local (
  cod_local NUMBER(6,0) NOT NULL,
  desc_local VARCHAR2(60) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_locacao NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_local PRIMARY KEY (cod_local)
);

CREATE TABLE tb_local_socio

CREATE TABLE tb_medico

CREATE TABLE tb_mensalidade

CREATE TABLE tb_socio (
  cod_socio NUMBER(6,0) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  cod_cidade NUMBER(6,0) NOT NULL,
  endereco VARCHAR2(35) NOT NULL,
  bairro VARCHAR2(25) NOT NULL,
  cpf VARCHAR2(14),
  identidade VARCHAR2(15),
  dt_nascimento DATE,
  celular VARCHAR2(19),
  e_mail VARCHAR2(120),
  dt_cadastro DATE,
  ind_situacao CHAR(1) DEFAULT 'A',
  cep VARCHAR2(10),
  CONSTRAINT pk_socio PRIMARY KEY (cod_socio),
  CONSTRAINT fk_tipo_titulo FOREIGN KEY (cod_tipo_titulo) REFERENCES tb_tipo_titulo (cod_tipo_titulo),
  CONSTRAINT fk_cidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade)
);

CREATE TABLE tb_tipo_titulo (
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  desc_tipo_titulo VARCHAR2(25) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_mensalidade NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_tipo_titulo PRIMARY KEY (cod_tipo_titulo)
);