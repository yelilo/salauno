<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use Session;
use DB;
use Redirect;

class ConfiguracionController extends Controller
{
    private function CreaTokent()
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
              CURLOPT_TIMEOUT => 600,
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

    public function sincCandidato($objJson)
    {
        $token = $this->CreaTokent();
        $resCandidato = $this->searchLead($objJson,$token);

        $rs = json_decode(json_encode($resCandidato),true);
        $rs = json_decode($rs, true);


        if (!empty($rs['records'])) {
          // echo "llena";
          $id_lead = $rs['records'][0]['Id'];
        } else {
          $id_lead = '';
          // echo "vacia";
        }

        $_url = ($id_lead == '') ? 'https://na30.salesforce.com/services/data/v37.0/sobjects/Lead' : 'https://na30.salesforce.com/services/data/v37.0/sobjects/Lead/'.$id_lead.'?_HttpMethod=PATCH' ;

        // echo $_url;

        $curl = curl_init();
        curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt_array($curl, array(
          CURLOPT_URL => $_url,
          CURLOPT_RETURNTRANSFER => true,
          CURLOPT_ENCODING => "",
          CURLOPT_MAXREDIRS => 10,
          CURLOPT_TIMEOUT => 600,
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
          $response = ($id_lead != '') ? json_encode(array('id' => $id_lead)) : $response ;
          return $response;
        }
    }

    function convert_object_to_array($data) {

        if (is_object($data)) {
            $data = get_object_vars($data);
        }

        if (is_array($data)) {
            return array_map(__FUNCTION__, $data);
        }
        else {
            return $data;
        }
    }

    private function searchLead($objJson, $token)
    {

      $arrayOj = json_decode($objJson);

      $FirstName       = str_replace(' ', '%20', $arrayOj->FirstName);
      $LastName        = str_replace(' ', '%20', $arrayOj->LastName);
      $MobilePhone     = $arrayOj->MobilePhone;
      $Email           = str_replace('@', '%40', $arrayOj->Email);
      $ID_Candidato__c = $arrayOj->ID_Candidato__c;

      $_url = "https://na30.salesforce.com/services/data/v20.0/query/?q=SELECT%20Id%20FROM%20Lead%20WHERE%20FirstName%20%3D%20'".$FirstName."'%20AND%20LastName%20%3D%20'".$LastName."'%20AND%20Phone%20%3D%20'".$MobilePhone."'%20AND%20Email%20%3D%20'".$Email."'";

      $curl = curl_init();

      curl_setopt($curl, CURLOPT_SSL_VERIFYPEER, false);
      curl_setopt_array($curl, array(
        CURLOPT_URL => $_url,
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_ENCODING => "",
        CURLOPT_MAXREDIRS => 10,
        CURLOPT_TIMEOUT => 600,
        CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
        CURLOPT_CUSTOMREQUEST => "GET",
        CURLOPT_HTTPHEADER => array(
          "authorization: Bearer ".$token,
          "cache-control: no-cache",
          "content-type: application/json",
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
