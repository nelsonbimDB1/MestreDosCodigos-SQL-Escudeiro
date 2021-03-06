
CREATE TABLE [dbo].[Bairros](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[MunicipioId] [bigint] NOT NULL,
 CONSTRAINT [PK_Bairros] PRIMARY KEY CLUSTERED ([Id] ASC)
 )
GO

CREATE NONCLUSTERED INDEX IDX_BAIRROS ON [dbo].[Bairros] (NOME ASC)

GO
CREATE TABLE [dbo].[Documento](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Documento] [nvarchar](50) NOT NULL,
	[TipoDocumentoId] [bigint] NOT NULL,
 CONSTRAINT [PK_Documento] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_DOCUMENTO ON [dbo].[Documento] (Documento ASC)

GO
CREATE TABLE [dbo].[Estados](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Sigla] [char](2) NOT NULL,
	[Nome] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Estados] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_ESTADOS ON [dbo].[Estados] (Nome ASC) INCLUDE(Sigla)

GO
CREATE TABLE [dbo].[Fornecedores](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](10) NOT NULL,
	[LogradouroId] [bigint] NOT NULL,
	[DocumentoId] [bigint] NOT NULL,
 CONSTRAINT [PK_Fornecedores] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_FORNECEDORES ON [dbo].[Fornecedores] (NOME ASC)

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
CREATE TABLE [dbo].[Municipios](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nvarchar](150) NOT NULL,
	[EstadoId] [bigint] NOT NULL,
 CONSTRAINT [PK_Municipios] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_MUNICIPIOS ON [dbo].[Municipios] (NOME ASC)

GO
CREATE TABLE [dbo].[Produtos](
	[Id] [bigint] NOT NULL,
	[Nome] [nvarchar](100) NOT NULL,
	[Valor] [decimal](18, 2) NOT NULL,
 CONSTRAINT [PK_Produtos] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_PRODUTOS ON [dbo].[Produtos] (NOME ASC) INCLUDE(Valor)

GO
CREATE TABLE [dbo].[ProdutosFornecedores](
	[ProdutoId] [bigint] NOT NULL,
	[FornecedorId] [bigint] NOT NULL,
 CONSTRAINT [PK_ProdutosFornecedores] PRIMARY KEY CLUSTERED ([ProdutoId] ASC,[FornecedorId] ASC))
GO

CREATE TABLE [dbo].[TipoDocumento](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Descricao] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_TipoDocumento] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_TipoDocumento ON [dbo].[TipoDocumento] (Descricao ASC)

GO
CREATE TABLE [dbo].[Usuarios](
	[Id] [bigint] IDENTITY(1,1) NOT NULL,
	[Nome] [nchar](10) NOT NULL,
	[LogradouroId] [bigint] NOT NULL,
	[DocumentoId] [bigint] NOT NULL,
	[UsuarioIndicacaoId] [bigint] NOT NULL,
 CONSTRAINT [PK_Usuarios] PRIMARY KEY CLUSTERED ([Id] ASC))
GO

CREATE NONCLUSTERED INDEX IDX_USUARIOS ON [dbo].[Usuarios] (Nome ASC)

GO
ALTER TABLE [dbo].[Municipios]  WITH CHECK ADD  CONSTRAINT [FK_Municipios_Estados] FOREIGN KEY([EstadoId])
REFERENCES [dbo].[Estados] ([Id])
GO
ALTER TABLE [dbo].[Municipios] CHECK CONSTRAINT [FK_Municipios_Estados]
GO
ALTER TABLE [dbo].[Bairros]  WITH CHECK ADD  CONSTRAINT [FK_Bairros_Municipios] FOREIGN KEY([MunicipioId])
REFERENCES [dbo].[Municipios] ([Id])
GO
ALTER TABLE [dbo].[Bairros] CHECK CONSTRAINT [FK_Bairros_Municipios]
GO
ALTER TABLE [dbo].[Logradouros]  WITH CHECK ADD  CONSTRAINT [FK_Logradouros_Bairros] FOREIGN KEY([BairroId])
REFERENCES [dbo].[Bairros] ([Id])
GO
ALTER TABLE [dbo].[Logradouros] CHECK CONSTRAINT [FK_Logradouros_Bairros]
GO
ALTER TABLE [dbo].[Documento]  WITH CHECK ADD  CONSTRAINT [FK_Documento_TipoDocumento] FOREIGN KEY([TipoDocumentoId])
REFERENCES [dbo].[TipoDocumento] ([Id])
GO
ALTER TABLE [dbo].[Documento] CHECK CONSTRAINT [FK_Documento_TipoDocumento]
GO
ALTER TABLE [dbo].[Fornecedores]  WITH CHECK ADD  CONSTRAINT [FK_Fornecedores_Documento] FOREIGN KEY([DocumentoId])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[Fornecedores] CHECK CONSTRAINT [FK_Fornecedores_Documento]
GO
ALTER TABLE [dbo].[Fornecedores]  WITH CHECK ADD  CONSTRAINT [FK_Fornecedores_Logradouros] FOREIGN KEY([LogradouroId])
REFERENCES [dbo].[Logradouros] ([Id])
GO
ALTER TABLE [dbo].[Fornecedores] CHECK CONSTRAINT [FK_Fornecedores_Logradouros]
GO
ALTER TABLE [dbo].[Logradouros]  WITH CHECK ADD  CONSTRAINT [FK_Logradouros_Usuarios] FOREIGN KEY([BairroId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Logradouros] CHECK CONSTRAINT [FK_Logradouros_Usuarios]
GO
ALTER TABLE [dbo].[ProdutosFornecedores]  WITH CHECK ADD  CONSTRAINT [FK_ProdutosFornecedores_Fornecedores] FOREIGN KEY([FornecedorId])
REFERENCES [dbo].[Fornecedores] ([Id])
GO
ALTER TABLE [dbo].[ProdutosFornecedores] CHECK CONSTRAINT [FK_ProdutosFornecedores_Fornecedores]
GO
ALTER TABLE [dbo].[ProdutosFornecedores]  WITH CHECK ADD  CONSTRAINT [FK_ProdutosFornecedores_Produtos] FOREIGN KEY([ProdutoId])
REFERENCES [dbo].[Produtos] ([Id])
GO
ALTER TABLE [dbo].[ProdutosFornecedores] CHECK CONSTRAINT [FK_ProdutosFornecedores_Produtos]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Documento] FOREIGN KEY([DocumentoId])
REFERENCES [dbo].[Documento] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Documento]
GO
ALTER TABLE [dbo].[Usuarios]  WITH CHECK ADD  CONSTRAINT [FK_Usuarios_Usuarios] FOREIGN KEY([UsuarioIndicacaoId])
REFERENCES [dbo].[Usuarios] ([Id])
GO
ALTER TABLE [dbo].[Usuarios] CHECK CONSTRAINT [FK_Usuarios_Usuarios]
