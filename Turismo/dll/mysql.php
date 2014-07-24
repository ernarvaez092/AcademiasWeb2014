<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<?php
/**
* 
*/
 
class DB_mysql
{
	/* Variables De Conexion*/

	var $base_dedatos;
	var $servidor;
	var $usuario;
	var $clave;

	/* Variable de Control*/
	var $conexion_id=0;
	var $consulta_id=0;
	var $error=0;
	var $error_consulta=0;


	function conectar( $dbhost, $dbuser, $dbpass, $dbname){
		if ($dbname != "") $this -> base_dedatos=$dbname;
		if ($dbhost != "") $this -> servidor=$dbhost;
		if ($dbuser != "") $this -> usuario=$dbuser;
		//if ($dbpass != "") $this -> clave=$dbpass;

		$this ->conexion_id = mysql_connect($this->servidor, $this->usuario, $this->clave);
		if (!$this->conexion_id) {

			$this->error = "Conexion con el Servidor a Fallado";
			return 0;

		}
		if (!mysql_select_db($this->base_dedatos, $this->conexion_id)) {
			$this->error="No se Pudo Conectar con La Base de Datos".$this->base_dedatos;
			return 0;
		}

		return $this->conexion_id;
	}
    /*Funcion de Ejecucion de Sentencias SQL*/
	function consulta($SQL){
		if ($SQL=="") {
			$this->error_consulta="No Existe Sentencias SQL";
			return 0;
		}
		/*Ejecutamos consulta*/
		$this->consulta_id=mysql_query($SQL, $this ->conexion_id);
		return $this->consulta_id;
	}
/*retorna el numero de campos*/
	function numero_de_campos(){
		return mysql_num_fields($this->consulta_id);

	}
/* retorna el nobre de cada campo*/
	function campos_nombre($numcampos){
     return mysql_field_name($this->consulta_id, $numcampos);
	}
/*muestra los datos de una tabla*/

function ListarConsulta(){	
	
	while ($row = mysql_fetch_array($this->consulta_id)) {

		for ($i=0; $i <$this->numero_de_campos()-1; $i++) { 
			echo "<a href='detellatractivo.php?id=$row[0]''><li>$row[1]</li></a>";	
			echo "<br>";
			
		}	

	}	

}

function ListarConsultarespo(){	
	echo "<table border='1'>";
	echo "<tr>";
	for ($i=0; $i<$this->numero_de_campos(); $i++) { 
		echo "<td>".$this->campos_nombre($i)."</td>";
		
	}
	echo "<td>BORRAR</td>";
	echo "<td>EDITAR</td>";
	
	echo "</tr>";
	while ($row = mysql_fetch_array($this->consulta_id)) {
		echo "<tr>";
		for ($i=0; $i <$this->numero_de_campos(); $i++) { 
			echo '<td>'.$row[$i].'</td>';	
			
		}
	
	echo '<td><a href = "eliminar.php?id='.$row[2].'?&fi='.$row[0].'"><img border=0 src="../images/icono-eliminar.png"></a></td>';
	echo '<td><a href = "editar.php?id='.$row[2].'"><img border=0 src="../images/icon_edit_topic.gif"></a></td>';	
   	echo "</tr>";
	}
	
	echo "<table>";
}
function Consulta_opcion(){	
    return mysql_fetch_array($this->consulta_id);

}

function Consulta_id(){	
	
	while ($row = mysql_fetch_array($this->consulta_id)) {
		echo "<option value='".$row[0]."' $TRUE>".htmlentities($row[2])."</option>";		
          
	}	

}
function opcion_uno($s){	
	
	while ($opc = mysql_fetch_array($this->consulta_id)) {	
	       echo "<option value='".$opc[0]."'>".$opc[$s]."</option>";	
    			
          
	}	

}


function nun_registros(){	
	return mysql_num_rows($this->consulta_id);

}

function consulta_registros(){	
    return mysql_fetch_array($this->consulta_id);

}
/* RETRNO UNA LISTA DE VALORES	*/
function consulta_lista(){
	while ( $row = mysql_fetch_array($this->consulta_id)) {
		for ($i=0; $i < $this->numero_de_campos() ; $i++) { 
			$row[$i];
		}
		return $row;
	}
}



function mapa(){
	$apikey = "AIzaSyCXWF4NAYvYarlWbvORCgrTyPXKpSMvNGE";    
    return $apikey;
}

}





?>