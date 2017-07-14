
	<div class="panel panel-default">
		<div class="panel-heading">Datos Informativos</div>
		<div class="panel-body">
			<div class="form-group">
        		{!! Form::label('Campaña Activa') !!}
				<div class="radio">
        			{!! Form::label('') !!}
            		{!! Form::radio('activo','Si') !!} Si
        			{!! Form::label('') !!}
					{!! Form::radio('activo','No') !!} No
				</div>
			</div>
			<div class="form-group">
        		{!! Form::label('Fecha de Inicio') !!}
        		{!! Form::date('fecha_inicio',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Fecha de Termino') !!}
        		{!! Form::date('fecha_termino',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Nombre del Aliado') !!}
        		{!! Form::text('nombre_aliado',null,['class'=>'form-control','placeholder'=>'Nombres, Apellidos Paterno y Materno']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Nombre del Doctor') !!}
        		{!! Form::text('nombre_doctor',null,['class'=>'form-control','placeholder'=>'Nombres, Apellidos Paterno y Materno']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Correo Electronico') !!}
				{!! Form::email('corre_electronico',null,['class'=>'form-control','placeholder'=>'correo@correo.com']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Telefono') !!}
				{!!Form::number('telefono',null,['class'=>'form-control'])!!}
			</div>
			<div class="form-group">
        		{!! Form::label('Status') !!}
        		{!! Form::select('status',[
						'' => 'Seleccione',
						'En progeso' => 'En progeso',
						'Planeada'   => 'Planeada',
						'Completada' => 'Completada',
						'Cancelada'  => 'Cancelada',
					],null,['class' =>'form-control']) !!}
			</div>
	  	</div>
	</div>	
    <div class="panel panel-default">
		<div class="panel-heading">Dirección</div>
		<div class="panel-body">
			<div class="form-group">
        		{!! Form::label('Codigo Postal') !!}
        		{!! Form::number('domicilio_cp',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Estado/Poblacion/Municipio') !!}
        		{!! Form::text('domicilio_poblacion',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Ciudad') !!}
        		{!! Form::text('domicilio_ciudad',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Colonia') !!}
        		{!! Form::text('domicilio_colonia',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Numero Exterior') !!}
				{!! Form::text('domicilio_numero_exterior',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Numero Interior') !!}
				{!! Form::text('domicilio_numero_interior',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Descripcion') !!}
				{!! Form::text('domicilio_descripcion',null,['class'=>'form-control','placeholder'=>'Ingresa una breve descripcion del lugar ejemplo: Poblado pequeño a 10 minutos del km 31 carretera México Toluca']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Altitud') !!}
				{!! Form::text('geolocalizacion_altitud',null,['class'=>'form-control']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Longitud') !!}
				{!! Form::text('geolocalizacion_longitud',null,['class'=>'form-control']) !!}
			</div>
	  	</div>
	</div>
	<div class="panel panel-default">
		<div class="panel-heading">Datos de Campaña</div>
		<div class="panel-body">
			<div class="form-group">
        		{!! Form::label('Codigo de Campaña') !!}
        		{!! Form::text('codigo',null,['class'=>'form-control','placeholder'=>'Introduce el codigo de Campaña ejemplo: C-CA-ABCD-0000']) !!}
			</div>
			<div class="form-group">
        		{!! Form::label('Tipo de Campaña') !!} <span class="glyphicon glyphicon-question-sign">&nbsp;</span><br>
        		<label class="radio-inline">{!!Form::radio('A', 'tipo_campaña', false,['class'=>''])!!} A</label>
        		<label class="radio-inline">{!!Form::radio('AA', 'tipo_campaña', false,['class'=>''])!!} AA</label>
        		<label class="radio-inline">{!!Form::radio('AAA', 'tipo_campaña', false,['class'=>''])!!} AAA</label>
        		<br>
        		<label class="radio-inline">{!!Form::radio('B', 'tipo_campaña', false,['class'=>''])!!} B</label>
        		<label class="radio-inline">{!!Form::radio('BB', 'tipo_campaña', false,['class'=>''])!!} BB</label>
        		<label class="radio-inline">{!!Form::radio('BBB', 'tipo_campaña', false,['class'=>''])!!} BBB</label>
        		<br>
        		<label class="radio-inline">{!!Form::radio('C', 'tipo_campaña', false,['class'=>''])!!} C</label>
        		<label class="radio-inline">{!!Form::radio('CC', 'tipo_campaña', false,['class'=>''])!!} CC</label>
        		<label class="radio-inline">{!!Form::radio('CCC', 'tipo_campaña', false,['class'=>''])!!} CCC</label>
			</div>
			<div class="form-group">
        		{!! Form::label('Transporte') !!}<br>
        		<label class="radio-inline">{!!Form::radio('Taxi', 'trasporte', false,['class'=>''])!!} Taxi</label>
        		<label class="radio-inline">{!!Form::radio('Camioneta', 'trasporte', false,['class'=>''])!!} Camioneta</label>
        		<label class="radio-inline">{!!Form::radio('Auto', 'trasporte', false,['class'=>''])!!} Auto</label>
			</div>
			<div class="form-group">
	    		{!! Form::label('Papeleria') !!}
	    		<div class="checkbox">
				  <label>
				    {!!Form::checkbox('checklist_foto', 'papeleria', false,['class'=>''])!!}
				    Check list de revisión de foto
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('fotos_tripticos', 'papeleria', false,['class'=>''])!!}
				    Folletos y trípticos
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('cupon_referencia', 'papeleria', false,['class'=>''])!!}
				    Cupón de referencia
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('hojas_referencia', 'papeleria', false,['class'=>''])!!}
				    Hojas de referencias para el médico
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('hojas_registro', 'papeleria', false,['class'=>''])!!}
				    Hojas de registo
				  </label>
				</div>
			</div>
			<div class="form-group">
	    		{!! Form::label('Promocion') !!}
	    		<div class="checkbox">
				  <label>
				    {!!Form::checkbox('sistema', 'promocion', false,['class'=>''])!!}
				    Promoción válida y en sistema
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('banner', 'promocion', false,['class'=>''])!!}
				    Banner
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('muro', 'promocion', false,['class'=>''])!!}
				    Muro
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('poster', 'promocion', false,['class'=>''])!!}
				    Póster
				  </label>
				</div>
			</div>
			<div class="form-group">
	    		{!! Form::label('¿Cual?') !!}
	    		{!! Form::text('nombre_aliado',null,['class'=>'form-control','placeholder'=>'Ingresa detalle de la Promocion']) !!}
			</div>
			<div class="form-group">
	    		{!! Form::label('Equipo') !!}
	    		<div class="checkbox">
				  <label>
				    {!!Form::checkbox('focus', 'equipo', false,['class'=>''])!!}
				    Focus
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('optica_movil', 'equipo', false,['class'=>''])!!}
				    Optica Movil
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('autorefractometro', 'equipo', false,['class'=>''])!!}
				    Autorefractometro
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('stand', 'equipo', false,['class'=>''])!!}
				    Stand
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('caja_pruebas', 'equipo', false,['class'=>''])!!}
				    Caja de Pruebas
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('oclusores', 'equipo', false,['class'=>''])!!}
				    Oclusores
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('retinoscopio', 'equipo', false,['class'=>''])!!}
				    Retinoscopio
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('oftalmoscopio', 'equipo', false,['class'=>''])!!}
				    Oftalmoscopio
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('cartillas', 'equipo', false,['class'=>''])!!}
				    Cartillas
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('armazones', 'equipo', false,['class'=>''])!!}
				    Armazones
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('terminal_bancaria', 'equipo', false,['class'=>''])!!}
				    Terminal Bancaria
				  </label>
				</div>
				<div class="checkbox">
				  <label>
				    {!!Form::checkbox('laptop', 'equipo', false,['class'=>''])!!}
				    Laptop
				  </label>
				</div>
			</div>
		</div>
	</div>
</div>
    	{!! Form::submit('Guardar',['class'=>'btn btn-primary']) !!}