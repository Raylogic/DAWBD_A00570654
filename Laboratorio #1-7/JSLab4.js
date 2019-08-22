function contar_numero(arr = [1, -9, 5, 3, 4, -7, 2, -6, 0, 8]) {
	var positivo = 0;
	var negativo = 0;
	var ceros = 0;
	for(x=0; x<arr.length; x++) {
		if(arr[x] > 0) {
			positivo++;
		} else if (arr[x] == 0) {
			ceros++;
		} else if (arr[x] < 0) {
			negativo++;
		}
	}
	return "Positivos = " + positivo + " Ceros = " + ceros + " Negativos = " + negativo;
}
var str = contar_numero;
document.write(str());

function promedio_matriz() {
	var matrix = [];
	var suma = 0;
	var filas = 9;
	var columnas = 9;
	for(var i=0; i<filas; i++) {
	    matrix[i] = [];
	    for(var j=0; j<columnas; j++) {
	        matrix[i][j] = Math.floor(Math.random()*10);;
	        suma = suma + matrix[i][j];
	    }
	}
	var promedio = suma/(filas*columnas);
	return "Promedio = " + promedio;
}
var prom = promedio_matriz;
document.write(prom());



function invertir_numero(num) {
	num = num + "";
	return num.split("").reverse().join("");
}
var inversion = invertir_numero;
document.write(inversion(12345));

console.log(reverse_a_number(32243));

function binario(num) {
	var resultado = [];
	for(var i=0; num>=1; ++i) {
        resultado[i] = num % 2;
        num = Math.floor(num/2);
    }
    return "Binario = " + resultado.reverse().join("");
}
var b = binario;
document.write(binario(240));