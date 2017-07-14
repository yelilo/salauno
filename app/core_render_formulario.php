<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class core_render_formulario extends Model
{
	protected $fillable = [
		'id',
		'nombre',
		'titulo',
		'tabla',
		'activo',
		'ayuda'
	];

	public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
