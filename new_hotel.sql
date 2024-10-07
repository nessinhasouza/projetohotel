-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE database mydb;
USE mydb;



-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`tb_hospede`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_hospede` (
  `cpf_hospede` INT NOT NULL,
  `nome_hospede` VARCHAR(45) NOT NULL,
  `telefone_hospede` BIGINT(15) NOT NULL,
  `sexo` ENUM('masculino', 'feminino') NOT NULL,
  PRIMARY KEY (`cpf_hospede`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_funcionario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_funcionario` (
  `cpf_funcionario` BIGINT(15) NOT NULL,
  `nome_funcionario` VARCHAR(45) NOT NULL,
  `cargo` VARCHAR(45) NOT NULL,
  `acesso` INT NOT NULL,
  `telefone` BIGINT(15) NOT NULL,
  `departamento` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cpf_funcionario`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`tb_quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_quarto` (
  `cod_quarto` BIGINT(15) NOT NULL,
  `ocupacao_maxima` INT NOT NULL,
  `status` ENUM('ocupado', 'livre') NOT NULL,
  PRIMARY KEY (`cod_quarto`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;


-- -----------------------------------------------------
-- Table `mydb`.`tb_categoria_quarto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_categoria_quarto` (
  `cod_categoria` BIGINT(15) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `tipo` ENUM('basico', 'luxo') NOT NULL,
  PRIMARY KEY (`cod_categoria`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;


-- -----------------------------------------------------
-- Table `mydb`.`tb_reserva`
-- -----------------------------------------------------
CREATE TABLE tb_reservas(
	cod_reserva BIGINT PRIMARY KEY AUTO_INCREMENT,
    data_reserva DATETIME NOT NULL,
    qtd_hospede INT NOT NULL,
    valor_total INT NOT NULL,
    status_reserva ENUM('disponível', 'ocupado') NOT NULL,
	chekout DATE NOT NULL,
    chekin DATE NOT NULL,
    fk_cod_quarto INT NOT NULL,
    fk_categoria_quarto INT NOT NULL,
    fk_cpf_hospede BIGINT NOT NULL
     
    
);

ALTER TABLE tb_reservas ADD CONSTRAINT rel_reservas_quarto FOREIGN KEY (fk_cod_quarto) REFERENCES tb_quarto(cod_quarto);
ALTER TABLE tb_reservas ADD CONSTRAINT rel_reservas_categoria_quarto FOREIGN KEY (fk_categoria_quarto) REFERENCES tb_categoria_quarto (Cód_Categoria);
ALTER TABLE tb_reservas ADD CONSTRAINT rel_reservas_hospede FOREIGN KEY (fk_cpf_hospede) REFERENCES tb_hospede (cpf_hospede);
DESCRIBE tb_reservas;
DROP TABLE mydb.tb_reserva;


-- -----------------------------------------------------
-- Table `mydb`.`tb_hotel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`tb_hotel` (
  `cnpj` BIGINT(15) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `endereço` VARCHAR(45) NOT NULL,
  `telefone` BIGINT(15) NOT NULL,
  `numero_quartos` INT NOT NULL,
  PRIMARY KEY (`cnpj`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = armscii8;

describe tb_hotel;
ALTER TABLE mydb.tb_quarto
MODIFY COLUMN cod_quarto BIGINT(15) NOT NULL;

#Povoamento das tabelas:
#Povoamento tabela hospede
INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('04920530249', 'Caio', '996304523', 'Masculino');

INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('04780530249', 'Vinicius', '999604523', 'Masculino');

-- Verificar a estrutura da tabela
DESCRIBE tb_hospede;

-- Ajustar o tipo de dados da coluna cpf_hospede, se necessário
ALTER TABLE tb_hospede MODIFY COLUMN cpf_hospede VARCHAR(15) NOT NULL;

-- Inserir os dados
INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('04780530249', 'Vinicius', '999604523', 'Masculino');

INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('04780530250', 'Vanessa', '987404398', 'Feminino');

INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('05080530250', 'Lilian', '996404398', 'Feminino');

INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('05089630250', 'Lucas', '816404398', 'Masculino');

INSERT INTO tb_hospede (cpf_hospede, nome_hospede, telefone_hospede, Sexo)
VALUES ('05060630250', 'Lucas', '776404398', 'Masculino');


DESCRIBE tb_hospede;

SELECT nome_hospede FROM tb_hospede;
SELECT cod_quarto FROM tb_quarto;


ALTER TABLE mydb.tb_quarto ADD COLUMN cod_quarto BIGINT(15) NOT NULL;

INSERT INTO mydb.tb_quarto (cod_quarto, ocupacao_maxima, status) VALUES
(1, 2, 'livre'),
(2, 4, 'ocupado'),
(3, 3, 'livre'),
(4, 2, 'ocupado'),
(5, 4, 'livre'),
(6, 3, 'ocupado'),
(7, 2, 'livre'),
(8, 4, 'ocupado'),
(9, 3, 'livre'),
(10, 2, 'ocupado');

DESCRIBE mydb.tb_quarto;
ALTER TABLE mydb.tb_quarto ADD COLUMN ocupacao_maxima INT NOT NULL;
ALTER TABLE mydb.tb_quarto ADD COLUMN status ENUM('ocupado', 'livre') NOT NULL;
ALTER TABLE mydb.tb_quarto MODIFY COLUMN cod_quarto BIGINT(15) AUTO_INCREMENT;
ALTER TABLE mydb.tb_quarto MODIFY COLUMN cod_quarto BIGINT(15) AUTO_INCREMENT PRIMARY KEY;
ALTER TABLE mydb.tb_quarto MODIFY COLUMN cod_quarto BIGINT(15) AUTO_INCREMENT;
ALTER TABLE mydb.tb_quarto ADD PRIMARY KEY (cod_quarto);

ALTER TABLE mydb.tb_quarto MODIFY COLUMN cod_quarto BIGINT(15) auto_increment;


INSERT INTO mydb.tb_categoria_quarto (Cód_Categoria, Descrição, Tipo) VALUES
(1, 'Quarto Standard', 'basico'),
(2, 'Quarto Deluxe', 'luxo'),
(3, 'Quarto Familiar', 'basico'),
(4, 'Suite Presidencial', 'luxo'),
(5, 'Quarto Econômico', 'basico'),
(6, 'Quarto Executivo', 'luxo'),
(7, 'Quarto Simples', 'basico'),
(8, 'Quarto Premium', 'luxo'),
(9, 'Quarto Compartilhado', 'basico'),
(10, 'Quarto VIP', 'luxo');

DESCRIBE tb_categoria_quarto;
SELECT Tipo FROM tb_categoria_quarto;

DESCRIBE mydb.tb_funcionário;

#atualizando a tabela categoria_quartos:
DESCRIBE mydb.tb_categoria_quarto;
ALTER TABLE mydb.tb_categoria_quarto MODIFY COLUMN tipo ENUM('basico', 'luxo');
SELECT * FROM mydb.tb_categoria_quarto WHERE tipo NOT IN ('basico', 'luxo');
UPDATE mydb.tb_categoria_quarto SET tipo = 'basico' WHERE tipo <> 'basico';
UPDATE mydb.tb_categoria_quarto SET tipo = 'luxo' WHERE tipo <> 'luxo';
DESCRIBE mydb.tb_categoria_quarto;

INSERT INTO mydb.tb_categoria_quarto (cod_categoria, descricao, tipo) VALUES
(1, 'Quarto Básico', 'basico'),
(2, 'Quarto de Luxo', 'luxo');

ALTER TABLE mydb.tb_categoria_quarto ADD COLUMN cod_categoria BIGINT(15) NOT NULL AUTO_INCREMENT FIRST;

DESCRIBE mydb.tb_funcionario;
INSERT INTO mydb.tb_funcionario (cpf_funcionario, nome_funcionario, cargo, acesso, telefone, departamento) VALUES
(12345678901, 'João', 'Gerente', 1, 1122334455, 'Administração'),
(23456789012, 'Maria', 'Atendente', 2, 9988776655, 'Recepção'),
(34567890123, 'Pedro', 'Técnico de TI', 1, 5544332211, 'Tecnologia da Informação'),
(45678901234, 'Ana', 'Analista Financeiro', 2, 3366998877, 'Financeiro'),
(56789012345, 'Carlos', 'Assistente de RH', 1, 7788996655, 'Recursos Humanos');



DESCRIBE mydb.tb_reserva;
INSERT INTO mydb.tb_reserva (codigo_reserva, data_reserva, qtd_hospedes, valor_total, status_reserva, chekin, chekout, tb_quarto_cod_quarto, tb_categoria_quarto_cod_categoria, tb_hospede_cpf_hospede)
 VALUES (),
 ();
INSERT INTO tb_reserva (data_reserva, qtd_hospedes, valor_total, status_reserva, chekin, chekout, cpf_hospede) 
VALUES ('2024-06-01', 2, 200, 'ocupado', '2024-06-01', '2024-06-05', 1, 1, 12345678901);

 DESCRIBE tb_reservas;
INSERT INTO tb_reservas (cod_reserva, data_reserva, qtd_hospede, valor_total, status_reserva, chekin, chekout, fk_cod_quarto, fk_categoria_quarto, fk_cpf_hospede) VALUES
(default, '2024-06-01', 2, 200, 'ocupado', '2024-06-01', '2024-06-05', 1, 1, 04780530249 );



ALTER TABLE mydb.tb_reserva
CHANGE COLUMN codigo_reserva id_reserva BIGINT(15) NOT NULL AUTO_INCREMENT PRIMARY KEY;

DESCRIBE tb_quarto;
#Criação das views:

CREATE VIEW vw_informacoes_reservas_por_quarto AS
SELECT 
    r.codigo_tb_reserva,
    r.data_reserva,
    r.qtd_hospedes,
    r.valor_total,
    r.status_reserva,
    r.tb_quarto_cod_quarto AS cod_quarto,
    q.ocupacao_maxima,
    q.status AS status_quarto
FROM 
    tb_reservas r
INNER JOIN 
    tb_quarto q ON r.tb_quarto_cod_quarto = q.cod_quarto;

#View com informações dos funcionários

CREATE VIEW vw_informacoes_funcionarios AS
SELECT 
    cpf_funcionario,
    nome_funcionario,
    cargo,
    acesso,
    telefone,
    departamento
FROM 
    tb_funcionario;

#Relatórios de Checkin e Checkout das reservas

CREATE VIEW vw_relatorio_checkin_checkout AS
SELECT 
    cod_reserva,
    chekin AS data_checkin,
    chekout AS data_checkout
FROM 
    tb_reservas;

#Informações de Reservas por Hóspede:
#Essa view pode fornecer uma lista de reservas para cada hóspede, incluindo datas de reserva, quartos reservados, status da reserva e valor total.

CREATE VIEW vw_informacoes_reservas_por_hospede AS
SELECT 
    r.cod_reserva,
    r.data_reserva,
    r.fk_cod_quarto AS cod_quarto,
    r.status_reserva,
    r.valor_total,
    h.cpf_hospede,
    h.nome_hospede,
    h.telefone_hospede
FROM 
    tb_reservas r
INNER JOIN 
    tb_hospede h ON r.fk_cpf_hospede= h.cpf_hospede;

#Disponibilidade de Quartos:
# view pode fornecer uma lista de quartos disponíveis em determinadas datas, mostrando quais quartos estão livres e quais estão ocupados.

CREATE VIEW vw_disponibilidade_quartos AS
SELECT 
    q.cod_quarto,
    CASE
        WHEN EXISTS (
            SELECT 1
            FROM tb_reservas r
            WHERE q.cod_quarto = r.fk_cod_quarto
            AND '2024-05-22' BETWEEN r.chekin AND r.chekout
        ) THEN 'ocupado'
        ELSE 'livre'
    END AS status_disponibilidade
FROM 
    tb_quarto q;

DESCRIBE mydb.tb_reservas;
 
SHOW CREATE VIEW vw_informacoes_funcionarios;
#criação de usuário 
CREATE USER 'estagiario'@'localhost' IDENTIFIED BY '123456';
GRANT SELECT, INSERT, UPDATE ON *.* TO 'estagiario'@'localhost';

CREATE TABLE tb_funcionarios_deletados(
id_exclusao INT PRIMARY KEY AUTO_INCREMENT,
cpf_antigo BIGINT(15),
nome_antigo VARCHAR(255),
cargo_antigo VARCHAR(255),
telefone_antigo BIGINT(15),
departamento_antigo VARCHAR(255),
usuario_resp VARCHAR(255)
);


DELIMITER //

CREATE TRIGGER before_delete_tb_funcionarios
BEFORE DELETE ON tb_funcionario
FOR EACH ROW
BEGIN
    INSERT INTO tb_funcionarios_deletados
    (cpf_antigo, nome_antigo, cargo_antigo, telefone_antigo, departamento_antigo, usuario_resp)
    VALUES 
    (OLD.cpf_funcionario, OLD.nome_funcionario, OLD.cargo, OLD.telefone, OLD.departamento, CURRENT_USER());
END //

DELIMITER ;

DESCRIBE tb_hotel;
select email from tb_hotel;
INSERT INTO tb_hotel VALUES (12345678901234, 'hotel1@example.com', 1122334455, 50);

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;




