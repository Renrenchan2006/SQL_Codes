USE atividade_08_db;

-- Tabela de funcionário
CREATE TABLE Funcionario (
	cpf VARCHAR (11) PRIMARY KEY,
    nome VARCHAR (100) NOT NULL,
    salario DECIMAL (10,2) DEFAULT 2000,
    data_nascimento DATE
);

ALTER TABLE Funcionario ADD COLUMN email VARCHAR (100);

-- Tabela de Departamento
CREATE TABLE Departamento (
	id INT AUTO_INCREMENT PRIMARY KEY,
	nome VARCHAR (50) UNIQUE,
    gerente VARCHAR (11), 
    FOREIGN KEY (gerente) REFERENCES Funcionario (cpf)
    );
    
-- Alteração Tabela Funcionário
ALTER TABLE Funcionario ADD CONSTRAINT salario_min CHECK (salario >= 1000);

-- Insert Tabela de Funcinário)
INSERT INTO `atividade_08_db`.`Funcionario` (`cpf`, `nome`, `salario`, `data_nascimento`, `email`)
VALUES ('12345678912', 'Lucas', '2000', '01/01/01', 'lucas@lmail.com');
INSERT INTO `atividade_08_db`.`Funcionario` (`cpf`, `nome`, `salario`, `data_nascimento`, `email`)
VALUES ('09876543210', 'Anna', '2300', '27/03/03', 'anna@amail.com');
INSERT INTO `atividade_08_db`.`Funcionario` (`cpf`, `nome`, `salario`, `data_nascimento`, `email`)
VALUES ('12312312345', 'Marcos', '1500', '04/12/09', 'marcos@mmail.com');

INSERT INTO `atividade_08_db`.`Funcionario` (`cpf`, `nome`, `salario`, `data_nascimento`, `email`)
VALUES ('12345678900', 'Jonas', '129000', '19-08-11', 'jonas@jmail.com');

-- Alteração Tabela de Funcionário
UPDATE Funcionario
SET salario = 2500 
WHERE salario = 2000;

DELETE FROM Funcionario
WHERE cpf = 12345678900;

-- Insert Tabela de Departamento
INSERT INTO Departamento VALUES
(id, 'Contabilidade', '12345678912');
INSERT INTO Departamento VALUES
(id, 'Hellcursos Humanos', '09876543210');

-- Select salario 2200
select* from Funcionario
WHERE salario > 2200;

-- Tabela de Projeto
CREATE TABLE Projeto(
	id_projeto INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR (100),
    localidade VARCHAR (50),
    id_departamento INT,
    FOREIGN KEY (id_departamento) REFERENCES Departamento (id)
);

-- Insert Tabela de Projetos
INSERT INTO Projeto VALUES
(id_projeto, 'Festinha', 'Praça Principal', 2);
INSERT INTO Projeto VALUES
(id_projeto, 'Imposto', 'Sala 4', 1);

-- Select especifíco
SELECT 
p.nome AS nome_projeto,
d.nome AS nome_departamento,
f.nome AS nome_gerente
FROM Projeto p
JOIN Departamento d ON p.id_departamento = d.id
JOIN Funcionario f ON d.gerente = f.cpf;

-- SELECT GERAL
select* from Funcionario;
select* from Departamento;
select* from Projeto;