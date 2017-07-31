@extends('layouts.app')

@section('content')

	<div class="container-fluid">
	  <div class="panel panel-primary">
	    <div class="panel-heading">Nuevo Candidato</div>
	    <div class="panel-body">
	    {!! Form::open(['route' => 'candidate.store', 'method'=>'POST'],['data-toggle'=>'validator']) !!}
	      {{-- @include('candidate.form') --}}
	      {{-- <input type="" name="campo" value="{{old('campo')}}"> --}}
	      {!!$form_render!!}
					{!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
	    {!! Form::close() !!}
	    <br>
	    </div>
	  </div>
	</div>
@endsection