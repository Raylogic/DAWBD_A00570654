CALL nuevoAdministrador('A00570654@itesm.mx','X-ray1257','Raymundo','Romero','Arenas');
CALL eliminarAdministrador('pato.romero@gmail.com');
CALL cambiarAdministrador('pato.romero@gmail.com','X-ray1256','Patricia','Arenas','Carrillo');
CALL buscarAdministrador('A00570654@itesm.mx');

UPDATE usuario SET Mail='A06666666@itesm.mx', Contraseña='X-ray1245', Nombre='Fatima', APaterno='Goomez', AMaterno='Delenne' WHERE Mail='A0567065@itesm.mx';