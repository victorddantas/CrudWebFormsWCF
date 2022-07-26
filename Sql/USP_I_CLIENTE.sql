USE [GTI]
GO

/****** Object:  StoredProcedure [dbo].[USP_I_CLIENTE]    Script Date: 21/07/2022 14:41:17 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_I_CLIENTE]

	@Nome VARCHAR(100),
	@Cpf  VARCHAR(22),
	@Rg   VARCHAR(22),
	@UfExpedicao VARCHAR(22),
	@Sexo VARCHAR(44),
	@EstadoCivil VARCHAR(44),
    @DataNascimento DATETIME,
	@DataExpedicao DATETIME,
	
	@Endereco VARCHAR(100),
	@Complemento VARCHAR(100),
	@Numero  VARCHAR(30),
	@Bairro VARCHAR(100),
	@Cidade VARCHAR(100),
	@Cep  VARCHAR(22),
	@Uf   VARCHAR(22) 
	 
AS
BEGIN
		BEGIN TRY
				BEGIN TRAN
							  
						
									  INSERT INTO Cliente
									          ( 
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
									          )
									  VALUES  ( 
												@Nome ,
									            @CPF ,
												@RG ,
												@UfExpedicao ,
												@Sexo ,
												@EstadoCivil ,												
									              @DataNascimento,
												@DataExpedicao,
												@Endereco ,
												@Complemento ,
												@Numero   ,
												@Bairro  ,
												@Cidade  ,
												@Cep   ,
												@Uf    
									          );


				SELECT SCOPE_IDENTITY();
											  
				COMMIT TRAN
		END TRY
		BEGIN CATCH
				ROLLBACK TRAN

		END CATCH
END
GO


