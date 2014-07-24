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
    <script src="http://www.google.com/jsapi"></script>
    <script type="text/javascript">google.load("jquery", "1.2", {uncompressed:true});</script>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />          
    <script src="jquery-1.10.2.min.js"></script>
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
            <li><a href="frontal.php">INICIO</a></li>
            <li><a href="reportes.php">REPORTES</a></li>
            <li><a href="nueva_ficha.php">SUBIR INFORMACION</a></li>
            <li><a href="buscar.php">FICHAS</a></li>
        </ul>
	</section>
</NAV>
<section id = "titulo">
  <h2>GENERAR REPORTES</h2>	
</section>
<section >
	<?php
	 $miconexion = new DB_mysql;
	 $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname); 	  
	?>
</section>
    <section id = "filtros">   
<br>

    <fieldset>
    <legend align= "center">Filtros de Reporte</legend>   
    <form>
        <LABEL for="nombre">Nombre: </LABEL>
        <INPUT type="text" id="nombre">                    
        <input class="button" type="submit" value="BUSCAR">
        <span id="suggestions"></span> 
    </form>       
          <br>    
<form action="c_informe.php" method="POST">
<!-- FILTRO DE LAS UBICACIONES DE CADA SITIO !-->
        <fieldset>
            <legend>Ubicacion</legend>
            <label>Povincia:</label>            
            <select name="provincia" id="provincia" cantonatri= ''>
                    <option value="">- Seleccione una Provincia -</option>
                     <?php                     
                     $query= "SELECT * FROM `Provincia`";               
                     $miconexion->consulta($query); 
                     $s=1;
                     $miconexion->opcion_uno($s);
                    ?>
            </select>  
            &nbsp 
            <label>Canton:</label>
            <select name="canton" id="canton" parroatri= ''>
                <option value='' selected='selected'>Canton</option>
                <?php                     
                     $query= "SELECT `Canton_Nombre`,`Canton_Nombre`FROM `Canton`";               
                     $miconexion->consulta($query); 
                     $s=1;
                     $miconexion->opcion_uno($s);
                    ?>
            </select>
            <span id='Buscando'></span>                     
            &nbsp             
            <label>Parroquia:</label>
            <select name="parroquia" id="parroquia">
                <option value='' selected='selected'>Parroquia</option>
                <?php                     
                     $query= "SELECT `Parroquia_Nombre`,`Parroquia_Nombre` FROM `Parroquia`";               
                     $miconexion->consulta($query); 
                     $s=1;
                     $miconexion->opcion_uno($s);
                    ?>
            </select>
            <span id='paroqui'></span>
            &nbsp              
            
        </fieldset>
        <br>
        <fieldset>

<!-- FILTRO DE LAS CARACTERISTICAS DE CADA SITIO !-->          
            <legend align= "right">Caracteristicas</legend>
            <label>Categoria:</label>
            <select name="categoria" id="categoria">
                    <option value="">- Seleccione-</option>
                    <?php                     
                     $query= "SELECT * FROM `Atractivo_Categoria` ";               
                     $miconexion->consulta($query); 
                     $s=1;
                     $miconexion->opcion_uno($s);
                    ?>
            </select>  
            &nbsp                
            <label>Tipo:</label>
            <select name="tipo" id="tipo" tipoatri= ''>
                <option value="">- Selecione -</option>    
                    <?php                     
                     $query= "SELECT `Categoria_Tipo`,`Categoria_Tipo`FROM `Atractivo_Tipo`";               
                     $miconexion->consulta($query); 
                     $s=1;
                     $miconexion->opcion_uno($s);
                    ?>             
            </select>
            <span id='stipo'></span>            
            &nbsp
            <label>Subtipo:</label>
            <select name="subtipo" id="subtipo">
                <option value="">- seleccione-</option>
                <?php
                    $query1= "SELECT * FROM `Atractivo_Subtipo`";
                    $s=2;
                    $miconexion->consulta($query1); 
                    $miconexion->opcion_uno($s);
                    ?>
            </select>        
            <section id = "acceso">
            <label>Acceso:</label>   
            <br>                     
            <input type="checkbox" name="terrestre" value="" > Terrestre<br>
            <input type="checkbox" name="aereo" value=""> Aereo<br>
            <input type="checkbox" name="acuatico" value=""> Acuatico<br>
        </fieldset>
        <br>
             <input  class="button" type="submit" value="GENERAR REPORTE"> 
             <input class="button" type="reset" value="BORRAR LA INFORMACION">            
            </section>

    </fieldset>
<!-- AJAX PARA LA CARGA DE SELECT!-->


<!-- CARAGAR POBLADO DINAMICAMENTE!-->
    
</form>
         
                           
    </section>

<script>
$("#estado").on("change", buscarMunicipios);
</script>
</body>
</html>