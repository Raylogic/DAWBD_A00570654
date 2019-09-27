<!DOCTYPE HTML>
<html>
<head>
    <title>Laboratorio #12</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <link rel="stylesheet" type="text/css" href="css/_Estilo.css" media="screen,projection">
    <link rel="stylesheet" type="text/css" href="css/_Style.css" media="screen,projection">

    <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.4.1/css/all.css" integrity="sha384-5sAR7xN1Nv6T6+dT2mhtzEpVJvfS3NScPQTrOxhwjIuvcA67KV2R5Jz6kr4abQsz" crossorigin="anonymous">
    
</head>
    
<body>
	<main>
	<!--
	<nav id="menu" class="navbar navbar-dark bg-dark navbar-expand-md py-0 fixed-top">
	    <a href="#" class="navbar-brand"><i class="fas fa-address-book"></i> DAW</a>
	    <button class="navbar-toggler" data-toggle="collapse" data-target="#navLinks" aria-label="Toggle navigation">
	        <span class="navbar-toggler-icon"></span>
	    </button>
	    <div class="collapse navbar-collapse" id="navLinks">
	        <ul class="navbar-nav">
	            <li class="nav-item"><a href="Laboratorio10.php" class="nav-link">Laboratorio #12</a></li>
	        </ul>
	    </div>
	</nav>
	-->
	
	<nav id="menu">
    	<div class="nav-wrapper">
	    	<a href="#" class="navbar-brand"><i class="fas fa-address-book"></i> DAW</a>
			<ul id="nav-mobile" class="right hide-on-med-and-down">
	  			<li class="active"><a href="">Laboratorio 12</a></li>
			</ul>
    	</div>
 	</nav>
	<br>
	<section class="container-fluid">
  		<div class="col l12">
            <div class="center-align">
                <header>Laboratorio #12</header>
            </div>
        </div>
	</section>

	<section class="container-fluid px-0">
        <div class="row align-items-center">
            <div class="col-md-12">
                <div class="row justify-content-center">
                    <div class="col-8 col-lg-10 mt-3">
                        <article>
                            <p><strong class="Bibliografia">Preguntas:</strong>
                            <p><strong>1) ¿Por qué es importante hacer un session_unset() y luego un session_destroy()? </strong><br>
                                <ul>
                                    <li>session_unset() = Elimina las variables que permitieron iniciar la sesión, por lo que sirve como medida de seguridad para evitar accesos restringidos</li>
                                    <li>session_destroy() = Elimina la sesión para evitar que un usuario no autorizado acceda al sistema</li>
                                </ul>
                            </p>
                            <p><strong>2) ¿Cuál es la diferencia entre una variable de sesión y una cookie? (2)</strong><br>
                                <ul>
                                    <li>Variable de sesión = Guarda los datos de la sesión en un directorio temporal del lado del servidor mientras esté activa</li>
                                    <li>Cookie = Guarda los datos de la sesión en un archivo de texto del lado del cliente para que se puedan usar en futuras sesiones</li>
                                </ul>
                            </p>
                            <p><strong>3) ¿Qué técnicas se utilizan en sitios como facebook para que el usuario no sobreescriba sus fotos en el sistema de archivos cuando sube una foto con el mismo nombre? (3)</strong><br>
                                <ul>
                                    <li>Guarda las fotos en una tabla de dispersión y añade su hash al nombre del archivo</li>
                                </ul>
                            </p>
                            <p><strong>4) ¿Qué es CSRF y cómo puede prevenirse? (4)</strong><br>
                                <ul>
                                    <li>Acción que fuerza al usuario a realizar acciones no deseadas en una aplicación web en la que están autenticados mediante código embebido.</li>
                                </ul>
                            </p>
                        </article>
                    </div>
                </div>
            </div>
        </div>
	</section>
	<section class="container-fluid px-0">
	    <div class="row align-items-center">
	        <div class="col-md-12">
	            <div class="row justify-content-center">
	                <div class="col-8 col-lg-10 mt-3">
	                     <footer>
	                        <p><strong class="Bibliografia">Referencias:</strong>
	                            <ol>
	                                <li>GeeksforGeeks, 2018, "session_unset() vs session_destroy() in PHP" (25/09/2019), Recuperado de: https://www.geeksforgeeks.org/session_unset-vs-session_destroy-in-php/</li>
	                                <li>Tutorialspoint, 2019, "What is the difference between session and cookies?" (25/09/2019), Recuperado de: https://www.tutorialspoint.com/What-is-the-difference-between-session-and-cookies</li>
	                                <li>Facebook, 2019, "File Uploading with the Facebook SDK for PHP" (25/09/2019), Recuperado de: https://developers.facebook.com/docs/php/FacebookFile/5.0.0</li>
	                                <li>Cross-Site Request Forgery (CSRF), 2018, "Cross-Site Request Forgery (CSRF)" (25/09/2019), Recuperado de: https://www.owasp.org/index.php/Cross-Site_Request_Forgery_(CSRF)</li>
	                            </ol>
	                        </p>  
	                    </footer>                    
	                </div>
	            </div>  
	        </div>   
	    </div>   
	</section>

	<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.3/umd/popper.min.js" integrity="sha384-ZMP7rVo3mIykV+2+9J3UJ46jBk0WLaUAdn689aCwoqbBJiSnjAK/l8WvCWPIPm49" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/js/bootstrap.min.js" integrity="sha384-ChfqqxuZUCnJSK3+MXmPNIyE6ZbWh2IMqE241rYiqJxyMiZ6OW/JmZQ5stwEULTy" crossorigin="anonymous"></script>

    <script type="text/javascript" src="_Navbar.js"></script>
    <script type="text/javascript" src="js/materialize.js"></script>
	</main>
</body>
</html>
            