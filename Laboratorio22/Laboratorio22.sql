SELECT * FROM Materiales
sp_helpconstraint Materiales

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaMaterial' AND type = 'P')
    DROP PROCEDURE creaMaterial
GO
CREATE PROCEDURE creaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    INSERT INTO Materiales VALUES(@uclave, @udescripcion, @ucosto, @uimpuesto)
GO

EXECUTE creaMaterial 5000,'Martillos Acme',250,15 

--------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaMaterial' AND type = 'P')
    DROP PROCEDURE modificaMaterial
GO
CREATE PROCEDURE modificaMaterial
    @uclave NUMERIC(5,0),
    @udescripcion VARCHAR(50),
    @ucosto NUMERIC(8,2),
    @uimpuesto NUMERIC(6,2)
AS
    UPDATE Materiales SET Descripcion=@udescripcion, Costo=@ucosto, PorcentajeImpuesto=@uimpuesto WHERE Clave=@uclave
GO

EXECUTE modificaMaterial 5000,'Martillos AJAX',300,12

-------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaMaterial' AND type = 'P')
    DROP PROCEDURE eliminaMaterial
GO
CREATE PROCEDURE eliminaMaterial
    @uclave NUMERIC(5,0)
AS
    DELETE FROM Materiales WHERE Clave=@uclave
GO

EXECUTE eliminaMaterial 5000

------------------------------------------------------------------------------------

SELECT * FROM Proyectos

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaProyecto' AND type = 'P')
    DROP PROCEDURE creaProyecto
GO
CREATE PROCEDURE creaProyecto
    @unumero NUMERIC(5),
    @udenominacion VARCHAR(50)
AS
    INSERT INTO Proyectos VALUES(@unumero, @udenominacion)
GO

EXECUTE creaProyecto 5020,'Verbos y Vibras'

-----------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaProyecto' AND type = 'P')
    DROP PROCEDURE modificaProyecto
GO
CREATE PROCEDURE modificaProyecto
    @unumero NUMERIC(5),
    @udenominacion VARCHAR(50)
AS
    UPDATE Proyectos SET Denominacion=@udenominacion WHERE Numero=@unumero
GO

EXECUTE modificaProyecto 5020,'H2QRO'

-------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaProyecto' AND type = 'P')
    DROP PROCEDURE eliminaProyecto
GO
CREATE PROCEDURE eliminaProyecto
    @unumero NUMERIC(5)
AS
    DELETE FROM Proyectos WHERE Numero=@unumero
GO

EXECUTE eliminaProyecto 5020

------------------------------------------------------------------------------------

SELECT * FROM Proveedores

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaProveedor' AND type = 'P')
    DROP PROCEDURE creaProveedor
GO
CREATE PROCEDURE creaProveedor
    @urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    INSERT INTO Proveedores VALUES(@urfc, @urazonsocial)
GO

EXECUTE creaProveedor 'ROAR990301','ITESM QRO'

-----------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaProveedor' AND type = 'P')
    DROP PROCEDURE modificaProveedor
GO
CREATE PROCEDURE modificaProveedor
    @urfc CHAR(13),
    @urazonsocial VARCHAR(50)
AS
    UPDATE Proveedores SET RazonSocial=@urazonsocial WHERE RFC=@urfc
GO

EXECUTE modificaProveedor 'ROAR990301','ITESM LEON'

-------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaProveedor' AND type = 'P')
    DROP PROCEDURE eliminaProveedor
GO
CREATE PROCEDURE eliminaProveedor
    @urfc CHAR(13)
AS
    DELETE FROM Proveedores WHERE RFC=@urfc
GO

EXECUTE eliminaProveedor 'ROAR990301'

------------------------------------------------------------------------------------

SELECT * FROM Entregan

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'creaEntregan' AND type = 'P')
    DROP PROCEDURE creaEntregan
GO
CREATE PROCEDURE creaEntregan
	@uclave NUMERIC(5,0),
	@urfc CHAR(13),
	@unumero NUMERIC(5),
	@ufecha DATETIME,
    @ucantidad NUMERIC(8,2)
AS
    INSERT INTO Entregan VALUES(@uclave, @urfc, @unumero, @ufecha, @ucantidad)
GO

EXECUTE creaEntregan 1000,'AAAA800101',5019,'01/03/99',1257

-----------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'modificaEntregan' AND type = 'P')
    DROP PROCEDURE modificaEntregan
GO
CREATE PROCEDURE modificaEntregan
    @uclave NUMERIC(5,0),
	@urfc CHAR(13),
	@unumero NUMERIC(5),
	@ufecha DATETIME,
    @ucantidad NUMERIC(8,2)
AS
    UPDATE Entregan SET Fecha=@ufecha, Cantidad=@ucantidad WHERE Clave=@uclave AND RFC=@urfc AND Numero=@unumero
GO

EXECUTE modificaEntregan 1000,'AAAA800101',5000,'01/12/01',666

-------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects WHERE name = 'eliminaEntregan' AND type = 'P')
    DROP PROCEDURE eliminaEntregan
GO
CREATE PROCEDURE eliminaEntregan
    @uclave NUMERIC(5,0),
	@urfc CHAR(13),
	@unumero NUMERIC(5)
AS
    DELETE FROM Entregan WHERE Clave=@uclave AND RFC=@urfc AND Numero=@unumero
GO

EXECUTE eliminaEntregan 1000,'AAAA800101',5000

-------------------------------------------------------------------------------------

IF EXISTS (SELECT name FROM sysobjects
    WHERE name = 'queryMaterial' AND type = 'P')
DROP PROCEDURE queryMaterial
GO

CREATE PROCEDURE queryMaterial
	@udescripcion VARCHAR(50),
	@ucosto NUMERIC(8,2)
AS
	SELECT * FROM Materiales WHERE descripcion
	LIKE '%'+@udescripcion+'%' AND costo > @ucosto
GO

EXECUTE queryMaterial 'Lad',20 