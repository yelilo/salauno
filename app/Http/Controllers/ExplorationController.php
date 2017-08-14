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
use App\exploration;
use App\result;

class ExplorationController extends Controller
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
            $candidates = DB::table('candidates')
                    ->join('explorations', 'explorations.candidate_id', '=', 'candidates.id')
                    ->where('candidates.etapa','=','Exploracion')
                    ->where('candidates.campaign_id','=',$campaign->id)
                    ->select('candidates.*', 'explorations.prediagnostico')
                    ->get();
            return view('exploration.index',['candidates'=>$candidates]);
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
        $campaign    = campaign::where('activo','=','Si')->first();
        $exploration = exploration::find($request->id);
            $exploration->campaign_id                           = $campaign->id;
            $exploration->user_id                               = $request->user()->id;
            $exploration->parpados_posicion                     = $request->parpados_posicion;
            $exploration->parpados_ptosis                       = $request->parpados_ptosis;
            $exploration->parpados_otros                        = $request->parpados_otros;
            $exploration->segmento_anterior_secrecion           = $request->segmento_anterior_secrecion;
            $exploration->segmento_anterior_quemosis            = $request->segmento_anterior_quemosis;
            $exploration->segmento_anterior_hiperemia           = $request->segmento_anterior_hiperemia;
            $exploration->segmento_anterior_pterigion           = $request->segmento_anterior_pterigion;
            $exploration->segmento_anterior_catarata_incipiente = $request->segmento_anterior_catarata_incipiente;
            $exploration->segmento_anterior_catarata_avanzada   = $request->segmento_anterior_catarata_avanzada;
            $exploration->segmento_anterior_hemorragia          = $request->segmento_anterior_hemorragia;
            $exploration->segmento_anterior_sinequia            = $request->segmento_anterior_sinequia;
            $exploration->segmento_anterior_otros               = $request->segmento_anterior_otros;
            $exploration->iris_dpa                              = $request->iris_dpa;
            $exploration->iris_aniridia                         = $request->iris_aniridia;
            $exploration->iris_anisocoria                       = $request->iris_anisocoria;
            $exploration->iris_rubeosis                         = $request->iris_rubeosis;
            $exploration->iris_reflejo_ausente                  = $request->iris_reflejo_ausente;
            $exploration->iris_ectropion_uveal                  = $request->iris_ectropion_uveal;
            $exploration->iris_otros                            = $request->iris_otros;
            $exploration->vitreo_transparente                   = $request->vitreo_transparente;
            $exploration->vitreo_hemorragia                     = $request->vitreo_hemorragia;
            $exploration->vitreo_sinquisis                      = $request->vitreo_sinquisis;
            $exploration->vitreo_otros                          = $request->vitreo_otros;
            $exploration->retina_desprendimiento                = $request->retina_desprendimiento;
            $exploration->retina_microaneurismas                = $request->retina_microaneurismas;
            $exploration->retina_exudados                       = $request->retina_exudados;
            $exploration->retina_drusas                         = $request->retina_drusas;
            $exploration->retina_fondo_coroideo                 = $request->retina_fondo_coroideo;
            $exploration->retina_hemorragias                    = $request->retina_hemorragias;
            $exploration->retina_neovasos                       = $request->retina_neovasos;
            $exploration->retina_cruce_av_sospechoso            = $request->retina_cruce_av_sospechoso;
            $exploration->retina_tortosidad_venosa              = $request->retina_tortosidad_venosa;
            $exploration->retina_adelgazamiento_vascular        = $request->retina_adelgazamiento_vascular;
            $exploration->retina_otros                          = $request->retina_otros;
            $exploration->macula_brillo                         = $request->macula_brillo;
            $exploration->macula_edema                          = $request->macula_edema;
            $exploration->macula_desprendimiento                = $request->macula_desprendimiento;
            $exploration->macula_exudados                       = $request->macula_exudados;
            $exploration->macula_drusas                         = $request->macula_drusas;
            $exploration->macula_hemorragias                    = $request->macula_hemorragias;
            $exploration->macula_otros                          = $request->macula_otros;
            $exploration->papila_excavacion_fisiologica         = $request->papila_excavacion_fisiologica;
            $exploration->papila_excavacion_sospechosa          = $request->papila_excavacion_sospechosa;
            $exploration->papila_neovasos                       = $request->papila_neovasos;
            $exploration->papila_vasos_bayoneta                 = $request->papila_vasos_bayoneta;
            $exploration->papila_hemorragia_astila              = $request->papila_hemorragia_astila;
            $exploration->presion_intraocular                   = $request->presion_intraocular;
            $exploration->glucosa_capilar                       = $request->glucosa_capilar;
            $exploration->presion_arterial                      = $request->presion_arterial;
            $exploration->presion_estado_medicion               = $request->presion_estado_medicion;
            $exploration->papila_otros                          = $request->papila_otros;
            $exploration->prediagnostico                        = 'Si';
        $exploration->save();

        // <<< Reglas impresion de prediagnostico

             $retinopatia_diabetica = '';
            if (strpos($request->retina_microaneurismas,'D')||
               strpos($request->retina_exudados,'D')||
               strpos($request->retina_exudados_duros,'D')||
               strpos($request->retina_neovasos,'D') ||
               strpos($request->retina_hemorragias,'D')) {
                $retinopatia_diabetica .= 'D';
                echo(strpos($request->retina_microaneurismas,'D'));
            }
            if(strpos($request->retina_microaneurismas,'OI') ||
               strpos($request->retina_exudados,'OI') ||
               strpos($request->retina_exudados_duros,'OI') ||
               strpos($request->retina_neovasos,'OI') ||
               strpos($request->retina_hemorragias,'OI')){
                $retinopatia_diabetica .= 'OI';
            }
            if(strlen($retinopatia_diabetica)>3){
                $retinopatia_diabetica = 'AO';
            }
            
            $retinopatia_hipertensiva = '';
            if(strpos($request->retina_cruce_av_sospechoso,'D')||
               strpos($request->retina_tortosidad_venosa,'D')||
               strpos($request->retina_hemorragias,'D')){
                $retinopatia_hipertensiva .= 'D';
            }
            if(strpos($request->retina_cruce_av_sospechoso,'OI') ||
               strpos($request->retina_tortosidad_venosa,'OI') ||
               strpos($request->retina_hemorragias,'OI')){
                $retinopatia_hipertensiva .= 'OI';
            }
            if(strlen($retinopatia_hipertensiva)>3){
                $retinopatia_hipertensiva = 'AO';
            }
            
            $maculopatia = '';
             if(strpos($request->macula_edema,'D') ||
               strpos($request->macula_drusas,'D') ||
               strpos($request->macula_desprendimiento,'D') ||
               strpos($request->macula_exudados,'D')){
                $maculopatia .= 'OD';
            }
            if(strpos($request->macula_edema,'OI') ||
               strpos($request->macula_drusas,'OI') ||
               strpos($request->macula_desprendimiento,'OI') ||
               strpos($request->macula_exudados,'OI')){
                $maculopatia .= 'OI';
            }
            if(strlen($maculopatia)>3){
                $maculopatia = 'AO';
            }

            $glaucoma = '';
            if(strpos($request->papila_excavacion_sospechosa,'D')||
               strpos($request->papila_neovasos,'D')||
               strpos($request->papila_vasos_bayoneta,'D')||
               strpos($request->papila_hemorragia_astila,'D')){
                $glaucoma .= 'OD';
            }
            if(strpos($request->papila_excavacion_sospechosa,'OI') ||
               strpos($request->papila_neovasos,'OI') ||
               strpos($request->papila_vasos_bayoneta,'OI') ||
               strpos($request->papila_hemorragia_astila,'OI')){
                $glaucoma .= 'OI';
            }
            if(strlen($glaucoma)>3){
                $glaucoma = 'AO';
            }
            
            $pterigion = '';
            if(strpos($request->papila_neovasos,'D')){
                $pterigion .= 'OD';
            }
            if(strpos($request->papila_neovasos,'OI')){
                $pterigion .= 'OI';
            }
            if(strlen($pterigion)>3){
                $pterigion = 'AO';
            }

            $catarata_incipiente = '';
            if(strpos($request->segmento_anterior_catarata_incipiente,'D')){
                $catarata_incipiente .= 'OD';
            }
            if(strpos($request->segmento_anterior_catarata_incipiente,'OI')){
                $catarata_incipiente .= 'OI';
            }
            if(strlen($catarata_incipiente)>3){
                $catarata_incipiente = 'AO';
            }

            $catarata_avanzada = '';
            if(strpos($request->segmento_anterior_catarata_avanzada,'D')){
                $catarata_avanzada .= 'OD';
            }
            if(strpos($request->segmento_anterior_catarata_avanzada,'OI')){
                $catarata_avanzada .= 'OI';
            }
            if(strlen($catarata_avanzada)>3){
                $catarata_avanzada = 'AO';
            }

            $conjuntivitis = '';
            if(strpos($request->segmento_anterior_quemosis,'D') ||
               strpos($request->segmento_anterior_secrecion,'D')||
               strpos($request->segmento_anterior_hiperemia,'D')){
                $conjuntivitis .= 'OD';
            }
            if(strpos($request->segmento_anterior_quemosis,'OI') ||
               strpos($request->segmento_anterior_secrecion,'OI') ||
               strpos($request->segmento_anterior_hiperemia,'OI')){
                $conjuntivitis .= 'OI';
             }
             if(strlen($conjuntivitis)>3){
                $conjuntivitis = 'AO';
            }

            $oculoplastica = '';
            if(strpos($request->parpados_posicion,'D') ||
               strpos($request->parpados_ptosis,'D')){
                $oculoplastica = 'OD';
            }
            if(strpos($request->parpados_posicion,'OI') ||
               strpos($request->parpados_ptosis,'OI')){
                $oculoplastica = 'OI';
            }
            if(strlen($oculoplastica)>3){
                $oculoplastica = 'AO';
            }
            
            $arrayResults = array(  $retinopatia_diabetica,
                                    $retinopatia_hipertensiva,
                                    $maculopatia,
                                    $glaucoma,
                                    $pterigion,
                                    $catarata_incipiente,
                                    $catarata_avanzada,
                                    $oculoplastica,
                                    $conjuntivitis);

            $resSearch = array_search('Si', $arrayResults);

            $revision_integral = (empty($resSearch)) ? 'Si' : 'No' ;

            $results = result::where('candidate_id','=',$request->id)->first();
            if (empty($results)) {
                $results = new result;
                $results->candidate_id                  = $request->id;
            } else {
                $results = result::where('candidate_id','=',$request->id)->first();
            }
                $results->user_id                  = $request->user()->id;
                $results->retinopatia_diabetica    = $retinopatia_diabetica;
                $results->retinopatia_hipertensiva = $retinopatia_hipertensiva;
                $results->maculopatia              = $maculopatia;
                $results->glaucoma                 = $glaucoma;
                $results->pterigion                = $pterigion;
                $results->catarata_incipiente      = $catarata_incipiente;
                $results->catarata_avanzada        = $catarata_avanzada;
                $results->oculoplastica            = $oculoplastica;
                $results->conjuntivitis            = $conjuntivitis;
                $results->revision_integral        = $revision_integral;
                $results->save();
        // Reglas impresion de prediagnostico >>>

        return $this->show($request->id);
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
        $results     = result::where('candidate_id', '=', $id)->first();
        $render      = new RenderController;
        $form_render = $render->index(4,$id);
        return view('exploration/resultados',['candidate'=>$candidate,'results'=>$results,'form_render'=>$form_render]);
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
        $form_render = $render->index(3,$id);
        $candidate = candidate::find($id);
        return view('exploration/editar',['candidate'=>$candidate,'form_render'=>$form_render]);
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
            $candidate->pre_diagnostico         = $request->pre_diagnostico;
            $candidate->ojo_prediagnostico      = $request->ojo_prediagnostico;
            $candidate->etapa                   = $request->etapa;
        $candidate->save();
        Session::flash('message','El Candidato "'.$candidate->nombres.' '.$candidate->apellidos.'" se ha enviado a "'.$request->etapa.'"');
        return Redirect::to('exploration');
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

    public function getResultadosExploracion($id)
    {


        return $arrayResult;
    }
}
