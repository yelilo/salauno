<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use Session;
use Redirect;
use App\Http\Requests\ReviewRequest;
use App\Http\Controllers\RenderController;
use App\candidate;

class ReviewController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $candidates = candidate::where('etapa','=','Revision')->get();
        $etapa = array('titulo' => 'Revision');
        return view('review.index',['candidates'=>$candidates,'etapa'=>$etapa]);
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
        $form_render = $render->index(2,$id);
        $candidate = candidate::find($id);
        return view('review/editar',['candidate'=>$candidate,'form_render'=>$form_render]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  int  $id
     * @return \Illuminate\Http\Response
     */
    public function update($id,ReviewRequest $request)
    {
        $candidate = candidate::find($id);
            $candidate->etapa        = $request->etapa;
            $candidate->motivo_etapa = $request->motivo_etapa;
        $candidate->save();
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" se ha enviado a "'.$request->etapa.'"');
        return Redirect::to('candidate/');
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
