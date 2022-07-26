USE [GTI]
GO

/****** Object:  StoredProcedure [dbo].[USP_O_CLIENTE]    Script Date: 21/07/2022 14:42:16 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_O_CLIENTE]
  @Id INT
AS
BEGIN
SELECT 
Id,
 Nome ,
									            CPF ,
												RG ,
												UfExpedicao ,
												Sexo ,
												EstadoCivil ,												
									            DataNascimento,
												DataExpedicao,
												Endereco ,
												Complemento ,
												Numero   ,
												Bairro  ,
												Cidade  ,
												Cep   ,
												Uf 
FROM Cliente
WHERE id = @id
END
GO


