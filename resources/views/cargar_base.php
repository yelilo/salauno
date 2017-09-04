<?php  

use App\candidate;

function actualizacion(){
}
	
function act_db(){
	$base_file;

	$mysql_user = 'root';
	$mysql_pass = '';
	$mysql_host = 'localhost';
	$base_db = 'test';
	$sql_file = 'salauno_campanias.sql';


	$id_db = mysqli_connect($mysql_host, $mysql_user, $mysql_pass) or die('Error en la conexion');
	mysqli_select_db($id_db,$base_db) or die('<script = javascript>alert(\'Base de datos no encontrada\')</script>');
	
	$temp = '';

	$lines = file($sql_file) or die('Nueva base de datos no encontrada');

	foreach ($lines as $key => $line) {
		if(substr($line,0, 2) == '--' || strlen($line) <= 2){			
			continue;
		}
		if(substr(trim($line), -1, 1) != ';'){
			$temp .= $line;
		}
		else{
			$temp .= $line;	
			mysqli_query($id_db,$temp);
			$temp = '';
		}
	}
	print('<script = javascript>alert(\'Base de datos actualizada\')</script>');
}

act_db();

?>