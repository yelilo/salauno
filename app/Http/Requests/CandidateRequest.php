<?php

namespace App\Http\Requests;
use Validator;
use App\Http\Requests\Request;

class CandidateRequest extends Request
{
    // protected $redirect = "candidate/edit";
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize()
    {
        return true;
    }

    /**
     * Get the validation rules that apply to the request.
     *
     * @return array
     */
    public function rules()
    {
        return [
            'nombres'          =>'required',
            'apellidos'        =>'required',
            'fecha_nacimiento' =>'required',
            'genero'           =>'required',
            'telefono_celular' =>'required',
            'cirugia_ojo'      =>'required',
            'domicilio_cp'     =>'min:5|max:5',
            'ocupacion'        =>'required',
        ];
    }
    /**
     * Get the error messages for the defined validation rules.
     *
     * @return array
     */
    public function messages()
    {
        return [
            'nombres.required'          => 'El campo Nombre es requerido',
            'apellidos.required'        => 'El campo Apellidos es requerido',
            'fecha_nacimiento.required' => 'El campo Fecha de Nacimiento es requerido',
            'genero.required'           => 'El campo Genero es requerido',
            'telefono_celular.required' => 'El campo Telefono Celular es requerido',
            'cirugia_ojo.required'      => 'El campo Cirugia de Ojo es requerido',
            'apellidos.min'             => 'El codigo postal tiene que ser de 5 digitos',
            'apellidos.max'             => 'El codigo postal tiene que ser de 5 digitos',
        ];
    }
}
