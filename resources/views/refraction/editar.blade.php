@extends('layouts.app')

@section('content')

<div class="container-fluid">
	{!!Form::model($candidate, array('route' => array('refraction.update', $candidate->id),'method'=>'PUT'))!!}
	{!!$form_render!!}
    {!! Form::submit('Enviar a Consejeria',['class'=>'btn btn-primary']) !!}
    {!! Form::close() !!}
</div>
@endsection