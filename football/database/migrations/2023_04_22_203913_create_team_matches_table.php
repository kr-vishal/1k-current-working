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
        Schema::create('matches', function ( Blueprint $table ) {
            $table->id();
            $table->date('match_date');
            $table->unsignedBigInteger('home_team_id');
            $table->unsignedBigInteger('away_team_id');
            $table->unsignedBigInteger('referee_id');
            $table->unsignedBigInteger('league_id');
            $table->unsignedTinyInteger('home_team_score');
            $table->unsignedTinyInteger('away_team_score');
            $table->enum('match_status', [
                'scheduled',
                'in_progress',
                'completed'
            ]);

            $table->timestamps();

            $table->foreign('home_team_id')
                  ->references('id')
                  ->on('matches')
                  ->cascadeOnDelete()->cascadeOnUpdate();

            $table->foreign('away_team_id')
                  ->references('id')
                  ->on('matches')
                  ->cascadeOnDelete()->cascadeOnUpdate();

            $table->foreign('referee_id')
                  ->references('id')
                  ->on('referees')
                  ->cascadeOnDelete()->cascadeOnUpdate();

            $table->foreign('league_id')
                  ->references('id')
                  ->on('leagues')
                  ->cascadeOnDelete()->cascadeOnUpdate();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('matches');
    }
};
