CREATE TABLE [dbo].[Estados](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Sigla] [char](2) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_ESTADOS ON [dbo].[Estados] (Nome ASC) INCLUDE(Sigla)

GO

CREATE TABLE [dbo].[Cidades](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[EstadoId] [int] NOT NULL,
 CONSTRAINT [PK_Cidades] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_CIDADES ON [dbo].[Cidades] (NOME ASC)

GO

CREATE TABLE [dbo].[Bairros](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[CidadeId] [bigint] NOT NULL,
 CONSTRAINT [PK_Bairros] PRIMARY KEY CLUSTERED ([Id] ASC)
 )
GO

CREATE NONCLUSTERED INDEX IDX_BAIRROS ON [dbo].[Bairros] (NOME ASC)

GO

CREATE TABLE [dbo].[Logradouros](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[Numero] [nvarchar](50) NOT NULL,
	[Complemento] [nvarchar](100) NULL,
	[BairroId] [bigint] NOT NULL,
 CONSTRAINT [PK_Logradouros] PRIMARY KEY CLUSTERED ([Id] ASC)) ON [PRIMARY]

GO

CREATE NONCLUSTERED INDEX IDX_LOGRADOUROS ON [dbo].[Logradouros] (NOME ASC)

GO

CREATE TABLE Cliente (
    Id        INT NOT NULL,
    Nome      varchar(100) NOT NULL,
	Email      varchar(100) NOT NULL,
	LogradouroId bigint NOT NULL,
    PRIMARY KEY (id));

GO

CREATE NONCLUSTERED INDEX IDX_CLIENTE ON [dbo].[Cliente] (NOME ASC)

GO

CREATE TABLE Usuario (
    Id        INT NOT NULL,
    Nome      varchar(100) NOT NULL,
	LogradouroId bigint NOT NULL,
    PRIMARY KEY (id));

GO

CREATE NONCLUSTERED INDEX IDX_Usuario ON [dbo].[Usuario] (NOME ASC)

GO
CREATE TABLE Fornecedor (
    Id        INT NOT NULL,
    Nome      varchar(100) NOT NULL,
	LogradouroId bigint NOT NULL,
    PRIMARY KEY (id));

GO

CREATE NONCLUSTERED INDEX IDX_Fornecedor ON [dbo].[Fornecedor] (NOME ASC)

GO

CREATE TABLE Funcionario (
    Id        INT NOT NULL,
    Nome      varchar(100) NOT NULL,
	LogradouroId bigint NOT NULL,
    PRIMARY KEY (id));

GO

CREATE NONCLUSTERED INDEX IDX_Funcionario ON [dbo].[Funcionario] (NOME ASC)

GO
ALTER TABLE [dbo].[Cidades]  WITH CHECK ADD  CONSTRAINT [FK_Cidades_Estados] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Estados] ([Id])
GO
ALTER TABLE [dbo].[Cidades] CHECK CONSTRAINT [FK_Cidades_Estados]
GO
ALTER TABLE [dbo].[Bairros]  WITH CHECK ADD  CONSTRAINT [FK_Bairros_Cidades] FOREIGN KEY([CidadeId])
REFERENCES [dbo].[Cidades] ([Id])
GO
ALTER TABLE [dbo].[Bairros] CHECK CONSTRAINT [FK_Bairros_Cidades]
GO
ALTER TABLE [dbo].[Logradouros]  WITH CHECK ADD  CONSTRAINT [FK_Logradouros_Bairros] FOREIGN KEY([BairroId])
REFERENCES [dbo].[Bairros] ([Id])
GO
ALTER TABLE [dbo].[Logradouros] CHECK CONSTRAINT [FK_Logradouros_Bairros]
GO
ALTER TABLE [dbo].[Cliente]  WITH CHECK ADD  CONSTRAINT [FK_Cliente_Logradouro] FOREIGN KEY([LogradouroId])
REFERENCES [dbo].[Logradouros] ([Id])
GO
ALTER TABLE [dbo].[Cliente] CHECK CONSTRAINT [FK_Cliente_Logradouro]
GO
ALTER TABLE [dbo].[Usuario]  WITH CHECK ADD  CONSTRAINT [FK_Usuario_Logradouro] FOREIGN KEY([LogradouroId])
REFERENCES [dbo].[Logradouros] ([Id])
GO
ALTER TABLE [dbo].[Usuario] CHECK CONSTRAINT [FK_Usuario_Logradouro]
GO
ALTER TABLE [dbo].[Fornecedor]  WITH CHECK ADD  CONSTRAINT [FK_Fornecedor_Logradouro] FOREIGN KEY([LogradouroId])
REFERENCES [dbo].[Logradouros] ([Id])
GO
ALTER TABLE [dbo].[Fornecedor] CHECK CONSTRAINT [FK_Fornecedor_Logradouro]
GO
ALTER TABLE [dbo].[Funcionario]  WITH CHECK ADD  CONSTRAINT [FK_Funcionario_Logradouro] FOREIGN KEY([LogradouroId])
REFERENCES [dbo].[Logradouros] ([Id])
GO
ALTER TABLE [dbo].[Funcionario] CHECK CONSTRAINT [FK_Funcionario_Logradouro]

--DROP TABLE CLIENTE, LOGRADOUROS, BAIRROS, CIDADES,ESTADOS