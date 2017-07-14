@extends('layouts.app')

@section('content')
<div class="panel panel-default">
  <div class="panel-heading">Candidatos :: Revisiones
  </div>
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
            {!! link_to_route('review.edit', $title = '', $parameters = $candidate->id, $attributes = array('class'=>'btn btn-default glyphicon glyphicon-pencil','title'=>'Editar')) !!}
          </td>
      </tbody>
      @endforeach
    </table>
</div>
@endsection