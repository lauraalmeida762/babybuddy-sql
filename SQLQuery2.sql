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
    Id               INT IDENTITY,
    Nome             VARCHAR(100)     NOT NULL,
    Email            VARCHAR(100)     NOT NULL,
    Senha            VARCHAR(255)     NOT NULL,
    Nivel_Acesso     VARCHAR(20)      NOT NULL,
    Data_Cadastro    DATETIME         NOT NULL,
    Status_Usuario   VARCHAR(10)      NOT NULL, -- ATIVO / INATIVO

    PRIMARY KEY (Id)
);
GO

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

INSERT INTO Evento (Tipo_Evento)
VALUES ('Consulta');
GO

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

INSERT INTO Agenda (Usuario_Id, Evento_Id, Titulo, Informacao, Data_Agendada, Data_Cadastro, Status_Agenda)
VALUES (1, 1, 'Análises de sangue e urina', 'Levar coleta de urina e exame de sangue', GETDATE(), GETDATE(), 'AGENDADO');
GO

-- TABELA: Material
CREATE TABLE Material
(
    Id                INT IDENTITY,
    Titulo            VARCHAR(150)    NOT NULL,
    Link              VARCHAR(200)    NULL,
    Arquivo           VARBINARY(MAX)  NULL,
    Data_Publicacao   DATETIME        NOT NULL,
    Autor             VARCHAR(200)    NOT NULL,
    Status_Material   VARCHAR(20)     NOT NULL, -- ATIVO / INATIVO

    PRIMARY KEY (Id)
);
GO

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

    PRIMARY KEY (Id),
    FOREIGN KEY (Usuario_Id) REFERENCES Usuario(Id),
    FOREIGN KEY (Material_Id) REFERENCES Material(Id)
);
GO

INSERT INTO Favorito (Usuario_Id, Material_Id, Data_Favoritada)
VALUES (1, 1, GETDATE());
GO

-- TABELA: Gestante
CREATE TABLE Gestante
(
    Id                INT IDENTITY,
    Usuario_Id        INT             NOT NULL,
    Data_Registro     DATETIME        NOT NULL,
    Data_Nascimento   DATE            NOT NULL,
    Observacoes       VARCHAR(200)    NOT NULL,
    Tipo_Sanguineo    VARCHAR(5)      NOT NULL,
    Status_Gestante   VARCHAR(10)     NOT NULL, -- ATIVO / INATIVO

    PRIMARY KEY (Id),
    FOREIGN KEY (Usuario_Id) REFERENCES Usuario(Id)
);
GO

INSERT INTO Gestante (Usuario_Id, Data_Registro, Data_Nascimento, Observacoes, Tipo_Sanguineo, Status_Gestante)
VALUES (1, GETDATE(), '1998-05-15', 'Muitos enjôos.', 'A+', 'ATIVO');
GO

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


-- TABELA: Gestacao_Historico
CREATE TABLE Gestacao_Historico
(
    Id                    INT IDENTITY,
    Gestacao_Id           INT             NOT NULL,
    Data_Registro         DATETIME        NOT NULL,
    Observacoes           VARCHAR(200)    NOT NULL,
    Peso_Materno          DECIMAL(6,2)    NOT NULL,
    Pressao_Arterial      VARCHAR(20)     NOT NULL,
    Semana_Gestacional    VARCHAR(50)     NOT NULL,

    PRIMARY KEY (Id),
    FOREIGN KEY (Gestacao_Id) REFERENCES Gestacao(Id)
);
GO

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
