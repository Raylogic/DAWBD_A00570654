<?php 
session_start();

if(($_SESSION["Mail"] == "A00570654@itesm.mx")) {

    $target_dir = "uploads/";
    $target_file = $target_dir . basename($_FILES["fileToUpload"]["name"]);
    $estatus = 1;
    $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));

    //¿La imagen es una imagen?
    if(isset($_POST["Enviar"])) {
        $check = getimagesize($_FILES["fileToUpload"]["tmp_name"]);
        if($check !== false) {
            echo "File is an image - " . $check["mime"] . ".";
            $estatus = 1;
        } else {
            echo "Esto no es una imagen";
            $estatus = 0;
        }
    }
    //¿El archivo ya existe?
    if (file_exists($target_file)) {
        echo "Ummm... Este archivo ya existe";
        $estatus = 0;
    }
    //¿El archivo pesa lo adecuado?
    if ($_FILES["fileToUpload"]["size"] > 500000) {
        echo "El archivo es muy grande para procesar";
        $estatus = 0;
    }
    //¿La imagen tiene el formato adecuado?
    if($imageFileType != "jpg" && $imageFileType != "png" && $imageFileType != "jpeg" && $imageFileType != "gif" ) {
        echo "Sólo acepto formato JPG, PNG, JPEG o GIF";
        $estatus = 0;
    }
    //Checa el estatus de la imagen
    if ($estatus == 0) {
        echo "Tu imagen no se pudo subir";
    } else {
        if (move_uploaded_file($_FILES["fileToUpload"]["tmp_name"], $target_file)) {
            echo "La imagen ". basename( $_FILES["fileToUpload"]["name"]). " se ha subido exitosamente";
        } else {
            echo "Hubo un error al subir la imagen";
        }
    }
} else {
    header("location:index.php");
}

?>
