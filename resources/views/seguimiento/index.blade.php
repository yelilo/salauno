@extends('layouts.app')

@section('content')
<div class="panel panel-primary">
  <div class="panel-heading">Campaña :: Seguimiento</div>
  <div class="panel-body">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
          <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
              Resultados Generales
            </a>
          </h4>
        </div>
        <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
          <div class="panel-body">
            <table class="table">
              <thead>
                <tr>
                  <th>Numero de Registros</th>
                  <th>Femenino</th>
                  <th>Masculino</th>
                  <th>Otro</th>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <td>{!!$total_candidatos!!}</td>
                  <td>{!!$total_femenino!!}</td>
                  <td>{!!$total_masculino!!}</td>
                  <td>{!!$total_otro!!}</td>
                </tr>
              </tbody>
            </table>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingTwo">
          <h4 class="panel-title">
            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
              Pre-diagnosticos
            </a>
          </h4>
        </div>
        <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
          <div class="panel-body">
            <table class="table">
              <tr>
                <th>Retinopatia Diabetica</th>
                <th>Retinopatia Hipertensiva</th>
                <th>Maculopatia</th>
                <th>Refractivo</th>
                <th colspan="2">Pterigion</th>
              </tr>
              <tr>
                <td>{!!$total_retinopatia_dia!!}</td>
                <td>{!!$total_retinopatia_hip!!}</td>
                <td>{!!$total_maculopatia!!}</td>
                <td>{!!$total_refractivo!!}</td>
                <td colspan="2">{!!$total_pterigion!!}</td>
              </tr>
              <tr>
                <th>Glaucoma</th>
                <th>Catarata</th>
                <th>Conjuntivitis</th>
                <th>Oculoplastica</th>
                <th>Iridopatia</th>
                <th>Revision Integral</th>
              </tr>
               <tr>
                <td>{!!$total_exc_sosp!!}</td>
                <td>{!!$total_catarata!!}</td>
                <td>{!!$total_conjuntivitis!!}</td>
                <td>{!!$total_oculoplastica!!}</td>
                <td>{!!$total_iridopatia!!}</td>
                <td>{!!$total_rev_integral!!}</td>
              </tr>
            </table>
          </div>
        </div>
      </div>
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingThree">
          <h4 class="panel-title">
            <a class="collapsed" role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="true" aria-controls="collapseThree">
              Candidatos Registrados
            </a>
          </h4>
        </div>
        <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
          <div class="panel-body">
            <table class="table">
              <thead>
                <th>Codigo</th>
                <th>Nombre</th>
                <th>Etapa</th>
              </thead>
              @foreach($candidates as $candidate)
              <tbody>
                  <td>{{$candidate->codigo}}</td>
                  <td>{!! link_to_route('consejeria.edit', $title = $candidate->nombres.' '.$candidate->apellidos, $parameters = $candidate->id, $attributes = array('title'=>'Editar')) !!}</td>
                  <td>{{$candidate->etapa}}</td>
              </tbody>
              @endforeach
            </table>
            {!!$candidates->render()!!}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection