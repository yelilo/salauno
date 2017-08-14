@extends('layouts.app')

@section('content')
<div class="panel panel-primary">
  <div class="panel-heading">Campaña :: Seguimiento</div>
  <div class="panel-body">
    <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
      <div class="panel panel-default">
        <div class="panel-heading" role="tab" id="headingOne">
          <h4 class="panel-title">
            <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
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
                <tr>
                  <td>{!!$total_candidatos!!}</td>
                  <td>{!!$total_femenino!!}</td>
                  <td>{!!$total_masculino!!}</td>
                  <td>{!!$total_otro!!}</td>
                </tr>
              </thead>
              <tbody>
                <tr>
                  <th>Numero de Citas</th>
                  <th>Diabetes</th>
                  <th>Hiertension</th>
                  <th>Diabetes + Hipertension</th>
                </tr>
                <tr>
                  <td>{!!$total_citas!!}</td>
                  <td>{!!$total_diabetes!!}</td>
                  <td>{!!$total_hipertension!!}</td>
                  <td>{!!$total_diabetes_hipertension!!}</td>
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
                <th>Catarata incipiente</th>
                <th>Catarata pb quirurgica</th>
                <th>Conjuntivitis</th>
                <th>Excavacion Sospechosa</th>
                <th>Fondo coroideo / Adelgazamiento retina</th>
              </tr>
              <tr>
                <td>{!!$total_catarata_incipiente!!}</td>
                <td>{!!$total_catarata_quirurgica!!}</td>
                <td>{!!$total_conjuntivitis!!}</td>
                <td>{!!$total_excavacion_sospechosa!!}</td>
                <td>{!!$total_fondo_coroideo!!}</td>
              </tr>
              <tr>
                <th>Maculopatia</th>
                <th>No valorable</th>
                <th>Oculoplastica</th>
                <th>Ojo seco</th>
                <th>Otro</th>
              </tr>
              <tr>
                <td>{!!$total_maculopatia!!}</td>
                <td>{!!$total_no_valorable!!}</td>
                <td>{!!$total_oculoplastica!!}</td>
                <td>{!!$total_ojo_seco!!}</td>
                <td>{!!$total_otro!!}</td>
              </tr>
              <tr>
                <th>Pterigion</th>
                <th>Queratocono</th>
                <th>Refractivo</th>
                <th>Retinopatia Diabetica</th>
                <th>Retinopatia Hipertensiva</th>
              </tr>
              <tr>
                <td>{!!$total_pterigion!!}</td>
                <td>{!!$total_queratocono!!}</td>
                <td>{!!$total_refractivo!!}</td>
                <td>{!!$total_retinopatia_diabetica!!}</td>
                <td>{!!$total_retinopatia_hipertensiva!!}</td>
              </tr>
              <tr>
                <th>Revision Integral</th>
                <th>Sano</th>
                <th>Sin Hallazgo</th>
                <th>Sin Pre-diagnostico</th>
                <th>Valoracion cirugia refractiva</th>
              </tr>
              <tr>
                <td>{!!$total_revision!!}</td>
                <td>{!!$total_sano!!}</td>
                <td>{!!$total_sin_hallazgo!!}</td>
                <td>{!!$total_sin_prediagnostico!!}</td>
                <td>{!!$total_valoracion_lasik!!}</td>
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
            {{-- {!!$candidates->render()!!} --}}
          </div>
        </div>
      </div>
    </div>
  </div>
</div>
@endsection