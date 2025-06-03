USE atividade_10_db;
 
 -- Tabela Funcionário
 CREATE TABLE Funcionario(
	cpf VARCHAR (15) NOT NULL PRIMARY KEY,
    funcionario_cpf VARCHAR (15), -- Supervisor
    departamento_dnumero INT,
    pnome VARCHAR(60),
    unome VARCHAR (30),
    endereco VARCHAR (80),
    sexo CHAR(1) CHECK( sexo IN('M', 'F')),
    salario REAL
);

-- Tabela Departamento
CREATE TABLE Departamento(
	dnumero INT PRIMARY KEY,
    dnome VARCHAR(30),
    cpf_gerente VARCHAR(15),
    
	-- Gerente
    CONSTRAINT fk_gerente FOREIGN KEY (cpf_gerente)
    REFERENCES Funcionario(cpf)
    );
    
-- Adição tabela funcionario
ALTER TABLE Funcionario
-- Supervisor
ADD CONSTRAINT fk_supervisor_cpf FOREIGN KEY (funcionario_cpf)
REFERENCES Funcionario(cpf),
ADD CONSTRAINT fk_supervisor FOREIGN KEY (departamento_dnumero)
REFERENCES Departamento(dnumero);

-- Tabela Dependente
CREATE TABLE Dependente(
	cpf VARCHAR(15),
    nome_dependente VARCHAR(60),
    parentesco VARCHAR(20)
);

ALTER TABLE Dependente
ADD CONSTRAINT fk_dependente_funcionario FOREIGN KEY (cpf)
REFERENCES Funcionario(cpf);

-- Tabela Projeto
CREATE TABLE Projeto(
	pnumero INT,
    pjnome VARCHAR(30),
    dnumero INT
);

ALTER TABLE Projeto
ADD CONSTRAINT fk_projeto_departamento FOREIGN KEY (dnumero)
REFERENCES Departamento(dnumero);
ALTER TABLE Projeto
ADD PRIMARY KEY (pnumero);
    
-- Tabela Trabalha_em
CREATE TABLE Trabalha_em(
	funcionario_cpf VARCHAR(15),
    projeto_pnumero INT 
);

ALTER TABLE Trabalha_em
ADD CONSTRAINT fk_trabalha_funcionario FOREIGN KEY (funcionario_cpf)
REFERENCES Funcionario(cpf),
ADD CONSTRAINT fk_trabalha_projeto FOREIGN KEY (projeto_pnumero)
REFERENCES Projeto(pnumero);

-- Dados Table Departamento
INSERT INTO `atividade_10_db`.`Departamento` (`dnumero`, `dnome`) VALUES ('9', 'Nove');
INSERT INTO `atividade_10_db`.`Departamento` (`dnumero`, `dnome`) VALUES ('4', 'Quatro');
INSERT INTO `atividade_10_db`.`Departamento` (`dnumero`, `dnome`) VALUES ('5', 'Cinco');
INSERT INTO `atividade_10_db`.`Departamento` (`dnumero`, `dnome`) VALUES ('8', 'Oito');
INSERT INTO `atividade_10_db`.`Departamento` (`dnumero`, `dnome`) VALUES ('0', 'Zero');

-- Dados Table Funcionario
INSERT INTO Funcionario 
(cpf, departamento_dnumero, pnome, unome, endereco, sexo, salario) 
VALUES 
('505.505.505.505', '9', 'Arquetique', 'Monquei', 'Campinas, São Paulo', 'M', '50505'),
('444.444.444.444', '4', 'Fourquatro', 'DeCuattro', 'Ceilondres, Distrito Federal', 'F', '40000');
INSERT INTO Funcionario 
(cpf, funcionario_cpf, departamento_dnumero, pnome, unome, endereco, sexo, salario) 
VALUES
('000.111.222.333', '505.505.505.505', '5', 'Pregui', 'Sá', 'São Paulo, São Paulo', 'F', '12300'),
('001.001.001.001', '505.505.505.505', '5', 'Binarey', 'Numbere', 'São Paulo, São Paulo', 'M', '12300'),
('123.456.789.000', '505.505.505.505', '5', 'Naon-Eh', 'Alfabet', 'São Lourenço, São Paulo', 'F', '12300'),
('111.111.111.111', '444.444.444.444', '4', 'Oneum', 'DeUnno', 'Caruaru, Pernambuco', 'F', '10000'),
('222.222.222.222', '444.444.444.444', '4', 'Twodois', 'DeDoss', 'Palmas, Belém', 'F', '20000'),
('333.333.333.333', '444.444.444.444', '4', 'Threetrês', 'DeTriez', 'Fordlândia, Amazônia', 'M', '30000');
INSERT INTO Funcionario 
(cpf, departamento_dnumero, pnome, unome, endereco, sexo, salario) 
VALUES
('000.987.654.321', '8', 'tebaflA', 'hE-noaN', 'Xique-Xique, Bahia', 'M', '3400'),
('102.030.405.060', '0', 'sem', 'nome', 'São José dos Campos, São Paulo', 'F', '19000');

-- Dados Table Departamento (cpf gerente)
UPDATE `atividade_10_db`.`Departamento` SET `cpf_gerente` = '000.111.222.333' WHERE (`dnumero` = '9');
UPDATE `atividade_10_db`.`Departamento` SET `cpf_gerente` = '444.444.444.444' WHERE (`dnumero` = '4');

-- Dados Table Dependente
INSERT INTO Dependente
(cpf, nome_dependente, parentesco)
VALUES
('505.505.505.505', 'Dê Estroques', 'Tio'),
('505.505.505.505', 'Interpoleuson', 'Primo'),
('222.222.222.222', 'SixSeis DiSeix', 'Produto'),
('333.333.333.333', 'FiveCinco DiCinquo', 'Soma'),
('123.456.789.000', 'ABCarlos', 'Filho'),
('102.030.405.060', 'Isento do Nome', 'Filho');

-- Dados Table Projeto
INSERT INTO `atividade_10_db`.`Projeto` (`pnumero`, `pjnome`, `dnumero`) VALUES ('1', 'Shawarma', '4');
INSERT INTO `atividade_10_db`.`Projeto` (`pnumero`, `pjnome`, `dnumero`) VALUES ('2', 'Dodecaedro de Giza', '5');
INSERT INTO `atividade_10_db`.`Projeto` (`pnumero`, `pjnome`, `dnumero`) VALUES ('3', 'Jaime Teiaa', '9');
INSERT INTO `atividade_10_db`.`Projeto` (`pnumero`, `pjnome`, `dnumero`) VALUES ('4', 'Half Life 3', '0');
INSERT INTO `atividade_10_db`.`Projeto` (`pnumero`, `pjnome`, `dnumero`) VALUES ('5', 'Gaur Plains', '8');

-- Dados Table Trabalha_em
INSERT INTO Trabalha_em
VALUES
('505.505.505.505', 3),
('444.444.444.444', 1),
('000.111.222.333', 2),
('001.001.001.001', 2),
('123.456.789.000', 3),
('111.111.111.111', 1),
('222.222.222.222', 1),
('333.333.333.333', 1),
('000.987.654.321', 5),
('102.030.405.060', 4);

UPDATE `atividade_10_db`.`Departamento` SET `dnome` = 'Pesquisa' WHERE (`dnumero` = '9');


select* from Funcionario;
select* from Departamento;
select* from Dependente;
select* from Projeto;
select* from Trabalha_em;

-- Parte 1 Consulta Básico
SELECT pnome, unome, salario FROM Funcionario;

SELECT* FROM Funcionario
WHERE salario>=30000;

SELECT funcionario_cpf
FROM Trabalha_em
WHERE projeto_pnumero IN (1, 2, 3);

SELECT dnumero, dnome
FROM Departamento
ORDER BY dnome;

-- Parte 2 Consulta Intermediário
SELECT f.pnome, f.unome, f.endereco
FROM Funcionario f
INNER JOIN Departamento d ON f.departamento_dnumero = d.dnumero
WHERE d.dnome = 'Pesquisa';

SELECT 
  f.pnome AS funcionario_pnome,
  f.unome AS funcionario_unome,
  s.pnome AS supervisor_pnome,
  s.unome AS supervisor_unome
FROM Funcionario f
LEFT JOIN Funcionario s ON f.funcionario_cpf = s.cpf;

SELECT COUNT(DISTINCT salario) AS total_salarios_diferentes
FROM Funcionario;

SELECT 
  MAX(salario) AS maior_salario,
  MIN(salario) AS menor_salario
FROM Funcionario;

-- Parte 3 Consulta Avançada
SELECT 
  departamento_dnumero AS numero_departamento,
  COUNT(*) AS total_funcionarios,
  AVG(salario) AS media_salarial
FROM Funcionario
GROUP BY departamento_dnumero;

SELECT 
  projeto_pnumero,
  COUNT(funcionario_cpf) AS total_funcionarios
FROM Trabalha_em
GROUP BY projeto_pnumero
HAVING COUNT(funcionario_cpf) > 2;

SELECT pnome, unome
FROM Funcionario
WHERE cpf IN (
    SELECT cpf
    FROM Dependente
    GROUP BY cpf
    HAVING COUNT(*) >= 2
);

SELECT f.pnome, f.unome
FROM Funcionario f
WHERE EXISTS (
    SELECT 1
    FROM Departamento d
    WHERE d.cpf_gerente = f.cpf
)
AND EXISTS (
    SELECT 1
    FROM Dependente dep
    WHERE dep.cpf = f.cpf
);
  
SELECT DISTINCT f.pnome, f.unome
FROM Funcionario f
JOIN Trabalha_em te ON f.cpf = te.funcionario_cpf
JOIN Projeto p ON te.projeto_pnumero = p.pnumero
JOIN Departamento d ON p.dnumero = d.dnumero
WHERE d.dnome = 'Pesquisa'
  AND EXISTS (
    SELECT 1
    FROM Dependente dep
    WHERE dep.cpf = f.cpf
  )
  AND f.salario > (
    SELECT AVG(salario)
    FROM Funcionario
  );