SELECT * FROM Materiales

SELECT * FROM Materiales
WHERE Clave = 1000

SELECT Clave, RFC, Fecha FROM Entregan

SELECT * FROM Materiales, Entregan
WHERE Materiales.Clave = Entregan.Clave

SELECT * FROM Entregan, Proyectos 
WHERE Entregan.Numero <= Proyectos.Numero 

(SELECT * FROM Entregan WHERE Clave = 1450) 
UNION 
(SELECT * FROM Entregan WHERE Clave = 1300) 

SELECT * FROM Entregan WHERE Clave = 1450 OR Clave = 1300

(SELECT Clave FROM Entregan WHERE Numero = 5001) 
INTERSECT
(SELECT Clave FROM Entregan WHERE Numero = 5018)

-- (SELECT * FROM Entregan) 
-- MINUS 
-- (SELECT * FROM Entregan WHERE Clave = 1000) 

SELECT Clave, RFC, Numero, Fecha, Cantidad 
FROM Entregan 
WHERE Clave NOT IN 
	(SELECT Clave 
	FROM Entregan 
	WHERE Clave = 1000) 

SELECT * FROM Entregan, Materiales 

SET DateFormat DMY
SELECT Descripcion
FROM Materiales as M, Entregan as E
WHERE M.Clave = E.Clave AND E.Fecha BETWEEN '01/01/00' AND '31/12/00'

SET DateFormat DMY
SELECT DISTINCT Descripcion
FROM Materiales as M, Entregan as E
WHERE M.Clave = E.Clave AND E.Fecha BETWEEN '01/01/00' AND '31/12/00'

SELECT P.Numero, Denominacion, E.Cantidad
FROM Proyectos P, Entregan E
WHERE P.Numero = E.Numero
ORDER BY P.Numero ASC, E.Fecha DESC

SELECT * FROM Materiales WHERE Descripcion LIKE 'Si%' 

DECLARE @foo varchar(40); 
DECLARE @bar varchar(40); 
SET @foo = '¿Que resultado'; 
SET @bar = ' ¿¿¿??? ' 
SET @foo += ' obtienes?'; 
PRINT @foo + @bar; 

SELECT RFC FROM Entregan WHERE RFC LIKE '[A-D]%'; 
SELECT RFC FROM Entregan WHERE RFC LIKE '[^A]%'; 
SELECT Numero FROM Entregan WHERE Numero LIKE '___6'; 

SELECT Clave,RFC,Numero,Fecha,Cantidad 
FROM Entregan 
WHERE Numero Between 5000 and 5010; 

SELECT RFC,Cantidad,Fecha,Numero 
FROM Entregan
WHERE Numero BETWEEN 5000 AND 5010 AND 
EXISTS (SELECT RFC
		FROM Proveedores
		WHERE RazonSocial LIKE 'La%' and Entregan.RFC = Proveedores.RFC) 

-- Query usando IN
SELECT RFC,Cantidad,Fecha,Numero 
FROM Entregan
WHERE Numero BETWEEN 5000 AND 5010 AND RFC IN 
	(SELECT RFC 
	FROM Proveedores 
	WHERE RazonSocial LIKE 'La%' AND Entregan.RFC = Proveedores.RFC) 

-- Query usando NOT IN
SELECT RFC,Cantidad,Fecha,Numero 
FROM Entregan
WHERE Numero BETWEEN 5000 AND 5010 AND RFC NOT IN 
	(SELECT RFC 
	FROM Proveedores 
	WHERE RazonSocial NOT LIKE 'La%' OR Entregan.RFC != Proveedores.RFC) 

-- Query usando SOME/ANY/ALL
SELECT RFC,Cantidad,Fecha,Numero 
FROM Entregan
WHERE Numero BETWEEN 5000 AND 5010 AND RFC = ANY 
	(SELECT RFC 
	FROM Proveedores 
	WHERE RazonSocial LIKE 'La%' AND Entregan.RFC = Proveedores.RFC) 

SELECT TOP 2 * FROM Proyectos 

SELECT TOP Numero FROM Proyectos 

ALTER TABLE Materiales ADD PorcentajeImpuesto NUMERIC(6,2); 
UPDATE Materiales SET PorcentajeImpuesto = 2*clave/1000; 
SELECT SUM(E.Cantidad*(M.Costo+1/M.PorcentajeImpuesto))
FROM Entregan as E, Materiales as M

-- 5 vistas CREATE VIEW
CREATE VIEW NumeroMenor AS (
	SELECT * FROM Materiales
	WHERE Clave = 1000
	)
SELECT * FROM NumeroMenor

CREATE VIEW Entregan1 AS (
	SELECT * FROM Entregan WHERE Clave = 1450
	)
CREATE VIEW Entregan2 AS (
	SELECT * FROM Entregan WHERE Clave = 1300
	)
(SELECT * FROM Entregan1)
UNION
(SELECT * FROM Entregan2)

CREATE VIEW MaterialSI AS (
	SELECT * FROM Materiales 
	WHERE Descripcion LIKE 'Si%' 
	)
SELECT * FROM MaterialSI

CREATE VIEW TOP2 AS  (
	SELECT TOP 2 * FROM Proyectos 
	)
SELECT * FROM TOP2

CREATE VIEW AD AS (
	SELECT RFC FROM Entregan 
	WHERE RFC LIKE '[A-D]%'
	)
SELECT * FROM AD

-- Lista de sentencias ----------------------------------------------------------------------------------
SELECT E.Clave, M.Descripcion
FROM Entregan AS E, Materiales AS M, Proyectos AS P
WHERE E.Clave = M.Clave AND E.Numero = P.Numero AND P.Denominacion = 'Mexico sin ti no estamos completos'

SELECT E.Clave, M.Descripcion
FROM Entregan AS E, Materiales AS M, Proveedores AS P
WHERE E.Clave = M.Clave AND E.RFC = P.RFC AND P.RazonSocial = 'Acme tools'
 
SET DateFormat DMY
SELECT P.RFC
FROM Entregan AS E, Proveedores AS P
WHERE E.RFC = P.RFC AND E.Fecha BETWEEN '01/01/00' AND '31/12/00' AND E.Cantidad >= 300

SET DateFormat DMY
SELECT M.Descripcion, SUM(Cantidad) AS 'Total_Material'
FROM Entregan AS E, Materiales AS M
WHERE E.Clave = M.Clave AND E.Fecha BETWEEN '01/01/00' AND '31/12/00'
GROUP BY M.Descripcion

CREATE VIEW Materiales2001 AS (
	SELECT Clave, SUM(Cantidad) AS 'Total'
	FROM Entregan
	WHERE Fecha BETWEEN '01/01/01' AND '31/12/01'
	GROUP BY Clave
	)
SELECT TOP 1 * FROM Materiales2001

SELECT Descripcion
FROM Materiales
WHERE Descripcion LIKE '%ub%' 

SELECT Denominacion, SUM(Cantidad*Costo) AS 'Total'
FROM Entregan AS E, Proyectos AS P, Materiales AS M
WHERE E.Numero = P.Numero AND E.Clave = M.Clave
GROUP BY Denominacion

CREATE VIEW Televisa AS (
	SELECT DISTINCT P.RFC, P.RazonSocial, R.Denominacion
	FROM Proveedores AS P, Proyectos AS R, Entregan AS E
	WHERE P.RFC = E.RFC AND R.Numero = E.Numero AND R.Denominacion = 'Televisa en acción'
	)
CREATE VIEW Coahuila AS (
	SELECT DISTINCT P.RFC, P.RazonSocial, R.Denominacion
	FROM Proveedores AS P, Proyectos AS R, Entregan AS E
	WHERE P.RFC = E.RFC AND R.Numero = E.Numero AND R.Denominacion = 'Educando en Coahuila'
	)
SELECT RFC, RazonSocial 
FROM Televisa
WHERE RazonSocial NOT IN (
	SELECT RazonSocial 
	FROM Coahuila
	)