@extends('layouts.app')

@section('content')

<div class="container-fluid">
		{!! Form::model($campaign, array('route' => array('campaign.update', $campaign->id),'method'=>'PUT')) !!}
			{{-- @include('campaign.form') --}}
			{!!$form_render!!}
			{!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
		{!! Form::close() !!}
</div>
@endsection