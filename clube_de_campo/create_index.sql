CREATE INDEX idx_socio ON tb_socio (nome);

CREATE INDEX idx_local_socio1 ON tb_local_socio (cod_socio);
CREATE INDEX idx_local_socio2 ON tb_local_socio (dt_reserva);

CREATE INDEX idx_conta_receber1 ON tb_conta_receber (cod_socio);
CREATE INDEX idx_conta_receber2 ON tb_conta_receber (dt_vencimento);

CREATE INDEX idx_mensalidade ON tb_mensalidade (cod_socio);

CREATE INDEX idx_convidado1 ON tb_convidado (nome);
CREATE INDEX idx_convidado2 ON tb_convidado (cod_socio);

CREATE INDEX idx_dependente1 ON tb_dependente (nome);
CREATE INDEX idx_dependente2 ON tb_dependente (cod_socio);

CREATE INDEX idx_entrada_saida1 ON tb_entrada_saida (cod_socio);
CREATE INDEX idx_entrada_saida2 ON tb_entrada_saida (cod_dependente);
CREATE INDEX idx_entrada_saida3 ON tb_entrada_saida (cod_convidado);
CREATE INDEX idx_entrada_saida4 ON tb_entrada_saida (dt_entrada_saida);

CREATE INDEX idx_exame_medico1 ON tb_exame_medico (cod_socio);
CREATE INDEX idx_exame_medico2 ON tb_exame_medico (cod_dependente);
CREATE INDEX idx_exame_medico3 ON tb_exame_medico (cod_convidado);
CREATE INDEX idx_exame_medico4 ON tb_exame_medico (cod_medico);
CREATE INDEX idx_exame_medico5 ON tb_exame_medico (dt_exame);