USE Gufi_Manha;

SELECT Nome, Email, Senha, DataCadastro, Genero, TituloTipoUsuario FROM Usuario
INNER JOIN TipoUsuario ON TipoUsuario.IdTipoUsuario = Usuario.IdTipoUsuario;

SELECT * FROM Instituicao;

SELECT * FROM TipoEvento;

SELECT NomeEvento,DataEvento,Descricao,AcessoLivre, Instituicao.NomeFantasia FROM Evento
INNER JOIN Instituicao ON Instituicao.IdInstituicao = Evento.Idinstituicao
INNER JOIN TipoEvento ON TipoEvento.IdTipoEvento = Evento.IdTipoEvento
WHERE Evento.AcessoLivre = 0;
GO

SELECT * FROM Presenca
INNER JOIN Evento ON Evento.IdEvento = Presenca.IdEvento
INNER JOIN Usuario ON Presenca.IdUsuario = Usuario.IdUsuario
WHERE Usuario.IdUsuario = 2;


SELECT NomeEvento, Evento.IdEvento, DataEvento, CASE AcessoLivre WHEN '1' THEN 'Publico' WHEN '0' THEN 'Privado' END AS Acesso, Instituicao.CNPJ, Instituicao.NomeFantasia, Instituicao.Endereco , Nome, Email, DataCadastro, Genero  FROM Presenca
INNER JOIN Evento ON Evento.IdEvento = Presenca.IdEvento
INNER JOIN Usuario ON Presenca.IdUsuario = Usuario.IdUsuario
INNER JOIN Instituicao ON Instituicao.IdInstituicao = Evento.IdInstituicao
WHERE Usuario.IdUsuario = 2 AND Presenca.Situacao = 'Confirmada';

