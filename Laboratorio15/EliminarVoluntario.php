<?php
session_start();
require_once("Modelo.php");

if(isset($_GET["VolID"])) {
    $voluntarios = buscar_voluntario($_GET["VolID"]);
    eliminar_voluntario($_GET["VolID"]);
    header("location:Laboratorio15.php");
}
?>