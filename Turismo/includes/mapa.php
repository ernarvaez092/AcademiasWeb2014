<?php
include("../dll/config.php");
include("../dll/mysql.php");
?>
<!<!DOCTYPE html>

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
$query= "SELECT * FROM `Atractivo_Turistico` ORDER BY `ID_Atractivo_Turistico` ASC;";
$miconexion->consulta($query);
$lista_res="";
$lista_res=$miconexion->consulta_lista();
$apikey=$miconexion->mapa();

?>
<H1> UBICACION DE TODOS LOS SITIOS  </H1>    
<script src="https://maps.googleapis.com/maps/api/js?v=AIzaSyCXWF4NAYvYarlWbvORCgrTyPXKpSMvNGE"></script>
<section id = "map-canvas"></section>
      

  <script type="text/javascript">
    var locations = [
      ['Cascada del oso', -3.680472, -78.704444, 4],
      ['Cascada Acorazonada', -3.966840, -78.845741, 5],
      ['Cascada Hombre Shuar', -3.966840, -78.845741, 5],
      ['Cascada', -3.916191, -78.802783, 4],
      ['Reserva Forestal El Zarza', -3.831670, -78.593914, 4]
    ];

    var map = new google.maps.Map(document.getElementById('map-canvas'), {
      zoom: 8,
      center: new google.maps.LatLng(-3.680472, -78.704444),
      mapTypeId: google.maps.MapTypeId.ROADMAP
    });

    var infowindow = new google.maps.InfoWindow();

    var marker, i;

    for (i = 0; i < locations.length; i++) {  
      marker = new google.maps.Marker({
        position: new google.maps.LatLng(locations[i][1], locations[i][2]),
        map: map
      });

      google.maps.event.addListener(marker, 'click', (function(marker, i) {
        return function() {
          infowindow.setContent(locations[i][0]);
          infowindow.open(map, marker);
        }
      })(marker, i));
    }
  </script> 
<footer>
	<h5>-REVISTA TURISTICA DE LA PROVINCIA DE ZAMORA CHINCHIPE-</h5>
</footer>
</body>
</html>