USE master;
IF EXISTS (SELECT * FROM sys.databases WHERE name = 'bd_babybuddy')
    DROP DATABASE bd_babybuddy;
GO

CREATE DATABASE bd_babybuddy;
GO

USE bd_babybuddy;
GO

-- TABELA: Usuario
CREATE TABLE Usuario
(
<<<<<<< HEAD
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
=======
    Id               INT IDENTITY,
    Nome             VARCHAR(100)     NOT NULL,
    Email            VARCHAR(100)     NOT NULL,
    Senha            VARCHAR(255)     NOT NULL,
    Nivel_Acesso     VARCHAR(20)      NOT NULL,
    Data_Cadastro    DATETIME         NOT NULL,
    Status_Usuario   VARCHAR(10)      NOT NULL, -- ATIVO / INATIVO
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

    PRIMARY KEY (Id)
);
GO
<<<<<<< HEAD
SELECT * FROM Usuario
 
 DROP TABLE Usuario

=======
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

INSERT INTO Usuario (Nome, Email, Senha, Nivel_Acesso, Data_Cadastro, Status_Usuario)
VALUES ('Lorena Souza', 'lorena@gmail.com', 'lorenasouza1', 'Gestante', GETDATE(), 'ATIVO');
GO

-- TABELA: Evento
CREATE TABLE Evento
(
    Id              INT IDENTITY,
    Tipo_Evento     VARCHAR(150)     NOT NULL,

    PRIMARY KEY (Id)
);
GO

<<<<<<< HEAD
DROP TABLE Evento

=======
INSERT INTO Evento (Tipo_Evento)
VALUES ('Consulta');
GO
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

-- TABELA: Agenda
CREATE TABLE Agenda
(
    Id                INT IDENTITY,
    Usuario_Id        INT             NOT NULL,
    Evento_Id         INT             NOT NULL,
    Titulo            VARCHAR(100)    NOT NULL,
    Informacao        VARCHAR(200)    NULL,
    Data_Agendada     DATETIME        NOT NULL,
    Data_Cadastro     DATETIME        NOT NULL,
    Status_Agenda     VARCHAR(20)     NOT NULL, -- AGENDADO, CANCELADO, EXCLUIDO, PERDIDO

    PRIMARY KEY (Id),
    FOREIGN KEY (Usuario_Id) REFERENCES Usuario(Id),
    FOREIGN KEY (Evento_Id)  REFERENCES Evento(Id)
);
GO
<<<<<<< HEAD
SELECT * FROM Agenda
 
 DROP TABLE Agenda

=======
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

INSERT INTO Agenda (Usuario_Id, Evento_Id, Titulo, Informacao, Data_Agendada, Data_Cadastro, Status_Agenda)
VALUES (1, 1, 'Análises de sangue e urina', 'Levar coleta de urina e exame de sangue', GETDATE(), GETDATE(), 'AGENDADO');
GO

-- TABELA: Material
CREATE TABLE Material
(
<<<<<<< HEAD
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
=======
    Id                INT IDENTITY,
    Titulo            VARCHAR(150)    NOT NULL,
    Link              VARCHAR(200)    NULL,
    Arquivo           VARBINARY(MAX)  NULL,
    Data_Publicacao   DATETIME        NOT NULL,
    Autor             VARCHAR(200)    NOT NULL,
    Status_Material   VARCHAR(20)     NOT NULL, -- ATIVO / INATIVO
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

    PRIMARY KEY (Id)
);
GO
<<<<<<< HEAD
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
=======

INSERT INTO Material (Titulo, Link, Arquivo, Data_Publicacao, Autor, Status_Material)
VALUES ('Alimentação do Bebê', NULL, NULL, GETDATE(), 'Tatiana Zanin', 'ATIVO');
GO

-- TABELA: Favorito
CREATE TABLE Favorito
(
    Id                INT IDENTITY,
    Usuario_Id        INT             NOT NULL,
    Material_Id       INT             NOT NULL,
    Data_Favoritada   DATETIME        NOT NULL,
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

    PRIMARY KEY (Id),
    FOREIGN KEY (Usuario_Id) REFERENCES Usuario(Id),
    FOREIGN KEY (Material_Id) REFERENCES Material(Id)
);
GO
<<<<<<< HEAD
SELECT * FROM Favorit
 
 DROP TABLE Favorit
=======
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

INSERT INTO Favorito (Usuario_Id, Material_Id, Data_Favoritada)
VALUES (1, 1, GETDATE());
GO

-- TABELA: Gestante
CREATE TABLE Gestante
(
<<<<<<< HEAD
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
=======
    Id                INT IDENTITY,
    Usuario_Id        INT             NOT NULL,
    Data_Registro     DATETIME        NOT NULL,
    Data_Nascimento   DATE            NOT NULL,
    Observacoes       VARCHAR(200)    NOT NULL,
    Tipo_Sanguineo    VARCHAR(5)      NOT NULL,
    Status_Gestante   VARCHAR(10)     NOT NULL, -- ATIVO / INATIVO
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

    PRIMARY KEY (Id),
    FOREIGN KEY (Usuario_Id) REFERENCES Usuario(Id)
);
GO
<<<<<<< HEAD
SELECT * FROM Gestante
 
DROP TABLE Gestante
=======

INSERT INTO Gestante (Usuario_Id, Data_Registro, Data_Nascimento, Observacoes, Tipo_Sanguineo, Status_Gestante)
VALUES (1, GETDATE(), '1998-05-15', 'Muitos enjôos.', 'A+', 'ATIVO');
GO
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

-- TABELA: Gestacao
CREATE TABLE Gestacao
(
    Id                    INT IDENTITY,
    Gestante_Id           INT             NOT NULL,
    Data_Inicio           DATETIME        NOT NULL,
    Data_Prevista_Parto   DATETIME        NOT NULL,
    Data_Parto            DATETIME        NULL,
    Tipo_Gestacao         VARCHAR(100)    NOT NULL,
    Observacoes           VARCHAR(200)    NOT NULL,
    Status_Gestacao       VARCHAR(30)     NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Gestante_Id) REFERENCES Gestante(Id)
);
GO

INSERT INTO Gestacao (Gestante_Id, Data_Inicio, Data_Prevista_Parto, Data_Parto, Tipo_Gestacao, Observacoes, Status_Gestacao)
VALUES (1, GETDATE(), DATEADD(MONTH, 9, GETDATE()), NULL, 'Sem risco', 'Muitos enjôos', 'Ocorrendo');
GO
<<<<<<< HEAD
SELECT * FROM Gestacao
 
 DROP TABLE Gestacao
=======

>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

-- TABELA: Gestacao_Historico
CREATE TABLE Gestacao_Historico
(
<<<<<<< HEAD
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
=======
    Id                    INT IDENTITY,
    Gestacao_Id           INT             NOT NULL,
    Data_Registro         DATETIME        NOT NULL,
    Observacoes           VARCHAR(200)    NOT NULL,
    Peso_Materno          DECIMAL(6,2)    NOT NULL,
    Pressao_Arterial      VARCHAR(20)     NOT NULL,
    Semana_Gestacional    VARCHAR(50)     NOT NULL,
>>>>>>> e9bd7a6eadd79366696f65f55b9ffd4235a79a9f

    PRIMARY KEY (Id),
    FOREIGN KEY (Gestacao_Id) REFERENCES Gestacao(Id)
);
GO
<<<<<<< HEAD
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
=======

INSERT INTO Gestacao_Historico (Gestacao_Id, Data_Registro, Observacoes, Peso_Materno, Pressao_Arterial, Semana_Gestacional)
VALUES (1, GETDATE(), 'Muitos enjôos', 75.20, '90/60 mmHg', 'Semana 36');
GO

-- CONSULTAS DE VERIFICAÇÃO
SELECT * FROM Usuario;
SELECT * FROM Evento;
SELECT * FROM Agenda;
SELECT * FROM Material;
SELECT * FROM Favorito;
SELECT * FROM Gestante;
SELECT * FROM Gestacao;
SELECT * FROM Gestacao_Historico;
GO
