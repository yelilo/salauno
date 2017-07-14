<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class core_render_campos extends Model
{
	protected $fillable = [
		'id',
		'nombre',
		'titulo',
		'seccion_id',
		'formulario_id',
		'orden',
		'tipo',
		'longitud',
		'script',
		'class',
		'ayuda',
		'activo',
		'tabla',
		'obligatorio',
		'placeholder'
	];

	public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
