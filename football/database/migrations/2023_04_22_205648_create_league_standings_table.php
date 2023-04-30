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
        Schema::create('league_standings', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('league_id');
            $table->unsignedBigInteger('team_id');
            $table->unsignedSmallInteger('points');
            $table->unsignedSmallInteger('games_played');
            $table->unsignedSmallInteger('wins');
            $table->unsignedSmallInteger('draws');
            $table->unsignedSmallInteger('losses');
            $table->unsignedSmallInteger('goals_for');
            $table->unsignedSmallInteger('goals_against');
            $table->unsignedSmallInteger('goal_difference');

            $table->timestamps();

            $table->foreign('league_id')
                  ->references('id')->on('leagues')
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
        Schema::dropIfExists('league_standings');
    }
};
