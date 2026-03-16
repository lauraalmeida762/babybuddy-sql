USE MASTER IF EXISTS(SELECT * FROM SYS.databases WHERE NAME = 'bd_babybuddy')
DROP DATABASE bd_babybuddy
GO 

CREATE DATABASE bd_babybuddy
GO

USE bd_babybuddy




-- USUARIO
CREATE TABLE Usuario
(
      id				INT IDENTITY,
	  nome				VARCHAR(100)	NOT NULL,
	  email				VARCHAR(100)	NOT NULL,
	  senha				VARCHAR(255)	NOT NULL,
	  nivel_acesso		VARCHAR(20)		NOT NULL,
	  data_cadastro		DATETIME		NOT NULL,
	  status_usuario		VARCHAR(10)		NOT NULL,
	  
	  PRIMARY KEY (id)
)
	  GO

INSERT Usuario (nome, email, senha, nivel_acesso, data_cadastro, status_usuario)
VALUES ( 'Lorena souza',  'lorena@gmail.com', 'Gestante', 'lorenasouza1', GETDATE(), 'ATIVO')

GO
SELECT * FROM Usuario
 
 DROP TABLE Usuario





-- EVENTO
CREATE TABLE Evento
(
      id      INT IDENTITY,
	  tipo_evento VARCHAR (150)

	  PRIMARY KEY (id),
)
	  GO

INSERT Evento ( tipo_evento)
VALUES ('consulta' )

GO
SELECT * FROM Evento

DROP TABLE Evento





-- AGENDA
CREATE TABLE Agenda
(
      id			  INT IDENTITY,
	  usuario_id      INT, 
	  evento_id		  INT,
	  titulo		  VARCHAR(100) NOT NULL,
	  informacao	  VARCHAR(200) NULL,
	  data_agendada   DATETIME	   NOT NULL,
      data_cadastro   DATETIME     NOT NULL,
	  status_agenda   VARCHAR(100) NOT NULL,--AGENDADO, CANCELADO, EXCLUIDO OU PERDIDO
	
	  PRIMARY KEY (id), 
	  FOREIGN KEY (usuario_id) references Usuario (id),
      FOREIGN KEY (evento_id) references Evento (id)

)
	  GO

INSERT Agenda (usuario_id, evento_id, titulo, informacao, data_agendada, data_cadastro, status_agenda)
VALUES ( 1, 1, 'Análises ao sangue e urina', 'Levar coleta de urina e exame de sangue', GETDATE(), GETDATE(),  'AGENDADO')

GO
SELECT * FROM Agenda
 
 DROP TABLE Agenda





-- MATERIAL

CREATE TABLE Material
(
      id      INT IDENTITY,
	  titulo VARCHAR(150) NOT NULL,
	  link   VARCHAR(200) NULL,
	  arquivo VARCHAR(MAX) NULL,
	  data_publicacao   DATETIME NOT NULL,
	  autor   VARCHAR(200) NOT NULL,
	  status_material VARCHAR(50) NOT NULL,
  
	  PRIMARY KEY (id)
	  
)
	  GO

INSERT Material ( titulo, link, arquivo, data_publicacao, autor, status_material)
VALUES ( 'Alimentação do Bebe', 'Link', 'Introdução alimentar', GETDATE(), 'Tatiana Zanin', 'ATIVO' )

GO
SELECT * FROM Material
 
 DROP TABLE Material



-- FAVORITO
CREATE TABLE Favorit
(
      id      INT IDENTITY,
	  usuario_id INT,
	  material_id INT,
	  data_favoritada   DATETIME     NOT NULL,
  
	  PRIMARY KEY (id),
	  FOREIGN KEY(material_id) REFERENCES Material(id),
	  FOREIGN KEY(usuario_id) REFERENCES Usuario(id)
)
	  GO

INSERT Favorit (usuario_id, material_id, data_favoritada)
VALUES (1, 1, GETDATE())

GO
SELECT * FROM Favorit
 
 DROP TABLE Favorit




-- GESTANTE
CREATE TABLE Gestante
(
      id        INT IDENTITY,
	  usuario_id INT, 
	  data_registro   DATETIME NOT NULL,
      data_nascimento DATE NOT NULL,
	  observacoes VARCHAR(200) NOT NULL,
	  tipo_sanguineo VARCHAR(20) NOT NULL,

	  PRIMARY KEY (id),
	  FOREIGN KEY(usuario_id) REFERENCES Usuario(id)

)
	  GO

INSERT Gestante (usuario_id, data_registro, data_nascimento, observacoes, tipo_sanguineo)
VALUES ( 1, GETDATE(), GETDATE(), 'nenhum sintoma', 'o-')

GO
SELECT * FROM Gestante
 
DROP TABLE Gestante



-- GESTACAO

CREATE TABLE Gestacao
(
      id        INT IDENTITY,
	  gestante_id INT,
	  data_inicio  DATETIME NOT NULL,
      data_prevista_parto     DATETIME NOT NULL,
	  data_parto     DATETIME  NULL,
	  tipo_gestacao VARCHAR(100) NOT NULL,
	  observacoes VARCHAR(200) NOT NULL,
	  status_gestacao VARCHAR(30) NOT NULL,
	  
	  PRIMARY KEY (id), 
	  FOREIGN KEY (gestante_id) references Gestante (id)

)
	  GO

INSERT Gestacao (gestante_id,   data_inicio,  data_prevista_parto, data_parto, tipo_gestacao, observacoes, status_gestacao)
VALUES (1, GETDATE(),  GETDATE(), GETDATE(), 'Sem risco', 'Muitos enjoos', 'Ocorrendo')

GO
SELECT * FROM Gestacao
 
 DROP TABLE Gestacao



-- GESTACAOHISTORICO
CREATE TABLE GestacaoHistorico
(
      id        INT IDENTITY,
	  gestacao_id INT,
	  data_registro  DATETIME NOT NULL,
	  observacoes VARCHAR(200) NOT NULL,
	  peso_materno DECIMAL(5,2) NOT NULL,
	  pressao_arterial VARCHAR(20) NOT NULL,
	  semana_gestacional     INT  NOT NULL,

	  PRIMARY KEY (id),
	  CONSTRAINT fk_gestacao_historico FOREIGN KEY (gestacao_id) references Gestacao (id)
)
	 GO

INSERT into GestacaoHistorico (gestacao_id, data_registro, observacoes, peso_materno, pressao_arterial, semana_gestacional)
VALUES (1, GETDATE(),  'Muitos enjoos', 75.2, '90/60 mmHg', 36)

GO
SELECT * FROM GestacaoHistorico

 DROP TABLE GestacaoHistorico




 --SUPORTE
 CREATE TABLE suporte 
 (
    suporte_id INT IDENTITY PRIMARY KEY,
    usuario_id INT, 
    assunto VARCHAR(100) NOT NULL,
    mensagem TEXT NOT NULL,
    resposta TEXT NOT NULL,
    situacao_atual VARCHAR(20) NOT NULL,
    data_envio DATETIME NOT NULL,
    data_resposta DATETIME NOT NULL,
	
	 constraint fk_suporte_usuario FOREIGN KEY (suporte_id) references usuario (id)

)

   GO

   INSERT suporte (usuario_id, assunto, mensagem, resposta, situacao_atual,  data_envio, data_resposta)
   VALUES (1, 'erro no aplicativo', 'o aplicativo esta fechando quando tento registrar sintomas', 'estamos analisando o problema', 'respondido', GETDATE(), GETDATE())

   GO
   SELECT * FROM suporte

   DROP TABLE suporte




SELECT * FROM Usuario
SELECT * FROM Evento
SELECT * FROM Agenda
SELECT * FROM Material
SELECT * FROM Favorit
SELECT * FROM Gestante
SELECT * FROM Gestacao
SELECT * FROM GestacaoHistorico
SELECT * FROM suporte
