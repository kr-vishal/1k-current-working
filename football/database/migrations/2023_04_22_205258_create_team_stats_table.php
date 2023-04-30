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
        Schema::create('team_stats', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('team_id');
            $table->unsignedBigInteger('match_id');
            $table->unsignedSmallInteger('possession');
            $table->unsignedSmallInteger('shots_taken');
            $table->unsignedSmallInteger('shots_on_target');
            $table->unsignedSmallInteger('passes_attempted');
            $table->unsignedSmallInteger('passes_completed');
            $table->unsignedSmallInteger('fouls_committed');
            $table->unsignedSmallInteger('fouls_suffered');
            $table->unsignedSmallInteger('yellow_cards');
            $table->unsignedSmallInteger('red_cards');
            $table->timestamps();

            $table->foreign('team_id')
                  ->references('id')->on('teams')
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
        Schema::dropIfExists('team_stats');
    }
};
