<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Session;
use Redirect;
use App\campaign;
use App\candidate;
use App\Http\Requests;
use App\Http\Controllers\ExplorationController;
use App\Http\Controllers\RenderController;
use DB;

class ConsejeriaController extends Controller
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
            $candidates = candidate::where('etapa','=','Consejeria')
                                    ->where('campaign_id','=',$campaign->id)->get();
            return view('consejeria.index',['candidates'=>$candidates]);
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
        $candidate   = candidate::find($id);
        $campaign = campaign::find($candidate->campaign_id);
        if($candidate->clinica != null){
            $idClinica = $candidate->clinica;
            $clinica = DB::selectone('SELECT * FROM clinics WHERE id =\''.$idClinica.'\'');
            return view('ticket',['candidate'=>$candidate, 'campaign' => $campaign, 'clinica'=>$clinica]);
        }        
        return view('ticket',['candidate'=>$candidate, 'campaign' => $campaign]);
    }

    /**
     * Show the form for editing the specified resource.
     *
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function edit($id)
    {
        $render      = new RenderController;
        $form_render = $render->index(6,$id);
        $candidate   = candidate::find($id);
        return view('consejeria/editar',['candidate'=>$candidate,'form_render'=>$form_render]);
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
        $etapa = 'Terminado';
        $candidate = candidate::find($id);
            $candidate->etapa      = $etapa;
            $candidate->status     = $request->status;
            $candidate->fecha_cita = $request->fecha_cita;
            $candidate->clinica    = $request->clinica;
            $candidate->tipo_consulta = $request->tipo_consulta;
            $candidate->hora_consulta = $request->hora_consulta;
        $candidate->save();
        if($request->comprobante) {
            return $this->show($id);
        }
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" se ha enviado a Seguimiento');
        return Redirect::to('consejeria');
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
