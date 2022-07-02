ALTER TABLE tb_tipo_titulo DROP CONSTRAINT pk_tipo_titulo;

ALTER TABLE tb_local DROP CONSTRAINT pk_local;

ALTER TABLE tb_estado DROP CONSTRAINT pk_estado;

ALTER TABLE tb_cidade DROP CONSTRAINT pk_cidade;
ALTER TABLE tb_cidade DROP CONSTRAINT fk_cidadeXestado;

ALTER TABLE tb_socio DROP CONSTRAINT pk_socio;
ALTER TABLE tb_socio DROP CONSTRAINT fk_socioXtipo_titulo;
ALTER TABLE tb_socio DROP CONSTRAINT fk_socioXcidade;

ALTER TABLE tb_local_socio DROP CONSTRAINT pk_local_socio;
ALTER TABLE tb_local_socio DROP CONSTRAINT fk_local_socioXlocal;
ALTER TABLE tb_local_socio DROP CONSTRAINT fk_local_socioXsocio;

ALTER TABLE tb_medico DROP CONSTRAINT pk_medico;
ALTER TABLE tb_medico DROP CONSTRAINT fk_medicoXcidade;

ALTER TABLE tb_conta_receber DROP CONSTRAINT pk_conta_receber;
ALTER TABLE tb_conta_receber DROP CONSTRAINT fk_conta_receberXsocio;
ALTER TABLE tb_conta_receber DROP CONSTRAINT fk_conta_receberXlocal_socio;

ALTER TABLE tb_mensalidade DROP CONSTRAINT pk_mensalidade;
ALTER TABLE tb_mensalidade DROP CONSTRAINT fk_mensalidadeXSocio;

ALTER TABLE tb_caixa DROP CONSTRAINT pk_caixa;
ALTER TABLE tb_caixa DROP CONSTRAINT fk_caixaXmensalidade;
ALTER TABLE tb_caixa DROP CONSTRAINT fk_caixaXconta_receber;
ALTER TABLE tb_caixa DROP CONSTRAINT fk_caixaXlocal_socio;
ALTER TABLE tb_caixa DROP CONSTRAINT fk_caixaXsocio;

ALTER TABLE tb_convidado DROP CONSTRAINT pk_convidado;
ALTER TABLE tb_convidado DROP CONSTRAINT fk_convidadoXsocio;

ALTER TABLE tb_dependente DROP CONSTRAINT pk_dependente;
ALTER TABLE tb_dependente DROP CONSTRAINT fk_dependenteXsocio;

ALTER TABLE tb_entrada_saida DROP CONSTRAINT pk_entrada_saida;
ALTER TABLE tb_entrada_saida DROP CONSTRAINT fk_entrada_saidaXsocio;
ALTER TABLE tb_entrada_saida DROP CONSTRAINT fk_entrada_saidaXdependente;
ALTER TABLE tb_entrada_saida DROP CONSTRAINT fk_entrada_saidaXconvidado;

ALTER TABLE tb_exame_medico DROP CONSTRAINT pk_exame_medico;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXsocio;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXdependente;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXconvidado;
ALTER TABLE tb_exame_medico DROP CONSTRAINT fk_exame_medicoXmedico;