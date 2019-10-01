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

function get_voluntarios() {
    $operation = connectDB();
    $query = 'SELECT VolID, Nombre, Mail, Teléfono, Edad FROM voluntarios';
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
            echo "<td>" . $row["Teléfono"] . "</td>";
            echo "<td>" . $row["Edad"] . "</td>";
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

function get_voluntarios_porCriterio($Columna, $criterio) {
    $operation = connectDB();
    $query = 'SELECT VolID, Nombre, Mail, Teléfono, Edad FROM voluntarios'; 
    if(is_string($criterio)){
        if($criterio != ""){
            $query .= " WHERE $Columna LIKE '%".$criterio."%'";
        }
    } else if(is_int($criterio)){
        if($criterio != 0){
            $query .= " WHERE $Columna=$criterio";
        }
    }

    $registros = $operation->query($query);

    $resultado = "<section class='container-fluid'>
                  <div class='row'>
                  <div class='col s12 m4 l1'></div>
                  <div class='col s12 m4 l10'>
                  <table border='1px solid black'>
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