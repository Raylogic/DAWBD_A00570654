SET DateFormat DMY
SELECT SUM(E.Cantidad) AS Entregado, SUM(E.Cantidad*(M.Costo+M.PorcentajeImpuesto)) AS Importe
FROM Materiales AS M, Entregan AS E
WHERE M.Clave = E.Clave AND E.Fecha BETWEEN '01/01/97' AND '31/12/97'

SELECT P.RazonSocial, SUM(E.Cantidad) AS Entregado, SUM(E.Cantidad*(M.Costo+M.PorcentajeImpuesto)) AS Importe
FROM Materiales AS M, Entregan AS E, Proveedores as P
WHERE M.Clave = E.Clave AND P.RFC = E.RFC 
GROUP BY P.RazonSocial

SELECT M.Clave, M.Descripcion, SUM(E.Cantidad) AS Entregado, MIN(E.Cantidad) AS Minimo, MAX(E.Cantidad) AS Maximo, SUM(E.Cantidad*(M.Costo+M.PorcentajeImpuesto)) AS Importe
FROM Materiales as M, Entregan as E
WHERE M.Clave = E.Clave
GROUP BY M.Clave, M.Descripcion
HAVING AVG(E.Cantidad) > 400

SELECT P.RazonSocial, M.Clave, M.Descripcion, SUM(E.Cantidad) AS Promedio_Entregado
FROM Materiales AS M, Entregan AS E, Proveedores as P
WHERE M.Clave = E.Clave AND P.RFC = E.RFC 
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING SUM(E.Cantidad) > 500

SELECT P.RazonSocial, M.Clave, M.Descripcion, SUM(E.Cantidad) AS Promedio_Entregado
FROM Materiales AS M, Entregan AS E, Proveedores as P
WHERE M.Clave = E.Clave AND P.RFC = E.RFC 
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING SUM(E.Cantidad) < 370
UNION
SELECT P.RazonSocial, M.Clave, M.Descripcion, SUM(E.Cantidad) AS Promedio_Entregado
FROM Materiales AS M, Entregan AS E, Proveedores as P
WHERE M.Clave = E.Clave AND P.RFC = E.RFC 
GROUP BY P.RazonSocial, M.Clave, M.Descripcion
HAVING SUM(E.Cantidad) > 450

-------------------------------------------------------------

SELECT * FROM Materiales ORDER BY Descripcion
INSERT INTO Materiales VALUES (1450,'Varilla 4/40',250,2.00)
INSERT INTO Materiales VALUES (1460,'Varilla 5/14',400,2.06)
INSERT INTO Materiales VALUES (1480,'Caliza',140,2.12)
INSERT INTO Materiales VALUES (1500,'Cuarzo',360,2.04)
INSERT INTO Materiales VALUES (1520,'Tubería 5.2',520,2.08)

-------------------------------------------------------------

SELECT Clave, Descripcion
FROM Materiales
WHERE Clave NOT IN (
	SELECT Clave
	FROM Entregan
)

SELECT DISTINCT P.RazonSocial
FROM Proveedores AS P, Entregan AS E, Proyectos AS R
WHERE P.RFC = E.RFC AND R.Numero = E.Numero AND R.Denominacion = 'Queretaro Limpio'
INTERSECT
SELECT DISTINCT P.RazonSocial
FROM Proveedores AS P, Entregan AS E, Proyectos AS R
WHERE P.RFC = E.RFC AND R.Numero = E.Numero AND R.Denominacion = 'CIT Yucatan'

SELECT Descripcion
FROM Materiales
WHERE Clave NOT IN (
	SELECT M.Clave
	FROM Materiales AS M, Entregan AS E, Proyectos AS P
	WHERE M.Clave = E.Clave AND P.Numero = E.Numero AND P.Denominacion = 'CIT Yucatan'
)
ORDER BY Descripcion ASC

SELECT P.RazonSocial
FROM Proveedores AS P, Entregan AS E
WHERE P.RFC = E.RFC
GROUP BY P.RazonSocial
HAVING AVG(E.Cantidad) > (
	SELECT AVG(E.Cantidad) 
	FROM Proveedores AS P, Entregan AS E
	WHERE P.RFC = E.RFC AND P.RFC = 'VAGO780901'
)

SET DateFormat DMY
CREATE VIEW T2000 AS (
	SELECT RFC, SUM(Cantidad) AS Total_2000
	FROM Entregan
	WHERE Fecha BETWEEN '01/01/00' AND '31/12/00'
	GROUP BY RFC
)
CREATE VIEW T2001 AS (
	SELECT RFC, SUM(Cantidad) AS Total_2001
	FROM Entregan
	WHERE Fecha BETWEEN '01/01/01' AND '31/12/01'
	GROUP BY RFC
)
SELECT DISTINCT P.RFC, P.RazonSocial
FROM Proveedores AS P, Entregan AS E, Proyectos AS R, T2000, T2001
WHERE P.RFC = E.RFC AND R.Numero = E.Numero AND R.Denominacion = 'Infonavit Durango' AND Total_2000 > Total_2001


