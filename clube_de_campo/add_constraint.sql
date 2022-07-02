ALTER TABLE tb_tipo_titulo ADD CONSTRAINT pk_tipo_titulo PRIMARY KEY (cod_tipo_titulo);

ALTER TABLE tb_local ADD CONSTRAINT pk_local PRIMARY KEY (cod_local);

ALTER TABLE tb_estado ADD CONSTRAINT pk_estado PRIMARY KEY (cod_estado);

ALTER TABLE tb_cidade ADD CONSTRAINT pk_cidade PRIMARY KEY (cod_cidade);
ALTER TABLE tb_cidade ADD CONSTRAINT fk_cidadeXestado FOREIGN KEY (cod_estado) REFERENCES tb_estado (cod_estado);

ALTER TABLE tb_socio ADD CONSTRAINT pk_socio PRIMARY KEY (cod_socio);
ALTER TABLE tb_socio ADD CONSTRAINT fk_socioXtipo_titulo FOREIGN KEY (cod_tipo_titulo) REFERENCES tb_tipo_titulo (cod_tipo_titulo);
ALTER TABLE tb_socio ADD CONSTRAINT fk_socioXcidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade);

ALTER TABLE tb_local_socio ADD CONSTRAINT pk_local_socio PRIMARY KEY (cod_local_socio);
ALTER TABLE tb_local_socio ADD CONSTRAINT fk_local_socioXlocal FOREIGN KEY (cod_local) REFERENCES tb_local (cod_local);
ALTER TABLE tb_local_socio ADD CONSTRAINT fk_local_socioXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);

ALTER TABLE tb_medico ADD CONSTRAINT pk_medico PRIMARY KEY (cod_medico);
ALTER TABLE tb_medico ADD CONSTRAINT fk_medicoXcidade FOREIGN KEY (cod_cidade) REFERENCES tb_cidade (cod_cidade);

ALTER TABLE tb_conta_receber ADD CONSTRAINT pk_conta_receber PRIMARY KEY (cod_conta_receber);
ALTER TABLE tb_conta_receber ADD CONSTRAINT fk_conta_receberXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);
ALTER TABLE tb_conta_receber ADD CONSTRAINT fk_conta_receberXlocal_socio FOREIGN KEY (cod_local_socio) REFERENCES tb_local_socio (cod_local_socio);

ALTER TABLE tb_mensalidade ADD CONSTRAINT pk_mensalidade PRIMARY KEY (cod_mensalidade);
ALTER TABLE tb_mensalidade ADD CONSTRAINT fk_mensalidadeXSocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);

ALTER TABLE tb_caixa ADD CONSTRAINT pk_caixa PRIMARY KEY (cod_caixa);
ALTER TABLE tb_caixa ADD CONSTRAINT fk_caixaXmensalidade FOREIGN KEY (cod_mensalidade) REFERENCES tb_mensalidade (cod_mensalidade);
ALTER TABLE tb_caixa ADD CONSTRAINT fk_caixaXconta_receber FOREIGN KEY (cod_conta_receber) REFERENCES tb_conta_receber (cod_conta_receber);
ALTER TABLE tb_caixa ADD CONSTRAINT fk_caixaXlocal_socio FOREIGN KEY (cod_local_socio) REFERENCES tb_local_socio (cod_local_socio);
ALTER TABLE tb_caixa ADD CONSTRAINT fk_caixaXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);

ALTER TABLE tb_convidado ADD CONSTRAINT pk_convidado PRIMARY KEY (cod_convidado);
ALTER TABLE tb_convidado ADD CONSTRAINT fk_convidadoXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);

ALTER TABLE tb_dependente ADD CONSTRAINT pk_dependente PRIMARY KEY (cod_dependente);
ALTER TABLE tb_dependente ADD CONSTRAINT fk_dependenteXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);

ALTER TABLE tb_entrada_saida ADD CONSTRAINT pk_entrada_saida PRIMARY KEY (cod_entrada_saida);
ALTER TABLE tb_entrada_saida ADD CONSTRAINT fk_entrada_saidaXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);
ALTER TABLE tb_entrada_saida ADD CONSTRAINT fk_entrada_saidaXdependente FOREIGN KEY (cod_dependente) REFERENCES tb_dependente (cod_dependente);
ALTER TABLE tb_entrada_saida ADD CONSTRAINT fk_entrada_saidaXconvidado FOREIGN KEY (cod_convidado) REFERENCES tb_convidado (cod_convidado);

ALTER TABLE tb_exame_medico ADD CONSTRAINT pk_exame_medico PRIMARY KEY (cod_exame_medico);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXsocio FOREIGN KEY (cod_socio) REFERENCES tb_socio (cod_socio);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXdependente FOREIGN KEY (cod_dependente) REFERENCES tb_dependente (cod_dependente);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXconvidado FOREIGN KEY (cod_convidado) REFERENCES tb_convidado (cod_convidado);
ALTER TABLE tb_exame_medico ADD CONSTRAINT fk_exame_medicoXmedico FOREIGN KEY (cod_medico) REFERENCES tb_medico (cod_medico);