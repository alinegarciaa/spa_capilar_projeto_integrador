CREATE INDEX idx_cliente_profissional 
ON agendamentos (clientes_id, profissionais_id);

EXPLAIN SELECT * FROM agendamentos
WHERE clientes_id = 1 AND profissionais_id = 2;
