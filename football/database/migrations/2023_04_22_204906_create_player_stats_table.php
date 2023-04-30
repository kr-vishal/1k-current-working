<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration {
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('player_stats', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('player_id');
            $table->unsignedBigInteger('match_id');
            $table->unsignedTinyInteger('goals_scored');
            $table->unsignedTinyInteger('assists');
            $table->unsignedTinyInteger('shots_taken');
            $table->unsignedTinyInteger('shots_on_target');
            $table->unsignedTinyInteger('passes_attempted');
            $table->unsignedTinyInteger('passes_completed');
            $table->unsignedTinyInteger('fouls_committed');
            $table->unsignedTinyInteger('fouls_suffered');
            $table->unsignedTinyInteger('yellow_cards');
            $table->unsignedTinyInteger('red_cards');

            $table->timestamps();

            $table->foreign('player_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('match_id')
                  ->references('id')->on('matches')
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
        Schema::dropIfExists('player_stats');
    }
};
