<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class stage extends Model
{
	protected $fillable = [
		'id',
		'nombre',
		'titulo',
		'descripcion',
		'activo',
	];

	public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
