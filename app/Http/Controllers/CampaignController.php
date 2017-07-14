<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use App\Http\Requests\CampaignRequest;
use App\campaign;
use App\candidate;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\RenderController;
use App\Http\Controllers\ConfiguracionController;
use Session;
use Redirect;

class CampaignController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        // Listado de campañas
        $campaigns = campaign::paginate(15);
        return view('campaign/index',['campaigns'=>$campaigns]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $render = new RenderController;
        $form_render = $render->index(7,0);
        return view('campaign/nuevo',['form_render'=>$form_render]);
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(CampaignRequest $request)
    {
        $resCodigo = $this->validaCodigo($request->codigo,0);
        if ($resCodigo == 'ok') {

            if ($request->status == 'En Proceso') {
                $campaignSh = campaign::where('status','=','En Proceso')->first();
                if ($campaignSh != null) {
                    $campaignSh->status = 'Completada';
                    $campaignSh->activo = 'No';
                    $campaignSh->save();
                }
                $activo = 'Si';
            } else {
                $activo = 'No';
            }

            $campaign = new campaign;
                $campaign->user_id            = $request->user()->id;
                $campaign->nombre_aliado      = $request->nombre_aliado;
                $campaign->nombre_medico      = $request->nombre_medico;
                $campaign->correo_electronico = $request->correo_electronico;
                $campaign->telefono           = $request->telefono;
                $campaign->direccion          = $request->direccion;
                $campaign->codigo             = $request->codigo;
                $campaign->tipo_campania      = $request->tipo_campania;
                $campaign->promocion          = $request->promocion;
                $campaign->status             = $request->status;
                $campaign->activo             = $activo;
            $campaign->save();

            Session::flash('message-info','Campaña creada corecctamente');
        } else {
            Session::flash('message-info','La Campaña '.$request->codigo.' ya existe');
        }
        return Redirect::to('campaign');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        $respuesta = $this->enviarRegistros($id);
        Session::flash('message-info',$respuesta);
        return Redirect::to('campaign');
    }

    public function enviarRegistros($id)
    {
        $campaign    = campaign::find($id);
        $count_ok    = 0;
        $count_error = 0;

        $candidates = DB::table('candidates')
                    ->join('campaigns', 'campaigns.id', '=', 'candidates.campaign_id')
                    ->where('candidates.campaign_id','=',$campaign->id)
                    ->where('candidates.etapa','<>','Enviado a SF')
                    ->select('candidates.*', 'campaigns.codigo')
                    ->get();

        $acc = new ConfiguracionController;

        foreach ($candidates as $key => $candidate) {
            $arrayCandidate = array(
                'Campana__c'                            => $candidate->codigo,
                'FirstName'                           => $candidate->nombres,
                'LastName'                            => $candidate->apellidos,
                'Sexo__c'                             => $candidate->genero,
                'PersonBirthdate__c'                  => $candidate->fecha_nacimiento,
                'Ocupacion__c'                        => $candidate->ocupacion,
                'Seguro_Medico__c'                    => $candidate->seguro_medico,
                'Seguro_Medico_Cual_Otro__c'          => $candidate->seguro_medico_otro,
                'Numero_de_Poliza__c'                 => $candidate->numero_poliza,
                'Phone'                               => $candidate->telefono_fijo,
                'MobilePhone'                         => $candidate->telefono_celular,
                'Email'                               => $candidate->correo_electronico,
                'PostalCode'                          => $candidate->domicilio_cp,
                'State'                               => $candidate->domicilio_poblacion,
                'City'                                => $candidate->domicilio_ciudad,
                'Diabetes__c'                         => $candidate->diabetes,
                'Tiempo_de_evolucion_Diabetes__c'     => $candidate->diabetes_tiempo_anios,
                'Retinopatia_Diabetica__c'            => $candidate->retinopatia_diabetica,
                'Hipertension__c'                     => $candidate->hipertension,
                'Tiempo_de_evolucion_Hipertension__c' => $candidate->hipertension_tiempo_anios,
                'Otra_enfermedad__c'                  => $candidate->enfermedad_tiroides,
                'Notado_disminucion_vision__c'        => $candidate->disminucion_vista,
                'Tiempo_examen_consulta__c'           => $candidate->examen_visual,
                'Cirugia_de_ojo__c'                   => $candidate->cirugia_ojo,
                'Cirugia_Ojo_Cual__c'                 => $candidate->cirugia_ojo_cual,
                'Status'                              => $candidate->status,
                'Fecha_de_cita__c'                    => $candidate->fecha_cita,
                'Pre_Diagnostico__c'                  => $candidate->pre_diagnostico
            );

            $jsonCandidate = json_encode($arrayCandidate);
            $respuesta = $acc->sincCandidato($jsonCandidate);
            // echo "<p>";
            // echo $respuesta;
            // echo "</p>";
            if ($respuesta != 'error') {
                $count_ok++;
                candidate::where('id', $candidate->id)
                              ->update(['etapa' => 'Enviado a SF']);
            } else {
                $count_error++;
                candidate::where('id', $candidate->id)
                              ->update(['etapa' => 'Error importacion']);
            }
        }

        $results = "Se cargaron ".$count_ok." registros a Salesforce; ";
        $results .= "Poblemas de importacion ".$count_error." registros";
        return $results;
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $campaign = campaign::find($id);
        $render = new RenderController;
        $form_render = $render->index(7,$id);
        return view('campaign/editar',['campaign'=>$campaign,'form_render'=>$form_render]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update(Request $request, $id)
    {
        $resCodigo = $this->validaCodigo($request->codigo,$id);
        if ($resCodigo == 'ok') {
            if ($request->status == 'En Proceso') {
                $campaignSh = campaign::where('status','=','En Proceso')->first();
                if ($campaignSh != null) {
                    $campaignSh->status = 'Completada';
                    $campaignSh->activo = 'No';
                    $campaignSh->save();
                }
                $activo = 'Si';
            } else {
                $activo = 'No';
            }

            $campaign = campaign::find($id);
                $campaign->user_id            = $request->user()->id;
                $campaign->nombre_aliado      = $request->nombre_aliado;
                $campaign->nombre_medico      = $request->nombre_medico;
                $campaign->correo_electronico = $request->correo_electronico;
                $campaign->telefono           = $request->telefono;
                $campaign->direccion          = $request->direccion;
                $campaign->codigo             = $request->codigo;
                $campaign->tipo_campania      = $request->tipo_campania;
                $campaign->promocion          = $request->promocion;
                $campaign->status             = $request->status;
                $campaign->activo             = $activo;
            $campaign->save();

            Session::flash('message-info', $campaign->codigo.': Cambios generados correctamente :)');
        } else {
            Session::flash('message-info','La Campaña '.$request->codigo.' ya existe');
        }
        return Redirect::to('campaign');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function destroy($id)
    {
        //
    }

    public function validaCodigo($codigo,$id)
    {
        $resCodigo = campaign::where('codigo','=',$codigo)->first();

        $resCodigo = (empty($resCodigo) || $resCodigo->id == $id) ? 'ok' : 'duplicado' ;

        // return (empty($resCodigo)) ? 'ok' : 'duplicado' ;
        return $resCodigo ;
    }
}
