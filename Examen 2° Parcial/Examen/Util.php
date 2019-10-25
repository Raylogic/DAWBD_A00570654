<?php

function connectDB() {

    /*
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "dawbdorg_A00570654";
    */
    
    $servername = "mysql1008.mochahost.com";
    $username = "dawbdorg_0570654";
    $password = "0570654";
    $dbname = " dawbdorg_A00570654";
    
    
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

?>