IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Clientes_Banca')
DROP TABLE Clientes_Banca
CREATE TABLE Clientes_Banca
(
	NoCuenta varchar(5) not null,
	Nombre varchar(30),
	Saldo numeric(10,2)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Tipos_Movimiento')
DROP TABLE Tipos_Movimiento
CREATE TABLE Tipos_Movimiento
(
	Clave varchar(2) not null,
	Descripcion varchar(30)
)

IF EXISTS (SELECT * FROM INFORMATION_SCHEMA.TABLES WHERE TABLE_NAME='Movimientos')
DROP TABLE Movimientos
CREATE TABLE Movimientos
(
	NoCuenta varchar(5) not null,
	Clave varchar(2) not null,
	Fecha DateTime,
	Monto numeric(10,2)
)