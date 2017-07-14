<div class="panel panel-primary">
	<div class="panel-heading">Modifica Candidato</div>
	<div class="panel-body">
	{!!Form::model($candidate, array('route' => array('candidate.update', $candidate->id),'method'=>'PUT'))!!}
		{!!$form_render!!}
		{!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
	{!! Form::close() !!}
	</div>
</div>