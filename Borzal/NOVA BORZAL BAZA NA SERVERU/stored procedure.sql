USE [bdanijel_BORZALRKNOVO]
GO
/****** Object:  StoredProcedure [dbo].[sp_RazlikaDatum]    Script Date: 06/12/2019 13:42:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_RazlikaDatum]  @datum1 date,
										   @datum2 date
										
AS

SET NOCOUNT ON

BEGIN


with TrebovanjeSumarDATUM as
(
SELECT     dbo.sirovine.ID, dbo.sirovine.NAZIV, SUM(dbo.trebovanje.KOLICINA) AS TrebovanoUkupno, dbo.sirovine.JM, dbo.trebovanje.DATUM
FROM         dbo.sirovine INNER JOIN
                      dbo.trebovanje ON dbo.sirovine.ID = dbo.trebovanje.ID_SIROVINE
GROUP BY dbo.sirovine.ID, dbo.sirovine.NAZIV, dbo.sirovine.JM, dbo.trebovanje.DATUM
having trebovanje.DATUM >= @datum1 and trebovanje.DATUM <= @datum2
),

TrebovanjeSumar as
(
select id,naziv,  JM, sum(TrebovanoUkupno) as TrebovanjeUkupnoSUMAR
FROM TrebovanjeSumarDATUM
group by id,naziv,jm
),

UtrosenoSumarDATUM as
(
SELECT ID, NAZIV, JM, SUM(Utroseno) AS UtrosenoUkupno, DATUM
FROM         dbo.vUtrosenoDATUM
GROUP BY ID, NAZIV, JM, DATUM
HAVING DATUM >= @datum1 and DATUM <= @datum2
),
UtrosenoSumar as
(
select ID,naziv,jm,SUM(UtrosenoUkupno) as UtrosenoUkupnoSUMAR
FROM UtrosenoSumarDATUM
group by ID, NAZIV,jm
)
select TrebovanjeSumar.id, TrebovanjeSumar.naziv, TrebovanjeSumar.jm, TrebovanjeUkupnoSUMAR,UtrosenoUkupnoSUMAR, (TrebovanjeUkupnoSUMAR - UtrosenoUkupnoSUMAR) as Razlika
FROM TrebovanjeSumar left join UtrosenoSumar
on TrebovanjeSumar.ID=UtrosenoSumar.ID

  
END   

 --exec sp_lfsIsplata '2018', '04'
GO
/****** Object:  StoredProcedure [dbo].[sp_UtrosenoDATUM]    Script Date: 06/12/2019 13:42:43 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE PROCEDURE [dbo].[sp_UtrosenoDATUM]  @datum1 date,
										   @datum2 date
										
AS

SET NOCOUNT ON

BEGIN


SELECT [ID]
      ,[NAZIV]
      ,[JM]
      ,[TrebovanoUkupno]
      ,[UtrosenoUkupno]
      ,[STANJE]
from 

vSirovineStanjeDATUM

where TrebovanoDATUM>=@datum1 and TrebovanoDATUM <= @datum2 and UtrosenoDATUM >= @datum1 and UtrosenoDATUM <= @datum2



  
END   

 --exec sp_lfsIsplata '2018', '04'
GO
