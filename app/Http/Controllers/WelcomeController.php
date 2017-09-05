<?php

namespace App\Http\Controllers;
use App\candidate;
use DB;
use App\Http\Controllers\Controller;
use App\Http\Controllers\RenderController;
use App\Http\Controllers\ConfiguracionController;
use Session;
use Redirect;


class WelcomeController extends Controller
{

	private $version_n = 2;
	private $version_act;
    // use CandidateRequest;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
    	$actualizar = 1;
    	$candidate = candidate::where('etapa','!=','Enviado a SF')->count();
    	$version_act = DB::table('configurations')->where('client_id','version_actual')->value('actualizar_sist');
    	if($version_act){
    		if($version_act == $this->version_n){
	    		$actualizar = 0;
    		}
    	}
        return view('welcome.index',['candidatos'=>$candidate, 'version'=>$actualizar]);

    }

    public function actualizar(){
    $base_file;

	$mysql_user = 'root';
	$mysql_pass = 'salauno***';
	$mysql_host = 'localhost';
	$base_db = 'salauno_campanias';
	$sql_file = '../salauno_campanias.sql';
	global $version_n;

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
	$version_act = DB::table('configurations')->where('client_id','version_actual')->update(['actualizar_sist'=>$this->version_n]);
	print('<script = javascript>alert(\'Base de datos actualizada\')</script>');
    	return view('welcome.index',['candidatos'=>0, 'version'=>0]);
    }
}
