/*!40101 SET NAMES utf8mb4 */;

--ALTER TABLE `configurations` ADD `actualizar_sist` INT NULL AFTER `activo`;

INSERT INTO `configurations` (`id`, `client_id`, `client_secret`, `username`, `password`, `url_tk`, `activo`, `actualizar_sist`) VALUES (NULL, 'version_actual', NULL, NULL, NULL, NULL, 'No', '2');

INSERT INTO `stages` (`id`, `nombre`, `titulo`, `activo`) VALUES
(7,'enfermeria','Enfermeria','Si');

UPDATE `core_render_campos` SET `longitud` = 'Exploracion,Enfermeria,Optica,Consejeria' WHERE `core_render_campos`.`id` = 44;

INSERT INTO `core_render_formularios` (`id`, `stage_id`, `titulo`, `tabla`, `activo`, `ayuda`) VALUES (NULL, '8', 'Enfermeria', 'candidates', 'Si', 'Fase de enfermeria para la captura de datos como niveles de presión, glucosa, etc.');

INSERT INTO `core_render_secciones` (`id`, `nombre`, `titulo`, `orden`, `activo`, `formulario_id`, `class`) VALUES (NULL, 'presion', 'Enfermeria', '1', 'Si', '8', 'panel-default');

UPDATE `core_render_campos` SET `formulario_id` = '8' WHERE `core_render_campos`.`id` = 315;

UPDATE `core_render_campos` SET `formulario_id` = '8' WHERE `core_render_campos`.`id` = 312;

UPDATE `core_render_campos` SET `formulario_id` = '8' WHERE `core_render_campos`.`id` = 311;

UPDATE `core_render_campos` SET `formulario_id` = '8' WHERE `core_render_campos`.`id` = 310;

UPDATE `core_render_campos` SET `seccion_id` = '41' WHERE `core_render_campos`.`id` = 315;

UPDATE `core_render_campos` SET `seccion_id` = '41' WHERE `core_render_campos`.`id` = 312;

UPDATE `core_render_campos` SET `seccion_id` = '41' WHERE `core_render_campos`.`id` = 311;

UPDATE `core_render_campos` SET `seccion_id` = '41' WHERE `core_render_campos`.`id` = 310;

DELETE FROM `core_render_secciones` WHERE `id` = 39;

UPDATE `core_render_campos` SET `class` = 'campo_unico' WHERE `core_render_campos`.`id` = 315;

UPDATE `core_render_secciones` SET `class` = 'panel-default form-horizontal' WHERE `core_render_secciones`.`id` = 41;

INSERT INTO `core_render_secciones` (`id`, `nombre`, `titulo`, `orden`, `activo`, `formulario_id`, `class`) VALUES (NULL, 'finalizar', 'Finalizar', '2', 'Si', '8', 'panel-default');

INSERT INTO `core_render_campos` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES (NULL, 'etapa', '¿A qué estación lo quieren mandar?', '42', '8', 'Si', '10', 'select', 'Optica,Consejeria', 'Si', 'candidates', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `core_render_secciones` (`id`, `nombre`, `titulo`, `orden`, `activo`, `formulario_id`, `class`) VALUES (NULL, 'agudeza_visual', 'Agudeza Visual', '9', 'Si', '3', 'panel-default');

INSERT INTO `core_render_campos` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES (NULL, 'od_cv_estenopeic', 'C. V. Con Estenopéic', '43', '3', 'No', '7', 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `core_render_campos` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES (NULL, 'oi_cv_estenopeic', 'C. V. Con Estenopéic', '43', '3', 'No', '8', 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `core_render_campos` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES (NULL, 'od_av_lejana', 'A.V. Lejana', '43', '3', 'No', '3', 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL);

INSERT INTO `core_render_campos` (`id`, `nombre`, `titulo`, `seccion_id`, `formulario_id`, `obligatorio`, `orden`, `tipo`, `longitud`, `activo`, `tabla`, `script`, `class`, `ayuda`, `placeholder`, `attr`) VALUES (NULL, 'oi_av_lejana', 'A.V. Lejana', '43', '3', 'No', '4', 'select', '20,25,30,40,50,60,70,80,100,200,400', 'Si', 'refractions', NULL, NULL, NULL, NULL, NULL);