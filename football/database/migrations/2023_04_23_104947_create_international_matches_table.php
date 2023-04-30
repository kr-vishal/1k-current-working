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
        Schema::create('international_matches', function ( Blueprint $table ) {
            $table->id();
            $table->date('match_date');
            $table->unsignedBigInteger('home_national_team_id');
            $table->unsignedBigInteger('away_national_team_id');
            $table->unsignedBigInteger('referee_id');
            $table->unsignedBigInteger('competition_id');
            $table->unsignedTinyInteger('home_team_score');
            $table->unsignedTinyInteger('away_team_score');
            $table->enum('match_status', [
                'scheduled',
                'in_progress',
                'completed'
            ]);
            $table->timestamps();

            $table->foreign('home_national_team_id')
                  ->references('id')->on('national_teams')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('away_national_team_id')
                  ->references('id')->on('national_teams')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('competition_id')
                  ->references('id')->on('competitions')
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
        Schema::dropIfExists('international_matches');
    }
};
