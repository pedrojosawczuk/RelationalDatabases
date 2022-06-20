CREATE TABLE tb_caixa (
  cod_caixa NUMBER(9,0) NOT NULL,
  cod_mensalidade NUMBER(9,0),
  cod_conta_receber NUMBER(9,0),
  cod_local_socio NUMBER(9,0),
  cod_socio NUMBER(9,0) NOT NULL,
  dt_caixa DATE NOT NULL,
  val_caixa NUMBER(9,2) NOT NULL,
  desc_observacao VARCHAR2(100),
  CONSTRAINT pk_caixa PRIMARY KEY (cod_caixa),
  CONSTRAINT fk_caixaXmensalidade FOREIGN KEY (cod_mensalidade) REFERENCES tb_mensalidade (cod_mensalidade),
  CONSTRAINT fk_caixaXconta_receber FOREIGN KEY (cod_conta_receber) REFERENCES tb_conta_receber (cod_conta_receber),
  CONSTRAINT fk_caixaXlocal_socio FOREIGN KEY (cod_local_socio) REFERENCES tb_local_socio (cod_local_socio),
  CONSTRAINT fk_caixaXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio)
);

CREATE TABLE tb_cidade (
  cod_cidade NUMBER(6,0) NOT NULL,
  desc_cidade VARCHAR2(45) NOT NULL,
  cod_estado CHAR(2) NOT NULL,
  CONSTRAINT pk_cidade PRIMARY KEY (cod_cidade),
  CONSTRAINT fk_cidadeXestado FOREIGN KEY (cod_estado) REFERENCES tb_estado (cod_estado)
);

CREATE TABLE tb_conta_receber (
  cod_conta_receber NUMBER(6,0) NOT NULL,
  cod_socio NUMBER(6,0) NOT NULL,
  cod_local_socio NUMBER(6,0),
  dt_emissao DATE NOT NULL,
  dt_vencimento DATE NOT NULL,
  dt_pagamento DATE,
  val_original NUMBER(9,2) NOT NULL,
  val_titulo NUMBER(9,2) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  CONSTRAINT pk_conta_receber PRIMARY KEY (cod_conta_receber),
  CONSTRAINT fk_conta_receberXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio),
  CONSTRAINT fk_conta_receberXlocal_socio FOREIGN KEY (cod_local_socio) REFERENCES tb_local_socio (cod_local_socio)
);

CREATE TABLE tb_convidado (
  cod_convidado NUMBER(9,0) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  endereco VARCHAR2(35) NOT NULL,
  celular VARCHAR2(19),
  e_mail VARCHAR2(120),
  dt_convidado DATE NOT NULL,
  qt_dias NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0) NOT NULL,
  CONSTRAINT pk_convidado PRIMARY KEY (cod_convidado),
  CONSTRAINT fk_convidadoXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio)
);

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

CREATE TABLE tb_local_socio (
  cod_local_socio NUMBER(9,0) NOT NULL,
  cod_local NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0) NOT NULL,
  dt_reserva DATE NOT NULL,
  val_reserva NUMBER(9,2) NOT NULL,
  desc_observacao VARCHAR2(200),
  ind_situacao CHAR(1) DEFAULT 'A',
  CONSTRAINT pk_local_socio PRIMARY KEY (cod_local_socio),
  CONSTRAINT fk_local_socioXlocal FOREIGN KEY (cod_local) REFERENCES tb_local (cod_local),
  CONSTRAINT fk_local_socioXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio)
);

CREATE TABLE tb_medico (
  cod_medico NUMBER(6,0) NOT NULL,
  nome VARCHAR2(45) NOT NULL,
  endereco VARCHAR2(40) NOT NULL,
  e_mail VARCHAR2(150) NOT NULL,
  celular VARCHAR2(19) NOT NULL,
  cod_cidade NUMBER(6,0) NOT NULL,
  CONSTRAINT pk_medico PRIMARY KEY (cod_medico),
  CONSTRAINT fk_medicoXcidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade)
);

CREATE TABLE tb_mensalidade (
  cod_mensalidade NUMBER(6,0) NOT NULL,
  cod_socio NUMBER(6,0) NOT NULL,
  dt_emissao DATE NOT NULL,
  dt_vencimento DATE NOT NULL,
  dt_pagamento DATE,
  val_original NUMBER(9,2) NOT NULL,
  val_titulo NUMBER(9,0) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  CONSTRAINT pk_mensalidade PRIMARY KEY (cod_mensalidade),
  CONSTRAINT fk_mensalidadeXSocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio)
);

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
  CONSTRAINT fk_socioXtipo_titulo FOREIGN KEY (cod_tipo_titulo) REFERENCES tb_tipo_titulo (cod_tipo_titulo),
  CONSTRAINT fk_socioXcidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade)
);

CREATE TABLE tb_tipo_titulo (
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  desc_tipo_titulo VARCHAR2(25) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_mensalidade NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_tipo_titulo PRIMARY KEY (cod_tipo_titulo)
);