BULK INSERT al570654.al570654.[materiales]
   FROM 'e:\wwwroot\rcortese\materiales.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SELECT  * FROM Materiales