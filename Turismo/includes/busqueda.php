<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<?
/**
* 
*/
class BD_Dinamica{

	function Conectarse(){
		if (!($link=mysql_connect("localhost","root",""))){
			echo "Error conectando a la base de datos.";
			exit();
		}
		if (!mysql_select_db("academiasdb",$link)){
			echo "Error seleccionando la base de datos.";
			exit();
		}
		return $link;
	}

}

$miconexion = new BD_Dinamica;
$link=$miconexion->Conectarse();

$B_BUSCAR= mysql_query ("SELECT * FROM `Canton` WHERE `Pro_ID_Provincia` ='".$_POST["idnumero"]."' ",$link);
$R_BUSCAR=mysql_fetch_assoc($B_BUSCAR);
$C_BUSCAR=mysql_num_rows($B_BUSCAR);
if($C_BUSCAR){
do{
if($_POST["idpobla"]==$R_BUSCAR['Pro_ID_Provincia']){$TRUE=" selected='TRUE'";}else{$TRUE="";}
echo "<option value='".$R_BUSCAR['ID_canton']."' $TRUE>".htmlentities($R_BUSCAR['Canton_Nombre'])."</option>";

 }while($R_BUSCAR=mysql_fetch_assoc($B_BUSCAR));
}else{
echo "<option value=''>".htmlentities("Canton")."</option>";
}
mysql_close($link);
?>
