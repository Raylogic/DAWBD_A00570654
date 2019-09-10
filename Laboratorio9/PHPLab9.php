<?php
function promedio($lista){
    $promedio = array_sum($lista)/count($lista);
    return $promedio;
}
function mediana($lista){
    if(isset($_POST['n0'])){
      sort($lista);
      $cantidad = count($lista);
      $posMediana = ($cantidad + 1) / 2;
      $mediana = $cantidad % 2 != 0 ? $lista[$posMediana - 1] : ($lista[$posMediana - 1] + $lista[$posMediana]) / 2;
      return $mediana;
    }
}  
function ascendente($lista){
    sort($lista);
    $ascend = "<ul>";
    for($i = 0; $i <12; $i++) {

      $ascend .= "<li>".$lista[$i]."</li>";
    }
    $ascend .= "</ul>";

    return $ascend;
}

function descendente($lista){
    rsort($lista);
    $descend = "<ul>";
    for($i = 0; $i <12; $i++) {

      $descend .= "<li>".$lista[$i]."</li>";
    }
    $descend .= "</ul>";

    return $descend;
}    
function listado($lista){
  if(isset($_POST['n0'])){

    $prom = promedio($lista);
    print "<ul>
            <li>1) Promedio = ".$prom."</li>
          </ul>";
    
    $med = mediana($lista);
    print "<ul>
            <li>2) Mediana = ".$med."</li>
          </ul>";
   
    $asc = ascendente($lista);
    print "<ul>
            <li>3) Arreglo ascendente:".$asc."</li>
          </ul>";

    $desc = descendente($lista);
    print "<ul>
            <li>3) Arreglo descendente:".$desc."</li>
          </ul>";
  }
}
function tabla ($limite){
    $cuadrados = array();
    $cubos = array();
    echo "<table border='1'>";
    for($tr = 0; $tr < 2; $tr++){
        echo "<tr align=center>";
        for($td = 1; $td <= $limite; $td++){
            if($tr == 0)
                echo "<td width=40px>".pow($td,2)."</td>";
            else
                echo "<td width=40px>".pow($td,3)."</td>";
        }
        echo "</tr>";
    }
    echo "</table>";
}
function binario($numero){
    $bits = array();
    for($i = 0; $numero>=1; ++$i){
      $bits[$i] = $numero % 2;
      $numero = floor($numero/2);
    }
    $bits = array_reverse($bits,true);

    return $bits;
}    
?>