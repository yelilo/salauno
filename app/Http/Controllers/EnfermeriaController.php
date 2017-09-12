<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;
use App\candidate;
use App\campaign;
use App\exploration;
use Session;
use Redirect;

class EnfermeriaController extends Controller
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
            $candidates = candidate::where('etapa','=','Enfermeria')
                            ->where('campaign_id','=',$campaign->id)->get();
            return view('enfermeria.index',['candidates'=>$candidates]);
        }
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
        $render = new RenderController;
        $form_render = $render->index(8,$id);
        $candidate = candidate::find($id);
        return view('enfermeria/editar',['candidate'=>$candidate,'form_render'=>$form_render]);
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
        $exploration = exploration::where('candidate_id','=',$id)->first();
        $presion_intraocular = $request->Iz_presion_intraocular."/".$request->Der_presion_intraocular;
        $glucosa_capilar = $request->Iz_glucosa_capilar."/".$request->Der_glucosa_capilar;
        $presion_arterial = $request->Iz_presion_arterial."/".$request->Der_presion_arterial;
        $exploration->presion_intraocular = $presion_intraocular;
        $exploration->glucosa_capilar = $glucosa_capilar;
        $exploration->presion_arterial = $presion_arterial;
        $exploration->presion_estado_medicion = $request->presion_estado_medicion;
        $exploration->save();
        $candidate = candidate::where('id','=',$id)->first();
        $candidate->etapa = $request->etapa;
        $candidate->save();
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