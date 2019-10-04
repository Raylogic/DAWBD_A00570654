<?php 

require_once("Modelo.php");
include_once("_Header.html");
include_once("_FormasVoluntario.html");

if($_POST["Nombre"] != "" && $_POST["Mail"] != "" && $_POST["Telefono"] != "" && $_POST["Edad"] != ""){
	registrar_voluntario($_POST["Nombre"], $_POST["Mail"], $_POST["Telefono"], $_POST["Edad"]);
} else {
	if($_POST["Nombre"] == ""){
        $error_nombre = "El nombre no debe estar vacío";
    }
    if($_POST["Mail"] == ""){
        $error_mail = "El mail no debe estar vacío";
    }
    if($_POST["Telefono"] == ""){
        $error_telefono = "El telefono no debe estar vacío";
    }
    if($_POST["Edad"] == ""){
        $error_edad = "La edad no debe estar vacía";
    }
}

include_once("_Footer.html");

?>