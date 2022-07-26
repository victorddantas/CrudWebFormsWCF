USE [GTI]
GO

/****** Object:  StoredProcedure [dbo].[USP_U_CLIENTE]    Script Date: 21/07/2022 14:42:49 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_U_CLIENTE]
    @Id int,
    @Nome VARCHAR(100),
	@Cpf  VARCHAR(22),
	@Rg   VARCHAR(22),
	@UfExpedicao VARCHAR(50),
	@Sexo VARCHAR(20),
	@EstadoCivil VARCHAR(50),
	@DataNascimento DATETIME,
	@DataExpedicao DATETIME,
	@Endereco VARCHAR(100),
	@Complemento VARCHAR(100),
	@Numero  VARCHAR(30),
	@Bairro VARCHAR(100),
	@Cidade VARCHAR(100),
	@Cep  VARCHAR(11),
	@Uf   VARCHAR(10) 

AS
BEGIN
UPDATE  Cliente
SET		Nome = @Nome ,
		CPF =@Cpf ,
		RG = @Rg ,
		UfExpedicao  = @UfExpedicao,
		Sexo  = @Sexo,
		EstadoCivil  = @EstadoCivil,												
		DataNascimento= @DataNascimento,
		DataExpedicao = @DataExpedicao,
		Endereco 	  = @Endereco ,
		Complemento   = @Complemento ,
		Numero   	  = @Numero   ,
		Bairro  	  = @Bairro  ,
		Cidade  	  = @Cidade  ,
		Cep   		  = @Cep   ,
		Uf 			  = @Uf 

FROM Cliente
WHERE id = @id
END
GO


