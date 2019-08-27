
function tabla_potencia() {
	var num = prompt("Número = ");
	document.write("<table border='1'");
	document.write("<thead>");
	document.write("<th>Número</th> <th>Cuadrados</th> <th>Cubos</th>");
	document.write("</thead>");

	for(var i = 1; i <= num; i++) {
		document.write("<tr>");
		document.write("<td>"+i+"</td> <td>"+Math.pow(i,2)+"</td> <td>"+Math.pow(i,3)+"</td>");
		document.write("</tr>");
	}
	document.write("</table>");
}

//-----------------------------------------------------------------------------------------------------

function suma_random() {
	var num1 = Math.floor(Math.random()*100);
	var num2 = Math.floor(Math.random()*100);
	var suma = num1 + num2;
	
	var tiempo_inicio = performance.now();
	var operacion = prompt("" + num1 + " + " + num2 + " = ");
	var tiempo_final = performance.now();
	var tiempo_entre = ((tiempo_final - tiempo_inicio)/1000).toFixed(2);

	if(operacion == suma) {
		document.write("¡Correcto!" + "<br>");
	} else {
		document.write("¡Incorrecto!" + "<br>");
	}
	document.write("Tardaste " + tiempo_entre + " segundos en responder." + "<br>");
}

//----------------------------------------------------------------------------------

function contar_numeros() {
	var arr = [];
	for(var i = 0; i < 20; i++) {
	    arr[i] = Math.floor(Math.random()*20 - 10);
	    document.write(arr[i] + ", ");
	}
	var positivos = 0;
	var negativos = 0;
	var ceros = 0;
	for(i = 0; i < arr.length; i++) {
		if(arr[i] > 0) {
			positivos++;
		} else if (arr[i] == 0) {
			ceros++;
		} else if (arr[i] < 0) {
			negativos++;
		}
	}
	document.write("<br> Positivos = " + positivos + "<br>Ceros = " + ceros + "<br>Negativos = " + negativos);
}

//------------------------------------------------------

function promedio_matriz() {
	var matriz = [];
	var suma = 0;
	var filas = 9;
	var columnas = 9;
	for(var i=0; i<filas; i++) {
	    matriz[i] = [];
	    for(var j=0; j<columnas; j++) {
	        matriz[i][j] = Math.floor(Math.random()*10);
	        document.write(matriz[i][j] + ", ")
	        suma = suma + matriz[i][j];
	    }
	    var promedio = suma/columnas;
		document.write("<br>Promedio = " + promedio.toFixed(2) + "<br><br>");
		suma = 0;
	}
}

//---------------------------------------------------------

function invertir_numero() {
	var num = prompt("Número a invertir = ")
	num = num + "";
	document.write(num.split("").reverse().join(""));
}

//----------------------------------------------------------

class Numero {

	constructor(numero){
		this.numero = numero;
	}

	binario(){
		var arr = new Array(15);
		for(var i = 0; this.numero>=1; ++i) {
        	arr[i] = this.numero % 2;
        	this.numero = Math.floor(this.numero/2);
    	}
   		document.write("<br>Binario = " + arr.reverse().join(""));
	}
	primo(){
		var primo = true;
		for(var i = 1; i<=this.numero; i++){
			if(this.numero % i == 0){
				primo = false;
				break;
			} 
		}
		if(primo == true){
			document.write("<br>Es un número primo");
		} else {
			document.write("<br>No es un número primo");
		}
	}		
}

function analisis_numero(){
	var num = new Numero(Math.floor(Math.random()*1024));
	document.write("Número = " + num.numero);

	num.primo();
	num.binario();
	

	document.write('<br><br><a href="Laboratorio4.html">Laboratorio #4</a>');
}
