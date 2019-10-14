<?php
    
    require_once("Modelo.php");
    session_start();

    include_once("_Header.html");
    include_once("_Navbar.html"); 
    if(isset($_GET["ID"])) {
        echo icon_card($_GET["ID"]);
    } else {
        echo icon_card();
    }
    include_once("_Footer.html");
?>