<?php

namespace App\Http\Requests;

use App\Http\Requests\Request;

class CampaignRequest extends Request
{
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
            'codigo'        => 'required',
            'nombre_aliado'  => 'required',
            'nombre_medico' => 'required',
            'correo_electronico' => 'required',
            'status' => 'required',
        ];
    }
}
