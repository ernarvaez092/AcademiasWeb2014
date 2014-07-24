<?php
include("../dll/config.php");
include("../dll/mysql.php");
?>
<!DOCTYPE html>

<html lang="es">
<head>
    <meta name="viewport"content="initial-scale=1.0, user-scalable=no" />
    <link href="../css/detellatractivo.css" rel="stylesheet" type="text/css" media="all" />
	<title> <?php  echo $site_name;?> </title>
</head>
<body>
<NAV >
	<section id = "logo">
	<a href="index.php">	<img  src="../images/loro.png" alt="LOGO" /></a>
	</section>

	<section id = "menu_principal">
		<ul>
            <li><a href="../index.php">INICIO</a></li>
            <li><a href="atractivos.php">ATRACTIVOS</a></li>
            <li><a href="mapa.php">MAPAS</a></li>
        </ul>
	</section>
</NAV>
<section id = "contenedor">
<?php
extract($_GET);
$miconexion = new DB_mysql;
$miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname); 
$query= "SELECT aa.`Atractivo_Nombre`,aa.`Atractivo_lat`,aa.`Atractivo_log`,aa.`Atractivo_Altura`,aa.`Atractivo_Temperatura`,
                  aa.`Atractivo_Caracteristicas`,aa.`Atractivo_Fortalezas`,aa.`Atractivo_Debilidades`,aa.`Atractivo_Ventajas`,
                  aa.`Atractivo_Amenazas`,ca.`Canton_Nombre`,pa.`Parroquia_Nombre`,aa.`Entorno_Estado`,po.`Provincia_Nombre`,cc.`A_Categoria`,
                  dd.`Categoria_Tipo`,ee.`A_Subtipo`
                   FROM `Atractivo_Turistico` aa,`Atractivo_Categoria` cc, `Atractivo_Tipo`dd, `Atractivo_Subtipo`ee, `Canton` ca,`Parroquia` pa,
                        `Provincia` po,`Atractivo_Detalle` ad, `Atractivo_Ubicacion` au 
                  
                  WHERE aa.`ID_Atractivo_Turistico`=$id and  ad.`ID_Atractivo_Turistico`=$id and cc.`ID_Atractivo_Categoria`= ad.`ID_Atractivo_Categoria`
                        and ad.`ID_Atrat_tipo` = dd.`ID_Atrat_tipo`and ee.`ID_Atractivo_Subtipo`= ad.`ID_Atractivo_Subtipo` and au.`ID_Atractivo_Turistico`=$id and
                        au.`ID_canton` = ca.`ID_canton` and au.`ID_Parroquia` = pa.`ID_Parroquia` and au.`ID_Provincia` = po.`ID_Provincia`;";
$miconexion->consulta($query);
$lista_res="";
$lista_res=$miconexion->consulta_lista();
$apikey=$miconexion->mapa();

?>
	<section id = "datos_generales">
             <H3>DATOS GENERALES</H3>  
             <h1>Atractivo Turistico: </h1> <p><?php echo $lista_res[0]; ?></p>
             <h1>Categoria: </h1> <p> <?php echo $lista_res[14]; ?></p>
             <h1>Tipo: </h1>      <p> <?php echo $lista_res[15]; ?></p>
             <h1>Subtipo: </h1>	  <p> <?php echo $lista_res[16]; ?></p>             
    </section>
    <section id = "ubicacion">    
             <H3>DATOS DE UBICACION</H3>     
             <h1>Provincia: </h1> <p> <?php echo $lista_res[13]; ?></p>
             <h1>Canton: </h1>    <p> <?php echo $lista_res[10]; ?></p>
             <h1>Parroquia: </h1> <p> <?php echo $lista_res[11]; ?></p>	
             <h1>Altura: </h1>	  <p> <?php echo $lista_res[3]; ?></p>
            	
    </section>
    <section id="temperatura">
             <h1>Temperatura: </h1> <p1>  <?php echo $lista_res[4]; ?></p1>	

	</section>
	<section id = "caracteristicas">
             <H3>INFORMACION ADICIONAL</H3>     
	         <h1>Caracteristicas: </h1> <p>  <?php echo $lista_res[5]; ?></p>			
             <h1>Entorno: </h1> <p>  <?php echo $lista_res[12]; ?></p>			
	</section>

	<section id = "foda">
        <H3>MATRIZ FODA</H3>     

		<article id = "fortalezas">
			  <h1>FORTALEZAS</h1> <p2>  <?php echo $lista_res[6]; ?></p2>
		</article>
		<article id = "oportunidades">
			  <h1>OPORTUNIDADES</h1> <p2>  <?php echo $lista_res[8]; ?></p2>
		</article>
		<article id = "devilidades">
			  <h1>DEVILIDADES</h1> <p2>  <?php echo $lista_res[7]; ?></p2>
		</article>
		<article id = "amenazas">
			  <h1>AMENAZAS</h1> <p2>  <?php echo $lista_res[9]; ?></p2>
		</article>
	</section>
</section>

<H1> UBICACION EN EL MAPA  </H1>   
<script src="https://maps.googleapis.com/maps/api/js?v=AIzaSyCXWF4NAYvYarlWbvORCgrTyPXKpSMvNGE"></script>
    <script>

    function initialize() {

        var myLatlng = new google.maps.LatLng(<?php echo $lista_res[1].', '.$lista_res[2] ; ?>);
        var mapOptions = {
            zoom: 10,
            center: myLatlng
        }
        var map = new google.maps.Map(document.getElementById('map-canvas'), mapOptions);
        var marker = new google.maps.Marker({
            position: myLatlng,
            map: map,
            title: 'Atractivo Localizado'
      });
    }
    google.maps.event.addDomListener(window, 'load', initialize);

    </script> 
    
<section id = "map-canvas">
</section>

<footer>
	<h5>-REVISTA TURISTICA DE LA PROVINCIA DE ZAMORA CHINCHIPE-</h5>
</footer>
</body>
</html>