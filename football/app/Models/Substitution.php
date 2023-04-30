<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Substitution extends Model
{
    use HasFactory;

    public function match(): BelongsTo
    {
        return $this->belongsTo(TeamMatch::class, 'match_id');
    }

    public function playerOut(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_out_id');
    }

    public function playerIn(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_in_id');
    }

    public function team(): BelongsTo
    {
        return $this->belongsTo(Team::class);
    }
}
