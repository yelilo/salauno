@extends('layouts.app')

@section('content')
<div class="panel panel-primary form-horizontal">
    <div class="panel-heading">Bienvenido</div>
    <div class="panel-body">
    	<div class="">
    		<label class="col-sm-3 control-label">Campaña</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->codigo}}</p>
	        </div>
        </div>
    	<div class="">
    		<label class="col-sm-3 control-label">Aliado</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->nombre_aliado}}</p>
	        </div>
        </div>
    	<div class="">
    		<label class="col-sm-3 control-label">Doctor</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->nombre_medico}}</p>
	        </div>
        </div>
    	<div class="">
    		<label class="col-sm-3 control-label">Teléfono</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->telefono}}</p>
	        </div>
        </div>
    	<div class="">
    		<label class="col-sm-3 control-label">Correo Electrónico</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->correo_electronico}}</p>
	        </div>
        </div>
    	<div class="">
    		<label class="col-sm-3 control-label">Dirección</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->direccion}}</p>
	        </div>
        </div>
    	<div class="">
    		<label class="col-sm-3 control-label">Promoción</label>
	        <div class="col-sm-9">
	          <p class="form-control-static">{{$campania->promocion}}</p>
	        </div>
        </div>
    </div>
</div>
@endsection
