<?php
include("../dll/config.php");
include("../dll/mysql.php");
extract($_POST);
       $miconexion = new DB_mysql;
	   $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname) ;
	   $query = "INSERT INTO `Atractivo_Turistico`(`ID_Atractivo_Turistico`, `Atractivo_Nombre`, `Atractivo_lat`, `Atractivo_log`, `Atractivo_Altura`, `Atractivo_Temperatura`, `Atractivo_Pluviometrica`, `Atractivo_Caracteristicas`, `Atractivo_Fortalezas`, `Atractivo_Debilidades`, `Atractivo_Ventajas`, `Atractivo_Amenazas`, `Calle`, `Numero`, `Transversal`, `Conservacion_Usos`, `Concervacion_Estado`, `Estado_Conser_Causas`, `Entorno_Estado`, `Esta_Entor_Causas`)
	             VALUES (NULL,'$atractivo','$lat',$log,'$altura','$temperatura','$pluviometrica','$comentario',NULL,NULL,NULL,NULL,'$calle,$numero','$transversal','$uso','$conservado','$causas',NULL,NULL)";
	   $miconexion->consulta($query);
	 

	   //echo $query;
	   //echo '<script>alert("el registro se ah borrado")</script>';
	   echo '<script>location.href="buscar.php"</script>';
?>
