function xbox() {
  var precio = 5000;
  document.getElementById("Xbox").innerHTML = 
    "<ul>" +
      "<li>Memoria: 1TB</li>" +
      "<li>Incluye dos controles</li>" +
      "<li>Incluye Halo: Infinte</li>" +
      "<li>Incluye Xbox Game Pass</li>" +
      "<li>Precio = $" + precio +
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
      "<li>Precio = $" + precio +
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
      "<li>Precio = $" + precio +
    "</ul>"
  "";
}
function total(){
  var amountXbox = document.getElementById("AmountXbox").value;
  var discountXbox = document.getElementById("DiscountXbox").value;
  var amountPS = document.getElementById("AmountPS").value;
  var discountPS = document.getElementById("DiscountPS").value;
  var amountNin = document.getElementById("AmountNX").value;
  var discountNin = document.getElementById("DiscountNX").value;
  var IVA = 0.16;
  var total = (amountXbox*(1-discountXbox/100) + amountPS*(1-discountPS/100) + amountNin*(1-discountNin/100))*(1+IVA);
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