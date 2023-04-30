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
        Schema::create('coaches', function ( Blueprint $table ) {
            $table->id();
            $table->string('name');
            $table->unsignedSmallInteger('nationality_id');
            $table->date('dob');
            $table->unsignedBigInteger('team_id');
            $table->timestamps();

            $table->foreign('team_id', 'teams')->references('id')->on('teams')
                  ->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('nationality_id')
                  ->references('id')
                  ->on('nationalities')->cascadeOnDelete()->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('coaches');
    }
};
