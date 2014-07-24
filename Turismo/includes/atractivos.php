<?php
include("../dll/config.php");
include("../dll/mysql.php");
?>
<!<!DOCTYPE html>

<html lang="es">
<head>
    <link href="../css/estilos_atractivos.css" rel="stylesheet" type="text/css" media="all" />
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
<section id = "titulo">
  <h2>LISTADO GENERAL DE ATRACTIVOS TURISTICOS</h2>
	
</section>
<section id  	="divScroll">
	<?php
	 $miconexion = new DB_mysql;
	 $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname);
     $query= "select ID_Atractivo_Turistico,Atractivo_Nombre  from Atractivo_Turistico order by Atractivo_Nombre";
	 $miconexion->consulta($query);
	 $miconexion->ListarConsulta();	  
	?>
</section>


</body>
</html>