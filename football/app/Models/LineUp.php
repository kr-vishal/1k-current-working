<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class LineUp extends Model
{
    use HasFactory;

    public function match(): BelongsTo
    {
        return $this->belongsTo(TeamMatch::class, 'match_id');
    }

    public function team(): BelongsTo
    {
        return $this->belongsTo(Team::class);
    }

    public function player1(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_1_id');
    }

    public function player2(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_2_id');
    }

    public function player3(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_3_id');
    }

    public function player4(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_4_id');
    }

    public function player5(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_5_id');
    }

    public function player6(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_6_id');
    }

    public function player7(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_7_id');
    }

    public function player8(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_8_id');
    }

    public function player9(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_9_id');
    }

    public function player10(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_10_id');
    }

    public function player11(): BelongsTo
    {
        return $this->belongsTo(Player::class, 'player_11_id');
    }
}
