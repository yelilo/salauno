<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Session;
use DB;
use Redirect;

class ConfiguracionController extends Controller
{
    public function CreaTokent()
    {
        $conf = DB::table('configurations')->where('activo','Si')->first();

        $credenciales = "-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"grant_type\"\r\n\r\npassword\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"client_id\"\r\n\r\n".$conf->client_id."\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"client_secret\"\r\n\r\n".$conf->client_secret."\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"username\"\r\n\r\n".$conf->username."\r\n-----011000010111000001101001\r\nContent-Disposition: form-data; name=\"password\"\r\n\r\n".$conf->password."\r\n-----011000010111000001101001--";

        $curl = curl_init();
            curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
            curl_setopt_array($curl, array(
              CURLOPT_URL => $conf->url_tk,
              CURLOPT_RETURNTRANSFER => true,
              CURLOPT_ENCODING => "",
              CURLOPT_MAXREDIRS => 10,
              CURLOPT_TIMEOUT => 30,
              CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
              CURLOPT_CUSTOMREQUEST => "POST",
              CURLOPT_POSTFIELDS => $credenciales,
              CURLOPT_HTTPHEADER => array(
                "cache-control: no-cache",
                "content-type: multipart/form-data; boundary=---011000010111000001101001",
                "postman-token: 9d8fc239-3c42-80df-b853-fc381693448d"
              ),
            ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);
        if ($err) {
          echo "cURL Error #:" . $err;
        } else {
            $tkObj = json_decode($response, true);
          return $tkObj['access_token'];
        }
    }


    public function show($opciones){
      return view('configuracion/agregar',['opciones'=>$opciones]);
    }

    public function modify(Request $request){
      $nombre = $request->Nuevo;
      echo($nombre);
    }

    public function index(){
      $opciones = DB::select('SELECT * FROM tipo_consultas');
      return view('configuracion/index',['opciones'=>$opciones]);
    }

    public function sincCandidato($objJson)
    {
        $token = $this->CreaTokent();

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt_array($curl, array(
          CURLOPT_URL => "https://na30.salesforce.com/services/data/v37.0/sobjects/Lead",
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 30,
          CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
          CURLOPT_CUSTOMREQUEST => "POST",
          CURLOPT_POSTFIELDS => $objJson,
          CURLOPT_HTTPHEADER => array(
            "authorization: Bearer ".$token,
            "cache-control: no-cache",
            "content-type: application/json",
            "postman-token: 36261aab-f37d-31e4-9aaa-e17e3b70a329"
          ),
        ));

        $response = curl_exec($curl);
        $err = curl_error($curl);

        curl_close($curl);

        if ($err) {
          return "cURL Error #:" . $err;
        } else {
          return $response;
        }
    }
}
