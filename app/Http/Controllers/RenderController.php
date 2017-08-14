<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;

use DB;
use App\Http\Requests\CandidateRequest;
use App\Http\Requests;
use App\candidate;
use App\stage;
use App\campaign;
use App\core_render_formulario;
use App\core_render_secciones;
use App\core_render_campos;
use Session;
use Redirect;

class RenderController extends Controller
{
	public function index($stage_id,$id_registro)
	{
		return $form_render = $this->getFormulario($stage_id,$id_registro);
	}

	private function getFormulario($stage_id,$id_registro)
	{
        $form_render = '';
        $js          = '';
        $formulario = core_render_formulario::where('stage_id','=',$stage_id)
                    ->where('activo', '=', 'Si')
                    ->first();

        $secciones = core_render_secciones::where('formulario_id','=',$formulario->id)
                    ->where('activo', '=', 'Si')
                    ->orderby('orden')
                    ->get();

        foreach ($secciones as $key => $seccion) {
            $tipo_panel  = $seccion->class;

            if ($tipo_panel == 'panel-primary form-horizontal') {
                $form_render .= '<div class="panel panel-primary">
                                        <ul class="nav nav-pills nav-justified">';

                $stages = stage::where('activo','=','Si')->get();
                $class = '';
                foreach ($stages as $key => $stage) {
                        $class = ($stage_id == $stage->id) ? 'active' : $class ;
                        if ($class != 'disabled' || $class == 'active') {
                            switch ($stage->titulo) {
                                case 'Revision':
                                    $url = route('candidate.edit',[$id_registro]);
                                    break;
                                case 'Tamizaje':
                                    $url = route('review.edit',[$id_registro]);
                                    break;
                                case 'Exploración':
                                    $url = route('exploration.edit',[$id_registro]);
                                    break;
                                case 'Resultado Exploración':
                                    $url = route('exploration.show',[$id_registro]);
                                    break;
                                case 'Optica':
                                    $url = route('refraction.edit',[$id_registro]);
                                    break;
                                default:
                                    $url = "#";
                                    break;
                            }
                            $modal = 'data-toggle="modal" data-target="#'.$stage->nombre.'"';
                        } else {
                            $url = "#";
                            $modal = '';
                        }


                        $form_render .= '<li role="presentation" class="'.$class.'"><a href="'.$url.'" title="Editar" '.$modal.'>'.$stage->titulo.'</a></li>';
                        $class = ($class == 'active') ? 'disabled' : $class;
                }

                $form_render .= '</ul>
                                    <div class="panel-body">';
            }

            $campos = core_render_campos::where('formulario_id','=',$formulario->id)
                    ->where('seccion_id', '=', $seccion->id)
                    ->where('activo', '=', 'Si')
                    ->orderby('orden')
                    ->get();

            $form_render .= '<div class="panel '.$tipo_panel.'">
								<div class="panel-heading">'.$seccion->titulo.'</div>
								<div class="panel-body">';

            if (($formulario->id == 3 || $formulario->id == 5) && $seccion->nombre != 'candidato') {
                if($seccion->nombre == "presion"){
                    $form_render .= '<input type="hidden" name="id" id="id" value="'.$id_registro.'">';
                    $form_render .= '<table class="table">
                                        <thead>
                                            <tr>
                                                <th>Informacion</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
                }
                else{
                    $form_render .= '<input type="hidden" name="id" id="id" value="'.$id_registro.'">';
                    $form_render .= '<table class="table">
                                        <thead>
                                            <tr>
                                                <th>Descripcion</th>
                                                <th>Ojo Derecho</th>
                                                <th>Ojo Izquierdo</th>
                                            </tr>
                                        </thead>
                                        <tbody>';
                }
            }

            if ($formulario->id == 5 && $seccion->nombre != 'candidato') {
                $TotCampos = count($campos);
                for ($countCp=0; $countCp < $TotCampos; $countCp) {
                    switch ($campos[$countCp]->tipo) {
                        case 'select':
                            $valueOD = $this->getValue($campos[$countCp],$id_registro);
                            $valueOI = $this->getValue($campos[$countCp+1],$id_registro);
                            $form_render .= '<tr>
                                                <td width="50%">'.$campos[$countCp]->titulo.'</td>
                                                <td width="25%">
                                                    <select name="'.$campos[$countCp]->nombre.'" id="'.$campos[$countCp]->nombre.'" class="form-control '.$campos[$countCp]->class.'" '.$campos[$countCp]->attr.'>';
                            $opciones = explode(',', $campos[$countCp]->longitud);
                            $form_render .= '<option value="">Seleccione</option>';
                            foreach ($opciones as $key => $opcion) {
                                if ($valueOD == $opcion) {
                                    $form_render .= '<option value="'.$opcion.'" selected>'.$opcion.'</option>';
                                } else{
                                    $form_render .= '<option value="'.$opcion.'">'.$opcion.'</option>';
                                }
                            }

                            $form_render .= '       </select>
                                                </td>
                                                <td width="25%">
                                                <select name="'.$campos[$countCp+1]->nombre.'" id="'.$campos[$countCp+1]->nombre.'" class="form-control '.$campos[$countCp+1]->class.'" '.$campos[$countCp+1]->attr.'>';
                            $form_render .= '<option value="">Seleccione</option>';
                            $opciones = explode(',', $campos[$countCp+1]->longitud);
                            foreach ($opciones as $key => $opcion) {
                                if ($valueOI == $opcion) {
                                    $form_render .= '<option value="'.$opcion.'" selected>'.$opcion.'</option>';
                                } else{
                                    $form_render .= '<option value="'.$opcion.'">'.$opcion.'</option>';
                                }
                            }

                            $form_render .= '    </select>
                                                </td>
                                            </tr>';
                            $countCp = $countCp + 2;
                            break;
                        case 'number':
                            if ($campos[$countCp]->nombre == 'r_adicion' || $campos[$countCp]->nombre == 'rf_adicion') {
                                $form_render .= '<tr>
                                                    <td width="50%">'.$campos[$countCp]->titulo.'</td>
                                                    <td width="50%" colspan="2">
                                                        <input type="number" maxlength="'.$campos[$countCp]->longitud.'" value="'.$valueOD.'" name="'.$campos[$countCp]->nombre.'" id="'.$campos[$countCp]->nombre.'" class="form-control '.$campos[$countCp]->class.'" placeholder="'.$campos[$countCp]->placeholder.'" '.$campos[$countCp]->attr.' step="any">
                                                    </td>
                                                </tr>';
                                $countCp = $countCp + 1;
                            } else {
                                $valueOD = $this->getValue($campos[$countCp],$id_registro);
                                $valueOI = $this->getValue($campos[$countCp+1],$id_registro);
                                $form_render .= '<tr>
                                                    <td width="50%">'.$campos[$countCp]->titulo.'</td>
                                                    <td width="25%">
                                                        <input type="number" maxlength="'.$campos[$countCp]->longitud.'" value="'.$valueOD.'" name="'.$campos[$countCp]->nombre.'" id="'.$campos[$countCp]->nombre.'" class="form-control '.$campos[$countCp]->class.'" placeholder="'.$campos[$countCp]->placeholder.'" '.$campos[$countCp]->attr.' step="any">
                                                    </td>
                                                    <td width="25%">
                                                        <input type="number" maxlength="'.$campos[$countCp+1]->longitud.'" value="'.$valueOI.'" name="'.$campos[$countCp+1]->nombre.'" id="'.$campos[$countCp+1]->nombre.'" class="form-control '.$campos[$countCp+1]->class.'" placeholder="'.$campos[$countCp+1]->placeholder.'" '.$campos[$countCp+1]->attr.' step="any">
                                                    </td>
                                                </tr>';
                                $countCp = $countCp + 2;
                            }

                            break;
                        case 'text':
                            $valueOD = $this->getValue($campos[$countCp],$id_registro);
                            $form_render .= '<tr>
                                                    <td width="50%">'.$campos[$countCp]->titulo.'</td>
                                                    <td width="50%" colspan="2">
                                                        <input type="text" maxlength="'.$campos[$countCp]->longitud.'" value="'.$valueOD.'" name="'.$campos[$countCp]->nombre.'" id="'.$campos[$countCp]->nombre.'" class="form-control '.$campos[$countCp]->class.'" placeholder="'.$campos[$countCp]->placeholder.'" '.$campos[$countCp]->attr.' style="'.$obligatorio.'" '.$required.'>
                                                    </td>
                                                </tr>';
                            $countCp = $countCp + 1;
                            break;
                        default:                            $countCp = $countCp + 1;
                            break;
                    }
                }
            } else {
                foreach ($campos as $key => $campo) {
                    $js .= $campo->script;
                    $obligatorio = ($campo->obligatorio == 'Si') ? 'background-color: hsla(50,81%,94%,0.5)' : '' ;
                    $required = ($campo->obligatorio == 'Si') ? 'required="required"' : '' ;

                    if ($campo->nombre != 'agenda') {
                        $value = ($id_registro != 0) ? $this->getValue($campo,$id_registro) : '' ;
                    }

                    if ($formulario->id == 3 && $seccion->nombre != 'candidato') {
                        switch ($campo->tipo) {
                            case 'checkbox':
                                $opciones      = explode(',', $campo->longitud);
                                $countOpciones = count($opciones);
                                $value_check   = explode(',',$value);

                                for ($count=0; $count < $countOpciones; $count) {

                                    if (count($value_check) == 2) {
                                        $checkedOD = ($value_check[0] == 'OD') ? 'checked' : '' ;
                                        $checkedOI = ($value_check[1] == 'OI') ? 'checked' : '' ;
                                    } elseif (count($value_check) == 1) {
                                        if ($value_check[0] == 'OD') {
                                            $checkedOD = 'checked';
                                            $checkedOI = '';
                                        } elseif ($value_check[0] == 'OI') {
                                            $checkedOI = 'checked';
                                            $checkedOD = '';
                                        } else {
                                            $checkedOD = '';
                                            $checkedOI = '';
                                        }
                                    } else {
                                        $checkedOD = '';
                                        $checkedOI = '';
                                    }


                                    $form_render .= '<tr>
                                                        <td width="60%">'.$campo->titulo.'</td>
                                                        <td width="20%">
                                                            <input type="checkbox" name="'.$opciones[$count].'_'.$campo->nombre.'" id="'.$opciones[$count].'_'.$campo->nombre.'" class="'.$opciones[$count].'_'.$campo->class.'" '.$campo->attr.' value="'.$opciones[$count].'" '.$checkedOD.'>
                                                        </td>
                                                        <td width="20%">
                                                            <input type="checkbox" name="'.$opciones[$count+1].'_'.$campo->nombre.'" id="'.$opciones[$count+1].'_'.$campo->nombre.'" class="'.$opciones[$count+1].'_'.$campo->class.'" '.$campo->attr.' value="'.$opciones[$count+1].'" '.$checkedOI.'>
                                                        </td>
                                                        <input type="hidden" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$seccion->nombre.'" placeholder="'.$campo->placeholder.'" '.$campo->attr.'>
                                                    </tr>';
                                    $count = $count + 2;
                                }
                                break;
                            case 'text':
                                $form_render .= '<tr>
                                                    <td width="60%">'.$campo->titulo.'</td>
                                                    <td colspan="2">
                                                        <input type="text" maxlength="'.$campo->longitud.'" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" placeholder="'.$campo->placeholder.'">
                                                    </td>
                                                </tr>';
                                break;
                                case 'select':
                                    $form_render .= '<tr>
                                                        <td width="60%">'.$campo->titulo.'</td>
                                                        <td colspan="2">';
                                                        $form_render .= '<select name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" '.$campo->attr.' style=" '.$obligatorio.'" '.$required.'>';
                                                        $form_render .= '<option value="">Seleccione</option>';
                                                        $opciones = explode(',', $campo->longitud);
                                                        foreach ($opciones as $key => $opcion) {
                                                            if ($value == $opcion) {
                                                                $form_render .= '<option value="'.$opcion.'" selected>'.$opcion.'</option>';
                                                            } else{
                                                                $form_render .= '<option value="'.$opcion.'">'.$opcion.'</option>';
                                                            }
                                                        }
                                                        $form_render .= '</select>';
                                                        $form_render .= '</td>
                                                                </tr>';
                            break;
                            default:
                                $form_render .= '--- Campo no Definido '.$campo->tipo.' '.$campo->nombre.'---';
                                break;
                        }
                    } else {
                        if ($campo->tipo == 'readonly' || $campo->tipo == 'accordion') {
                            $form_render .= '<div class="'.$campo->nombre.'">';
                        } else {
                           if ($campo->tipo == 'hidden') {
                                $enfermedades = DB::select('select '.$campo->nombre.' from results where candidate_id = \''.$id_registro.'\'');
                                $busqueda = $campo->nombre;
                                $ojoPred = $enfermedades[0]->$busqueda;
                                if(!empty($ojoPred)){
                                    $url = url($campo->nombre);
                                    $form_render .= '<div class="form-group '.$campo->nombre.'">
                                    <a href="'.$url.'" data-toggle="modal" data-target="#moda_'.$campo->nombre.'"><label class="'.$campo->nombre.'"> '.$campo->titulo.' ('.$ojoPred.')</label></a>';
                                }
                            } else {
                                $form_render .= '<div class="form-group '.$campo->nombre.'">
                                            <label class="'.$campo->nombre.'">'.$campo->titulo.'</label>';
                            }

                        }
                    	switch ($campo->tipo) {
                    		case 'text':
                                $form_render .= '<input type="text" maxlength="'.$campo->longitud.'" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" placeholder="'.$campo->placeholder.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.'>';
                                break;
                            case 'email':
                    			$form_render .= '<input type="email" maxlength="'.$campo->longitud.'" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" placeholder="'.$campo->placeholder.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.'>';
                    			break;
                    		case 'number':
                    			$form_render .= '<input type="number" maxlength="'.$campo->longitud.'" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" placeholder="'.$campo->placeholder.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.' step="any">';
                    			break;
                    		case 'select':
        	            		$form_render .= '<select name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.'>';
                                $form_render .= '<option value="">Seleccione</option>';
                                 if ($campo->nombre == 'tipo_consulta') {
                                    $list_opc = array();
                                    $idCampaign = DB::selectone('SELECT * FROM candidates WHERE id = \''.$id_registro.'\'');
                                    $lista_op = DB::selectone('SELECT Consultas FROM campaigns WHERE id = \''.$idCampaign->campaign_id.'\'');
                                    $list_opc = explode(",", $lista_op->Consultas);
                                    foreach ($list_opc as $opcion) {
                                        if ($value == $opcion) {
                                            $form_render .= '<option value="'.$opcion.'" selected>'.$opcion.'</option>';
                                        } else {
                                            $form_render .= '<option value="'.$opcion.'">'.$opcion.'</option>';
                                        }
                                    }
                                }
                                else if ($campo->nombre == 'clinica') {
                                    $records = $this->getCatalog('clinics');
                                    foreach ($records as $key => $row) {
                                        if ($value == $row->id) {
                                            $form_render .= '<option value="'.$row->id.'" selected>'.$row->nombre.'</option>';
                                        } else {
                                            $form_render .= '<option value="'.$row->id.'">'.$row->nombre.'</option>';
                                        }

                                    }
                                } else {
                                    $opciones = explode(',', $campo->longitud);
                                    foreach ($opciones as $key => $opcion) {
                                        if ($value == $opcion) {
                                            $form_render .= '<option value="'.$opcion.'" selected>'.$opcion.'</option>';
                                        } else{
                                            $form_render .= '<option value="'.$opcion.'">'.$opcion.'</option>';
                                        }
                                    }
                                }

                                $form_render .= '</select>';
                                break;
                            case 'selectNum':
                                if($campo->nombre == 'hora_consulta'){
                                    $form_render.='<br>';
                                }
                                 $form_render .='<input type="time" value="'.$value.'" name="'.$campo->nombre.'"  id="'.$campo->nombre.'" '.$campo->class.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.'>';
                                break;
                            case 'checkbox':
                                $opciones = explode(',', $campo->longitud);
                                    $form_render .= '<br>';
                                foreach ($opciones as $key => $opcion) {
                                    $checked = ($value == 'Si') ? 'checked' : '' ;
                                    $form_render .= '<label class="checkbox-inline">
                                                        <input type="checkbox" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="'.$campo->class.'" '.$campo->attr.' value="Si" style="'.$obligatorio.'" '.$required.' '.$checked.'> '.$opcion.'
                                                    </label>';
                                }
                                break;
                            case 'date':
                                $form_render .= '<input type="date" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.'>';
                                break;
                            case 'email':
                                $form_render .= '<input type="email" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" '.$campo->attr.' style="'.$obligatorio.'" '.$required.'>';
                                break;
                            case 'hidden':
                                $form_render .= '<input type="hidden" maxlength="'.$campo->longitud.'" value="'.$value.'" name="'.$campo->nombre.'" id="'.$campo->nombre.'" class="form-control '.$campo->class.'" placeholder="'.$campo->placeholder.'" '.$campo->attr.'>';
                                break;
                            case 'radio':
                                $opciones = explode(',', $campo->longitud);
                                    $form_render .= '<br>';
                                foreach ($opciones as $key => $opcion) {
                                    $form_render .= '<label class="radio-inline">';
                                    if ($value == $opcion) {
                                        $form_render .= '<input type="radio" name="'.$campo->nombre.'" id="'.$campo->nombre.'" value="'.$opcion.'" checked style="'.$obligatorio.'" '.$required.'> '.$opcion;
                                    } else {
                                        $form_render .= '<input type="radio" name="'.$campo->nombre.'" id="'.$campo->nombre.'" value="'.$opcion.'" style="'.$obligatorio.'" '.$required.'> '.$opcion;
                                    }
                                    $form_render .= '</label>';
                                }
                                break;
                            case 'readonly':
                                $form_render .= '<label class="col-sm-3 control-label">'.$campo->titulo.'</label>
                                                    <div class="col-sm-9">
                                                      <p class="form-control-static" id="'.$campo->nombre.'">'.$value.'</p>
                                                    </div>';
                                break;
                            case 'accordion':

                                $values = DB::select('select codigo, nombres, apellidos, telefono_celular, correo_electronico from candidates where id = '.$id_registro);

                                $form_render .= '
                                        <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
                                          <div class="panel panel-default">
                                            <div class="panel-heading" role="tab" id="headingOne">
                                              <h4 class="panel-title">
                                                <a role="button" data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="false" aria-controls="collapseOne">
                                                  '.$campo->titulo.'
                                                </a>
                                              </h4>
                                            </div>
                                            <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
                                              <div class="panel-body">
                                                <diV>
                                                    <p>Nombre: '.$values[0]->nombres.' '.$values[0]->apellidos.'</p>
                                                    <p>Celular: '.$values[0]->telefono_celular.'</p>
                                                    <p>Celular: '.$values[0]->correo_electronico.'</p>
                                                </div>
                                                <iframe src="https://app.acuityscheduling.com/schedule.php?owner=12651758&firstName='.$values[0]->nombres.'&lastName='.$values[0]->apellidos.'&phone='.$values[0]->telefono_celular.'&email='.$values[0]->correo_electronico.'&field:2012785=Sistema Campañas&field:1985156='.$values[0]->codigo.'" width="100%" height="800" frameBorder="0"></iframe>
                                                <script src="https://d3gxy7nm8y4yjr.cloudfront.net/js/embed.js" type="text/javascript"></script>
                                              </div>
                                            </div>
                                          </div>
                                        </div>';
                                break;
                    		default:
                    			$form_render .= '--- CAMPO NO DEFINIDO '.$campo->tipo.' ----';
                    			break;
                    	}
                    }
                	$form_render .= '</div>';
                }
            }

            if (($formulario->id == 3 || $formulario->id == 5) && $seccion->nombre != 'candidato') {
                $form_render .= '</tbody>
                                </table>';
            }

            $form_render .= '   <script type="text/javascript">
                                    $(document).ready(function() {
                                        '.$js.'
                                    });
                                </script>';

            $form_render .= '	</div>
							</div>';
        }
        return $form_render;
	}

	private function getValue($campo,$id_registro)
	{
        if ($campo->tabla == 'candidates' || $campo->tabla == 'campaigns') {
            $campo_primary = 'id';
        } else {
            $campo_primary = 'candidate_id';
        }

        $value = DB::select('select '.$campo->nombre.' from '.$campo->tabla.' where '.$campo_primary.' = ?', [$id_registro]);
        $valor = $campo->nombre;
        if (empty($value)) {
            $respuesta = '';
        } else {
            $respuesta = $value[0]->$valor;
        }


        return $respuesta;
    }
    private function getCatalog($tbl_catalog)
    {
        $records = DB::select('select id, nombre from '.$tbl_catalog.' where activo = "Si"');
        return $records;
    }
}
