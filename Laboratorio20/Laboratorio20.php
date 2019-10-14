<?php 
require_once("Util.php");
session_start();
if(isset($_SESSION["Mail"])) {

    include_once("_Header.html");
    include_once("_Contenido.html");
    include_once("_Footer.html");

}  else {
    header("location:index.php");
}
?>
            