function numberCount(arr = [1, -9, 5, 3, 4, -7, 2, -6, 0, 8]) {
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
	return "Positivos = " + positivo + "Ceros = " + ceros + "Negativos = " + negativo;
}

var str = numberCount;

document.write(str());