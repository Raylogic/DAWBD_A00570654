<?php
include_once("_Header.html");
require_once("PHPLab9.php");

print "<h3>Introduce 12 números: </h3>";
print "<form method=post action=Laboratorio9.php>";
for ($i = 0; $i < 12; $i++){
    print "<input type=text name=n$i />";
}
print "<br><br><input type=submit value=Calcular />";
print "</form><br>";

$lista = array();

if(isset($_POST['n0'])){
    for ($i = 0; $i < 12; $i++){
        $lista[$i] = $_POST['n'.$i];
    }
} 
if(isset($_POST['n0'])){

    print "<h3>Función #1: </h3>";
    $promedio = promedio($lista);
    print "Promedio = ".$promedio."<br><br>";

    print "<h3>Función #2: </h3>";
    $mediana = mediana($lista);
    print "Mediana = ".$mediana."<br><br>";

    print "<h3>Función #3: </h3>";
    listado($lista);

}

print "<h3>Función #4: </h3>";
$limite = 0;
print "<form method=post action=Laboratorio9.php>";
print "Escribe un número entre 1-20: <input type=number name=number min=1 max=20>";
print "<input type=submit>";
print "</form><br>";



if(isset($_POST['number'])){
    $limite = $_POST['number'];
    tabla($limite);
}

//------------------------------

print "<br><h3>Función Libre: </h3>";
$decimal = 0;
print "<form method=post action=Laboratorio9.php>";
print "Escribe un número entre 1-65536: <input type=number name=decbin min=1 max=65536>";
print "<input type=submit>";
print "</form><br>";

if(isset($_POST['decbin'])){
    $decimal = $_POST['decbin'];
    $binario = binario($decimal);
    $binario = implode("",$binario);
    print "Binario = ".$binario."<br><br>";
}
  
include_once("_Content.html");
?>