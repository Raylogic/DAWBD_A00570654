-- ------------------------------------ ADMINISTRADORES ------------------------------------------

DROP PROCEDURE IF EXISTS nuevoAdministrador;
DELIMITER //
CREATE PROCEDURE nuevoAdministrador(
IN uMail varchar(100),
IN uContraseña varchar(255),
IN uNombre varchar(50),
IN uAPaterno varchar(50),
IN uAMaterno varchar(50)
)
BEGIN
    INSERT INTO usuario(Mail, Contraseña, Nombre, APaterno, AMaterno) VALUES (uMail, uContraseña, uNombre, uAPaterno, uAMaterno);
END //
DELIMITER ;

-- -------------------------------------------

DROP PROCEDURE IF EXISTS cambiarAdministrador;
DELIMITER //
CREATE PROCEDURE cambiarAdministrador(
IN uMail varchar(100),
IN uContraseña varchar(255),
IN uNombre varchar(50),
IN uAPaterno varchar(50),
IN uAMaterno varchar(50)
)
BEGIN
    UPDATE usuario SET Mail=uMail, Contraseña=uContraseña, Nombre=uNombre, APaterno=uAPaterno, AMaterno=uAMaterno WHERE Mail=uMail;
END //
DELIMITER ;

-- ----------------------------------------------

DROP PROCEDURE IF EXISTS buscarAdministrador;
DELIMITER //
CREATE PROCEDURE buscarAdministrador(
IN uMail varchar(100)
)
BEGIN
    SELECT Mail, Contraseña, Nombre, APaterno, AMaterno FROM usuario WHERE Mail=uMail;
END //
DELIMITER ;

-- ----------------------------------------------

DROP PROCEDURE IF EXISTS eliminarAdministrador;
DELIMITER //
CREATE PROCEDURE eliminarAdministrador(
IN uMail varchar(100)
)
BEGIN
    DELETE FROM usuario WHERE Mail=uMail;
END //
DELIMITER ;

-- -----------------------------------------------

DROP PROCEDURE IF EXISTS imprimirAdministrador;
DELIMITER //
CREATE PROCEDURE imprimirAdministrador(
)
BEGIN
    SELECT Mail, Contraseña, Nombre, APaterno, AMaterno FROM usuario; 
END //
DELIMITER ;

-- ---------------------------------------------- VOLUNTARIOS -------------------------------------------------

DROP PROCEDURE IF EXISTS nuevoVoluntario;
DELIMITER //
CREATE PROCEDURE nuevoVoluntario(
IN uNombre varchar(50),
IN uApellidos varchar(100),
IN uMail varchar(100),
IN uTelefono varchar(10),
IN uEdad int
)
BEGIN
    INSERT INTO voluntarios(Nombre, Apellidos, Mail, Telefono, Edad) VALUES (uNombre, uApellidos, uMail, uTelefono, uEdad);
END //
DELIMITER ;

-- ----------------------------------------------

DROP PROCEDURE IF EXISTS cambiarVoluntario;
DELIMITER //
CREATE PROCEDURE cambiarVoluntario(
IN uVolID int,
IN uNombre varchar(50),
IN uApellidos varchar(100),
IN uMail varchar(100),
IN uTelefono varchar(10),
IN uEdad int
)
BEGIN
    UPDATE voluntarios SET Nombre=uNombre, Apelidos=uApellidos, Mail=uMail, Telefono=uTelefono, Edad=uEdad WHERE VolID=uVolID;
END //
DELIMITER ;

-- -----------------------------------------------

DROP PROCEDURE IF EXISTS buscarVoluntario;
DELIMITER //
CREATE PROCEDURE buscarVoluntario(
IN uVolID int
)
BEGIN
    SELECT VolID, Nombre, Apellidos, Mail, Telefono, Edad FROM voluntarios WHERE VolID=uVolID;
END //
DELIMITER ;

-- -----------------------------------------------

DROP PROCEDURE IF EXISTS eliminarVoluntario;
DELIMITER //
CREATE PROCEDURE eliminarVoluntario(
IN uVolID int
)
BEGIN
    DELETE FROM voluntarios WHERE VolID=uVolID;
END //
DELIMITER ;

-- -----------------------------------------------

DROP PROCEDURE IF EXISTS imprimirVoluntario;
DELIMITER //
CREATE PROCEDURE imprimirVoluntario(
)
BEGIN
    SELECT VolID, Nombre, Apellidos, Mail, Telefono, Edad FROM voluntarios; 
END //
DELIMITER ;