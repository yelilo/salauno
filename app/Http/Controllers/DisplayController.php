<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use Session;
use Redirect;
use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\candidate;
use App\display;
use App\result;

class DisplayController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $candidates = candidate::where('etapa','=','Optica')->get();
        return view('display.index',['candidates'=>$candidates]);
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
        $candidate = candidate::find($id);
        return view('display/editar',['candidate'=>$candidate]);
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
        $request->user()->displays()->create([
                'candidate_id'                  => $request->candidate_id,
                'user_id'                       => $request->user_id,
                'od_av_lejana'                  => $request->od_av_lejana,
                'oi_av_lejana'                  => $request->oi_av_lejana,
                'od_estenopeic'                 => $request->od_estenopeic,
                'oi_estenopeic'                 => $request->oi_estenopeic,
                'od_av_cercana'                 => $request->od_av_cercana,
                'oi_av_cercana'                 => $request->oi_av_cercana,
                'od_av_rx'                  => $request->od_av_rx,
                'oi_av_rx'                  => $request->oi_av_rx,
                'od_pio'                        => $request->od_pio,
                'oi_pio'                        => $request->oi_pio,
                'refaccion_od_esferico'         => $request->refaccion_od_esferico,
                'refaccion_oi_esferico'         => $request->refaccion_oi_esferico,
                'refaccion_od_cilindrico'       => $request->refaccion_od_cilindrico,
                'refaccion_oi_cilindrico'       => $request->refaccion_oi_cilindrico,
                'refaccion_od_eje'              => $request->refaccion_od_eje,
                'refaccion_oi_eje'              => $request->refaccion_oi_eje,
                'refaccion_od_av'               => $request->refaccion_od_av,
                'refaccion_oi_av'               => $request->refaccion_oi_av,
                'refaccion_add'                 => $request->refaccion_add,
                'refaccion_final_od_esferico'   => $request->refaccion_final_od_esferico,
                'refaccion_final_oi_esferico'   => $request->refaccion_final_oi_esferico,
                'refaccion_final_od_cilindrico' => $request->refaccion_final_od_cilindrico,
                'refaccion_final_oi_cilindrico' => $request->refaccion_final_oi_cilindrico,
                'refaccion_final_od_eje'        => $request->refaccion_final_od_eje,
                'refaccion_final_oi_eje'        => $request->refaccion_final_oi_eje,
                'refaccion_final_od_av'         => $request->refaccion_final_od_av,
                'refaccion_final_oi_av'         => $request->refaccion_final_oi_av,
                'refaccion_final_add'           => $request->refaccion_final_add
            ]);

        $candidate = candidate::find($id);
        $candidate->etapa = $request->etapa;
        $candidate->save();
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" se ha enviado a "'.$request->etapa.'"');
        return Redirect::to('display');
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
