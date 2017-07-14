<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateExplorationsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('explorations', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('candidate_id')->index();
            $table->integer('user_id')->index();
            $table->string('descripcion')->nullable();
            $table->enum('ojo_derecho',['Si','No'])->nullable();
            $table->enum('ojo_izquierdo',['Si','No'])->nullable();
            $table->enum('no_aplica',['Si','No'])->nullable();
            $table->text('observaciones')->nullable();
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
        Schema::drop('explorations');
    }
}
