USE [GTI]
GO

/****** Object:  StoredProcedure [dbo].[USP_L_CLIENTE]    Script Date: 21/07/2022 14:41:58 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_L_CLIENTE]
AS
 
BEGIN
SELECT 
Id,
Nome,
Cpf,
Rg,
OrgaoExpedicao,
UfExpedicao,
Sexo,
EstadoCivil,
DataNascimento,
DataExpedicao,
Endereco,	
Complemento,
Numero, 
Bairro,
Cidade,
Cep,
Uf
FROM  Cliente
END
 
 
GO

