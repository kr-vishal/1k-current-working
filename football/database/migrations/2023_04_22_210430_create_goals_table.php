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
        Schema::create('goals', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('match_id');
            $table->unsignedBigInteger('player_id');
            $table->unsignedBigInteger('team_id');
            $table->dateTime('goal_time');
            $table->timestamps();

            $table->foreign('match_id')
                  ->references('id')->on('matches')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_id')
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
        Schema::dropIfExists('goals');
    }
};
