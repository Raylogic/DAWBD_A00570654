function sendRequest() {
    $.get("Busqueda.php", {
        q: $("#Search").val()
    }).done(function (data) {
        $("#SortedTable").html(data);
    });
}
