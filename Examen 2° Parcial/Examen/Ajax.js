function sendRequest() {
    $.get("Zombie_Busqueda.php", {
        q: $("#Estado").val()
    }).done(function (data) {
        $("#Filtro").html(data);
    });
}