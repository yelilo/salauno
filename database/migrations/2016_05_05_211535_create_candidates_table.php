<?php

use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateCandidatesTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('candidates', function (Blueprint $table) {
            $table->increments('id');
            $table->string('user_id')->index();
            $table->string('campaign_id')->index();
            $table->string('codigo')->unique();
            $table->string('nombres')->nullable();
            $table->string('apellidos')->nullable();
            $table->date('fecha_nacimiento')->nullable();
            $table->integer('edad')->nullable();
            $table->enum('genero',['Femenino','Masculino'])->nullable();
            $table->string('ocupacion')->nullable();
            $table->enum('seguro_medico',['IMSS', 'ISSSTE', 'POPULAR', 'PRIVADO', 'OTRO', 'NINGUNO'])->nullable();
            $table->string('seguro_medico_otro')->nullable();
            $table->string('numero_poliza')->nullable();
            $table->integer('telefono_fijo')->nullable();
            $table->integer('telefono_celular')->nullable();
            $table->integer('telefono_otro')->nullable();
            $table->string('correo_electronico')->nullable();
            $table->string('domicilio_cp')->nullable();
            $table->string('domicilio_estado')->nullable();
            $table->string('domicilio_poblacion')->nullable();
            $table->string('domicilio_ciudad')->nullable();
            $table->string('domicilio_colonia')->nullable();
            $table->string('domicilio_numero_exterior')->nullable();
            $table->string('domicilio_numero_interior')->nullable();
            $table->enum('diabetes',['Si','No'])->nullable();
            $table->integer('diabetes_anios')->nullable();
            $table->enum('diabetes_tratamiento',['Si','No'])->nullable();
            $table->enum('hipertension',['Si','No'])->nullable();
            $table->integer('hipertension_anios')->nullable();
            $table->enum('hipertension_tratamiento',['Si','No'])->nullable();
            $table->enum('dialisis',['Si','No'])->nullable();
            $table->enum('familiar_glucosa',['Si','No','No se'])->nullable();
            $table->string('otra_enfermedad')->nullable();
            $table->enum('disminucion_vista',['Si','No'])->nullable();
            $table->enum('examen_visual',['Si','No'])->nullable();
            $table->enum('examen_visual_tiempo',['-1 año','+1 año'])->nullable();
            $table->enum('retinopatia_diabetica',['Si','No'])->nullable();
            $table->enum('cirugia_ojo',['Si','No'])->nullable();
            $table->string('tipo_cirugia')->nullable();
            $table->decimal('presion',10,2)->nullable();
            $table->decimal('glucosa',10,2)->nullable();
            $table->text('firma',10,2)->nullable();
            $table->enum('etapa',['Registro','Revision','Exploracion','Optica','Enfermeria','Consejeria','Terminado'])->default('Registro');
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
        Schema::drop('candidates');
    }
}
