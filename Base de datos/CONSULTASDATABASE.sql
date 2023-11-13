use mydb;
select * from alumnos;
select * from carrera;
select * from profesor;
select * from materias;
select * from libreta;
select * from evaluaciones;
select * from tipo_evaluación;


select * from materias where año=3;

select * from `carrera` where (`ID_carrera` = 1);

select * from materias where id_carre_corresp = 1 and año = 2;

UPDATE `mydb`.`materias` SET `id_carre_corresp` = 1 WHERE (`ID_materias` = '1');

UPDATE `mydb`.`carrera` SET `Nombre` = 'Laboratorio' WHERE (`ID_carrera` = '25');

UPDATE `mydb`.`alumnos` SET `anio` = '1' WHERE (`ID_Alum` = '4');

UPDATE `mydb`.`alumnos` SET `anio` = '1' WHERE (`ID_Alum` = '6');

select * from alumnos where anio = 1 and id_carre_corresp = 1;

UPDATE `mydb`.`alumnos` SET `anio` = '2' WHERE (`ID_Alum` = '16');

select * from alumnos where anio = 2 and id_carre_corresp = 1;
UPDATE `mydb`.`alumnos` SET `anio` = '3' WHERE (`ID_Alum` = '15');

delete from profesor where id_profesor = 19 ;
delete from libreta where alum_id = 4 ;

INSERT INTO libreta (Materia_id, Evaluacion_id, Calificacion, alum_id)
VALUES ('1', '3', 10, 4);
INSERT INTO libreta (Materia_id, Evaluacion_id, Calificacion, alum_id)
VALUES ('2', '2', 9, 4);

SELECT * FROM alumnos WHERE ID_Alum = 4;

ALTER TABLE carrera
DROP COLUMN id_carrerac;

    
SELECT profesor.Nombre,Apellido AS nombre_profesor, carrera.Nombre AS nombre_carrera
                    FROM materias 
                    JOIN profesor ON materias.id_prof_corresp = profesor.id_profesor
                    JOIN carrera ON materias.id_carre_corresp = carrera.id_carrera
                    WHERE materias.id_carre_corresp = 1 AND materias.año = 2;

select materias.id_materias, materias.Nombre AS nombre_materia, profesor.nombre  AS nombre_profesor, materias.Año
FROM materias INNER JOIN profesor ON materias.id_prof_corresp = profesor.nombre
WHERE materias.id_carre_corresp = 1 ;

SELECT materias.id_materias, materias.Nombre AS Nombre_materia, profesor.nombre AS Nombre_profesor, profesor.apellido AS Apellido ,materias.anio, carrera.Nombre AS Nombre_carrera
FROM materias
INNER JOIN profesor ON materias.id_prof_corresp = profesor.id_profesor
INNER JOIN carrera ON materias.id_carre_corresp = carrera.id_carrera
WHERE materias.id_carre_corresp = 1;

Select * from profesor where id_carrerac = 1 and anio = 2;

select * from materias where id_carre_corresp = 1 and anio = 2;

INSERT INTO Profesor (Nombre,Apellido,DNI,Domicilio,Email,Edad,Genero,Cuil)
VALUES ('Adrian', 'Martinez', 26543109, 'La Rioja y Salta' , 'adrianM@gmail.com', 49, 'Masculino', 220098321);

INSERT INTO Profesor (Nombre,Apellido,DNI,Domicilio,Email,Edad,Genero,Cuil)
VALUES ('Enrique', 'Martinez', 21980361, 'Maipú' , 'emartinez@gmail.com', 56, 'Masculino', 21345100);

INSERT INTO libreta (Materia_id, Evaluacion_id, Calificacion, alum_id)
VALUES(1,1,2,4);


SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion, materias.Nombre
FROM libreta
LEFT JOIN alumnos ON alumnos.id_alum = libreta.alum_id
LEFT JOIN materias ON libreta.materia_id = materias.id_materias
where alumnos.id_Alum = 4
LIMIT 5; 

#ESTA ES LA QUE VA EN LA APLICACION WSGI
SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion, materias.Nombre
FROM libreta
LEFT JOIN alumnos ON alumnos.id_alum = libreta.alum_id
LEFT JOIN materias ON libreta.materia_id = materias.id_materias
WHERE alumnos.id_Alum = 4
	AND materias.anio = 1 and materias.id_carre_corresp = 1
LIMIT 5;

SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion, materias.Nombre
FROM libreta
LEFT JOIN alumnos ON alumnos.id_alum = libreta.alum_id
LEFT JOIN materias ON libreta.materia_id = materias.id_materias
WHERE alumnos.id_Alum = 26
  AND materias.id_materias = 1
LIMIT 5;

SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion, materias.Nombre
FROM libreta
LEFT JOIN alumnos ON alumnos.id_alum = libreta.alum_id
LEFT JOIN materias ON libreta.materia_id = materias.id_materias
WHERE alumnos.id_Alum = 4
  AND materias.anio = 1
  AND materias.id_carre_corresp = 1;
  
  
SELECT materias.id_materias, materias.Nombre AS nombre_materia, libreta.evaluacion_id, libreta.calificacion
FROM materias
LEFT JOIN (
    SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion
    FROM libreta
    WHERE libreta.alum_id = 4
    
) AS libreta ON materias.id_materias = libreta.materia_id
WHERE materias.anio = 1 AND materias.id_carre_corresp = 1
limit 5;

SELECT materias.id_materias, materias.Nombre AS nombre_materia, libreta.evaluacion_id, libreta.calificacion
FROM materias
LEFT JOIN (
    SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion
    FROM libreta
    WHERE libreta.alum_id = 4
    LIMIT 5
) AS libreta ON materias.id_materias = libreta.materia_id
WHERE materias.anio = 1 AND materias.id_carre_corresp = 1;


#ESTA ES LA QUE VA EN APLICACION WSGI
SELECT subq.materia_id, subq.evaluacion_id, subq.calificacion, subq.nombre_materia
FROM (
    SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion, materias.Nombre AS nombre_materia,
           ROW_NUMBER() OVER (PARTITION BY libreta.materia_id ORDER BY libreta.evaluacion_id) AS rn
    FROM libreta
    LEFT JOIN materias ON libreta.materia_id = materias.id_materias
    WHERE libreta.alum_id = 4
) AS subq
WHERE subq.rn <= 5;

SELECT libreta.materia_id, libreta.evaluacion_id, libreta.calificacion
FROM libreta
WHERE libreta.materia_id = 5
  AND libreta.alum_id = 4
LIMIT 5;

SELECT materias.Nombre AS nombre_materia, 
       libreta.Calificacion
FROM libreta
INNER JOIN materias ON libreta.materia_id = materias.ID_materias
WHERE libreta.alum_id = 4
LIMIT 5;

SELECT profesor.id_profesor, profesor.nombre, profesor.apellido, profesor.dni, profesor.domicilio, profesor.email, profesor.edad, profesor.genero, profesor.cuil, materias.nombre as Materia 
FROM profesor INNER JOIN materias ON profesor.id_profesor = materias.id_prof_corresp
WHERE profesor.ID_carrerac = 1 AND materias.anio = 1;

SELECT materias.Nombre AS nombre_materia, libreta.Materia_id, min(libreta.calificacion), max(libreta.calificacion), count(libreta.calificacion), avg(libreta.Calificacion)
FROM materias 
INNER JOIN libreta 
ON libreta.materia_id = materias.ID_materias
WHERE libreta.alum_id = 4
GROUP BY libreta.Materia_id  
LIMIT 5;




SELECT * FROM libreta;

