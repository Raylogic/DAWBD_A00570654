<?php
    
require_once("Modelo.php");
session_start();

$errores = 0;
if($_POST["Nombre"] == ""){
    $error_nombre = "El nombre no debe estar vacío";
    $errores++;
}
if($_POST["Mail"] == ""){
    $error_mail = "El mail no debe estar vacío";
    $errores++;
}
if($_POST["Telefono"] == ""){
    $error_telefono = "El telefono no debe estar vacío";
    $errores++;
}
if($_POST["Edad"] == ""){
    $error_edad = "La edad no debe estar vacía";
    $errores++;
}

if($errores == 0){
	registrar_voluntario($_POST["Nombre"], $_POST["Mail"], $_POST["Telefono"], $_POST["Edad"]);
	header("location:Laboratorio15.php");
} else {
	include_once("_Header.html");
	include_once("_FormasVoluntario.html");
	include_once("_Footer.html");
}
		
?>