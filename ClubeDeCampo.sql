DROP SEQUENCE sq_tipo_titulo;
DROP SEQUENCE sq_local;
DROP SEQUENCE sq_socio;
DROP SEQUENCE sq_local_socio;
DROP SEQUENCE sq_medico;
DROP SEQUENCE sq_conta_receber;
DROP SEQUENCE sq_mensalidade;
DROP SEQUENCE sq_caixa;
DROP SEQUENCE sq_convidado;
DROP SEQUENCE sq_dependente;
DROP SEQUENCE sq_entrada_saida;
DROP SEQUENCE sq_exame_medico;

DROP TABLE tb_exame_medico;
DROP TABLE tb_entrada_saida;
DROP TABLE tb_dependente;
DROP TABLE tb_convidado;
DROP TABLE tb_caixa;
DROP TABLE tb_mensalidade;
DROP TABLE tb_conta_receber;
DROP TABLE tb_medico;
DROP TABLE tb_local_socio;
DROP TABLE tb_socio;
DROP TABLE tb_cidade;
DROP TABLE tb_estado;
DROP TABLE tb_local;
DROP TABLE tb_tipo_titulo;

CREATE TABLE tb_tipo_titulo (
  cod_tipo_titulo NUMBER(6,0) NOT NULL,
  desc_tipo_titulo VARCHAR2(25) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_mensalidade NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_tipo_titulo PRIMARY KEY (cod_tipo_titulo)
);
CREATE SEQUENCE sq_tipo_titulo
  START WITH 1
  INCREMENT BY 1;

CREATE TABLE tb_local (
  cod_local NUMBER(6,0) NOT NULL,
  desc_local VARCHAR2(60) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  val_locacao NUMBER(9,2) NOT NULL,
  CONSTRAINT pk_local PRIMARY KEY (cod_local)
);
CREATE SEQUENCE sq_local
  START WITH 1
  INCREMENT BY 1;

CREATE TABLE tb_estado (
  cod_estado CHAR(2) NOT NULL,
  desc_estado VARCHAR2(35) NOT NULL,
  CONSTRAINT pk_estado PRIMARY KEY (cod_estado)
);

CREATE TABLE tb_cidade (
  cod_cidade NUMBER(6,0) NOT NULL,
  desc_cidade VARCHAR2(45) NOT NULL,
  cod_estado CHAR(2) NOT NULL,
  CONSTRAINT pk_cidade PRIMARY KEY (cod_cidade),
  CONSTRAINT fk_cidadeXestado FOREIGN KEY (cod_estado) REFERENCES tb_estado (cod_estado)
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
CREATE SEQUENCE sq_socio
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_socio ON tb_socio (nome);

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
CREATE SEQUENCE sq_local_socio
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_local_socio1 ON tb_local_socio (cod_socio);
CREATE INDEX idx_local_socio2 ON tb_local_socio (dt_reserva);

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
CREATE SEQUENCE sq_medico
  START WITH 1
  INCREMENT BY 1;

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
CREATE SEQUENCE sq_conta_receber
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_conta_receber1 ON tb_conta_receber (cod_socio);
CREATE INDEX idx_conta_receber2 ON tb_conta_receber (dt_vencimento);

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
CREATE SEQUENCE sq_mensalidade
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_mensalidade ON tb_mensalidade (cod_socio);

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
CREATE SEQUENCE sq_caixa
  START WITH 1
  INCREMENT BY 1;

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
CREATE SEQUENCE sq_convidado
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_convidado1 ON tb_convidado (nome);
CREATE INDEX idx_convidado2 ON tb_convidado (cod_socio);

CREATE TABLE tb_dependente (
  cod_dependente NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0) NOT NULL,
  nome VARCHAR2(40) NOT NULL,
  celular VARCHAR2(19),
  e_mail VARCHAR2(120),
  dt_nascimento DATE NOT NULL,
  sexo CHAR(1) DEFAULT 'M',
  grau_dependencia VARCHAR2(10) DEFAULT 'FILHO',
  ind_situacao CHAR(1) DEFAULT 'A'
);
ALTER TABLE tb_dependente DROP CONSTRAINT pk_dependente;
ALTER TABLE tb_dependente DROP CONSTRAINT fk_dependenteXsocio;

ALTER TABLE tb_dependente ADD CONSTRAINT pk_dependente PRIMARY KEY (cod_dependente);
ALTER TABLE tb_dependente ADD CONSTRAINT fk_dependenteXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);

CREATE SEQUENCE sq_dependente
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_dependente1 ON tb_dependente (nome);
CREATE INDEX idx_dependente2 ON tb_dependente (cod_socio);

CREATE TABLE tb_entrada_saida (
  cod_entrada_saida NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0),
  cod_dependente NUMBER(9,0),
  cod_convidado NUMBER(9,0),
  dt_entrada_saida DATE NOT NULL,
  desc_local VARCHAR2(15),
  ind_tipo CHAR(1) DEFAULT 'E',
);
ALTER TABLE tb_entrada_saida DROP CONSTRAINT pk_entrada_saida;
ALTER TABLE tb_entrada_saida DROP CONSTRAINT fk_entrada_saidaXsocio;
ALTER TABLE tb_entrada_saida DROP CONSTRAINT fk_entrada_saidaXdependente;
ALTER TABLE tb_entrada_saida DROP CONSTRAINT fk_entrada_saidaXconvidado;

ALTER TABLE tb_entrada_saida ADD CONSTRAINT pk_entrada_saida PRIMARY KEY (cod_entrada_saida);
ALTER TABLE tb_entrada_saida ADD CONSTRAINT fk_entrada_saidaXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);
ALTER TABLE tb_entrada_saida ADD CONSTRAINT fk_entrada_saidaXdependente FOREIGN KEY (cod_dependente) REFERENCES tb_dependente (cod_dependente);
ALTER TABLE tb_entrada_saida ADD CONSTRAINT fk_entrada_saidaXconvidado FOREIGN KEY (cod_convidado) REFERENCES tb_convidado (cod_convidado);

CREATE SEQUENCE sq_entrada_saida
  START WITH 1
  INCREMENT BY 1;
CREATE INDEX idx_entrada_saida1 ON tb_entrada_saida (cod_socio);
CREATE INDEX idx_entrada_saida2 ON tb_entrada_saida (cod_dependente);
CREATE INDEX idx_entrada_saida3 ON tb_entrada_saida (cod_convidado);
CREATE INDEX idx_entrada_saida4 ON tb_entrada_saida (dt_entrada_saida);

CREATE TABLE tb_exame_medico (
  cod_exame_medico NUMBER(9,0) NOT NULL,
  cod_socio NUMBER(9,0),
  cod_dependente NUMBER(9,0),
  cod_convidado NUMBER(9,0),
  cod_medico NUMBER(9,0) NOT NULL,
  dt_exame DATE NOT NULL,
  dias_validade NUMBER(9,0) NOT NULL,
  ind_situacao CHAR(1) DEFAULT 'A',
  desc_observacao VARCHAR2(300),
);
ALTER TABLE tb_exame_medico DROP CONSTRAINT pk_exame_medico;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXsocio;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXdependente;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXconvidado;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXmedico;

ALTER TABLE tb_exame_medico ADD CONSTRAINT pk_exame_medico PRIMARY KEY (cod_exame_medico);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXdependente FOREIGN KEY (cod_dependente) REFERENCES tb_dependente (cod_dependente);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXconvidado FOREIGN KEY (cod_convidado) REFERENCES tb_convidado (cod_convidado);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXmedico FOREIGN KEY (cod_medico) REFERENCES tb_medico (cod_medico);

CREATE SEQUENCE sq_exame_medico
  START WITH 1
  INCREMENT BY 1;

CREATE INDEX idx_exame_medico1 ON tb_exame_medico (cod_socio);
CREATE INDEX idx_exame_medico2 ON tb_exame_medico (cod_dependente);
CREATE INDEX idx_exame_medico3 ON tb_exame_medico (cod_convidado);
CREATE INDEX idx_exame_medico4 ON tb_exame_medico (cod_medico);
CREATE INDEX idx_exame_medico5 ON tb_exame_medico (dt_exame);