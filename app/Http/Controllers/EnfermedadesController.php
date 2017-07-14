<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Http\Requests;

class EnfermedadesController extends Controller
{
    public function catarata()
    {
        return view('enfermedades/catarata');
    }
}
