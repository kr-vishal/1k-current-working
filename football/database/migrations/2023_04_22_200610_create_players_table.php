<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('players', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedSmallInteger('nationality_id');
            $table->date('dob');
            $table->unsignedTinyInteger('position');
            $table->unsignedSmallInteger('jersey_number');

            $table->timestamps();

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
        Schema::dropIfExists('players');
    }
};
