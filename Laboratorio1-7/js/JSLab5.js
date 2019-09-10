function xbox() {
  document.getElementById("Xbox").innerHTML = 
    "<ul>" +
      "<li>Memoria: 1TB</li>" +
      "<li>Incluye dos controles</li>" +
      "<li>Incluye Halo: Infinte</li>" +
      "<li>Incluye Xbox Game Pass</li>" +
    "</ul>"
  "";
}
function playstation() {
  document.getElementById("Playstation").innerHTML = 
    "<ul>" +
      "<li>Memoria: 500GB</li>" +
      "<li>Incluye un control</li>" +
      "<li>Incluye Borderlands 3</li>" +
      "<li>Incluye PlayStation Now</li>" +
    "</ul>"
  "";
}
function nintendo() {
  document.getElementById("Nintendo").innerHTML = 
    "<ul>" +
      "<li>Memoria: 100GB</li>" +
      "<li>Incluye dos joycons</li>" +
      "<li>Incluye Mario Odyssey</li>" +
      "<li>Incluye Nintendo Online</li>" +
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
  var total = Math.ceil((totalXbox + totalPS + totalNin)*(1+IVA));
  var impuesto = Math.ceil(totalXbox + totalPS + totalNin)*IVA;

  document.getElementById("Total").innerHTML = 
    "Total = $" + total + 
  "";
  document.getElementById("IVA").innerHTML = 
    "IVA = $" + impuesto + 
  "";
}

//------------------------------------------------------------------

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
    if(contrasena.match(/[0-9]/)){
      numero = true;
    }
    if(contrasena.match(/[a-z]/)){
      letra = true;
    }
    if(contrasena.match(/[!#$%*&.-]/)){
      especial = true;
    }
    if(tamano == true && numero == true && letra == true && especial == true){
      valido = true;
    }
    
    if(contrasena == verificacion && valido == false) {
        document.getElementById("AyudaPassword").innerHTML = "La contraseña no cumple los requisitos";
        document.getElementById("AyudaVerify").innerHTML = "La contraseña no cumple los requisitos";
        return false;
        
    } else if(contrasena == verificacion && valido == true) {
        document.getElementById("AyudaPassword").innerHTML = "Contraseña aceptada";
        document.getElementById("AyudaVerify").innerHTML = "Contraseña aceptada";
        return true;
        
    } else {
        document.getElementById("AyudaPassword").innerHTML = "Las contraseñas no coinciden";
        document.getElementById("AyudaVerify").innerHTML = "Las contraseñas no coinciden";
        return false;
    }
}

function terminar_compra(){
  var nombre = document.getElementById("Nombre").value;
  var apellido = document.getElementById("Apellido").value;
  var matricula = document.getElementById("Matrícula").value;
  var mail = document.getElementById("Mail").value;
  var terms = document.getElementById("Mail").checked;
  var pwd = validarContraseña();

  if(nombre != "" && apellido != "" && matricula != "" && mail != "" && pwd == true){
      document.getElementById("Endgame").innerHTML = 
      "¡Compra realizada!" + 
      "";
  }
}
