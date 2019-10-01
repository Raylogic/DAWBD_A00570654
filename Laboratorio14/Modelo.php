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
                        <a href="Iconos.php?id='.$fila["ID"].'"><img src="'.$fila["URL"].'" max-width:"90%"></a>
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
<!--
<div class="card">
    <div class="card-image waves-effect waves-block waves-light">
      <img class="activator" src="'.$fila["URL"].'">
    </div>
    <div class="card-content">
      <span class="card-title activator grey-text text-darken-4">'.$fila["ID"]'<i class="material-icons right">more_vert</i></span>
      <p><a href=""Iconos.php?id='.$fila["ID"].'"">Presióname</a></p>
    </div>
    <div class="card-reveal">
      <span class="card-title grey-text text-darken-4">'.$fila["ID"]'<i class="material-icons right">close</i></span>
      <p>'.$fila["Descripción"].'</p>
    </div>
  </div>
  -->