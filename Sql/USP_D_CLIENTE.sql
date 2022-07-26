USE [GTI]
GO

/****** Object:  StoredProcedure [dbo].[USP_D_CLIENTE]    Script Date: 21/07/2022 14:40:32 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[USP_D_CLIENTE]
@id INT
AS
 
BEGIN
DELETE FROM Cliente 
 
WHERE id =@id
END
GO


