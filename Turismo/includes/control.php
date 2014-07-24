<?php
    include("../dll/config.php");
    include("../dll/mysql.php");

    $miconexion = new DB_mysql;
    $miconexion->conectar( $dbhost, $dbuser, $dbpass, $dbname);
    $query= ("SELECT ID_usuario FROM usuario 
                                 WHERE ID_usuario =  '".htmlentities($_POST["usuario"]."'"));

    $miconexion->consulta($query);
    $lista_res=$miconexion->consulta_registros();    

   

     //Si existe el usuario, validamos también la contraseña ingresada y el estado del usuario...
     if($lista_res != 0){      
          $sql = "SELECT *
                  FROM usuario
                  WHERE ID_usuario = '".htmlentities($_POST["usuario"])."' 
                  AND clave = '".htmlentities($_POST["clave"])."'";
          $miconexion->consulta($sql);                   
          $lista_todo="";
          $lista_todo=$miconexion->consulta_lista();           

          if($lista_todo != 0){
               session_start();               
               $_SESSION["autentica"] = "SIP";
               $_SESSION["usuarioactual"] =  $lista_todo[0]; 
			         $_SESSION["tipo"] =  $lista_todo[2]; 
			   
						if($_SESSION['tipo']=="1")                                              
								header("location:frontal.php");
						else
                
                echo"<script>alert('usuario comun.');window.location.href=\"../index.php\"</script>";
								     
              
          }
          else{           
            
               echo"<script>alert('La Clave es incorecta.');window.location.href=\"../index.php\"</script>";
          }
     }else{         
         echo"<script>alert('El usuario no existe.');window.location.href=\"../index.php\"</script>";
     }

	
     
?>
