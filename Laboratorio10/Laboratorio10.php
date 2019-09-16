<?php
include_once("_Header.html");
include_once("_Navbar.html");
include_once("_Titulo.html");
include_once("_Startformas.html");
require_once("_PHPLab10.php");

//-------- Función #1-3 -----------

include("_formaNumeros.html");
$lista = array();
if(isset($_POST['n0'])){
    for ($i = 0; $i < 12; $i++){
        $lista[$i] = $_POST['n'.$i];
    }
} 
if(isset($_POST['n0'])){
    include("_outputNumeros.html");
}

//-------- Función #4 -------------

include("_formaTabla.html");
$limite = 0;
if(isset($_POST['number'])){
    $limite = htmlspecialchars($_POST["number"]);
    //$limite = $_POST['number'];
    tabla($limite);
}

//------------------------------

include("_formaBinario.html");
$decimal = 0;
if(isset($_POST['decbin'])){
    $decimal = htmlspecialchars($_POST["decbin"]);
    include("_outputBinario.html");
}

//-------------------------------

include_once("_Endformas.html");
include_once("_Preguntas.html");
include_once("_Referencias.html");
include_once("_Javascript.html");
?>