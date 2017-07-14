@extends('layouts.app')

@section('content')
<div class="panel panel-primary">
  <div class="panel-heading">Candidatos :: Tamizaje</div>
    <table class="table">
      <thead>
        <th width="20%">Código</th>
        <th width="70%">Nombre</th>
        <th width="10%" style="text-align:right;">{!! link_to_route('candidate.create', $title = 'Nuevo', $parameters = 1, $attributes = array('class'=>'btn btn-default btn-sm')) !!}</th>
      </thead>
      @foreach($candidates as $candidate)
      <tbody>
          <td>{{$candidate->codigo}}</td>
          <td colspan="2">
            {!! link_to_route('review.edit', $title = $candidate->nombres.' '.$candidate->apellidos, $parameters = $candidate->id, $attributes = array('title'=>'Editar')) !!}
          </td>
      </tbody>
      @endforeach
    </table>
</div>
{!! $candidates->render() !!}
@endsection