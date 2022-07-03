CREATE TABLE tb_nota (
  cod_nota NUMBER(6,0) NOT NULL,
  cod_cadastro NUMBER(6,0) NOT NULL,
  dt_emissao DATE NOT NULL,
  num_nota DATE,
  CONSTRAINT pk_nota PRIMARY KEY (cod_nota),
  CONSTRAINT fk_notaXcadastro FOREIGN KEY (cod_cadastro) REFERENCES tb_cadastro (cod_cadastro)
);

CREATE TABLE tb_nota_produto (
  cod_nota_produto NUMBER(6,0) NOT NULL,
  cod_nota NUMBER(6,0) NOT NULL,
  qt_quantidade NUMBER(7,2) NOT NULL,
  val_unitario NUMBER(9,2) NOT NULL,
  cod_produto NUMBER(6,2) NOT NULL,
  CONSTRAINT pk_nota_produto PRIMARY KEY (cod_nota_produto),
  CONSTRAINT fk_notaXnota_produto FOREIGN KEY (cod_nota)
);