<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class InternationalMatch extends Model
{
    use HasFactory;

    public function home_national_team(): BelongsTo
    {
        return $this->belongsTo(NationalTeam::class, 'home_national_team_id');
    }

    public function away_national_team(): BelongsTo
    {
        return $this->belongsTo(NationalTeam::class, 'away_national_team_id');
    }

    public function referee(): BelongsTo
    {
        return $this->belongsTo(Referee::class);
    }

    public function competition(): BelongsTo
    {
        return $this->belongsTo(Competition::class);
    }
}
