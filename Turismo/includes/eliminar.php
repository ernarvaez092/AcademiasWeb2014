<?php
	include("../dll/config.php");
    include("../dll/mysql.php");
extract($_GET);
       $miconexion = new DB_mysql;
	   $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname) ;
	   $tabla[0]= '`Tipo_Difucion`'; 
	   $tabla[1]= '`Patrimonio_Atractivo`'; 
	   $tabla[2]= '`Atractivo_Detalle`'; 
	   $tabla[3]= '`Facilidades_Turisticas`'; 
	   $tabla[4]= '`Atractivos_Secanos`'; 
	   $tabla[5]= '`Estructura_Vial_Acceso`'; 
	   $tabla[6]= '`Infraestructura_Basica`'; 
	   $tabla[7]= '`Centros_Urbanos_Cercanos`'; 
	   $tabla[8]= '`Infraestructura_Basica`'; 	

	   for($i=0; $i<9; $i++){
	   	$query = "delete from ".$tabla[$i]." WHERE ID_Atractivo_Turistico = '$id'";
	   	$miconexion->consulta($query);
	   	//echo $query."<br>";
	   	}


	   $query = "DELETE FROM `Persona_Categoria_Ficha` WHERE `ID_Ficha` = '$fi'";
	   $miconexion->consulta($query);	   
	   $query = "delete from `Ficha` WHERE ID_Atractivo_Turistico = '$id'";
	   $miconexion->consulta($query);	   
	   $query = "delete from `Atractivo_Turistico` WHERE ID_Atractivo_Turistico = '$id'";
	   $miconexion->consulta($query);
	   //echo $query;
	   //echo '<script>alert("el registro se ah borrado")</script>';
	   echo '<script>location.href="buscar.php"</script>';
?>
