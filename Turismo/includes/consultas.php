<?php
    include("../dll/config.php");
    include("../dll/mysql.php"); 
    $sql = "SELECT * FROM `Canton` WHERE `Pro_ID_Provincia` = ".$_GET['id'];
    $miconexion->consulta($sql); 
    $miconexion->Consulta_opcion();    
  
?>