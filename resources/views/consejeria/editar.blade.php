@extends('layouts.app')

@section('content')
<script type="text/javascript">
	$(document).ready(function() {
		// <<< Resultados de prediagnostico
			if ($('#retinopatia_diabetica').val() == 'No') {
				$('#retinopatia_diabetica').hide();
				$('.retinopatia_diabetica').hide();
			}

			if ($('#maculopatia').val() == 'No') {
				$('#maculopatia').hide();
				$('.maculopatia').hide();
			}

			if ($('#retinopatia_hipertensiva').val() == 'No') {
				$('#retinopatia_hipertensiva').hide();
				$('.retinopatia_hipertensiva').hide();
			}

			if ($('#refractivo').val() == 'No') {
				$('#refractivo').hide();
				$('.refractivo').hide();
			}

			if ($('#pterigion').val() == 'No') {
				$('#pterigion').hide();
				$('.pterigion').hide();
			}

			if ($('#catarata_avanzada').val() == 'No') {
				$('#catarata_avanzada').hide();
				$('.catarata_avanzada').hide();
			}

			if ($('#catarata_incipiente').val() == 'No') {
				$('#catarata_incipiente').hide();
				$('.catarata_incipiente').hide();
			}

			if ($('#glaucoma').val() == 'No') {
				$('#glaucoma').hide();
				$('.glaucoma').hide();
			}

			if ($('#oculoplastica').val() == 'No') {
				$('#oculoplastica').hide();
				$('.oculoplastica').hide();
			}

			if ($('#conjuntivitis').val() == 'No') {
				$('#conjuntivitis').hide();
				$('.conjuntivitis').hide();
			}

			if ($('#iridopatia').val() == 'No') {
				$('#iridopatia').hide();
				$('.iridopatia').hide();
			}

			if ($('#revision_integral').val() == 'No') {
				$('#revision_integral').hide();
				$('.revision_integral').hide();
			}
	});
</script>
<div class="container-fluid">
{!!Form::model($candidate, array('route' => array('consejeria.update', $candidate->id),'method'=>'PUT','files'=>true))!!}
	{!!$form_render!!}
{!! Form::submit('Termina Proceso',['class'=>'btn btn-primary']) !!}
{!! Form::submit('Comprobante',['class'=>'btn btn-primary', 'name'=>'comprobante']) !!}
{!! Form::close() !!}
</div>
@endsection