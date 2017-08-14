@extends('layouts.app')

@section('content')
		<style type="text/css">
			@media print{
				#ticket {
					height: 80%;
					width: 100%;
					margin-left: 0%;
				}
				.noImp{
					display: none;
				}
			}
			div.ticket {
				height: 80%;
				width: 80%;
				margin-left: 10%;
			}
			.texto{
					padding-top: 5%; 
					font-size: 4ex;
					font-family: sans-serif;
			}
			img.logo {
				width: 80%;
			}
			img.codigoBarras {
				width: 90%;
			}
		</style>
		<div media="print" id="ticket" class = "ticket">
			<div style="text-align: center;">
				<img src="/salauno/resources/views/ticket/salauno.bmp" class="logo" media="print"><br>
			</div>
			<br>
			<div class="texto">
				<strong>
					<p>Nombre: {{$candidate->nombres}} {{$candidate->apellidos}}</p>
					<p align="left">Paciente: {{$candidate->codigo}}<br>
					Campaña: {{$campaign->codigo}}</p>
					<p>Prediagnostico: {{$candidate->pre_diagnostico}} &nbsp ({{$candidate->ojo_prediagnostico}})</p>
					@if($candidate->status == 'Con cita')
					<p style="text-align: center;">Información de cita:<p>
					<p>
					<?php
						$hora = substr($candidate->hora_consulta, 0,5);
						$fecha_ord = "Fecha: ".substr($candidate->fecha_cita, 5, 2).'-'
						.substr($candidate->fecha_cita, 8, 2).'-'
						.substr($candidate->fecha_cita, 0, 4);  
						echo($fecha_ord."&nbsp &nbsp");
						echo("<br>Hora: ".$hora."<br>");
					?>
					Consulta: {{$candidate->tipo_consulta}}<br>
					Clinica: {{$clinica->nombre}}<br>
					{{$clinica->direccion}}</p>
					@endif
				</strong>
			</div>
			<div style="size: 100%; text-align: center;">
				<?php
					$mensaje = "EX-123456";
					echo("<img src=\"/salauno/resources/views/ticket/codigoBarras.php?&mensaje=".$candidate->codigo."\" class=\"codigoBarras\"/>");
				?>
			</div>
			<div class="texto" style="text-align: center;">
				<strong>
					Telefono: (55) 6728 3000 &nbsp &nbsp &nbsp &nbsp www.salauno.mx
				</strong>
			</div>
		</div>
@endsection