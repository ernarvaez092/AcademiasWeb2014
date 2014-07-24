<?php
include("../dll/config.php");
include("../dll/mysql.php");
extract($_POST);
       $miconexion = new DB_mysql;
	   $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname) ;
       //ACTUALIZO LA INFORMACION DE LAFICHA
	   $query = "UPDATE  `Ficha` 
	              SET Fecha = '$fecha'
	              where ID_Atractivo_Turistico='$id'";

	   $miconexion->consulta($query);
        //ACTUALIZO LA INFORMACION DE LA PERSONA LIGADA A ESA FICHA
	   $query = "UPDATE  `Persona` 
	              SET Nombres = '$encuestador'
	              where `ID_Persona` = '$idp'";

        //ACTUALIZO LA INFORMACION DEL ATRACTIVO LIGADA A ESA FICHA
	   $miconexion->consulta($query);
	   $query = "UPDATE  `Atractivo_Turistico`
	              SET Atractivo_Nombre = '$atractivo', Atractivo_log='$log', Atractivo_lat='$lat', Calle='$calle', Numero='$numero', Transversal='$transversal'
	              where `ID_Atractivo_Turistico` = '$id'";

	   $miconexion->consulta($query);
	   echo $query;
	  
	   echo '<script>alert("el registro se ah actualizado con exito el registro")</script>';
	   echo '<script>location.href="buscar.php"</script>';
	

?>