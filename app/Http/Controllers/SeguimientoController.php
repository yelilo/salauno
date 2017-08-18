<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\candidate;
use App\campaign;
use App\Http\Requests;

class SeguimientoController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $campaign         = campaign::where('activo','=','Si')->first();
        $candidates       = candidate::where('campaign_id','=',$campaign->id)->get();
        // $candidates       = candidate::where('campaign_id','=',$campaign->id)->paginate(15);
        $total_candidatos = count($candidates);
        $total_citas     = 0;
        $total_femenino  = 0;
        $total_masculino = 0;
        $total_otro      = 0;

        $total_diabetes              = 0;
        $total_hipertension          = 0;
        $total_diabetes_hipertension = 0;


        $total_catarata                 = 0;
        $total_conjuntivitis            = 0;
        $total_excavacion_sospechosa    = 0;
        $total_fondo_coroideo           = 0;
        $total_glaucoma                 = 0;
        $total_maculopatia              = 0;
        $total_no_valorable             = 0;
        $total_oculoplastica            = 0;
        $total_ojo_seco                 = 0;
        $total_otro                     = 0;
        $total_pterigion                = 0;
        $total_queratocono              = 0;
        $total_refractivo               = 0;
        $total_retinopatia_diabetica    = 0;
        $total_retinopatia_hipertensiva = 0;
        $total_revision                 = 0;
        $total_sin_hallazgo             = 0;

        // ************ PENDIENTE DE REALIZAR ************
        // Cambiar la funcionalidad acual y poner un catalogo de prediagnosticos
        // $prediagnosticos =

        foreach ($candidates as $key => $candidate) {
            // <<< Generales
                $total_citas                  = ($candidate->status == 'Con cita') ? $total_citas+1 : $total_citas ;
                $total_femenino              = ($candidate->genero == 'Femenino') ? $total_femenino+1 : $total_femenino ;
                $total_masculino             = ($candidate->genero == 'Masculino') ? $total_masculino+1 : $total_masculino ;
                $total_otro                  = ($candidate->genero == 'Otro') ? $total_otro+1 : $total_otro ;
            // Generales >>>

            // <<< Enfermedades
                $total_diabetes              = ($candidate->diabetes == 'Si' && ($candidate->hipertension == 'No' || $candidate->hipertension == null)) ? $total_diabetes+1 : $total_diabetes ;
                $total_hipertension          = (($candidate->diabetes == 'No' || $candidate->diabetes == null) && $candidate->hipertension == 'Si') ? $total_hipertension+1 : $total_hipertension ;
                $total_diabetes_hipertension = ($candidate->diabetes == 'Si' && $candidate->hipertension == 'Si') ? $total_diabetes_hipertension+1 : $total_diabetes_hipertension ;
            // Enfermedades >>>

            // <<< Prediagnosticos

                $total_catarata      = ($candidate->pre_diagnostico == 'Catarata') ? $total_catarata + 1 : $total_catarata;
                $total_glaucoma      = ($candidate->pre_diagnostico == 'Glaucoma preexistente') ? $total_glaucoma + 1 : $total_glaucoma;
                $total_conjuntivitis            = ($candidate->pre_diagnostico == 'Conjuntivitis') ? $total_conjuntivitis + 1 : $total_conjuntivitis;
                $total_excavacion_sospechosa    = ($candidate->pre_diagnostico == 'Excavación Sospechosa') ? $total_excavacion_sospechosa + 1 : $total_excavacion_sospechosa;
                $total_fondo_coroideo           = ($candidate->pre_diagnostico == 'Fondo coroideo/ Adelgazamiento de retina') ? $total_fondo_coroideo + 1 : $total_fondo_coroideo;
                $total_maculopatia              = ($candidate->pre_diagnostico == 'Maculopatía') ? $total_maculopatia + 1 : $total_maculopatia;
                $total_oculoplastica            = ($candidate->pre_diagnostico == 'Oculoplástica') ? $total_oculoplastica + 1 : $total_oculoplastica;
                $total_no_valorable             = ($candidate->pre_diagnostico == 'No valorable') ? $total_no_valorable + 1 : $total_no_valorable;
                $total_ojo_seco                 = ($candidate->pre_diagnostico == 'Ojo Seco') ? $total_ojo_seco + 1 : $total_ojo_seco;
                $total_pterigion                = ($candidate->pre_diagnostico == 'Pterigión') ? $total_pterigion + 1 : $total_pterigion;
                $total_queratocono              = ($candidate->pre_diagnostico == 'Queratocono') ? $total_queratocono + 1 : $total_queratocono;
                $total_refractivo               = ($candidate->pre_diagnostico == 'Refractivo (evaluar graduación)') ? $total_refractivo + 1 : $total_refractivo;
                $total_retinopatia_diabetica    = ($candidate->pre_diagnostico == 'Retinopatía Diabética') ? $total_retinopatia_diabetica + 1 : $total_retinopatia_diabetica;
                $total_retinopatia_hipertensiva = ($candidate->pre_diagnostico == 'Retinopatía Hipertensiva') ? $total_retinopatia_hipertensiva + 1 : $total_retinopatia_hipertensiva;
                $total_otro                     = ($candidate->pre_diagnostico == 'Otro') ? $total_otro + 1 : $total_otro;
                $total_sin_hallazgo             = ($candidate->pre_diagnostico == 'Sin Hallazgos') ? $total_sin_hallazgo + 1 : $total_sin_hallazgo;
            // Prediagnosticos >>>
        }

        return view('seguimiento.index',[
                                            'candidates'                     => $candidates,
                                            'total_candidatos'               => $total_candidatos,
                                            'total_citas'                    => $total_citas,
                                            'total_femenino'                 => $total_femenino,
                                            'total_masculino'                => $total_masculino,
                                            'total_otro'                     => $total_otro,
                                            'total_diabetes'                 => $total_diabetes,
                                            'total_hipertension'             => $total_hipertension,
                                            'total_diabetes_hipertension'    => $total_diabetes_hipertension,
                                            'total_glaucoma'                 => $total_glaucoma,
                                            'total_catarata'                 => $total_catarata,
                                            'total_conjuntivitis'            => $total_conjuntivitis,
                                            'total_excavacion_sospechosa'    => $total_excavacion_sospechosa,
                                            'total_fondo_coroideo'           => $total_fondo_coroideo,
                                            'total_maculopatia'              => $total_maculopatia,
                                            'total_no_valorable'             => $total_no_valorable,
                                            'total_oculoplastica'            => $total_oculoplastica,
                                            'total_ojo_seco'                 => $total_ojo_seco,
                                            'total_otro'                     => $total_otro,
                                            'total_pterigion'                => $total_pterigion,
                                            'total_queratocono'              => $total_queratocono,
                                            'total_refractivo'               => $total_refractivo,
                                            'total_retinopatia_diabetica'    => $total_retinopatia_diabetica,
                                            'total_retinopatia_hipertensiva' => $total_retinopatia_hipertensiva,
                                            'total_revision'                 => $total_revision,
                                            'total_sin_hallazgo'             => $total_sin_hallazgo,
                                        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {

    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {

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
        $candidate = candidate::find($id);
        return view('enfermeria/editar',['candidate'=>$candidate]);
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
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" se ha enviado a "'.$request->etapa.'"');
        return Redirect::to('enfermeria');
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
}