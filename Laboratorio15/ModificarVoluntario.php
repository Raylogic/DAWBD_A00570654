<?php
    
    require_once("Modelo.php");
    session_start();

    include_once("_Header.html");

    if(isset($_GET["VolID"])) {
        $voluntario = buscar_voluntario($_GET["VolID"]);
        include_once("_EditarVoluntario.html");
    } else {
        #$voluntario= buscar_voluntario($_GET["VolID"]);
        echo print_voluntarios($voluntario);
    }
    
    include_once("_Footer.html");
?>