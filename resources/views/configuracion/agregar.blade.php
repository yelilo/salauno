@extends('layouts.app')

@section('content')

<div class="panel panel-primary">
	<div class="panel-heading">Configuracion :: Agregar Tipo de Consulta</div>
  	<div class="panel-body">
  	<br>
  	<input type="text" name="Agregar" value="Nueva consulta">
  	<br><br>
  	{!! link_to_route('configuracion.show', $title = 'Agregar', $parameters = $opciones, $attributes = array('class'=>'btn btn-primary','title'=>'Agregar')) !!}
  	</div>
</div>

@endsection