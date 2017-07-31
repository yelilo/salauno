<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class campaign extends Model
{
    protected $fillable = [
    	'codigo',
		'user_id',
		'status',
		'codigo',
		'descripcion_campaña',
		'promociones',
		'fecha_inicio',
		'fecha_termino',
		'domicilio_cp',
		'domicilio_estado',
		'domicilio_poblacion',
		'domicilio_ciudad',
		'domicilio_colonia',
		'domicilio_numero_exterior',
		'domicilio_numero_interior',
		'domicilio_descripcion',
		'geolocalicacion_altitud',
		'geolocalicacion_longitus',
		'importe',
		'ingresos',
		'activo',
		'Consultas',
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



