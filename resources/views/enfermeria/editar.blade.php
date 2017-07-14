@extends('layouts.app')
@section('content')
<div class="container-fluid">
	<div class="panel panel-primary">
		<div class="panel-heading">Revision</div>
		{!!Form::model($candidate, array('route' => array('enfermeria.update', $candidate->id),'method'=>'PUT'))!!}
		<div class="panel-body">
			<div class="panel panel-default">
				<div class="panel-heading">Candidato</div>
				<div class="panel-body">
					<div class="form-group">
		        		{!! Form::label('Codigo: ') !!} {!!$candidate->codigo!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Nombre Completo: ') !!} {!!$candidate->nombres!!} {!!$candidate->apellidos!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Edad: ') !!} {!!$candidate->edad!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Diabetes: ') !!} {!!$candidate->diabetes!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Hipertension: ') !!} {!!$candidate->hipertension!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Dialisis: ') !!} {!!$candidate->hipertension!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Otra Enfermedad: ') !!} {!!$candidate->hipertension!!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Presión') !!}
		        		{!! Form::number('presion',null,['class'=>'form-control']) !!}
					</div>
					<div class="form-group">
		        		{!! Form::label('Glucosa') !!}
						{!! Form::number('glucosa',null,['class'=>'form-control']) !!}
					</div>
					<div class="form-group">
						{!!Form::hidden('etapa','Consejeria')!!}
					</div>
			  	</div>
			</div>
			{!! Form::submit('Enviar a Consejería',['class'=>'btn btn-primary']) !!}
		</div>
	  	{!! Form::close() !!}
	</div>
</div>
@endsection