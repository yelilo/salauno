<?php

namespace App;

use Illuminate\Database\Eloquent\Model;
use Carbon\Carbon;

class candidate extends Model
{
    protected $fillable = [
		'campaign_id',
		'user_id',
		'codigo',
		'nombres',
		'apellidos',
		'etapa',
		'fecha_nacimiento',
		'edad',
		'genero',
		'ocupacion',
		'seguro_medico',
		'seguro_medico_otro',
		'numero_poliza',
		'telefono_fijo',
		'telefono_celular',
		'telefono_otro',
		'correo_electronico',
		'domicilio_cp',
		'domicilio_estado',
		'domicilio_poblacion',
		'domicilio_ciudad',
		'domicilio_colonia',
		'domicilio_numero_exterior',
		'domicilio_numero_interior',
		'diabetes',
		'diabetes_anios',
		'diabetes_tratamiento',
		'hipertension',
		'hipertension_anios',
		'hipertension_tratamiento',
		'dialisis',
		'familiar_glucosa',
		'otra_enfermedad',
		'disminucion_vista',
		'examen_visual',
		'examen_visual_tiempo',
		'retinopatia_diabetica',
		'cirugia_ojo',
		'tipo_cirugia',
		'presion',
		'glucosa',
		'firma',
		'clinica',
		'fecha_cita',
		'tipo_consulta',
		'hora_consulta',
    ];

    public function user()
    {
    	return $this->belongsTo(User::class);
    }

    public function explorations()
    {
        return $this->hasMany(exploration::class);
    }

    // public function setAttribute($path)
    // {
    // 	$this->attributes['path'] = Carbon::now()->second.$path->getClientOriginalName;
    // 	$name = Carbon::now()->second.$path->getClientOriginalName;
    // 	\Storage::disk('local')->put($name, \File::get($path));
    // }

    // public static function Candidate()
    // {
    // 	# code...
    // }
}
