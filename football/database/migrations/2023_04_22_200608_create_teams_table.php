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
        Schema::create('teams', function ( Blueprint $table ) {
            $table->id();
            $table->string('name');
            $table->unsignedSmallInteger('country_id');
            $table->string('logo')->nullable();
            $table->unsignedBigInteger('stadium_id');
            $table->timestamps();

            $table->foreign('stadium_id')
                  ->references('id')
                  ->on('stadiums')->cascadeOnDelete()->cascadeOnDelete();

            $table->foreign('country_id')
                  ->references('id')
                  ->on('countries')->cascadeOnDelete()->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('teams');
    }
};
