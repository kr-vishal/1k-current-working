<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use TCG\Voyager\Traits\Resizable;

class Team extends Model
{
    use HasFactory, Resizable;

    public function coach(): BelongsTo
    {
        return $this->belongsTo(Coach::class);
    }

    public function stadium(): BelongsTo{
        return $this->belongsTo(Stadium::class);
    }

    public function country(){
        return $this->belongsTo(Country::class);
    }
}
