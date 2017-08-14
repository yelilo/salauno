@extends('layouts.app')

@section('content')
<script type="text/javascript">
	$(document).ready(function() {
		$("input[type=checkbox]").on('click', function(event) {
			var id = $(this).attr('id');
			var id = id.substr(3);
			var valor = '';
			var valorOD = '';
			var valorOI = '';
			if ($('#OD_'+id).prop('checked')) {
				valorOD = $('#OD_'+id).val();
			}
			if ($('#OI_'+id).prop('checked')) {
				valorOI = $('#OI_'+id).val();
			}
			valor = valorOD+','+valorOI;
			$('#'+id).val(valor);
		});

		// Parpados Normal
			if ($('#OD_parpados_normal').prop('checked')) {
				$('.OD_parpados').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OD_parpados').removeAttr('disabled');
			}

			if ($('#OI_parpados_normal').prop('checked')) {
				$('.OI_parpados').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OI_parpados').removeAttr('disabled');
			}

			$('#OD_parpados_normal').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OD_parpados').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OD_parpados').removeAttr('disabled');
				}
			});

			$('#OI_parpados_normal').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OI_parpados').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OI_parpados').removeAttr('disabled');
				}
			});
		// Iris
			if ($('#OD_iris_no_valorable').prop('checked')) {
				$('.OD_iris').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OD_iris').removeAttr('disabled');
			}

			if ($('#OI_iris_no_valorable').prop('checked')) {
				$('.OI_iris').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OI_iris').removeAttr('disabled');
			}

			$('#OD_iris_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OD_iris').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OD_iris').removeAttr('disabled');
				}
			});

			$('#OI_iris_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OI_iris').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OI_iris').removeAttr('disabled');
				}
			});
		// Vitreo
			if ($('#OD_vitreo_transparente').prop('checked')) {
				$('.OD_vitreo').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OD_vitreo').removeAttr('disabled');
			}

			if ($('#OI_vitreo_transparente').prop('checked')) {
				$('.OI_vitreo').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OI_vitreo').removeAttr('disabled');
			}

			$('#OD_vitreo_transparente').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OD_vitreo').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OD_vitreo').removeAttr('disabled');
				}
			});

			$('#OI_vitreo_transparente').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OI_vitreo').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OI_vitreo').removeAttr('disabled');
				}
			});
		// Retina
			if ($('#OD_retina_no_valorable').prop('checked')) {
				$('.OD_retina').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OD_retina').removeAttr('disabled');
			}

			if ($('#OI_retina_no_valorable').prop('checked')) {
				$('.OI_retina').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OI_retina').removeAttr('disabled');
			}

			$('#OD_retina_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OD_retina').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OD_retina').removeAttr('disabled');
				}
			});

			$('#OI_retina_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OI_retina').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OI_retina').removeAttr('disabled');
				}
			});
		// Macula
			if ($('#OD_macula_no_valorable').prop('checked')) {
				$('.OD_macula').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OD_macula').removeAttr('disabled');
			}

			if ($('#OI_macula_no_valorable').prop('checked')) {
				$('.OI_macula').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OI_macula').removeAttr('disabled');
			}

			$('#OD_macula_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OD_macula').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OD_macula').removeAttr('disabled');
				}
			});

			$('#OI_macula_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OI_macula').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OI_macula').removeAttr('disabled');
				}
			});
		// Papila
			if ($('#OD_papila_no_valorable').prop('checked')) {
				$('.OD_papila').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OD_papila').removeAttr('disabled');
			}

			if ($('#OI_papila_no_valorable').prop('checked')) {
				$('.OI_papila').attr({
					disabled: true,
					checked: false
				});
			} else {
				$('.OI_papila').removeAttr('disabled');
			}

			$('#OD_papila_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OD_papila').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OD_papila').removeAttr('disabled');
				}
			});

			$('#OI_papila_no_valorable').change(function(event) {
				if ($(this).prop('checked')) {
					$('.OI_papila').attr({
						disabled: true,
						checked: false
					});
				} else {
					$('.OI_papila').removeAttr('disabled');
				}
			});
	});
</script>
<div class="container-fluid">
		{!!Form::model($candidate, array('route' => array('exploration.store', $candidate->id),'method'=>'POST'))!!}
		{!!$form_render!!}
	        {!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}
	       	{!! Form::close() !!}
</div>
@endsection