<?php

function connectDB() {

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "laboratorio15";
    
    $environment = "DEV";
    if ($environment == "DEV") {
         $connection = mysqli_connect($servername, $username, $password, $dbname);
    } else if($environment == "PROD") {
         $connection = mysqli_connect($servername, $username, $password, $dbname);
    }
    if(!$connection){
        die("Conexión fallida: " . mysqli_connect_error());
    }
    
    mysqli_set_charset($connection,"utf8");
    return $connection;
}

function closeDB($connection) {
    mysqli_close($connection);
}

function get_voluntarios() {
    $operation = connectDB();
    $query = 'SELECT VolID, Nombre, Mail, Telefono, Edad FROM voluntarios';
    $resultado = mysqli_query($operation, $query);
    closeDB($operation);
    
    return $resultado;
}
function print_voluntarios($lista) {
    echo "<section class='container-fluid'>";
    echo "<div class='row'>";
    echo "<div class='col s12 m4 l1'></div>";
    echo "<div class='col s12 m4 l10'>";
    echo "<table border='1px solid black'>";
    echo "<th>";
    echo "<td>" . "Nombre" . "</td>";
    echo "<td>" . "Mail" . "</td>";
    echo "<td>" . "Teléfono" . "</td>";
    echo "<td>" . "Edad" . "</td>";
    echo "</th>";
    if(mysqli_num_rows($lista) > 0){
        while($row = mysqli_fetch_assoc($lista)){
            echo "<tr>";
            echo "<td>" . $row["VolID"] . "</td>";
            echo "<td>" . $row["Nombre"] . "</td>";
            echo "<td>" . $row["Mail"] . "</td>";
            echo "<td>" . $row["Telefono"] . "</td>";
            echo "<td>" . $row["Edad"] . "</td>";
            echo "<td>";
            echo '<a href="Laboratorio15.php?VolID='.$row["VolID"].'"><i class="material-icons green-text">edit</i></a>';
            echo '<a href="Laboratorio15.php?VolID='.$row["VolID"].'"><i class="material-icons red-text"> delete</i></a>';
            echo "</td>";
            echo "</tr>";
        }
    }
    echo "</table>";
    echo "</div>";
    echo "<div class='col s12 m4 l1'></div>";
    echo "</div>";
    echo "</div>";
    echo "</section>";
}

function registrar_voluntario($nombre, $mail, $telefono, $edad) {
    
    $operacion = connectDB();
    $query='INSERT INTO voluntarios (nombre,mail,telefono,edad) VALUES (?,?,?,?) ';

    if (!($statement = $operacion->prepare($query))) {
        die("No se pudo preparar la consulta para la base de datos: (" . $operacion->errno . ") " . $operacion->error);
    }
    if (!$statement->bind_param("ssss", $nombre, $mail, $telefono, $edad)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error); 
    }
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    } 

    closeDB($operacion);
}

function buscar_voluntario($id) {
    $operacion = connectDB();
    $query = "SELECT VolID, Nombre, Mail, Telefono, Edad FROM voluntarios WHERE VolID=$id";

    $registros = $operacion->query($query);
    while ($row = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $voluntario["Nombre"] = $row["Nombre"];
        $voluntario["Mail"] = $row["Mail"];
        $voluntario["Telefono"] = $row["Telefono"];
        $voluntario["Edad"] = $row["Edad"];
        $voluntario["VolID"] = $row["VolID"];
    }
    mysqli_free_result($registros);
    closeDB($operacion);
    
    return $voluntario;
}

function modificar_voluntario($id, $nombre, $mail, $telefono, $edad) {
    
    $operacion = connectDB();
    $antiguo_voluntario=buscar_voluntario($id);
    $query='UPDATE voluntarios SET Nombre=?, Mail=?, Telefono=?, Edad=? WHERE VolID=?';

    if (!($statement = $operacion->prepare($query))) {
        die("No se pudo preparar la consulta para la base de datos: (" . $operacion->errno . ") " . $operacion->error);
    }
    if (!$statement->bind_param("sss", $nombre, $foto, $id)) {
        die("Falló la vinculación de los parámetros: (" . $statement->errno . ") " . $statement->error); 
    }
    if (!$statement->execute()) {
        die("Falló la ejecución de la consulta: (" . $statement->errno . ") " . $statement->error);
    }

    closeDB($operacion);
}

function eliminar_voluntario($id) {
    $operacion = connectDB();
    $query='DELETE FROM voluntarios WHERE VolID=$id';

    $resultado = mysqli_query($operacion, $query);

    closeDB($operacion);
    
    return $resultado;
}

?>