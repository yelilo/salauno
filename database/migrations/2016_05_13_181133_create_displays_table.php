<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateRefractionsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('refractions', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->index();
            $table->integer('user_id')->index();
            $table->decimal('od_av_lejana',10,2)->nullable();
            $table->decimal('oi_av_lejana',10,2)->nullable();
            $table->decimal('od_estenopeic',10,2)->nullable();
            $table->decimal('oi_estenopeic',10,2)->nullable();
            $table->decimal('od_av_cercana',10,2)->nullable();
            $table->decimal('oi_av_cercana',10,2)->nullable();
            $table->decimal('od_av_rx',10,2)->nullable();
            $table->decimal('oi_av_rx',10,2)->nullable();
            $table->decimal('od_pio',10,2)->nullable();
            $table->decimal('oi_pio',10,2)->nullable();
            $table->decimal('refaccion_od_esferico',10,2)->nullable();
            $table->decimal('refaccion_oi_esferico',10,2)->nullable();
            $table->decimal('refaccion_od_cilindrico',10,2)->nullable();
            $table->decimal('refaccion_oi_cilindrico',10,2)->nullable();
            $table->decimal('refaccion_od_eje',10,2)->nullable();
            $table->decimal('refaccion_oi_eje',10,2)->nullable();
            $table->decimal('refaccion_od_av',10,2)->nullable();
            $table->decimal('refaccion_oi_av',10,2)->nullable();
            $table->decimal('refaccion_add',10,2)->nullable();
            $table->decimal('refaccion_final_od_esferico',10,2)->nullable();
            $table->decimal('refaccion_final_oi_esferico',10,2)->nullable();
            $table->decimal('refaccion_final_od_cilindrico',10,2)->nullable();
            $table->decimal('refaccion_final_oi_cilindrico',10,2)->nullable();
            $table->decimal('refaccion_final_od_eje',10,2)->nullable();
            $table->decimal('refaccion_final_oi_eje',10,2)->nullable();
            $table->decimal('refaccion_final_od_av',10,2)->nullable();
            $table->decimal('refaccion_final_oi_av',10,2)->nullable();
            $table->decimal('refaccion_final_add',10,2)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::drop('refractions');
    }
}
