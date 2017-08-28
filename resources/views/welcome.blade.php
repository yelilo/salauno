@extends('layouts.app')

@section('content')
<?php
use App\candidate;
?>
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
                <?php
                    function actualizar(){
                        system("cmd /c C:."\".xampp."\".htdocs."\".salauno");
                    }
                    $candidates = candidate::where('etapa','!=','Enviado a SF')->get();
                    $nCandidatos = sizeof($candidates);
                    if($nCandidatos != 0){
                        echo('<br><br><h4><p class="bg-danger">Aún quedan pacientes por enviar a Salesforce</p></h4>');
                    }
                    else{
                        echo('<button class = "btn btn-primary" onclick = actualizar()>Actualizar</button>');
                    }
                ?>
            </div>
        </div>
    </div>
</div>
@endsection
