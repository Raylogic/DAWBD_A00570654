<?php

$ip =$_SERVER['HTTP_X_FORWARDED_FOR'];
$res = file_get_contents('https://www.iplocate.io/api/lookup/'.$ip);
$data = json_decode($res);


echo "<section class='container-fluid'>";
echo "<div class='row'>";
echo "<div class='col s12 m4 l1'></div>";
echo "<div class='col s12 m4 l10'>";
echo "<p>A través de la API IPLocate, puedo saber dónde vives.</p>";
echo "<p>Ténlo en cuenta cuando te duermas hoy. Buenas noches :)</p>";
echo "<p>NOTA: Para ver el funcionamiento de esta API, revisa el laboratorio desde mi servidor Mochahost del 2° Parcial donde está guardado.</p>";

foreach ($data as $k => $v){
		echo $k." = ".$v."<br>";
}

echo "</div>";
echo "<div class='col s12 m4 l1'></div>";
echo "</div>";
echo "</section>";

?>