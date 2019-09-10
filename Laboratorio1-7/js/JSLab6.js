var avisos = 0;
function Matricular() {
	if(avisos == 0) {
		alert("Recuerda que tu matrícula debe empezar por la A");
	}
	avisos++;
}

//------------------------------------------------------------------------------

var count = 0;
setInterval(function(){ 
	count++;
	document.getElementById("Contador").innerText = "Contador = " + count;
}, 1000);

//------------------------------------------------------------------------------

var estado = 0;
function CambiaFont() {
	if(estado == 0) {
		document.getElementById("Fuente").style.fontFamily = "Times New Roman";
		estado = 1;
	} else if(estado == 1) {
		document.getElementById("Fuente").style.fontFamily = "Lato";
		estado = 0;
	}
}

//------------------------------------------------------------------------------

function allowDrop(ev) {
  ev.preventDefault();
}

function drag(ev) {
  ev.dataTransfer.setData("text", ev.target.id);
}
function drop(ev) {
  ev.preventDefault();
  var data = ev.dataTransfer.getData("text");
  ev.target.appendChild(document.getElementById(data));
}


