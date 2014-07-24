<?php
	error_reporting (5); 
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
<?php
$seleciona = 'select *';
$condicion = '';
$desde='`Atractivo_Turistico` aa';
extract($_POST);
if ($provincia) {		
	$condicion = "aa.ID_Provincia ='".$provincia."' ";	
}

if ($canton) {
	if ($condicion) {
		$condicion=$condicion." and aa.Canton ='".$canton."' ";
	}else{
		$condicion=$condicion." aa.Canton ='".$canton."' ";
	}
}
if ($parroquia) {
	if ($condicion) {
		$condicion=$condicion." and aa.parroquia ='".$parroquia."' ";		
	}else{
		$condicion=$condicion." aa.parroquia ='".$parroquia."' ";
	}	
}

if ($categoria) {
	if ($condicion) {
		$condicion=$condicion." and aa.ID_Cat_Atra ='".$categoria."' ";
		
	}else{
		$condicion=$condicion." aa.ID_Cat_Atra ='".$categoria."' ";

	}	
}
if ($tipo) {
	if ($condicion) {
		$condicion=$condicion." and aa.Atrac_Tipo ='".$tipo."' ";		
	}else{
		$condicion=$condicion." aa.Atrac_Tipo ='".$tipo."' ";
	}	
}
if ($subtipo) {
	if ($condicion) {
		$condicion=$condicion." and aa.Atrac_Subtipo ='".$subtipo."' ";		
	}else{
		$condicion=$condicion." aa.Atrac_Subtipo ='".$subtipo."' ";

	}

}
if (isset($terrestre)) {
		$desde=$desde.' , `Estructura_Vial_Acceso` bb';
	if ($condicion) {
		$condicion=$condicion." and bb.ID_Tipo_Acceso = '1' and aa.ID_Atractivo_Turistico=bb.ID_Atractivo_Turistico";
	}else{
		$condicion = "  bb.ID_Tipo_Acceso = '1' and aa.ID_Atractivo_Turistico=bb.ID_Atractivo_Turistico";
	}
}

if (isset($aereo)) {
	if ($condicion) {
		if (isset($terrestre)) {
			$condicion=$condicion." or bb.ID_Tipo_Acceso = '2'";					
		}else{
			$desde=$desde.' , `Estructura_Vial_Acceso` bb';
			$condicion=$condicion." and bb.ID_Tipo_Acceso = '2' and aa.ID_Atractivo_Turistico=bb.ID_Atractivo_Turistico";		

		}
	}else{
		$desde=$desde.' , `Estructura_Vial_Acceso` bb';
		$condicion = "  bb.ID_Tipo_Acceso = '2' and aa.ID_Atractivo_Turistico=bb.ID_Atractivo_Turistico";

	}
	
}
if (isset($acuatico)) {
	if ($condicion) {
		if (isset($terrestre)) {
			$condicion=$condicion." or bb.ID_Tipo_Acceso = '3'";			
			
		}else{
			if(isset($aereo)){
				$condicion=$condicion." or bb.ID_Tipo_Acceso = '3'";				
			}else{
				$desde=$desde.' , `Estructura_Vial_Acceso` bb';
				$condicion=$condicion." and bb.ID_Tipo_Acceso = '3' and aa.ID_Atractivo_Turistico=bb.ID_Atractivo_Turistico";	
		    }

		}		

	}else{
		$desde=$desde.' , `Estructura_Vial_Acceso` bb';
		$condicion = "  bb.ID_Tipo_Acceso = '3' and aa.ID_Atractivo_Turistico=bb.ID_Atractivo_Turistico";		
	}

	
}

$query = $seleciona.' from '.$desde.' where '.$condicion.' ;';
// Database Connection

$host="localhost";
$uname="root";
$pass="";
$database = "academiasdb"; 

$connection=mysql_connect($host,$uname,$pass); 

echo mysql_error();

//or die("Database Connection Failed");
$selectdb=mysql_select_db($database) or 
die("Database could not be selected"); 
$result=mysql_select_db($database)
or die("database cannot be selected <br>");

// Fetch Record from Database

$output = "";
mysql_query("SET CHARACTER SET utf8"); 
mysql_query("SET NAMES utf8"); 
$sql = mysql_query($query);
$columns_total = mysql_num_fields($sql);

// Get The Field Name

for ($i = 0; $i < $columns_total; $i++) {
$heading = mysql_field_name($sql, $i);
$output .= '"'.$heading.'",';
}
$output .="\n";

// Get Records from the table

while ($row = mysql_fetch_array($sql)) {
for ($i = 0; $i < $columns_total; $i++) {
$output .='"'.$row["$i"].'"/';
}
$output .="\n";
}
$filename = "reporte.xls ";
header('Content-Encoding: UTF-8');
header('Content-type: text/csv; charset=UTF-8');
header('Content-Disposition: attachment; filename='.$filename);
print chr(255) . chr(254) . mb_convert_encoding($output, 'UTF-16LE', 'UTF-8');
exit;
?>

