USE atividade_09_db;

-- Tabela de funcionários
CREATE TABLE Funcionario(
	cpf VARCHAR (11) PRIMARY KEY,
    pnome VARCHAR (50) NOT NULL,
    unome VARCHAR (50) NOT NULL,
    endereco TEXT NOT NULL,
    salario DECIMAL (10,2) NOT NULL,
    cpf_supervisor VARCHAR (11),
    dno INT (2) NOT NULL
    )
    
-- Insert de tabela de funcionários
INSERT INTO `Funcionario` (`cpf`, `pnome`, `unome`, `endereco`, `salario`, `dno`) VALUES
('12345678901', 'Carlos', 'Carleon', 'Rua São Paulo, São Paulo, São Paulo', '6900', '1');
INSERT INTO `Funcionario` (`cpf`, `pnome`, `unome`, `endereco`, `salario`, `cpf_supervisor`, `dno`) VALUES
('12345678902', 'Acarlos', 'Acarloscida', 'CLN 406, Brasília, Distrito Federal', '6900', '20987654321', '8');
INSERT INTO `Funcionario` (`cpf`, `pnome`, `unome`, `endereco`, `salario`, `cpf_supervisor`, `dno`) VALUES
('12345678903', 'Carlas', 'Carlarina', 'R. Fonseca, Jaboatão, Pernambuco', '11000', '00000000000', '5');
INSERT INTO `Funcionario` (`cpf`, `pnome`, `unome`, `endereco`, `salario`, `cpf_supervisor`, `dno`) VALUES
('12345678904', 'Carlorenso', 'Carlauro', '???, ???, ???', '100000', '99112266882', '0');
INSERT INTO `Funcionario` (`cpf`, `pnome`, `unome`, `endereco`, `salario`, `dno`)
VALUES ('12345678905', 'Louis', 'Cypher', 'ZzZzZzZzZzZzZzZzZ', '0', '66');

-- Consulta geral
select* from Funcionario;

-- Consulta primeiro e ultimo nome de funcionário
SELECT pnome, unome FROM funcionario;

-- Consulta salários distintos
SELECT DISTINCT salario FROM funcionario;

-- Consulta nome e endereço de funcionários de SP
SELECT pnome, unome, endereco FROM funcionario
WHERE endereco LIKE '%São Paulo, São Paulo%';

-- Aumento de 15% do salário
SELECT 1.15* salario, pnome, unome FROM funcionario;

-- Funcionario sem supervisor
SELECT pnome, unome FROM funcionario
WHERE cpf_supervisor IS NULL;