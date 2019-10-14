<?php 
require_once("Util.php");
session_start();

if(isset($_SESSION["Mail"])) {
    echo get_voluntarios_busqueda($_GET["q"]);
} 
?>