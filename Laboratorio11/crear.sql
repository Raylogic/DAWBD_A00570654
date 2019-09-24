CREATE TABLE Materiales
(
  Clave numeric(5),
  Descripcion varchar(50),
  Costo numeric(8,2)
)

CREATE TABLE Proveedores
(
	RFC char(13),
	RazonSocial varchar(50)
)

CREATE TABLE Proyectos
(
	Numero numeric(5),
	Denominacion varchar(50)
)

CREATE TABLE Entregan
(
	Clave numeric(5),
	RFC char(13),
	Numero numeric(5),
	Fecha datetime,
	Cantidad Numeric(8,2)
)

sp_help Materiales
sp_help Proveedores
sp_help Proyectos
sp_help Entregan
DROP TABLE Materiales
DROP TABLE Proveedores
DROP TABLE Proyectos
DROP TABLE Entregan

select * from sysobjects where xtype='U'