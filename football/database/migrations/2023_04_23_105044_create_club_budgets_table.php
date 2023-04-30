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
        Schema::create('club_budgets', function ( Blueprint $table ) {
            $table->id();
            $table->unsignedBigInteger('club_id');
            $table->year('budget_year');
            $table->double('budget_amount', 20, 6, true);
            $table->timestamps();

            $table->foreign('club_id')
                  ->references('id')->on('clubs')
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
        Schema::dropIfExists('club_budgets');
    }
};
