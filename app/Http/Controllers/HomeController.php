<?php

namespace App\Http\Controllers;

use App\Http\Requests;
use App\campaign;
use Session;
use Redirect;
use Illuminate\Http\Request;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Http\Response
     */
    public function index()
    {
        $campania = campaign::where('activo','Si')->first();
        if (empty($campania->id)) {
            Session::flash('message','No hay Campaña activada');
            return Redirect::to('campaign');
        }
        return view('home',['campania'=>$campania]);
    }
}
