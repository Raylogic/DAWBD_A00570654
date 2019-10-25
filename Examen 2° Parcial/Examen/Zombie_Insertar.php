<?php
    
require_once("Zombie_Modelo.php");
registrar_zombie($_POST["Nombre"], $_POST["Estado"]); 
header("location:index.php");
		
?>