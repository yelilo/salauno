<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Session;
use Redirect;
// use Validator;
use Illuminate\Candidates\Validation\Validator;
use App\campaign;
use App\candidate;
use App\refraction;
use App\exploration;
use App\Http\Requests;
use App\Http\Requests\CandidateRequest;
use App\Http\Controllers\RenderController;

class CandidateController extends Controller
{
    // use CandidateRequest;
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $campaign = campaign::where('activo','=','Si')->first();
        if ($campaign == null) {
            Session::flash('message-info','No hay campaña activa');
            return Redirect::to('campaign');
        } else {
            $candidates = candidate::where('etapa','=','Revision')
                            ->where('campaign_id','=',$campaign->id)
                            ->orderby('id')
                            ->paginate(10);
            return view('candidate.index',['candidates'=>$candidates]);
        }

    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        $campaign = campaign::where('activo','=','Si')->first();
        if ($campaign == null) {
            Session::flash('message-info','No hay campaña activa');
            return Redirect::to('campaign');
        } else {
            $render = new RenderController;
            $form_render = $render->index(1,0);
            return view('candidate.nuevo',['form_render'=>$form_render]);
        }
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    // public function store(CandidateRequest $request)
    public function store(Request $request)
    {
        $campaign      = campaign::where('activo','Si')->first();
        $arrayCampania = explode('-',$campaign->codigo);
        $ultimo_codigo = candidate::where('campaign_id','=',$campaign->id)->max('codigo');
        if (empty($ultimo_codigo)) { // Es el primer registro de campaña
            $next_codigo = '001';
        } else {
            $ultimo_codigo = (empty($ultimo_codigo)) ? 0 : $ultimo_codigo;
            $arrayCodigo   = explode('-', $ultimo_codigo);
            $next_codigo   = number_format($arrayCodigo[2]) + 1;
            $next_codigo   = str_pad((int) $next_codigo,3,"0",STR_PAD_LEFT);
        }

        // <<< valida que no exista candidato
            $resCandidate = candidate::where('nombres','=',$request->nombres)
                                        ->where('apellidos','=',$request->apellidos)
                                        ->where('fecha_nacimiento','=',$request->fecha_nacimiento)
                                        ->first();
            if (!empty($resCandidate)) {
                Session::flash('message-info','Este Registro ya esta duplicado y se encuentra en la etapa "'.$resCandidate->etapa.'"');
                return Redirect::to('candidate/create');
            }

        // valida que no exista candidato >>>

        $edad = $this->calculaEdad($request->fecha_nacimiento);

        $codigo = $arrayCampania[2].'-'.$arrayCampania[3].'-'.$next_codigo;

        $candidate = $request->user()->candidates()->create([
            'codigo'                    => $codigo,
            'campaign_id'               => $campaign->id,
            'nombres'                   => $request->nombres,
            'apellidos'                 => $request->apellidos,
            'fecha_nacimiento'          => $request->fecha_nacimiento,
            'genero'                    => $request->genero,
            'edad'                      => $edad,
            'ocupacion'                 => $request->ocupacion,
            'tiene_seguro_medico'       => $request->tiene_seguro_medico,
            'seguro_medico'             => $request->seguro_medico,
            'seguro_medico_otro'        => $request->seguro_medico_otro,
            'numero_poliza'             => $request->numero_poliza,
            'telefono_fijo'             => $request->telefono_fijo,
            'telefono_celular'          => $request->telefono_celular,
            'tiene_correo_electronico'  => $request->tiene_correo_electronico,
            'correo_electronico'        => $request->correo_electronico,
            'domicilio_cp'              => $request->domicilio_cp,
            'domicilio_ciudad'          => $request->domicilio_ciudad,
            'domicilio_poblacion'       => $request->domicilio_poblacion,
            'diabetes'                  => $request->diabetes,
            'diabetes_tiempo_anios'     => $request->diabetes_tiempo_anios,
            'retinopatia_diabetica'     => $request->retinopatia_diabetica,
            'hipertension'              => $request->hipertension,
            'hipertension_tiempo_anios' => $request->hipertension_tiempo_anios,
            'familiar_glaucoma'         => $request->familiar_glaucoma,
            'enfermedad_tiroides'       => $request->enfermedad_tiroides,
            'disminucion_vista'         => $request->disminucion_vista,
            'consulta_oftalmologo'      => $request->consulta_oftalmologo,
            'examen_visual'             => $request->examen_visual,
            'cirugia_ojo'               => $request->cirugia_ojo,
            'cirugia_ojo_cual'          => $request->cirugia_ojo_cual,
            'motivo_etapa'              => $request->motivo_etapa,
            'etapa'                     => $request->etapa,
            ]);
        // die($request->telefono_fijo);

        //<<< Agrega al candidato a las demas estaciones
            // <<< Exploracion
                $exploration = new exploration;
                    $exploration->candidate_id = $candidate->id;
                    $exploration->campaign_id = $campaign->id;
                $exploration->save();

                $refraction = new refraction;
                    $refraction->candidate_id = $candidate->id;
                    $refraction->campaign_id = $campaign->id;
                $refraction->save();
                // counseling::create(['candidate_id' => $candidate->id]);
            // Exploracion >>>
        //Agrega al candidato a las demas estaciones >>>

        Session::flash('message',' El Registro se ha enviado a '.$request->etapa);
        return Redirect::to('candidate/create');
    }

    /**
     * Display the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function show($id)
    {
        //
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $render = new RenderController;
        $form_render = $render->index(1,$id);
        $candidate = candidate::find($id);
        return view('candidate/editar',['candidate'=>$candidate, 'form_render'=>$form_render]);
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
        $candidate = candidate::find($id);
        $candidate->fill($request->all());
        $candidate->save();
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" ha sido modificado');
        // return Redirect::to('candidate/nuevo');
        return back();
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

    public function calculaEdad($fecha_nacimiento)
    {
        list($y,$m,$d) = explode("-", $fecha_nacimiento);
        return (date("md") < $m.$d ? date("Y") - $y - 1 : date("Y") - $y);
    }
}
