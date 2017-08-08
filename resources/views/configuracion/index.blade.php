@extends('layouts.app')

@section('content')


<div class="panel panel-primary">
	<div class="panel-heading">Configuracion</div>
  	<div class="panel-body">
  		<table>
			@foreach($opciones as $opcion)
			<tbody>
				<td>{{$opcion->nombre}}</td>
			</tbody>
			@endforeach
		</table>
		<div>
						{!! Form::open(array('url'=>'configuracion')) !!}
				{!! Form::text('Nuevo',null,['class'=>'form-control']) !!}
				{!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
			{!! Form::close() !!}
		</div>
	</div>
</div>
@endsection