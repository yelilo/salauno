<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class exploration extends Model
{
	protected $fillable = [
		'candidate_id',
		'user_id',
		'descripcion',
		'ojo_derecho',
		'ojo_izquierdo',
		'observaciones',
		'no_aplica',
    ];

    public function candidates()
    {
    	return $this->hasMany(candidate::class);
    }

    public function user()
    {
    	return $this->belongsTo(User::class);
    }

}
