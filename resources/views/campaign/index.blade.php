@extends('layouts.app')

@section('content')
<script type="text/javascript">
  $('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
})
</script>
<div class="panel panel-primary">
  <div class="panel-heading">Campañas
  </div>
    <table class="table">
      <thead>
        <th>Codigo</th>
        <th>Status</th>
        <th style="text-align:right;">{!! link_to_route('campaign.create', $title = 'Nuevo', $parameters = '', $attributes = array('class'=>'btn btn-default btn-sm')) !!}</th>
      </thead>
      @foreach($campaigns as $campaign)
      <tbody>
          <th>{!! link_to_route('campaign.edit', $title = $campaign->codigo, $parameters = $campaign->id, $attributes = array('title'=>'Editar')) !!}</th>
          <td>{{$campaign->status}}</td>
          <td style="text-align:right;">
            @if($campaign->status == 'Completada')
              <input type="button" title="Terminada" value="Terminada" name="Terminada" class="btn btn-primary disabled btn-sm">
            @elseif($campaign->status == 'En Proceso')
                {{-- {!! link_to_route('campaign.show', $title = 'Enviar a SF', $parameters = $campaign->id, $attributes = array('class'=>'btn btn-primary','title'=>'Editar','data-toggle'=>'modal', 'data-target'=>'#myModal')) !!} --}}
                {!! link_to_route('campaign.show', $title = 'Enviar a SF', $parameters = $campaign->id, $attributes = array('class'=>'btn btn-info btn-sm','title'=>'Editar', 'data-loading-text'=>'Espere...', 'id'=>'btnCargar')) !!}
            @else
                {!! link_to_route('campaign.edit', $title = 'Activar', $parameters = $campaign->id, $attributes = array('class'=>'btn btn-default btn-sm','title'=>'Editar')) !!}
            @endif
          </td>
      </tbody>
      @endforeach
    </table>
</div>
{!! $campaigns->render() !!}
<!-- Modal -->
@endsection