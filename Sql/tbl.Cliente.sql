USE [GTI]
GO

/****** Object:  Table [dbo].[Cliente]    Script Date: 25/07/2022 14:04:20 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE TABLE [dbo].[Cliente](
	[Id] [int] IDENTITY(1,1) NOT NULL,
	[Nome] [varchar](22) NULL,
	[Cpf] [varchar](22) NULL,
	[Rg] [varchar](50) NULL,
	[OrgaoExpedicao] [varchar](50) NULL,
	[UfExpedicao] [varchar](50) NULL,
	[Sexo] [varchar](50) NULL,
	[EstadoCivil] [varchar](50) NULL,
	[DataNascimento] [datetime] NULL,
	[DataExpedicao] [datetime] NULL,
	[Endereco] [varchar](100) NULL,
	[Complemento] [varchar](100) NULL,
	[Numero] [varchar](50) NULL,
	[Bairro] [varchar](100) NULL,
	[Cidade] [varchar](100) NULL,
	[Cep] [varchar](11) NULL,
	[Uf] [varchar](2) NULL,
 CONSTRAINT [PK_Cliente] PRIMARY KEY CLUSTERED 
(
	[Id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, OPTIMIZE_FOR_SEQUENTIAL_KEY = OFF) ON [PRIMARY]
) ON [PRIMARY]
GO

