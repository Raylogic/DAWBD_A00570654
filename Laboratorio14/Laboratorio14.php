<?php 
session_start();
if(isset($_SESSION["Mail"]) && isset($_SESSION["Contraseña"])) {

    include_once("_Header.html");
    include_once("_Navbar.html");
    include_once("_Contenido.html");
    include_once("_Footer.html");
    require_once("Util.php");
    $voluntarios = get_voluntarios();
    print_voluntarios($voluntarios);
    
    echo "<hr>";
    if(isset($_POST["BuscarMail"])){
        $_POST["BuscarMail"] = htmlspecialchars($_POST["BuscarMail"]);
        echo get_voluntarios_porCriterio('Mail', $_POST["BuscarMail"]);      
    }
    if(isset($_POST["BuscarEdad"])){
        $_POST["BuscarEdad"] = htmlspecialchars($_POST["BuscarEdad"]);
        echo get_voluntarios_porCriterio('Edad', $_POST["BuscarEdad"]);
    }
    if(isset($_POST["BuscarTelefono"])){
        $_POST["BuscarTelefono"] = htmlspecialchars($_POST["BuscarTelefono"]);
        echo get_voluntarios_porCriterio('Teléfono', $_POST["BuscarTelefono"]); 
    }

} else if(isset($_POST["Mail"]) && isset($_POST["Contraseña"])) {
    if(htmlspecialchars($_POST["Mail"]) == "A00570654@itesm.mx" && htmlspecialchars($_POST["Contraseña"]) == "X-ray1257") {
        $_SESSION["Mail"] = $_POST["Mail"]; 
        $_SESSION["Contraseña"] = $_POST["Contraseña"];
        include_once("_Header.html");
        include_once("_Navbar.html");
        include_once("_Contenido.html");
        include_once("_Footer.html");
        $voluntarios = get_voluntarios();
        print_voluntarios($voluntarios);
    }
} else {
    header("location:index.php");
}
?>
            