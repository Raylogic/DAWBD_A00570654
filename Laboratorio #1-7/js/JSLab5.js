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
  var amountXbox = document.getElementById("AmountXbox");
  var discountXbox = document.getElementById("DiscountXbox");
  var precioXbox = document.getElementById("PrecioXbox");
  var amountPS = document.getElementById("AmountPS");
  var discountPS = document.getElementById("DiscountPS");
  var precioPS = document.getElementById("PrecioPS");
  var amountNin = document.getElementById("AmountNX");
  var discountNin = document.getElementById("DiscountNX");
  var precioNin = document.getElementById("PrecioNX");
  var IVA = 0.16;
  var total = (precioXbox*(1-discountXbox/100)*amountXbox + precioPS*(1-discountPS/100)*amountPS + precioNin*(1-discountNin/100)*amountNin)*(1+IVA);
  document.getElementById("Total").innerHTML = 
    "<h2>" + "Total = $" + total + "</h2>"
  "";
}

/**
function checkPassword(form) { 
  password1 = form.password1.value; 
  password2 = form.password2.value; 
  
                // If password not entered 
                if (password1 == '') 
                    alert ("Please enter Password"); 
                      
                // If confirm password not entered 
                else if (password2 == '') 
                    alert ("Please enter confirm password"); 
                      
                // If Not same return False.     
                else if (password1 != password2) { 
                    alert ("\nPassword did not match: Please try again...") 
                    return false; 
                } 
  
                // If same return True. 
                else{ 
                    alert("Password Match: Welcome to GeeksforGeeks!") 
                    return true; 
                } 
            }
**/