<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class result extends Model
{
    protected $fillable = [
		'candidate_id',
		'ojo_izq_cat',
		'ojo_izq_rdnp',
		'ojo_izq_rdp',
		'ojo_izq_mac',
		'ojo_izq_err_refractivo',
		'ojo_izq_estravismo',
		'ojo_izq_pt',
		'ojo_izq_conjuntivitis',
		'ojo_izq_gnv',
		'ojo_izq_sano',
		'ojo_izq_blefaritis',
		'ojo_izq_seco',
		'ojo_izq_excsosp',
		'ojo_izq_otro',
		'ojo_der_cat',
		'ojo_der_rdnp',
		'ojo_der_rdp',
		'ojo_der_mac',
		'ojo_der_err_refractivo',
		'ojo_der_estravismo',
		'ojo_der_pt',
		'ojo_der_conjuntivitis',
		'ojo_der_gnv',
		'ojo_der_sano',
		'ojo_der_blefaritis',
		'ojo_der_seco',
		'ojo_der_excsosp',
		'ojo_der_otro',
    ];
}
