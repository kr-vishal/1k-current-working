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
        Schema::create('stadiums', function (Blueprint $table) {
            $table->id();
            $table->string('name');
            $table->unsignedSmallInteger('country_id');
            $table->unsignedMediumInteger('city_id');
            $table->unsignedMediumInteger('capacity');
            $table->timestamps();

            $table->foreign('country_id')
                  ->references('id')
                  ->on('countries')->cascadeOnUpdate()->cascadeOnDelete();

            $table->foreign('city_id')
                  ->references('id')
                  ->on('cities')->cascadeOnUpdate()->cascadeOnDelete();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('stadiums');
    }
};
