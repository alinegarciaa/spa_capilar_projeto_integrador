CREATE VIEW vw_agendamentos_detalhes AS
SELECT a.id AS agendamento_id, 
a.data_hora, 
a.status, 
c.nome AS cliente_nome,
p.nome AS profissional_nome, 
s.nome AS servico_nome
FROM agendamentos a
JOIN clientes c ON a.clientes_id = c.id
JOIN profissionais p ON a.profissionais_id = p.id
JOIN servicos s ON a.servicos_id = s.id;

SELECT * FROM vw_agendamentos_detalhes;
