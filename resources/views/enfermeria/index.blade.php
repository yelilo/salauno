@extends('layouts.app')

@section('content')
@if(Session::has('message'))
    <div class="alert alert-info" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      {{Session::get('message')}}
    </div>
  @endif
<div class="panel panel-default">
  <div class="panel-heading">Candidatos :: Enfermeria</div>
    <table class="table">
      <thead>
        <th>Codigo</th>
        <th>Nombre</th>
        <th></th>
      </thead>
      @foreach($candidates as $candidate)
      <tbody>
          <td>{{$candidate->codigo}}</td>
          <td>{{$candidate->nombres}} {{$candidate->apellidos}}</td>
          <td>
            {!! link_to_route('enfermeria.edit', $title = '', $parameters = $candidate->id, $attributes = array('class'=>'btn btn-default glyphicon glyphicon-pencil','title'=>'Editar')) !!}
          </td>
      </tbody>
      @endforeach
    </table>
</div>
@endsection