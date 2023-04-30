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
        Schema::create('referees', function ( Blueprint $table ) {
            $table->id();
            $table->string('name');
            $table->unsignedSmallInteger('nationality_id');
            $table->date('dob');
            $table->enum('level', [
                'international',
                'national',
                'regional'
            ]);

            $table->timestamps();

            $table->foreign('nationality_id')
                  ->references('id')
                  ->on('nationalities')
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
        Schema::dropIfExists('referees');
    }
};
