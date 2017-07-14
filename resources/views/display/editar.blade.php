@extends('layouts.app')

@section('content')

<div class="container-fluid">
	<div class="panel panel-primary">
		<div class="panel-heading">Optica</div>
		{!!Form::model($candidate, array('route' => array('display.update', $candidate->id),'method'=>'PUT'))!!}
		<div class="panel-body">
			<div class="panel panel-default">
				<div class="panel-heading">Candidato</div>
				<div class="panel-body">
					<div class="form-group">
	            		{!! Form::label('Código único:') !!} {!!$candidate->codigo!!}<br>
	            		{!! Form::label('Nombres:') !!} {!!$candidate->nombres!!} {!!$candidate->apellidos!!}
	            		{!! Form::hidden('candidate_id',$candidate->id) !!}
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">Agudeza Visual</div>
				<div class="panel-body">
					<div class="form-group">
	            		{!! Form::label('A. V. Lejana') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::select('od_av_lejana',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::select('oi_av_lejana',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('C. V. con estenopéic') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::select('od_estenopeic',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::select('oi_estenopeic',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('A. V. Cercana') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::select('od_av_cercana',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::select('oi_av_cercana',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('A. V. con Rx Actual') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::select('od_av_rx',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::select('oi_av_rx',[
									'20' => '20',
									'25' => '25',
									'30' => '30',
									'40' => '40',
									'50' => '50',
									'60' => '60',
									'70' => '70',
									'80' => '80',
									'100' => '100',
									'200' => '200',
									'400' => '400',
								],null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('PIO') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('od_pio',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('oi_pio',null,['class'=>'form-control']) !!}
						</div>
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">Refraccion</div>
				<div class="panel-body">
					<div class="form-group">
	            		{!! Form::label('Esférico') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_od_esferico',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_oi_esferico',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('Cilíndrico') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_od_cilindrico',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_oi_cilindrico',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('Eje') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_od_eje',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_oi_eje',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('A. V.') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_od_av',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_oi_av',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
		        		{!! Form::label('ADD') !!}
						{!! Form::number('refaccion_add',null,['class'=>'form-control']) !!}
					</div>
				</div>
			</div>
			<div class="panel panel-default">
				<div class="panel-heading">Refraccion Final</div>
				<div class="panel-body">
					<div class="form-group">
	            		{!! Form::label('Esférico') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_final_od_esferico',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_final_oi_esferico',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('Cilíndrico') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_final_od_cilindrico',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_final_oi_cilindrico',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('Eje') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_final_od_eje',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_final_oi_eje',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
	            		{!! Form::label('A. V.') !!}</br>
						<div class="form-inline">
	            			{!! Form::label('OD ') !!}
						    {!! Form::number('refaccion_final_od_av',null,['class'=>'form-control']) !!}
						    {!! Form::label('OI ') !!}
						    {!! Form::number('refaccion_final_oi_av',null,['class'=>'form-control']) !!}
						</div>
					</div>
					<div class="form-group">
		        		{!! Form::label('ADD') !!}
						{!! Form::number('refaccion_final_add',null,['class'=>'form-control']) !!}
					</div>
				</div>
			</div>
			<div class="form-group">
	        	{!! Form::label('Enviar a: ') !!}
				<label class="radio-inline">
		           	{!!Form::radio('etapa', 'Enfermeria', false)!!} Enfermeria
				</label>
				<label class="radio-inline">
		           	{!!Form::radio('etapa', 'Consejeria', false)!!} Consejeria
				</label>
			</div>
		    {!! Form::submit('Enviar',['class'=>'btn btn-primary']) !!}
		    {!! Form::close() !!} 
		</div>
	</div>
</div>
@endsection