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

			if ($('#catarata').val() == 'No') {
				$('#catarata').hide();
				$('.catarata').hide();
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
		// Resultados de prediagnostico >>>
			// alert($('#owner',$('#appointment-form')).val());

			// $("#appointment-form").children("input").each(function(){
			// 	alert($(this).attr("id") + " has a value of " + $(this).val());
			// });

			// $( "#appointment-form" ).submit(function( event ) {
			//   alert( "Handler for .submit() called." );
			//   event.preventDefault();
			// });

			$("input").click(function(){
        alert("The paragraph was clicked.");
    });


		// $('#first-name',$('#appointment-form')).onclick(function() {
		// 	alert($(this).val());
		// });
		// $('#first-name', $('#appointment-form') ).val('Hola mundo');

		// $("#appointment-form :input[name='firstName']").val('hola mundo');
		// var allinputs = $("#appointment-form :input");
		// var formClidren = $('#appointment-form > *');
		// alert(allinputs.length);
	});
</script>
<div class="container-fluid">
{!!Form::model($candidate, array('route' => array('consejeria.update', $candidate->id),'method'=>'PUT','files'=>true))!!}
	{!!$form_render!!}
{!! Form::submit('Termina Proceso',['class'=>'btn btn-primary']) !!}
{!! Form::close() !!}
</div>
@endsection