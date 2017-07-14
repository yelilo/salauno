@extends('layouts.app')

@section('content')
<div class="container-fluid">
      {!! Form::open(['route' => 'campaign.store', 'method'=>'POST']) !!}
        {{-- @include('campaign.form') --}}
        {!!$form_render!!}
        {!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
      {!! Form::close() !!}
</div>
@endsection