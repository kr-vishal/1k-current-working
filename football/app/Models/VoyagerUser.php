<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Notifications\Notifiable;
use Laravel\Passport\HasApiTokens;

class VoyagerUser extends \TCG\Voyager\Models\User
{
    use HasFactory, HasApiTokens, Notifiable;

    protected $table = 'users';
}
