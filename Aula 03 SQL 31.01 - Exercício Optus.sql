--DDL Linguagem de definiçao de dados

--Criar o banco de dados
CREATE DATABASE Optus_Manha;

USE Optus_Manha;

CREATE TABLE Estilos (
    IdEstilo    INT PRIMARY KEY IDENTITY,
    Nome        VARCHAR(250) 
);


CREATE TABLE Artistas (
    IdArtista   INT PRIMARY KEY IDENTITY,
    Nome        VARCHAR(250)  
);


CREATE TABLE Albuns(
    IdAlbum        INT PRIMARY KEY IDENTITY,
    Nome           VARCHAR(250) NOT NULL UNIQUE,
    DataLancamento DATE,
    Localizacao    VARCHAR(200),
    QtdMinutos     BIGINT,
    IdArtista      INT FOREIGN KEY REFERENCES Artistas (IdArtista),
	IdEstilo	   INT FOREIGN KEY REFERENCES Estilos (IdEstilo)
);

CREATE TABLE TipoUsuario (
	IdTipoUsuario INT PRIMARY KEY IDENTITY,
	Titulo		  VARCHAR(200)
);


CREATE TABLE Usuarios (
    IdUsuario      INT PRIMARY KEY IDENTITY,
    Nome           VARCHAR(250), 
    Email          VARCHAR(250),
    Senha          VARCHAR(250), 
    Permissao      VARCHAR(200),
	IdTipoUsuario  INT FOREIGN KEY REFERENCES TipoUsuario (IdTipoUsuario)
);

SELECT * FROM Albuns;

-- ALTERAÇÃO DE TABELA EXCLUIR COLUNA
ALTER TABLE Usuarios
DROP COLUMN Permissao;

-- DROP APAGAR TABELA
DROP TABLE Albuns;


-- DML LINGUAGEM DE MANIPULACAO DE DADOS
SELECT * FROM Estilos;
SELECT * FROM Albuns;
SELECT * FROM Artistas;
SELECT * FROM TipoUsuario;
SELECT * FROM Usuarios;

-- COMANDO DE INSERIR DADOS 
INSERT INTO Estilos (Nome)
VALUES ('Pagode'),('Samba'),('Rock');

INSERT INTO Artistas (Nome)
VALUES ('Anita'),('Zeca Pagodinha'),('Pitty');

INSERT INTO Artistas (Nome)
VALUES ('Queen'),('Guns');

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('Pitty todos os sucessos','29/01/2020','SP', 120, 3, 3),
	   ('Tom','23/01/2020','RJ', 100, 2, 2);

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('queen greatest hits','02/11/1981','Londres', 120, 4, 3),
	   ('Appetite for Destruction e G N R Lies ','01/02/1987','USA', 100, 5, 3);

INSERT INTO Albuns (Nome, DataLancamento, Localizacao, QtdMinutos, IdArtista, IdEstilo)
VALUES ('queen greatest hits 1','02/11/1981','Londres', 120, 4, 3),
	   ('Appetite for Destruction','01/02/1987','USA', 100, 5, 3);

-- Update Alterar dados

UPDATE Artistas
SET Nome = 'ZECA PAGODINHO'
WHERE IdArtista = 2;

--DELETE APAGAR DADOS 
DELETE FROM Artistas
WHERE IdArtista = 5;

--Limpar todos os dados da tabela
TRUNCATE TABLE Albuns;


--DQL LINGUAGEM DE CONSULTA DE DADOS

-- SELECIONAR DADOS (SELECT)

SELECT * FROM Artistas;

-- Operadores < > =

SELECT * FROM Albuns WHERE IdAlbum = 1;

SELECT * FROM Albuns WHERE IdAlbum > 1;

-- OR  OU

--Checar Nome e QtdMinutos dentro de Album e ver se DataLancamento e Localizacao estão vazios - se não voltar resultados é porque está preenchido corretamente.

SELECT Nome, QtdMinutos FROM Albuns
WHERE (DataLancamento IS NULL) or (Localizacao IS NULL);

/* comentario de bloco */

--Filtro de texto

SELECT IdArtista, Nome FROM Artistas
WHERE Nome LIKE 'Pitty%' ; --% pra pesquisar o texto no começo da frase.

-- Pitty% -> pesquisar Pitty como a primeira palavra
-- %Pitty -> pesquisar Pitty como a última palavra
-- %Pitty% -> pesquisar Pitty como qualquer palavra do texto


--ORDENAÇÃO

SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos ;

--ORDENAÇÃO INVERTIDA

SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos DESC;

--ORDENAÇÃO ASCENDENTE

SELECT IdAlbum, Nome, QtdMinutos FROM Albuns
ORDER BY QtdMinutos ASC;

--CONT

SELECT COUNT (IdAlbum) FROM Albuns;




SELECT * FROM Albuns WHERE IdArtista LIKE 1


SELECT * FROM Albuns WHERE DataLancamento LIKE '01/02/1987'


SELECT Nome FROM Albuns WHERE IdEstilo LIKE 2 


SELECT * FROM Albuns ORDER BY DataLancamento DESC