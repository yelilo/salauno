<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class core_render_secciones extends Model
{
	protected $fillable = [
		'id',
		'nombre',
		'titulo',
		'orden',
		'activo',
		'formulario_id'
	];

	public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
