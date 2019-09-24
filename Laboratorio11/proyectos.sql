BULK INSERT al570654.al570654.[proyectos]
   FROM 'e:\wwwroot\rcortese\proyectos.csv'
   WITH 
      (
         CODEPAGE = 'ACP',
         FIELDTERMINATOR = ',',
         ROWTERMINATOR = '\n'
      )

SELECT  * FROM Proyectos