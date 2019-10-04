<?php
    
require_once("Modelo.php");
session_start();

modificar_voluntario($_POST["VolID"], $_POST["Nombre"], $_POST["Mail"], $_POST["Telefono"], $_POST["Edad"]);

header("location:Laboratorio15.php");
                 
?>