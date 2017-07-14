@extends('layouts.app')

@section('content')
<div class="panel panel-primary">
  <div class="panel-heading">Candidatos :: Refracción
  </div>
    <table class="table">
      <thead>
        <th width="20%">Código</th>
        <th width="80%">Nombre</th>
      </thead>
      @foreach($candidates as $candidate)
      <tbody>
          <td>{{$candidate->codigo}}</td>
          <td>
            {!! link_to_route('refraction.edit', $title = $candidate->nombres.' '.$candidate->apellidos, $parameters = $candidate->id, $attributes = array('title'=>'Realizar Valoracion')) !!}
          </td>
      </tbody>
      @endforeach
    </table>
</div>
@endsection