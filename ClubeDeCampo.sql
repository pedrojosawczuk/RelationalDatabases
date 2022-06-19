CREATE TABLE tb_caixa

CREATE TABLE tb_cidade

CREATE TABLE tb_conta_receber

CREATE TABLE tb_convidado

CREATE TABLE tb_dependente

CREATE TABLE tb_entrada_saida

CREATE TABLE tb_estado (
  cod_estado CHAR(2) NOT NULL,
  desc_estado VARCHAR(35) NOT NULL,
  CONSTRAINT pk_estado PRIMARY KEY (cod_estado)
);

CREATE TABLE tb_exame_medico

CREATE TABLE tb_local (
  cod_local NUMBER(6,0) NOT NULL,
  desc_local VARCHAR(60) NOT NULL,
  ind_situacao CHAR(1) NOT NULL DEFAULT 'A',
  val_locacao NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_local PRIMARY KEY(cod_local)
);

CREATE TABLE tb_local_socio

CREATE TABLE tb_exame_medico

CREATE TABLE tb_mensalidade

CREATE TABLE tb_local_socio

CREATE TABLE tb_tipo_titulo (
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  desc_tipo_titulo VARCHAR(25) NOT NULL,
  ind_situacao CHAR(1) NOT NULL DEFAULT 'A',
  val_mensalidade NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_tipo_titulo PRIMARY KEY(cod_tipo_titulo)
);