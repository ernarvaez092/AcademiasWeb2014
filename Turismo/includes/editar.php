
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
<!DOCTYPE html>

<html lang="es">
<head>

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
  <H1>EDICION DE FICHA</H1>	
</section>
<section >
	<?php
	 extract($_GET);
	 $miconexion = new DB_mysql;
	 $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname);    
	 $query = "SELECT aa.`Atractivo_Nombre`,aa.`Atractivo_lat`,aa.`Atractivo_log`,aa.`Atractivo_Altura`,aa.`Atractivo_Temperatura`, aa.`Atractivo_Caracteristicas`,
       aa.`Atractivo_Fortalezas`,aa.`Atractivo_Debilidades`,aa.`Atractivo_Ventajas`, aa.`Atractivo_Amenazas`,ca.`Canton_Nombre`,pa.`Parroquia_Nombre`,
       aa.`Entorno_Estado`,po.`Provincia_Nombre`,cc.`A_Categoria`,dd.`Categoria_Tipo`,ee.`A_Subtipo`,fi.`ID_Ficha`,fi.`Fecha`,pe.`Nombres`,aa.`Calle`,aa.`Transversal`,aa.`Numero`,
       aa.`Atractivo_Pluviometrica`,aa.`Conservacion_Usos`,aa.`Concervacion_Estado`,aa.`Estado_Conser_Causas`,aa.`Atractivo_Pluviometrica`,fi.`Ficha_Numero`,
       pe.`ID_Persona` 

FROM `Atractivo_Turistico` aa,`Atractivo_Categoria` cc, `Atractivo_Tipo`dd, `Atractivo_Subtipo`ee, `Canton` ca,`Parroquia` pa,
     `Provincia` po,`Atractivo_Detalle` ad, `Atractivo_Ubicacion` au ,`Ficha` fi, `Persona` pe, `Persona_Categoria_Ficha` pec

WHERE aa.`ID_Atractivo_Turistico`=$id and  ad.`ID_Atractivo_Turistico`=$id and cc.`ID_Atractivo_Categoria`= ad.`ID_Atractivo_Categoria`
                        and ad.`ID_Atrat_tipo` = dd.`ID_Atrat_tipo`and ee.`ID_Atractivo_Subtipo`= ad.`ID_Atractivo_Subtipo` and au.`ID_Atractivo_Turistico`=$id 
                        and au.`ID_canton` = ca.`ID_canton` and au.`ID_Parroquia` = pa.`ID_Parroquia` and au.`ID_Provincia` = po.`ID_Provincia`
                        and fi.`ID_Atractivo_Turistico`=$id and fi.`ID_Ficha` = pec.`ID_Ficha` and pec.`ID_Persona`=pe.`ID_Persona`";
	 $miconexion->consulta($query);
	 $lista_res=$miconexion->consulta_lista(); 	
	?>
</section> 
<section id = "formulario">
	<form action="actualiza.php" method="POST" accept-charset="UTF-8">

<section id ="datos_generales" >
	<h5>  1. DATOS GENERALES:  </h5>	
	<label>FICHA: </label>
	<INPUT type="text" name="id" value="<?php echo $id; ?>"><BR>
	<label >FECHA: </label>
	 <input type="date" name="fecha" value="<?php echo $lista_res[18]; ?>" ><BR>
	<label>ENCUESTADOR: </label>
	<INPUT type="text" name="encuestador" value="<?php echo $lista_res[19]; ?>"><BR>
	<label>SUPERVISOR EVALUADOR: </label>
	<INPUT type="text" name="evaluador"><BR>
	<label>NOMBRE DEL ATRACTIVO: </label>
	<INPUT type="text" name="atractivo" value="<?php echo $lista_res[0]; ?>"><BR>
    <label>CATEGORÍA: </label>
	<INPUT type="text" name="categoria"value="<?php echo $lista_res[14]; ?>"><BR>
	<label>TIPO: </label>
	<INPUT type="text" name="tipo" value="<?php echo $lista_res[15]; ?>"><BR>	
	<label>SUBTIPO: </label>
	<INPUT type="text" name="subtipo" value="<?php echo $lista_res[16]; ?>"><BR>
</section>
<section id ="ubicacion">
	<h5>  2. UBICACION: </h5>	
	<label>LONGITUD: </label>
	<INPUT type="text" name="log" value="<?php echo $lista_res[1]; ?>"><BR>
	<label>LATITUD: </label>
	<INPUT type="text" name="lat" value="<?php echo $lista_res[2]; ?>"><BR>
	<label>PROVINCIA: </label>
	<INPUT type="text" name="provincia" value="<?php echo $lista_res[13]; ?>"><BR>
    <label>CIUDAD Y/O CANTON: </label>
	<INPUT type="text" name="canton" value="<?php echo $lista_res[10]; ?>"><BR>
	<label>PARROQUIA: </label>
	<INPUT type="text" name="parroquia" value="<?php echo $lista_res[11]; ?>"><BR>	
	<label>CALLE: </label>
	<INPUT type="text" name="calle" value="<?php echo $lista_res[20]; ?>"><BR>
	<label>NUMERO: </label>
	<INPUT type="text" name="numero" value="<?php echo $lista_res[22]; ?>"><BR>
	<label>TRANSVERSAL:</label>
	<INPUT type="text" name="transversal" value="<?php echo $lista_res[21]; ?>"><BR>
</section>
<section id ="info_extra">
	<h5> 3. CENTROS URBANOS MÁS CERCANOS AL ATRACTIVO:</h5>
	<label>NOMBRE DEL POBLADO: </label>
	<INPUT type="text" name="log" value="<?php echo $lista_res[28]; ?>"><BR>	
	<h5>4. CARACTERISTICAS FISICAS DEL ATRACTIVO</h5> <BR>
	<label>ALTURA: </label>
	<INPUT type="text" name="altura" value="<?php echo $lista_res[3]; ?>"><BR>
    <label>Temperatura: </label>
	<INPUT type="text" name="temperatura" value="<?php echo $lista_res[4]; ?>"><BR>	
	<label>PLUVIOMETRICA: </label>
	<INPUT type="text" name="publimetrica" value="<?php echo $lista_res[27]; ?>"><BR>
	<label>COMENTARIO: </label>
	<TEXTAREA name ="comentario"> <?php echo $lista_res[5]; ?></TEXTAREA>
</section>
<section id ="info_extra1">
	<h5> 5. USOS DE CONSERVACION DEL ATRACTIVO</h5>	
	<label>USO: </label>
	<TEXTAREA name ="uso"> <?php echo $lista_res[24]; ?></TEXTAREA>	
	<h5>6. ESTADO DE CONSERVACION DEL ATRACTIVO:</h5> <BR>
	<?php 
	echo "<label>Conservado: </label>";	
	if ($lista_res[25]=='Conservado' or $lista_res[25]=='CONSERVADO' or $lista_res[25]=='conservado' ) {
	echo '<input type="checkbox" name="conservado" value="conservado" checked><br>';
		
	}else{
	echo '<input type="checkbox" name="conservado" value="conservado"><br>';		
	}
	echo "<label>Deteriodado: </label>";	
	if ($lista_res[25]=='Deteriorado' or $lista_res[25]=='DETERIORADO' or $lista_res[25]=='deteriorado' ) {
		echo '<input type="checkbox" name="deteriorado" value="deteriodado" checked><br>';
		
	}else{
		echo '<input type="checkbox" name="deteriorado" value="deteriodado"><br>';
		
	}
	echo "<label>Alterado: </label>";
	if ($lista_res[25]=='Alterado' or $lista_res[25]=='ALTERADO' or $lista_res[25]=='alterado' ) {
	echo '<input type="checkbox" name="alterado" value="alterado" checked><br>';
		
	}else{
	echo '<input type="checkbox" name="alterado" value="alterado" ><br>';		
	}
	echo "<label>No Alterado: </label>";
	if ($lista_res[25]=='No Alterado' or $lista_res[25]=='NO ALTERADO' or $lista_res[25]=='no alterado') {
	echo '<input type="checkbox" name="noalterado" value="noalterado" checked><br>';
		
	}else{
	echo '<input type="checkbox" name="noalterado" value="noalterado"><br>';
	
	}
	echo "<label>En Proceso de Deterioro: </label>";

	if ($lista_res[25]=='En Proceso De Deterioro' or $lista_res[25]=='EN PROCESO DE DETERIORO' or $lista_res[25]=='en proceso de deterioro' ) {
	echo '<input type="checkbox" name="proceso" value="pro_deterioro" checked><br><br>';
	
		
	}else{
	echo '<input type="checkbox" name="proceso" value="pro_deterioro"><br><br>';	
	}
	 ?>	
	<label>CAUSAS: </label>
	<TEXTAREA name ="causas"><?php echo $lista_res[26]; ?> </TEXTAREA>
	<INPUT type="text" name="idp" value="<?php echo $lista_res[29]; ?>" id="idp"><BR>	
</section>    
   
</section>

<section id = "botones">
	<INPUT type="submit" value="Enviar">
	<INPUT type="reset">
</section>

</form>

</body>
</html>
