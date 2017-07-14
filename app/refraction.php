<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class refraction extends Model
{
	protected $fillable = [
		'od_av_lejana',
		'oi_av_lejana',
		'od_estenopeic',
		'oi_estenopeic',
		'od_av_cercana',
		'oi_av_cercana',
		'od_av_lejana',
		'oi_av_lejana',
		'od_pio',
		'oi_pio',
		'refaccion_od_esferico',
		'refaccion_oi_esferico',
		'refaccion_od_cilindrico',
		'refaccion_oi_cilindrico',
		'refaccion_od_eje',
		'refaccion_oi_eje',
		'refaccion_od_av',
		'refaccion_oi_av',
		'refaccion_add',
		'refaccion_final_od_esferico',
		'refaccion_final_oi_esferico',
		'refaccion_final_od_cilindrico',
		'refaccion_final_oi_cilindrico',
		'refaccion_final_od_eje',
		'refaccion_final_oi_eje',
		'refaccion_final_od_av',
		'refaccion_final_oi_av',
		'refaccion_final_add'
	];

	public function user()
    {
    	return $this->belongsTo(User::class);
    }
}
