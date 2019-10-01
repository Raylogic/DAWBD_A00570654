<?php 
    require_once("Util.php");
    $voluntarios = get_voluntarios();

    echo "<section class="container-fluid">";
    echo "<div class="row">";
    echo "<div class="col s12 m4 l1"></div>";
    echo "<div class="col s12 m4 l10">";
    echo "<table border=1px solid black>";
    if(mysqli_num_rows($voluntarios) > 0){
        while($row = mysqli_fetch_assoc($voluntarios)){
            echo "<tr>";
            echo "<td>" . $row["VolID"] . "</td>";
            echo "<td>" . $row["Nombre"] . "</td>";
            echo "<td>" . $row["Mail"] . "</td>";
            echo "<td>" . $row["Teléfono"] . "</td>";
            echo "<td>" . $row["Edad"] . "</td>";
            echo "</tr>";
        }
    }
    echo "</table>";
    echo "</div>"
    echo "<div class="col s12 m4 l1"></div>"
    echo "</div>"
    echo "</div>"
    echo "</section>"
?>