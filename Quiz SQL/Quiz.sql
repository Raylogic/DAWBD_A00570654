CREATE TABLE Carrera
(
	Codigo varchar(3) not null,
	Nombre varchar(50)
	PRIMARY KEY(Codigo)
)
CREATE TABLE Alumno
(
	Matricula varchar(10) not null,
	Nombre varchar(20),
	APaterno varchar(20),
	AMaterno varchar(20),
	Codigo varchar(3) not null
	PRIMARY KEY(Matricula)
	FOREIGN KEY(Codigo) REFERENCES Carrera(Codigo)
)

sp_help Alumno
sp_help Carrera
sp_helpconstraint Alumno
sp_helpconstraint Carrera

DROP TABLE Carrera
DROP TABLE Alumno

INSERT INTO Carrera values('ISC','Ingenieria en Sistemas Computacionales')
INSERT INTO Carrera values('IMT','Ingenieria en Mecatronica')
INSERT INTO Alumno values('A00570654','Raymundo','Romero','Arenas','ISC')
INSERT INTO Alumno values('A01702948','Eduardo','Castillo','Perera','IMT')
DELETE FROM Alumno WHERE Matricula LIKE 'A01702948'

SELECT * FROM Carrera
SELECT * FROM Alumno

-- --------------------

SELECT DISTINCT M.Descripcion
FROM Materiales as M, Proyectos as P, Entregan as E
WHERE M.Clave = E.Clave AND P.Numero = E.Numero AND P.Denominacion LIKE 'Teletón Qro'
ORDER BY M.Descripcion ASC

SET DateFormat DMY
SELECT P.Denominacion, SUM(E.Cantidad) as Entregado
FROM Materiales as M, Proyectos as P, Entregan as E
WHERE M.Clave = E.Clave AND P.Numero = E.Numero AND E.Fecha BETWEEN '01/01/10' AND '31/12/10'
GROUP BY P.Denominacion
ORDER BY Entregado DESC

SELECT Clave, Descripcion
FROM Materiales
WHERE Clave NOT IN (
	SELECT Clave
	FROM Entregan
)