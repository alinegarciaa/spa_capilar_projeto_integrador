DELIMITER //
CREATE PROCEDURE sp_consultar_agendamentos_cliente(IN cliente_id INT)
BEGIN
    SELECT a.id, a.data_hora, a.status, s.nome AS servico_nome
    FROM agendamentos a
    JOIN servicos s ON a.servicos_id = s.id
    WHERE a.clientes_id = cliente_id;
END //
DELIMITER ;

CALL sp_consultar_agendamentos_cliente(1);
