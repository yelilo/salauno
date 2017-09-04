@extends('layouts.app')

@section('content')

<div class="panel panel-default">
    <div class="panel-heading">Bienvenido</div>
    <div class="panel-body">
    <div class="panel-body">
    </div>
        <div class="media">
            <div class="media-left">
                <a href="#">
                  <img class="media-object" src="img/marti_coqueto.png" alt="Salauno Marti">
                </a>
            </div>
            <div class="media-body">
                <h4 class="media-heading">Nuestra misión</h4>
                <h3>“Eliminar la ceguera innecesaria en México”</h3>
                </br></br>
                <button type="button" class="btn btn-primary" onclick="location.href='home'">
                    Ingresa
                </button>
                @if(!$candidatos && $version)
                    {!! link_to_route('welcome.index', $title = 'Actualizar', $parameters = 0, $attributes = array('class'=>'btn btn-primary','title'=>'Editar')) !!}
                @elseif($candidatos > 0 && $version)
                    <h4 class="text-primary">"Aún quedan candidatos pendientes por enviar a SF"</h4>
                @endif
            </div>
        </div>
    </div>
</div>
@endsection
