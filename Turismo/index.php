<!DOCTYPE html>
<html lang="es">
<head>
	<title> </title>
	<meta charset= "utf-8">
        <link href='http://fonts.googleapis.com/css?family=Rokkitt:700' rel='stylesheet' type='text/css'>
        <link href="styles/style.css" type="text/css" rel="stylesheet"/>
		    <link href="css/estilos.css" rel="stylesheet" type="text/css" media="all" />
		    <link href="styles/jflow.style.css" type="text/css" rel="stylesheet"/>
<script type="text/javascript" src="scripts/libreria.js"></script>
<script src="scripts/jflow.plus.min.js" type="text/javascript"></script>
<script type="text/javascript">
        $(document).ready(function(){
          $("#myController").jFlow({
            controller: ".jFlowControl",slideWrapper : "#jFlowSlider",slides: "#mySlides",selectedWrapper: "jFlowSelected",effect: "flow",
            width: "940px",height: "300px",duration: 400,pause: 5000,prev: ".jFlowPrev",next: ".jFlowNext",auto: true });});
</script>
	<h1></h1>
</head>
<body>
  <section id="definels">        
      <section id="login_top">
           <p>Admin:&nbsp;&nbsp;</p>
           <form name="login" method="post" action="includes/control.php" target="_parent">   
                 <input name="usuario" type="text" placeholder="Usuario" class="topinputstyle" />
                 <p>&nbsp;&nbsp;</p>
                 <section class="formspace"><input name="clave" type="password" placeholder="password" class="topinputstyle" /></section>
                          <p>&nbsp;&nbsp;</p>
                 <section class="formspace"><input type="submit" value="" class="loginbutton" /></section>
            </form>
      </section>      
  </section>
<nav>
	<section id = "logo">
	<a href="index.php">	<img  src="images/loro.png" alt="LOGO" /></a>
	</section>

	<section id = "menu_principal">
		<ul>
            <li><a href="index.php">INICIO</a></li>
            <li><a href="includes/atractivos.php">ATRACTIVOS</a></li>
            <li><a href="includes/mapa.php">MAPAS</a></li>
        </ul>
	</section>
</nav>
<section id = "carrete_img">
  <!--
  **********************************************
   inicia el carrucel
  **********************************************
  -->
  <section id="sliderContainer">
    <section id="mySlides">
      <section id="slide1" class="slide"> <img src="images/uno.jpg" alt="Slide 1 jFlow Plus" />
        <section class="slideContent">
          <h3>Acceso Fluvial</h3>
          <p>Una de las actividades mas realizadas por los locales</p>
        </section>
      </section>
      <section id="slide2" class="slide"> <img src="images/jflow-sample-slide2.jpg" alt="Slide 2 jFlow Plus" />
        <section class="slideContent">
          <h3>Belleza</h3>
          <p>Candidatas a Reinas de Zamora</p>
        </section>
      </section>
      <section id="slide3" class="slide"> <img src="images/jflow-sample-slide3.jpg" alt="Slide 3 jFlow Plus" />
        <section class="slideContent">
          <h3>Cascadas</h3>
          <p>El atractivo mas conocido en toda la provincia.</p>
        </section>
      </section>
      <section id="slide4" class="slide"> <img src="images/jflow-sample-slide4.jpg" alt="Slide 3 jFlow Plus" />
        <section class="slideContent">
          <h3>Hosterias</h3>
          <p>Las mejores hosterias del Sur del Pais.</p>
        </section>
      </section>
    </section>
    <section id="myController"> 
        <span class="jFlowControl"></span> 
        <span class="jFlowControl"></span> 
        <span class="jFlowControl"></span> 
        <span class="jFlowControl"></span> 
    </section>
    <section class="jFlowPrev"></section>
    <section class="jFlowNext"></section>
  </section>
  <!--FIN CARRUCEL--> 

</section>
<section id = "videos">
<article id = "video_entrada1">
	<embed width="265.5" height="150"
           src="https://www.youtube.com/v/KYkmHfwiQY4"
           type="application/x-shockwave-flash">
    <h1>CEREMONIA RITUAL PACHAMAMA RAYMI 2014 ZAMORA CHINCHIPE</h1>
</article>
<article id = "video_entrada2">
	<embed width="265.5" height="150"
           src="https://www.youtube.com/v/ffrtHckkLZA"
           type="application/x-shockwave-flash">
    <h1>Ecuador Ama la vida - De los Andes a la Amazonia</h1>
</article>
<article id = "video_entrada3">
	<embed width="265.5" height="150"
           src="https://www.youtube.com/v/ffeiffJUdlE"
           type="application/x-shockwave-flash">           
    <h1>All you need is Ecuador #AllYouNeedIsEcuador</h1>
    </article>

</section>

<section>
  
</section>
<footer>
	<h5>-REVISTA TURISTICA DE LA PROVINCIA DE ZAMORA CHINCHIPE-</h5>
</footer>
</body>
</html>