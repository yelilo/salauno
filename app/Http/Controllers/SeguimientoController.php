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
        $candidates       = candidate::where('campaign_id','=',$campaign->id)->paginate(15);
        $total_candidatos = count($candidates);
        $total_femenino        = 0;
        $total_masculino       = 0;
        $total_otro            = 0;

        $total_catarata        = 0;
        $total_conjuntivitis   = 0;
        $total_exc_sosp        = 0;
        $total_iridopatia      = 0;
        $total_oculoplastica   = 0;
        $total_maculopatia     = 0;
        $total_pterigion       = 0;
        $total_refractivo      = 0;
        $total_retinopatia_dia = 0;
        $total_retinopatia_hip = 0;
        $total_rev_integral    = 0;

        foreach ($candidates as $key => $candidate) {
            $total_femenino  = ($candidate->genero == 'Femenino') ? $total_femenino+1 : $total_femenino ;
            $total_masculino = ($candidate->genero == 'Masculino') ? $total_masculino+1 : $total_masculino ;
            $total_otro      = ($candidate->genero == 'Otro') ? $total_otro+1 : $total_otro ;

            $total_catarata        = ($candidate->pre_diagnostico == 'Catarata') ? $total_catarata+1 : $total_catarata ;
            $total_conjuntivitis   = ($candidate->pre_diagnostico == 'Conjuntivitis') ? $total_conjuntivitis+1 : $total_conjuntivitis ;
            $total_exc_sosp        = ($candidate->pre_diagnostico == 'Excavacion Sospechosa') ? $total_exc_sosp+1 : $total_exc_sosp ;
            $total_iridopatia      = ($candidate->pre_diagnostico == 'Iridopatia') ? $total_iridopatia+1 : $total_iridopatia ;
            $total_oculoplastica   = ($candidate->pre_diagnostico == 'Oculoplastica') ? $total_oculoplastica+1 : $total_oculoplastica ;
            $total_maculopatia     = ($candidate->pre_diagnostico == 'Maculopatia') ? $total_maculopatia+1 : $total_maculopatia ;
            $total_pterigion       = ($candidate->pre_diagnostico == 'Pterigion') ? $total_pterigion+1 : $total_pterigion ;
            $total_refractivo      = ($candidate->pre_diagnostico == 'Refractivo') ? $total_refractivo+1 : $total_refractivo ;
            $total_retinopatia_dia = ($candidate->pre_diagnostico == 'Retinopatia Diabetica') ? $total_retinopatia_dia+1 : $total_retinopatia_dia ;
            $total_retinopatia_hip = ($candidate->pre_diagnostico == 'Retinopatia Hipertensiva') ? $total_retinopatia_hip+1 : $total_retinopatia_hip ;
            $total_rev_integral    = ($candidate->pre_diagnostico == 'Revision Integral') ? $total_rev_integral+1 : $total_rev_integral ;
        }

        return view('seguimiento.index',[   'candidates'            => $candidates,
                                            'total_candidatos'      => $total_candidatos,
                                            'total_femenino'        => $total_femenino,
                                            'total_masculino'       => $total_masculino,
                                            'total_otro'            => $total_otro,
                                            'total_catarata'        => $total_catarata,
                                            'total_conjuntivitis'   => $total_conjuntivitis,
                                            'total_exc_sosp'        => $total_exc_sosp,
                                            'total_iridopatia'      => $total_iridopatia,
                                            'total_oculoplastica'   => $total_oculoplastica,
                                            'total_maculopatia'     => $total_maculopatia,
                                            'total_pterigion'       => $total_pterigion,
                                            'total_refractivo'      => $total_refractivo,
                                            'total_retinopatia_dia' => $total_retinopatia_dia,
                                            'total_retinopatia_hip' => $total_retinopatia_hip,
                                            'total_rev_integral'    => $total_rev_integral,
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