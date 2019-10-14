<?php

function openDB() {
    
    $environment = "DEV";
    if ($environment == "DEV") {
         $database = mysqli_connect("localhost","root","","laboratorio14");
    } else if($environment == "PROD") {
         $database = mysqli_connect("localhost","root","passwdadmin","laboratorio14");
    }
    
    mysqli_set_charset($database,"utf8");
    return $database;
}

function closeDB($database) {
    mysqli_close($database);
}

function icon_card($id=0) {
    
    $db = openDB();
    
    $resultado = '<div class="row">';
    $query = 'SELECT ID, Name, Descripción, URL FROM geometry';
    
    if($id != 0) {
        $query .= " WHERE ID=$id";
    }
    
    $registros = $db->query($query);
    while ($fila = mysqli_fetch_array($registros, MYSQLI_BOTH)) {
        $resultado .= '
            <div class="col s12 m6 l4">
                <div class="card">
                    <div class="card-image">
                        <a href="Iconos.php?ID='.$fila["ID"].'"><img src="'.$fila["URL"].'" max-width:"90%"></a>
                        <span class="card-title">'.$fila["Name"].'</span>
                    </div>
                    <div class="card-content">
                        <p>'.$fila["Descripción"].'</p>
                    </div>
                </div>
            </div>
        ';
    }
    $resultado .= "</div>";

    mysqli_free_result($registros);
    closeDB($db);
    
    return $resultado;
}

?>
