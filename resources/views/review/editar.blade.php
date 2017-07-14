@extends('layouts.app')
@section('content')
<div class="container-fluid">
	{!!Form::model($candidate, array('route' => array('review.update', $candidate->id),'method'=>'PUT'))!!}
		<div class="panel-body">
		{!!$form_render!!}
	{!! Form::submit('Enviar',['class'=>'btn btn-primary']) !!}
</div>
@endsection