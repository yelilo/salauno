<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use App\Http\Requests\CampaignRequest;
use App\campaign;
use App\candidate;
use App\Http\Requests;
use App\exploration;
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
        $campaigns = campaign::orderby('created_at','DESC')
                     ->paginate(15);
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
                $campaign->consultas          = $request->consultas;
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
        $arrayRes = $this->enviarRegistros($id);
        echo var_dump($arrayRes);
        Session::flash('message-info',$arrayRes['respuesta']);
        return Redirect::to('campaign');
    }

    public function enviarRegistros($id)
    {
        $campaign    = campaign::find($id);
        $count_ok    = 0;
        $count_error = 0;
        $results     = '';

        $candidates = DB::table('candidates')
                    ->join('campaigns', 'campaigns.id', '=', 'candidates.campaign_id')
                    ->where('candidates.campaign_id','=',$campaign->id)
                    ->where('candidates.etapa','<>','Enviado a SF')
                    ->select('candidates.*', 'campaigns.codigo AS codigocp')
                    ->limit(40)
                    ->get();
                    // ->where('candidates.etapa','<>','Duplicado a SF')

        $acc = new ConfiguracionController;
        
            foreach ($candidates as $key => $candidate) {
                if ($results != '') {
                    break;
                }
                $res_presion = DB::selectone('select * from explorations where candidate_id = \''.$candidate->id.'\'');
                $Clinica_de_Interes__c = DB::table('clinics')->where('id','=',$candidate->clinica)->value('nombre');
                    // 'CreatedById'                         => '00536000000uxPYAAY',

                $arrayCandidate = array(
                    'OwnerId'                             => '00536000000uxPYAAY',
                    'Campana__c'                          => $candidate->codigocp,
                    'ID_Candidato__c'                     => $candidate->codigo,
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
                    'Clinica__c'                          => $candidate->clinica,
                    'Fecha_de_cita__c'                    => $candidate->fecha_cita,
                    'hora_consulta__c'                    => $candidate->hora_consulta,
                    'tipo_consulta__c'                    => $candidate->tipo_consulta,
                    'Pre_Diagnostico__c'                  => $candidate->pre_diagnostico,
                    'ojo_prediagnostico__c'               => $candidate->ojo_prediagnostico,
                    'presion_intraocular__c'              => $res_presion->presion_intraocular,
                    'glucosa_capilar__c'                  => $res_presion->glucosa_capilar,
                    'presion_arterial__c'                 => $res_presion->presion_arterial,
                    'presion_estado_medicion__c'          => $res_presion->presion_estado_medicion,
                    'Medio_o_Canal__c'                    => 'Campaña',
                    'Medio__c'                            => 'Sistema Campañas',
                    'Clinica_de_Interes__c'               => $Clinica_de_Interes__c,
                );

                if($candidate->status != 'Con cita'){
                    unset($arrayCandidate['Fecha_de_cita__c']);
                    unset($arrayCandidate['hora_consulta__c']);
                    unset($arrayCandidate['tipo_consulta__c']);
                }

                if (!$res_presion->presion_intraocular) {
                    unset($arrayCandidate['presion_intraocular__c']);
                }
                if (!$res_presion->glucosa_capilar) {
                    unset($arrayCandidate['glucosa_capilar__c']);
                }
                if (!$res_presion->presion_arterial) {
                    unset($arrayCandidate['presion_arterial__c']);
                }
                if (!$res_presion->presion_estado_medicion) {
                    unset($arrayCandidate['presion_estado_medicion__c']);
                }
                $jsonCandidate = json_encode($arrayCandidate);
                $respuesta     = $acc->sincCandidato($jsonCandidate);
                $respuesta     = json_decode($respuesta, true);


                if (array_key_exists('id', $respuesta)) {
                    $count_ok++;
                    $salesforce_id = $respuesta['id'];
                    candidate::where('id', $candidate->id)
                                ->update(['etapa' => 'Enviado a SF','salesforce_id' => $salesforce_id]);

                } elseif (array_key_exists('message', $respuesta[0])) {

                    $count_error++;
                    $pos = strpos($respuesta[0]['message'], 'candidatoCampana');
                    if ($pos !== false) {
                        $results = "Verifique que la campaña este creada en Salesforce para poder subir los candidatos.";
                    } else {
                        $results .= $candidate->codigo." - ".$respuesta[0]['message'];
                        candidate::where('id', $candidate->id)
                                ->update(['etapa' => 'Duplicado en SF']);
                    }

                } else {

                    $count_error++;
                    candidate::where('id', $candidate->id)
                                ->update(['etapa' => 'Error importacion']);
                }
                
        }

        if ($results == '') {
            $tipo_mensaje = 'message-info';
            $results = "Se cargaron ".$count_ok." registros a Salesforce";
            $results .= ($count_error >= 1) ? "; Poblemas de importacion ".$count_error." registros".$respuesta[0]['message'] : "" ;
        } else {
            $tipo_mensaje = 'message-warning';
        }
        $arrayRes = array('tipo_mensaje' => $tipo_mensaje, 'respuesta' => $results);
        return $arrayRes;
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
                $campaign->consultas          = $request->consultas;
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
