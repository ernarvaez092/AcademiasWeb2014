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
    <link href="../css/modifica.css" rel="stylesheet" type="text/css" media="all" />
	<title> <?php  echo $site_name;?> </title>
</head>
<body>
<section id = "sesion">
	        <h1>Bienvenido: <? echo $_SESSION["usuarioactual"]; ?><a href="salir.php">SALIR</a></h1>        
	
</section>
<NAV >
	<section id = "logo">
	<a href="index.php">	<img  src="../images/loro.png" alt="LOGO" /></a>
	</section>

	<section id = "menu_principal">
		<ul>
            <li><a href="frontal.php">INICIO</a></li>
            <li><a href="reportes.php">REPORTES</a></li>
            <li><a href="nueva_ficha.php">SUBIR INFORMACION</a></li>
            <li><a href="buscar.php">FICHAS</a></li>

        </ul>
	</section>

</NAV>
<section id = "titulo">
<h1> PANEL DE ADMINISTRACION</h1>
<?php
	 $miconexion = new DB_mysql;
	 $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname);
     $query= "SELECT bb.ID_Ficha,aa.Atractivo_Nombre,aa.ID_Atractivo_Turistico FROM `Atractivo_Turistico` aa, `Ficha` bb WHERE bb.ID_Atractivo_Turistico = aa.ID_Atractivo_Turistico order by bb.ID_Ficha";
	 $miconexion->consulta($query);
	 $miconexion->ListarConsultarespo();	  
	?>
</body>
</html>