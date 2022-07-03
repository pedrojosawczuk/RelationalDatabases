ALTER TABLE tb_cadastro ADD COLUMN (
  e_mail VARCHAR2(100),
  endereco VARCHAR2(45),
  rendimentos NUMBER(9,2) DEFAULT 0
);