$(document).ready(function() {
	alert('hola');
	if ($('#diabetes').value() == 'No') {
		$('#campos_diabetes').hide();
	} else {
		$('#campos_diabetes').show();
	}
});
