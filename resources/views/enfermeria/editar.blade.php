@extends('layouts.app')

@section('content')

<div class="container-fluid">
	{!!Form::model($candidate, array('route' => array('enfermeria.update', $candidate->id),'method'=>'PUT'))!!}
	{!!$form_render!!}
    {!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
    {!! Form::close() !!}
</div>
@endsection