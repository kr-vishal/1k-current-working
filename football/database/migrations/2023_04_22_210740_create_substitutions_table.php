<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('substitutions', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('match_id');
            $table->unsignedBigInteger('player_out_id');
            $table->unsignedBigInteger('player_in_id');
            $table->unsignedBigInteger('team_id');
            $table->dateTime('substitution_time');
            $table->timestamps();

            $table->foreign('match_id')
                  ->references('id')->on('matches')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_out_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_in_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('team_id')
                  ->references('id')->on('teams')
                  ->cascadeOnUpdate()->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('substitutions');
    }
};
