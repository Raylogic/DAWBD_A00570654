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
  var precioXbox = document.getElementById("PrecioXbox").innerHTML;
  var amountPS = document.getElementById("AmountPS").value;
  var discountPS = document.getElementById("DiscountPS").value;
  var precioPS = document.getElementById("PrecioPS").innerHTML;
  var amountNin = document.getElementById("AmountNX").value;
  var discountNin = document.getElementById("DiscountNX").value;
  var precioNin = document.getElementById("PrecioNX").innerHTML;
  var IVA = 0.16;
  var totalXbox = precioXbox*amountXbox*(1-(discountXbox/100));
  var totalPS = precioPS*amountPS*(1-(discountPS/100));
  var totalNin = precioNin*amountNin*(1-(discountNin/100));
  var total = (totalXbox + totalPS + totalNin)*(1+IVA);
  console.log(totalXbox);

  document.getElementById("Total").innerHTML = 
    "<h2>" + "Total = $" + total + "</h2>" + 
  "";
}

function validarContraseña() {
    var contrasena = document.getElementById("Contrasena").value;
    var verificacion = document.getElementById("Verify").value;
    var tamano = false;
    var numero = false;
    var letra = false;
    var especial = false;
    var valido = false;
    
    document.getElementById("Contrasena").value;
    
    if(contrasena.length >= 8){
      tamano = true;
    }
    if(contrasenia.match(/[0-9]/)){
      numero = true;
    }
    if(contrasenia.match(/[a-z]/)){
      letra = true;
    }
    if(contrasenia.match(/[!#$%*&.]/)){
      especial = true;
    }
    if(tamano == true && numero == true && letra == true && especial == true){
      valido = true;
    }
    
    if(contrasena == verificacion && aceptadaVal == false){
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