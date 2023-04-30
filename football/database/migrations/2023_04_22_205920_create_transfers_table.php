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
        Schema::create('transfers', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('player_id');
            $table->unsignedBigInteger('from_team_id');
            $table->unsignedBigInteger('to_team_id');
            $table->date('transfer_date');
            $table->unsignedInteger('transfer_fee');
            $table->timestamps();

            $table->foreign('player_id')
                  ->references('id')->on('players')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('from_team_id')
                  ->references('id')->on('teams')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('to_team_id')
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
        Schema::dropIfExists('transfers');
    }
};
