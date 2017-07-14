<?php

namespace App;

use Illuminate\Foundation\Auth\User as Authenticatable;

class User extends Authenticatable
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password',
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    // public function setPasswordAttribute($value)
    // {

    // }

    public function campaigns()
    {
        return $this->hasMany(campaign::class);
    }

    public function candidates()
    {
        return $this->hasMany(candidate::class);
    }

    public function explorations()
    {
        return $this->hasMany(exploration::class);
    }

    public function refractions()
    {
        return $this->hasMany(refraction::class);
    }
}
