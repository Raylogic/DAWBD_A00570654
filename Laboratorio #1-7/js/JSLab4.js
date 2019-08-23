
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
	var tiempo_inicio = performance.now();
	var aproximacion = prompt("Suma = ");
	var tiempo_final = performance.now();
	var tiempo_entre = ((tiempo_final - tiempo_inicio)/1000).toFixed(2);

	var num1 = Math.floor(Math.random()*10);
	var num2 = Math.floor(Math.random()*10);
	var suma = num1 + num2;
	
	if(aproximacion !== suma) {
		document.write("No le adivinó" + "<br>");
	} else {
		document.write("Eres psíquico" + "<br>");
	}
	document.write("Resultado verdadero = " + suma + "<br>");
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
	    document.write("<br>");
	}
	var promedio = suma/(filas*columnas);
	document.write("<br>Promedio = " + promedio.toFixed(2));
}

//---------------------------------------------------------

function invertir_numero() {
	var num = prompt("Número a invertir = ")
	num = num + "";
	document.write(num.split("").reverse().join(""));
}

//----------------------------------------------------------

function binario_paridad() {
	var num = Math.floor(Math.random()*1024)
	document.write("Número = " + num);
	var arr = new Array(15);
	for(var i = 0; num>=1; ++i) {
        arr[i] = num % 2;
        num = Math.floor(num/2);
    }
    document.write("<br>Binario = " + arr.reverse().join(""));

    var count1s = 0;
    for(var j = 0; j<arr.length; j++){
    	if(arr[j] == 1){
    		count1s++;
    	}
    }
    if(count1s % 2 == 0) {
    	document.write("<br>Paridad par");
    } else if(count1s % 2 == 1) {
		document.write("<br>Paridad impar");
    }
}
