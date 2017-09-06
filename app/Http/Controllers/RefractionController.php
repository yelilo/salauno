<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Session;
use Redirect;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Http\Controllers\RenderController;
use App\candidate;
use App\campaign;
use App\refraction;
use App\result;

class RefractionController extends Controller
{
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
            $candidates = candidate::where('etapa','=','Optica')
                            ->where('campaign_id','=',$campaign->id)->get();
            return view('refraction.index',['candidates'=>$candidates]);
        }
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function create()
    {
        //
    }

    /**
     * Store a newly created resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @return \Illuminate\Http\Response
     */
    public function store(Request $request)
    {
        //
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
        $form_render = $render->index(5,$id);
        $candidate = candidate::find($id);
        return view('refraction/editar',['candidate'=>$candidate,'form_render'=>$form_render]);
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
        $etapa = 'Consejeria';
        $campaign = campaign::where('activo','=','Si')->first();
        $refraction = refraction::where('candidate_id','=',$id)->first();
        //$refraction = refraction::find($id);
            $refraction->campaign_id                 = $campaign->id;
            $refraction->user_id                     = $request->user()->id;
            $refraction->od_av_lejana                = $request->od_av_lejana;
            $refraction->oi_av_lejana                = $request->oi_av_lejana;
            $refraction->od_cv_estenopeic            = $request->od_cv_estenopeic;
            $refraction->oi_cv_estenopeic            = $request->oi_cv_estenopeic;
            $refraction->od_av_cercana               = $request->od_av_cercana;
            $refraction->oi_av_cercana               = $request->oi_av_cercana;
            $refraction->od_av_rx                    = $request->od_av_rx;
            $refraction->oi_av_rx                    = $request->oi_av_rx;
            $refraction->od_presion_intraocular      = $request->od_presion_intraocular;
            $refraction->oi_presion_intraocular      = $request->oi_presion_intraocular;
            $refraction->od_r_esferico               = $request->od_r_esferico;
            $refraction->oi_r_esferico               = $request->oi_r_esferico;
            $refraction->od_r_cilíndrico             = $request->od_r_cilíndrico;
            $refraction->oi_r_cilíndrico             = $request->oi_r_cilíndrico;
            $refraction->od_r_eje                    = $request->od_r_eje;
            $refraction->oi_r_eje                    = $request->oi_r_eje;
            $refraction->od_r_av                     = $request->od_r_av;
            $refraction->oi_r_av                     = $request->oi_r_av;
            $refraction->r_adicion                   = $request->r_adicion;
            $refraction->od_rf_esferico              = $request->od_rf_esferico;
            $refraction->oi_rf_esferico              = $request->oi_rf_esferico;
            $refraction->od_rf_cilíndrico            = $request->od_rf_cilíndrico;
            $refraction->oi_rf_cilíndrico            = $request->oi_rf_cilíndrico;
            $refraction->od_rf_eje                   = $request->od_rf_eje;
            $refraction->oi_rf_eje                   = $request->oi_rf_eje;
            $refraction->od_rf_av                    = $request->od_rf_av;
            $refraction->oi_rf_av                    = $request->oi_rf_av;
            $refraction->od_rf_distancia_nasopupilar = $request->od_rf_distancia_nasopupilar;
            $refraction->oi_rf_distancia_nasopupilar = $request->oi_rf_distancia_nasopupilar;
            $refraction->rf_adicion                  = $request->rf_adicion;
            $refraction->optometrista_responsable    = $request->optometrista_responsable;
        $refraction->save();

        $candidate = candidate::find($id);
        $candidate->etapa = $etapa;
        $candidate->save();
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" se ha enviado a "'.$etapa.'"');
        return Redirect::to('refraction');
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
