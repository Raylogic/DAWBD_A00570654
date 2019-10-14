/* Crear el objeto de la petición asíncrona. */
function getRequestObject() {
    if (window.XMLHttpRequest) {
        return (new XMLHttpRequest());
    } else if (window.ActiveXObject) {
        return (new ActiveXObject("Microsoft.XMLHTTP"));
    } else {
        return (null);
    }
}

function sendRequest() {

    request = getRequestObject();
    if (request != null) {
        var Search = document.getElementById('Search');
        var url = 'Busqueda.php?q=' + Search.value;
        request.open('GET', url, true);
        request.onreadystatechange =
            function () {
                /* La petición pasa por varios varios estados:
                 * 0: No inicializada
                 * 1: Conexión establecida
                 * 2: Petición recibida
                 * 3: Respuesta en proceso
                 * 4: Finalizada
                */
                if (request.readyState == 4) {
                    var ajaxResponse = document.getElementById('SortedTable');
                    ajaxResponse.innerHTML = request.responseText;
                    console.log("Conexion recibida");
                }
            };
        request.send(null);
    }
}

function selectValue() {
    var list = document.getElementById("list");
    var SortedTable = document.getElementById("SortedTable");
    var ajaxResponse = document.getElementById('ajaxResponse');
    SortedTable.value = list.options[list.selectedIndex].text;
    ajaxResponse.style.visibility = "hidden";
    SortedTable.focus();
}