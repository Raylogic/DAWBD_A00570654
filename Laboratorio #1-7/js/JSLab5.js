function xbox() {
  var precio = 5000;
  document.getElementById("Xbox").innerHTML = 
    "<ul>" +
      "<li>Memoria: 1TB</li>" +
      "<li>Incluye dos controles</li>" +
      "<li>Incluye Halo: Infinte</li>" +
      "<li>Incluye Xbox Game Pass</li>" +
      "<li>Precio = $" + "<span id=PrecioXbox>" + precio + "</span>" +
    "</ul>"
  "";
}
function playstation() {
  var precio = 7500;
  document.getElementById("Playstation").innerHTML = 
    "<ul>" +
      "<li>Memoria: 500GB</li>" +
      "<li>Incluye un control</li>" +
      "<li>Incluye Borderlands 3</li>" +
      "<li>Incluye PlayStation Now</li>" +
      "<li>Precio = $" + "<span id=PrecioPS>" + precio + "</span>" +
    "</ul>"
  "";
}
function nintendo() {
  var precio = 6000;
  document.getElementById("Nintendo").innerHTML = 
    "<ul>" +
      "<li>Memoria: 100GB</li>" +
      "<li>Incluye dos joycons</li>" +
      "<li>Incluye Mario Odyssey</li>" +
      "<li>Incluye Nintendo Online</li>" +
      "<li>Precio = $" + "<span id=PrecioNX>" + precio + "</span>" +
    "</ul>"
  "";
}
function total(){
  var amountXbox = document.getElementById("AmountXbox").value;
  var discountXbox = document.getElementById("DiscountXbox").value;
  var precioXbox = document.getElementById("PrecioXbox");
  var amountPS = document.getElementById("AmountPS").value;
  var discountPS = document.getElementById("DiscountPS").value;
  var precioPS = document.getElementById("PrecioPS");
  var amountNin = document.getElementById("AmountNX").value;
  var discountNin = document.getElementById("DiscountNX").value;
  var precioNin = document.getElementById("PrecioNX");
  var IVA = 0.16;
  var total = (precioXbox*(1-discountXbox/100)*amountXbox + precioPS*(1-discountPS/100)*amountPS + precioNin*(1-discountNin/100)*amountNin)*(1+IVA);
  console.log(precioXbox);

  document.getElementById("Total").innerHTML = 
    "<h2>" + "Total = $" + total + "</h2>"
  "";
}





function evaluarContraseñas() {
    var contrasenia;
    var contraseniaConfirm;
    var tamanio = false;
    var numeros = false;
    var letras = false;
    var caracteres = false;
    var aceptada = 0;
    let aceptadaVal = false;
    
    document.getElementById("con1").value;
    
    contrasenia = document.getElementById("con1").value;
    contraseniaConfirm = document.getElementById("con2").value;

    
    if(contrasenia.length==0){
        tamanio=false;
  
    }if(contrasenia.length >= 8){
        tamanio=true;
        aceptada++;

    }if(contrasenia.match(/[0-9]/)){
        numeros=true;
        aceptada++;

    }if(contrasenia.match(/[a-z]/)){
        letras=true;
        aceptada++;

    }if(contrasenia.match(/[!#$%*&.]/)){
        caracteres = true;
        aceptada++;
    }
    if(aceptada == 4){
        aceptadaVal = true;
    }
    
    if(contrasenia == contraseniaConfirm && aceptadaVal == false){
        document.getElementById("feedback").innerHTML = "La contraseña no cumple los requisitos";
        
    }else if(contrasenia == contraseniaConfirm && aceptadaVal == true){
        document.getElementById("feedback").innerHTML = "Contraseña aceptada";
        
    }else{
        document.getElementById("feedback").innerHTML = "Las contraseñas no coinciden";
    }
}

function terminar_compra(){
  document.getElementById("Endgame").innerHTML = 
    "<h2>" + "¡Compra realizada!" + "</h2>"
  "";
}