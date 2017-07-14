<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateResultsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('results', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->index();
            $table->enum('ojo_izq_cat',['Si','No'])->default('No');
            $table->enum('ojo_izq_rdnp',['Si','No'])->default('No');
            $table->enum('ojo_izq_rdp',['Si','No'])->default('No');
            $table->enum('ojo_izq_mac',['Si','No'])->default('No');
            $table->enum('ojo_izq_err_refractivo',['Si','No'])->default('No');
            $table->enum('ojo_izq_estravismo',['Si','No'])->default('No');
            $table->enum('ojo_izq_pt',['Si','No'])->default('No');
            $table->enum('ojo_izq_conjuntivitis',['Si','No'])->default('No');
            $table->enum('ojo_izq_gnv',['Si','No'])->default('No');
            $table->enum('ojo_izq_sano',['Si','No'])->default('No');
            $table->enum('ojo_izq_blefaritis',['Si','No'])->default('No');
            $table->enum('ojo_izq_seco',['Si','No'])->default('No');
            $table->enum('ojo_izq_excsosp',['Si','No'])->default('No');
            $table->string('ojo_izq_otro');
            $table->enum('ojo_der_cat',['Si','No'])->default('No');
            $table->enum('ojo_der_rdnp',['Si','No'])->default('No');
            $table->enum('ojo_der_rdp',['Si','No'])->default('No');
            $table->enum('ojo_der_mac',['Si','No'])->default('No');
            $table->enum('ojo_der_err_refractivo',['Si','No'])->default('No');
            $table->enum('ojo_der_estravismo',['Si','No'])->default('No');
            $table->enum('ojo_der_pt',['Si','No'])->default('No');
            $table->enum('ojo_der_conjuntivitis',['Si','No'])->default('No');
            $table->enum('ojo_der_gnv',['Si','No'])->default('No');
            $table->enum('ojo_der_sano',['Si','No'])->default('No');
            $table->enum('ojo_der_blefaritis',['Si','No'])->default('No');
            $table->enum('ojo_der_seco',['Si','No'])->default('No');
            $table->enum('ojo_der_excsosp',['Si','No'])->default('No');
            $table->string('ojo_der_otro');
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
        Schema::drop('results');
    }
}
