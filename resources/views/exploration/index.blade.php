@extends('layouts.app')

@section('content')
<div class="panel panel-primary">
  <div class="panel-heading">Candidatos :: Exploración
  </div>
    <table class="table">
      <thead>
        <th width="20%">Código</th>
        <th width="70%">Nombre</th>
        <th></th>
      </thead>
      @foreach($candidates as $candidate)
      <tbody>
          <td>{{$candidate->codigo}}</td>
          <td>{!! link_to_route('exploration.edit', $title = $candidate->nombres.' '.$candidate->apellidos, $parameters = $candidate->id, $attributes = array('title'=>'Realizar Exploración')) !!}</td>
          <td>
            @if($candidate->prediagnostico == 'Si')
              {!! link_to_route('exploration.show', $title = '', $parameters = $candidate->id, $attributes = array('class'=>'btn btn-default glyphicon glyphicon-eye-open','title'=>'Ver Resultados')) !!}
            @endif
          </td>
      </tbody>
      @endforeach
    </table>
</div>
@endsection