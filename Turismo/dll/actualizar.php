<?php
include("../dll/config.php");
include("../dll/mysql.php");
?>
<!<!DOCTYPE html>

<html lang="es">
<head>
	<title> <?php  echo $site_name;?> </title>
	<h1><?php  echo $site_name;?> </h1>
</head>
<body>
<section>
	<?php
	   $miconexion = new DB_mysql;
	   $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname)
	?>
</section>

<section>
    
	 
</section>
<section>
	<?
     extract($_GET);
       $miconexion = new DB_mysql;
	   $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname) ;   
	   $query = "selec * from ESTUDIANTE WHERE CEDULA_ESTUDIANTE = '$id'";
	   $miconexion->consulta($query);
	   $miconexion->ListarConsulta_editar();
	  
	?>
</section>


</body>
</html>