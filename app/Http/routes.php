<?php

/*
|--------------------------------------------------------------------------
| Application Routes
|--------------------------------------------------------------------------
|
| Here is where you can register all of the routes for an application.
| It's a breeze. Simply tell Laravel the URIs it should respond to
| and give it the controller to call when that URI is requested.
|
*/
Route::auth();
Route::get('/', function () {
    return view('welcome');
});

Route::get('/home', 'HomeController@index');

Route::group(['middleware' => 'auth'], function () {
	Route::resource('campaign', 'CampaignController');
	Route::resource('candidate', 'CandidateController');
	Route::resource('enfermeria', 'EnfermeriaController');
	Route::resource('consejeria', 'ConsejeriaController');
	Route::resource('exploration', 'ExplorationController');
	Route::resource('result', 'ResultController');
	Route::resource('refraction', 'RefractionController');
	Route::resource('review', 'ReviewController');
	Route::resource('seguimiento', 'SeguimientoController');
	Route::resource('configuracion', 'ConfiguracionController');

	Route::get('modificarCons', function(){
		return view('configuracion.modify');
	});

	Route::get('catarata_incipiente', function () {
		    return view('enfermedades.catarata');
		});

	Route::get('catarata_avanzada', function () {
		    return view('enfermedades.catarata');
		});

	Route::get('retinopatia_diabetica', function () {
		    return view('enfermedades.retinopatia_diabetica');
		});


	Route::get('retinopatia_diabetica', function () {
		    return view('enfermedades.retinopatia_diabetica');
		});

	Route::get('maculopatia', function () {
		    return view('enfermedades.maculopatia');
		});

	Route::get('retinopatia_hipertensiva', function () {
		    return view('enfermedades.retinopatia_hipertensiva');
		});

	Route::get('refractivo', function () {
		    return view('enfermedades.refractivo');
		});

	Route::get('pterigion', function () {
		    return view('enfermedades.pterigion');
		});

	Route::get('glaucoma', function () {
		    return view('enfermedades.glaucoma');
		});

	Route::get('oculoplastica', function () {
		    return view('enfermedades.oculoplastica');
		});

	Route::get('conjuntivitis', function () {
		    return view('enfermedades.conjuntivitis');
		});

	Route::get('iridopatia', function () {
		    return view('enfermedades.iridopatia');
		});
});


