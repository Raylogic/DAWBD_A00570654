<?php

session_start();
require_once("Modelo.php");
include_once("_Header.html");
if(isset($_GET["VolID"])) {
    $voluntarios = buscar_voluntario($_GET["VolID"]);
    include_once("_EditarVoluntario.html");
} 
include_once("_Footer.html");

?>