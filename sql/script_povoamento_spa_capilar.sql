-- Povoamento do Banco de Dados do Spa Capilar --

INSERT INTO clientes (nome, endereco, telefone, email, data_nasci, historico_capilar) -- Inserindo dados na tabela cliente
VALUES
    ('Ana Silva', 'Rua das Flores, 123', '(11) 98765-4321', 'ana.silva@email.com', '1990-05-15', 'Cabelos secos, busca hidratação regular.'),
    ('João Santos', 'Av. Principal, 456', '(21) 99999-8888', 'joao.santos@email.com', '1985-10-20', 'Queda de cabelo moderada, histórico de tratamentos capilares.'),
    ('Maria Oliveira', 'Rua do Centro, 789', '(31) 1234-5678', 'maria.oliveira@email.com', '1988-03-25', 'Coloração frequente, preocupação com saúde do couro cabeludo.');
    
SELECT nome, endereco, telefone, email, data_nasci, historico_capilar FROM clientes; -- Recuperação dos dados da tabela clientes.

-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- --

INSERT INTO profissionais (nome, especializacao, telefone, email) -- Inserindo dados na tabela profissionais
VALUES
    ('Carlos Souza', 'Tricologista', '(11) 8765-4321', 'carlos.souza@email.com'),
    ('Juliana Lima', 'Esteticista Capilar', '(21) 9876-5432', 'juliana.lima@email.com'),
    ('Pedro Costa', 'Colorimetrista', '(31) 5555-7777', 'pedro.costa@email.com');

SELECT nome, especializacao, telefone, email FROM profissionais; -- Recuperação dos dados da tabela profissionais

-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- --

INSERT INTO produtos (nome, descricao, preco, quantidade_estoque) -- Inserindo dados na tabela produtos
VALUES
    ('Shampoo Hidratante', 'Shampoo para cabelos secos, com óleo de argan.', 25.90, 50),
    ('Condicionador Reparador', 'Condicionador para cabelos danificados, com proteínas.', 28.50, 40),
    ('Máscara Capilar Nutritiva', 'Máscara de tratamento intensivo para cabelos quimicamente tratados.', 35.75, 30);

SELECT nome, descricao, preco, quantidade_estoque FROM produtos; -- Recuperação dos dados da tabela produtos

-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- --

INSERT INTO servicos (nome, descricao, duracao, preco) -- Inserindo dados na tabela serviços
VALUES
    ('Tratamento Capilar Hidratante', 'Tratamento profundo para cabelos ressecados.', '01:00:00', 120.00),
    ('Coloração de Cabelos', 'Coloração permanente com produtos de alta qualidade.', '02:30:00', 250.00),
    ('Corte de Cabelo', 'Corte personalizado com consulta de visagismo.', '00:45:00', 80.00);

SELECT nome, descricao, duracao, preco FROM servicos; -- Recuperação dos dados da tabela serviços

-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- -- 

INSERT INTO disponibilidade_profissionais (dia_semana, hora_inicio, hora_fim, profissionais_id) -- Inserindo dados na tabela disponibilidades_profissionais
VALUES
    ('Segunda-feira', '08:00:00', '12:00:00', 1),
    ('Terça-feira', '13:00:00', '18:00:00', 1),
    ('Quarta-feira', '09:00:00', '15:00:00', 2),
    ('Quinta-feira', '10:00:00', '17:00:00', 3);

SELECT dia_semana, hora_inicio, hora_fim, profissionais_id FROM disponibilidade_profissionais; -- Recuperação dos dados da tabela disponibilidades_profissionais

-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- -- 

INSERT INTO agendamentos (data_hora, status, clientes_id, profissionais_id, servicos_id)  -- Inserindo dados na tabela agendamentos
VALUES
    ('2024-07-10 10:00:00', 'Confirmado', 1, 1, 1),
    ('2024-07-12 15:00:00', 'Pendente', 2, 2, 2),
    ('2024-07-15 09:30:00', 'Confirmado', 3, 3, 3);

SELECT data_hora, status, clientes_id, profissionais_id, servicos_id FROM agendamentos; -- Recuperação dos dados da tabela agendamentos
-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- -- 

INSERT INTO pagamentos (metodo_pagamento, valor, data_pagamento, agendamentos_id) -- Inserindo dados na tabela pagamentos
VALUES
    ('Cartão de Crédito', 120.00, '2024-07-10 11:00:00', 1),
    ('Dinheiro', 250.00, '2024-07-12 17:30:00', 2),
    ('Pix', 80.00, '2024-07-15 10:00:00', 3);
    
SELECT metodo_pagamento, valor, data_pagamento, agendamentos_id FROM pagamentos; -- Recuperação dos dados da tabela agendamentos
-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- -- 

INSERT INTO agendamentos_produtos (quantidade, agendamentos_id, produtos_id)
VALUES
    (1, 1, 1),
    (2, 2, 2),
    (3, 3, 3);

SELECT quantidade, agendamentos_id, produtos_id FROM agendamentos_produtos;

-- ----------------------------------------------------------------------------------------------------------------------------- --
-- ----------------------------------------------------------------------------------------------------------------------------- --     

INSERT INTO estoque (quantidade, produtos_id)
VALUES
    (50, 1),
    (40, 2),
    (30, 3);

SELECT quantidade, produtos_id FROM estoque; 