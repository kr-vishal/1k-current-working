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
        Schema::create('line_ups', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('match_id');
            $table->unsignedBigInteger('team_id');
            $table->unsignedBigInteger('player_1_id');
            $table->unsignedBigInteger('player_2_id');
            $table->unsignedBigInteger('player_3_id');
            $table->unsignedBigInteger('player_4_id');
            $table->unsignedBigInteger('player_5_id');
            $table->unsignedBigInteger('player_6_id');
            $table->unsignedBigInteger('player_7_id');
            $table->unsignedBigInteger('player_8_id');
            $table->unsignedBigInteger('player_9_id');
            $table->unsignedBigInteger('player_10_id');
            $table->unsignedBigInteger('player_11_id');
            $table->timestamps();

            $table->foreign('match_id')
                  ->references('id')->on('matches')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('team_id')
                  ->references('id')->on('teams')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_1_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_2_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_3_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_4_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_5_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_6_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_7_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_8_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_9_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_10_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('player_11_id')
                  ->references('id')->on('players')
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
        Schema::dropIfExists('line_ups');
    }
};
