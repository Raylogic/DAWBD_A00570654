SET DATEFORMAT dmy
BULK INSERT al570654.al570654.[entregan]
   FROM 'e:\wwwroot\rcortese\entregan.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SELECT  * FROM Entregan