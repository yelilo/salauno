@extends('layouts.app')

@section('content')
@if(Session::has('message'))
    <div class="alert alert-info" role="alert">
      <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      {{Session::get('message')}}
    </div>
  @endif
<div class="container">
  <div class="row">
    <div class="col-md-10 col-md-offset-1">
      <div class="panel panel-default">
        <div class="panel-heading">Candidatos :: Optica
        </div>
          <table class="table">
            <thead>
              <th>Código</th>
              <th>Nombre</th>
              <th>Teléfono</th>
              <th>Correo</th>
              <th></th>
            </thead>
            @foreach($candidates as $candidate)
            <tbody>
                <td>{{$candidate->codigo}}</td>
                <td>{{$candidate->nombres}} {{$candidate->apellidos}}</td>
                <td>{{$candidate->telefono_fijo}}</td>
                <td>{{$candidate->correo_electronico}}</td>
                <td>
                  {!! link_to_route('display.edit', $title = '', $parameters = $candidate->id, $attributes = array('class'=>'btn btn-default btn-xs glyphicon glyphicon-pencil','title'=>'Realizar Valoracion')) !!}
                </td>
            </tbody>
            @endforeach
          </table>
      </div>
    </div>
  </div>
</div>
@endsection