<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCampaignsTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('campaigns', function (Blueprint $table) {
            $table->increments('id');
            $table->integer('user_id')->index()->comment('Usuario responsable');
            $table->enum('status',['En progeso','Planeada','Completada','Cancelada'])->default('Planeada')->comment('Status de campaña');
            $table->unique('codigo',20);
            $table->text('descripcion_campania')->nullable();
            $table->text('promociones')->nullable();
            $table->date('fecha_inicio')->nullable();
            $table->date('fecha_termino')->nullable();
            $table->integer('domicilio_cp')->nullable();
            $table->string('domicilio_estado',50)->nullable();
            $table->string('domicilio_poblacion',50)->nullable();
            $table->string('domicilio_ciudad',50)->nullable();
            $table->string('domicilio_colonia',50)->nullable();
            $table->string('domicilio_numero_exterior',50)->nullable();
            $table->string('domicilio_numero_interior',50)->nullable();
            $table->text('domicilio_descripcion')->nullable();
            $table->string('geolocalicacion_altitud',50)->nullable();
            $table->string('geolocalicacion_longitus',50)->nullable();
            $table->decimal('importe',10,2)->nullable();
            $table->decimal('ingresos',10,2)->nullable();
            $table->enum('activo',['Si','No'])->default('No');
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
        Schema::drop('campaigns');
    }
}
