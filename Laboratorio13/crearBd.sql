-- Ejercicio #1
drop TABLE entregan 
drop TABLE materiales 
drop TABLE proyectos 
drop TABLE proveedores 

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Materiales')
DROP TABLE Materiales
CREATE TABLE Materiales
(
	Clave numeric(5) not null,
	Descripcion varchar(50),
	Costo numeric(8,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Proveedores')
DROP TABLE Proveedores
CREATE TABLE Proveedores
(
	RFC char(13) not null,
	RazonSocial varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Proyectos')
DROP TABLE Proyectos
CREATE TABLE Proyectos
(
	Numero numeric(5) not null,
	Denominacion varchar(50)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Entregan')
DROP TABLE Entregan
CREATE TABLE Entregan
(
	Clave numeric(5) not null,
	RFC char(13) not null,
	Numero numeric(5) not null,
	Fecha DateTime not null,
	Cantidad numeric(8,2)
)

BULK INSERT al570654.al570654.[Materiales] 
FROM 'e:\wwwroot\rcortese\materiales.csv' 
WITH 
( 
CODEPAGE = 'ACP', 
FIELDTERMINATOR = ',', 
ROWTERMINATOR = '\n' 
) 

BULK INSERT al570654.al570654.[Proyectos] 
FROM 'e:\wwwroot\rcortese\proyectos.csv' 
WITH 
( 
CODEPAGE = 'ACP', 
FIELDTERMINATOR = ',', 
ROWTERMINATOR = '\n' 
) 

BULK INSERT al570654.al570654.[Proveedores] 
FROM 'e:\wwwroot\rcortese\proveedores.csv' 
WITH 
( 
CODEPAGE = 'ACP', 
FIELDTERMINATOR = ',', 
ROWTERMINATOR = '\n' 
) 

SET DATEFORMAT dmy
BULK INSERT al570654.al570654.[Entregan] 
FROM 'e:\wwwroot\rcortese\entregan.csv' 
WITH 
( 
CODEPAGE = 'ACP', 
FIELDTERMINATOR = ',', 
ROWTERMINATOR = '\n' 
) 

-- Ejercicio #2
INSERT INTO Materiales values(1000,'xxx',1000)
SELECT * FROM Materiales
DELETE FROM Materiales WHERE Clave = 1000 and Costo = 1000 

ALTER TABLE Materiales add constraint llaveMateriales PRIMARY KEY (Clave) 
sp_helpconstraint materiales 
INSERT INTO Materiales values(1000,'xxx',1000)

ALTER TABLE Proveedores ADD CONSTRAINT llaveProveedores PRIMARY KEY (RFC)
ALTER TABLE Proyectos ADD CONSTRAINT llaveProyectos PRIMARY KEY (Numero)
ALTER TABLE Entregan ADD CONSTRAINT llaveEntregan PRIMARY KEY (Clave, RFC, Numero, Fecha)

-- Ejercicio #3
SELECT * FROM Materiales
SELECT * FROM Proveedores
SELECT * FROM Proyectos

INSERT INTO Entregan values(0,'xxx',0,'1-jan-02',0)
SELECT * FROM Entregan
DELETE FROM Entregan WHERE Clave = 0 

ALTER TABLE entregan ADD CONSTRAINT cfentreganclave FOREIGN KEY (clave) REFERENCES materiales(clave)
INSERT INTO Entregan values(0,'xxx',0,'1-jan-02',0)
ALTER TABLE entregan ADD CONSTRAINT cfentreganrfc FOREIGN KEY (RFC) REFERENCES proveedores(RFC)
ALTER TABLE entregan ADD CONSTRAINT cfentregannumero FOREIGN KEY (numero) REFERENCES proyectos(numero)

sp_helpconstraint materiales
sp_helpconstraint proveedores
sp_helpconstraint proyectos

-- Ejercicio #4
INSERT INTO entregan values(1000, 'AAAA800101', 5000, GETDATE(), 0)
SELECT * FROM Entregan
DELETE FROM Entregan WHERE Cantidad = 0 
ALTER TABLE Entregan ADD CONSTRAINT cantidad CHECK (cantidad > 0) 
INSERT INTO entregan values(1000, 'AAAA800101', 5000, GETDATE(), 0)

sp_helpconstraint materiales
sp_helpconstraint proveedores
sp_helpconstraint proyectos