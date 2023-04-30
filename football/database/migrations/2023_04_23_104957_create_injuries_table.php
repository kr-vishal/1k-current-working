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
        Schema::create('injuries', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('player_id');
            $table->unsignedBigInteger('match_id');
            $table->string('description');
            $table->date('date');
            $table->date('expected_return_date');
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
        Schema::dropIfExists('injuries');
    }
};
