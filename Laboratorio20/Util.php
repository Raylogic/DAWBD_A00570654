<?php

function connectDB() {

    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "laboratorio14";
    
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

function get_voluntarios_busqueda($criterio) {
    $operation = connectDB();
    $query = "SELECT VolID, Nombre, Mail, Teléfono, Edad FROM voluntarios"; 
    if(is_string($criterio)){
        if($criterio != ""){
            $query .= " WHERE Nombre LIKE '%".$criterio."%' 
                        OR Mail LIKE '%".$criterio."%' 
                        OR Teléfono LIKE '%".$criterio."%' 
                        OR Edad LIKE '%".$criterio."%'";
        }
    } 

    $registros = $operation->query($query);

    $resultado = "<section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black' id=\"list\">
                    <th>
                        <td>" . "Nombre" . "</td>
                        <td>" . "Mail" . "</td>
                        <td>" . "Teléfono" . "</td>
                        <td>" . "Edad" . "</td>
                    </th>";
    while ($row = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= "<tr>
                            <td>" . $row["VolID"] . "</td>
                            <td>" . $row["Nombre"] . "</td>
                            <td>" . $row["Mail"] . "</td>
                            <td>" . $row["Teléfono"] . "</td>
                            <td>" . $row["Edad"] . "</td>
                        </tr>";
    }
    $resultado .= "</table>
                    </div>
                    <div class='col s12 m4 l1'>
                    </div>
                    </div>
                    </div>
                    </section>";
    mysqli_free_result($registros);
    closeDB($operation);
    
    return $resultado;
}

function print_voluntarios() {
    $operation = connectDB();
    $query = "SELECT VolID, Nombre, Mail, Teléfono, Edad FROM voluntarios"; 

    $registros = $operation->query($query);

    $resultado = "<section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black' id=\"list\">
                    <th>
                        <td>" . "Nombre" . "</td>
                        <td>" . "Mail" . "</td>
                        <td>" . "Teléfono" . "</td>
                        <td>" . "Edad" . "</td>
                    </th>";
    while ($row = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= "<tr>
                            <td>" . $row["VolID"] . "</td>
                            <td>" . $row["Nombre"] . "</td>
                            <td>" . $row["Mail"] . "</td>
                            <td>" . $row["Teléfono"] . "</td>
                            <td>" . $row["Edad"] . "</td>
                        </tr>";
    }
    $resultado .= "</table>
                    </div>
                    <div class='col s12 m4 l1'>
                    </div>
                    </div>
                    </div>
                    </section>";
    mysqli_free_result($registros);
    closeDB($operation);
    
    return $resultado;
}

?>