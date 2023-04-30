<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Team extends Model
{
    use HasFactory;

    public function coach(): BelongsTo
    {
        return $this->belongsTo(Coach::class);
    }

    public function stadium(): BelongsTo{
        return $this->belongsTo(Stadium::class);
    }
}
