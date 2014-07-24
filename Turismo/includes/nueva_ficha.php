<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />

<?php
    error_reporting (5); 
    include("../dll/config.php");
    include("../dll/mysql.php");
    session_start();
    if(!isset($_SESSION['usuarioactual']))
    {
         header('location:../index.php');
    }
    if($_SESSION['tipo']!="1")
    {
         header('location:../index.php');
    }
?>
<!<!DOCTYPE html>

<html lang="es">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <link href="../css/ficha.css" rel="stylesheet" type="text/css" media="all" />
	<title> <?php  echo $site_name;?> </title>
</head>
<body>
<NAV >
	<section id = "logo">
	<a href="index.php">	<img  src="../images/loro.png" alt="LOGO" /></a>
	</section>

	<section id = "menu_principal">
		<ul>
            <li><a href="frontal.php">INICIO</a></li>
            <li><a href="reportes.php">REPORTES</a></li>
            <li><a href="#">SUBIR INFORMACION</a></li>
            <li><a href="buscar.php">FICHAS</a></li>
        </ul>
	</section>
</NAV>
<section id = "titulo">
  <H1>REGISTRO DE FICHAS</H1>	
</section>
<section >
	<?php
	 $miconexion = new DB_mysql;
	 $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname);     
	 $miconexion->consulta($query);
	 $lista_res=$miconexion->consulta_lista();     
	?>
</section> 
<section id = "formulario">
	<form action="insertar.php" method="POST" accept-charset="UTF-8">
<section id ="datos_generales" >
	<h5>  1. DATOS GENERALES:  </h5>
	<label>ID FICHA: </label>
	<INPUT type="text" name="idficha"><BR>
	<label>FICHA: </label>
	<INPUT type="text" name="ficha"><BR>
	<label>FECHA: </label>
	 <input type="date" name="fecha"><BR>
	<label>ENCUESTADOR: </label>
	<INPUT type="text" name="encuestador"><BR>
	<label>SUPERVISOR EVALUADOR: </label>
	<INPUT type="text" name="evaluador"><BR>
	<label>NOMBRE DEL ATRACTIVO: </label>
	<INPUT type="text" name="atractivo" value=""><BR>
    <label>CATEGORÍA: </label>
	<INPUT type="text" name="categoria"><BR>
	<label>TIPO: </label>
	<INPUT type="text" name="tipo"><BR>	
	<label>SUBTIPO: </label>
	<INPUT type="text" name="subtipo"><BR>
</section>
<section id ="ubicacion">
	<h5>  2. UBICACION: </h5>
	<label>LONGITUD: </label>
	<INPUT type="text" name="log"><BR>
	<label>LATITUD: </label>
	<INPUT type="text" name="lat"><BR>
	<label>PROVINCIA: </label>
	<INPUT type="text" name="provincia"><BR>
    <label>CIUDAD Y/O CANTON: </label>
	<INPUT type="text" name="canton"><BR>
	<label>PARROQUIA: </label>
	<INPUT type="text" name="parroquia"><BR>	
	<label>CALLE: </label>
	<INPUT type="text" name="calle"><BR>
	<label>NUMERO: </label>
	<INPUT type="text" name="numero"><BR>
	<label>TRANSVERSAL:</label>
	<INPUT type="text" name="transversal"><BR>
</section>
<section id ="info_extra">
	<h5> 3. CENTROS URBANOS MÁS CERCANOS AL ATRACTIVO:</h5>
	<label>NOMBRE DEL POBLADO: </label>
	<INPUT type="text" name="log"><BR>
	<label>DISTANCIA (Km): </label>
	<INPUT type="text" name="lat"><BR>
	<h5>4. CARACTERISTICAS FISICAS DEL ATRACTIVO</h5> <BR>
	<label>ALTURA: </label>
	<INPUT type="text" name="altura"><BR>
    <label>Temperatura: </label>
	<INPUT type="text" name="temperatura"><BR>
	<label>PRECIPITACION: </label>
	<INPUT type="text" name="parroquia"><BR>	
	<label>PLUVIOMETRICA: </label>
	<INPUT type="text" name="pluviometrica"><BR>
	<label>NUMERO: </label>
	<INPUT type="text" name="numero"><BR>
	<label>COMENTARIO: </label>
	<TEXTAREA name ="comentario"> </TEXTAREA>
</section>
<section id ="info_extra1">
	<h5> 5. USOS DE CONSERVACION DEL ATRACTIVO</h5>	
	<label>USO: </label>
	<TEXTAREA name ="uso"> </TEXTAREA>	
	<h5>6. ESTADO DE CONSERVACION DEL ATRACTIVO:</h5> <BR>
	<label>Conservado: </label>
	<input type="checkbox" name="conservado" value="conservado"><br>
	<label>Deteriodado: </label>
	<input type="checkbox" name="conservado" value="deteriodado"><br>
	<label>Alterado: </label>
	<input type="checkbox" name="conservado" value="alterado"><br>
	<label>No Alterado: </label>
	<input type="checkbox" name="conservado" value="noalterado"><br>
	<label>En Proceso de Deterioro: </label>
	<input type="checkbox" name="conservado" value="pro_deterioro"><br><br>
	<label>CAUSAS: </label>
	<TEXTAREA name ="causas"> </TEXTAREA>


	
</section>    
   
</section>

<section id = "botones">
	<INPUT type="submit" value="Enviar">
	<INPUT type="reset">
</section>

</form>

</body>
</html>
