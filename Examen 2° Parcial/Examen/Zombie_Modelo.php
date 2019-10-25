<?php

include("Util.php");

function registrar_zombie($nombre, $estado) {
    
    $operacion = connectDB();
    $query='CALL nuevoZombie(?,?)';

    if (!($statement = $operacion->prepare($query))) {
        die("No se pudo preparar la consulta para la base de datos: (" . $operacion->errno . ") " . $operacion->error);
    }
    if (!$statement->bind_param("ss", $nombre, $estado)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error); 
    }
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    } 

    closeDB($operacion);
}

function print_zombis() {
    $operation = connectDB();
    $query = 'CALL imprimirZombie()'; 

    $registros = $operation->query($query);

    $resultado = "<br>
                  <section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black' class='highlight' id=>
                  <thead>
                  <tr>
                  <th>" . "Nombre" . "</th>
                  <th>" . "Estados" . "</th>
                  </tr>
                  </thead>
                  <tbody>";
    while($row = mysqli_fetch_array($registros, MYSQLI_BOTH)){
        $resultado .= "<tr>
                       <td>" . $row["Nombre"] . "</td>
                       <td>" . $row["Estado"] . "- " . $row["FechaHora"] . "</td>
                       </tr>";
    }
    $resultado .= "</tbody>
                   </table>
                   </div>
                   <div class='col s12 m4 l1'></div>
                   </div>
                   </div>
                   </section>
                   <br>";
    mysqli_free_result($registros);
    closeDB($operation);
    
    return $resultado;
}

function historial_zombis() {
    $operation = connectDB();
    $query = 'CALL imprimirZombieOrdenado()'; 

    $registros = $operation->query($query);

    $resultado = "<br>
                  <section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black' class='highlight'>
                  <thead>
                  <tr>
                  <th>" . "Nombre" . "</th>
                  <th>" . "Estados" . "</th>
                  </tr>
                  </thead>
                  <tbody>";
    while($row = mysqli_fetch_array($registros, MYSQLI_BOTH)){
        $resultado .= "<tr>
                       <td>" . $row["Nombre"] . "</td>
                       <td>" . $row["Estado"] . "- " . $row["FechaHora"] . "</td>
                       </tr>";
    }
    $resultado .= "</tbody>
                   </table>
                   </div>
                   <div class='col s12 m4 l1'></div>
                   </div>
                   </div>
                   </section>
                   <br>";
    mysqli_free_result($registros);
    closeDB($operation);
    
    return $resultado;
}

function cuenta_zombis() {
    $operation = connectDB();
    $query = 'SELECT * FROM ZombisPorEstado'; 

    $registros = $operation->query($query);

    $resultado = "<br>
                  <section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black' class='highlight'>
                  <thead>
                  <tr>
                  <th>" . "Estado" . "</th>
                  <th>" . "Conteo" . "</th>
                  </tr>
                  </thead>
                  <tbody>";
    while($row = mysqli_fetch_array($registros, MYSQLI_BOTH)){
        $resultado .= "<tr>
                       <td>" . $row["Estado"] . "</td>
                       <td>" . $row["Total"] . "</td>
                       </tr>";
    }
    $resultado .= "</tbody>
                   </table>
                   </div>
                   <div class='col s12 m4 l1'></div>
                   </div>
                   </div>
                   </section>
                   <br>";
    mysqli_free_result($registros);
    closeDB($operation);
    
    return $resultado;
}

function search_estado($criterio) {
    $operation = connectDB();
    $query = "SELECT Z.Nombre, E.Estado, H.FechaHora
    FROM Zombi as Z, Estado as E, Historial as H
    WHERE Z.ZombID = H.ZombID AND E.EstID = H.EstID AND E.Estado = $criterio";

    $registros = $operation->query($query);

    $resultado = "<br>
                  <section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black' id='Admin' class='tablesorter'>
                  <thead>
                  <tr>
                  <th>" . "Mail" . "</th>
                  <th>" . "Nombre" . "</th>
                  <th>" . "Apellido Paterno" . "</th>
                  <th>" . "Apellido Materno" . "</th>
                  <th></th>
                  <th></th>
                  </tr>
                  </thead>
                  <tbody>";
    while($row = mysqli_fetch_array($registros, MYSQLI_BOTH)){
        $resultado .= "<tr>
                       <td>" . $row["Mail"] . "</td>
                       <td>" . $row["Nombre"] . "</td>
                       <td>" . $row["APaterno"] . "</td>
                       <td>" . $row["AMaterno"] . "</td>
                       <td><a href='Administrador_Modificar.php?UsuarioID=".$row["UsuarioID"]."'><i class='material-icons green-text'>edit</i></a></td>
                       <td><a href='Administrador_Eliminar.php?UsuarioID=".$row["UsuarioID"]."'><i class='material-icons red-text'> delete</i></a></td>
                       </tr>";
    }
    $resultado .= "</tbody>
                   </table>
                   </div>
                   <div class='col s12 m4 l1'></div>
                   </div>
                   </div>
                   </section>
                   <br>";
    mysqli_free_result($registros);
    closeDB($operation);
    
    return $resultado;
}

?>