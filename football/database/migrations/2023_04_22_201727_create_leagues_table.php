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
        Schema::create('leagues', function ( Blueprint $table ) {
            $table->id();
            $table->string('name');
            $table->unsignedSmallInteger('country_id');
            $table->date('start_date');
            $table->date('end_date');
            $table->timestamps();

            $table->index(['start_date', 'end_date'], 'league_date_idx');

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
        Schema::dropIfExists('leagues');
    }
};
