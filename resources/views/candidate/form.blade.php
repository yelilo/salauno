<script type="text/javascript">
	jQuery(document).ready(function($) {
		$('#campos_diabetes').hide();
		$('#campos_hipertension').hide();
		$('#examen_visual_tiempo').hide();
		$('#tipo_cirugia').hide();

		$("input[name=diabetes]").change(function () {
			if ($(this).val() == 'Si') {
				$('#campos_diabetes').show();
			} else {
				$('#campos_diabetes').hide();
			}
		});

		$("input[name=hipertension]").change(function () {
			if ($(this).val() == 'Si') {
				$('#campos_hipertension').show();
			} else {
				$('#campos_hipertension').hide();
			}
		});

		$("input[name=examen_visual]").change(function () {
			if ($(this).val() == 'Si') {
				$('#examen_visual_tiempo').show();
			} else {
				$('#examen_visual_tiempo').hide();
			}
		});

		$("input[name=cirugia_ojo]").change(function () {
			if ($(this).val() == 'Si') {
				$('#tipo_cirugia').show();
			} else {
				$('#tipo_cirugia').hide();
			}
		});

		$("input[name=otra_enfermedad]").change(function () {
			if ($(this).val() == 'Si') {
				$('#enfermedad').show();
			} else {
				$('#enfermedad').hide();
			}
		});
	});
</script>
			{{-- {{$form_render}} --}}

	{!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}