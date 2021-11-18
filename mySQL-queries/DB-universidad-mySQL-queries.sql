/* Si us plau, descàrrega la base de dades del fitxer schema_universidad.sql, visualitza el diagrama E-R en un editor i efectua les següents consultes: */

--01 Devuelve un listado con el primer apellido, segundo apellido y el nombre de todos los alumnos. El listado deberá estar ordenado alfabéticamente de menor a mayor por el primer apellido, segundo apellido y nombre.

SELECT apellido1, apellido2, nombre
    FROM persona
    WHERE tipo = "alumno"
    ORDER BY apellido1, apellido2, nombre

--02 Halla el nombre y los dos apellidos de los alumnos que no han dado de alta su número de teléfono en la base de datos.

SELECT apellido1, apellido2, nombre, telefono
    FROM persona
    WHERE tipo = "alumno" AND telefono is NULL 
    
--03 Devuelve el listado de los alumnos que nacieron en 1999.

SELECT *
    FROM persona
    WHERE tipo = "alumno" AND fecha_nacimiento BETWEEN '1999-01-01' AND '1999-12-31';

--//TODO preguntar por que esta query devuelve un valor entero null

--04 Devuelve el listado de profesores que no han dado de alta su número de teléfono en la base de datos y además su nif termina en K.
SELECT *
    FROM persona
    WHERE tipo = "profesor" AND telefono is NULL AND nif LIKE '%k' 

--//TODO de velta el mismo problema, por que te devuelve una row con todo null si no cumple las condiciones???''

--05 Devuelve el listado de las asignaturas que se imparten en el primer cuatrimestre, en el tercer curso del grado que tiene el identificador 7.

SELECT * 
    FROM asignatura
    WHERE cuatrimestre = 1
        AND curso = 3
        AND id_grado = 7

--06 Devuelve un listado de los profesores junto con el nombre del departamento al que están vinculados. El listado debe devolver cuatro columnas, primer apellido, segundo apellido, nombre y nombre del departamento. El resultado estará ordenado alfabéticamente de menor a mayor por apellidos y nombre.

SELECT apellido1, apellido2, p.nombre,
        d.nombre AS nombre_departamento
    FROM persona p
    RIGHT JOIN profesor pr
        ON  p.id = pr.id_profesor
    INNER JOIN departamento d
        ON pr.id_departamento = d.id
    ORDER BY apellido1, apellido2, p.nombre

--07 Devuelve un listado con el nombre de las asignaturas, año de inicio y año de fin del curso escolar del alumno con nif 26902806M.

SELECT a.nombre, c.anyo_inicio, c.anyo_fin
    FROM persona p
    INNER JOIN alumno_se_matricula_asignatura b
        ON p.id = b.id_alumno
    INNER JOIN curso_escolar c
        ON b.id_curso_escolar = c.id
    INNER JOIN asignatura a
        ON b.id_asignatura = a.id
    WHERE nif = "26902806M"

--08 Devuelve un listado con el nombre de todos los departamentos que tienen profesores que imparten alguna asignatura en el Grado en Ingeniería Informática (Plan 2015).

SELECT DISTINCT d.nombre
    FROM profesor pr
    INNER JOIN departamento d
        ON  d.id = pr.id_departamento
    INNER JOIN asignatura a
        ON pr.id_profesor = a.id_profesor
    INNER JOIN grado g
        ON a.id_grado = g.id
    WHERE g.nombre = 'Grado en Ingeniería Informática (Plan 2015)'
        
--09 Devuelve un listado con todos los alumnos que se han matriculado en alguna asignatura durante el curso escolar 2018/2019.

SELECT DISTINCT p.nombre
    FROM persona p
    INNER JOIN alumno_se_matricula_asignatura b
        ON p.id = b.id_alumno
    INNER JOIN curso_escolar c
        ON b.id_curso_escolar = c.id
    WHERE c.anyo_fin IN (2018,2019)--Tal vez deba ir solo 2018 aca, es cuestion de interpretacion de la consigna. 

/* Resolgui les 6 següents consultes utilitzant les clàusules LEFT JOIN i RIGHT JOIN. */

--01 Devuelve un listado con los nombres de todos los profesores y departamentos que tienen vinculados. El listado también debe mostrar a aquellos profesores que no tienen ningún departamento asociado. El listado debe devolver cuatro columnas, nombre del departamento, primer apellido, segundo apellido y nombre del profesor. El resultado estará ordenado alfabéticamente de menor a mayor por el nombre del departamento, apellidos y nombre.

SELECT
    d.nombre AS departamento_nombre,
    p.apellido1,
    p.apellido2,
    p.nombre AS nombre_profesor
    FROM profesor pr
    INNER JOIN persona p
        ON p.id = pr.id_profesor
    LEFT JOIN departamento d
        ON  d.id = pr.id_departamento
    ORDER BY d.nombre, p.apellido1, p.apellido2, p.nombre

--02 Devuelve un listado con los profesores que no están asociados a un departamento.

SELECT *
    FROM profesor pr
    INNER JOIN persona p
        ON p.id = pr.id_profesor
    LEFT JOIN departamento d
        ON  d.id = pr.id_departamento
   WHERE pr.id_departamento is NULL

--03 Devuelve un listado con los departamentos que no tienen profesores asociados.

SELECT d.nombre
    FROM departamento d
    LEFT JOIN profesor pr
        ON d.id = pr.id_departamento
        WHERE pr.id_profesor is NULL
        
--04 Devuelve un listado con los profesores que no imparten ninguna asignatura.

SELECT 
    p.nombre, p.apellido1, p.apellido2
    FROM profesor pr
    INNER JOIN persona p
        ON p.id = pr.id_profesor
    LEFT JOIN asignatura a
        ON pr.id_profesor = a.id_profesor
   WHERE a.id_profesor is NULL

--05 Devuelve un listado con las asignaturas que no tienen un profesor asignado.

SELECT *    
    FROM asignatura a 
    LEFT JOIN profesor pr
        ON a.id_profesor = pr.id_profesor
   WHERE a.id_profesor is NULL

--06 Devuelve un listado con todos los departamentos que no han impartido asignaturas en ningún curso escolar.

--Creo que se podria haber hecho mejor, pero esto es lo mejor que pude hacer XD

SELECT DISTINCT d.nombre  
	FROM departamento d
WHERE d.nombre NOT IN (SELECT DISTINCT d.nombre  
    FROM departamento d
    INNER JOIN  profesor pr
        ON pr.id_departamento = d.id
    INNER JOIN asignatura a
        ON a.id_profesor = pr.id_profesor     
    INNER JOIN alumno_se_matricula_asignatura b
        ON a.id = b.id_asignatura   
    INNER JOIN curso_escolar ce
        ON ce.id = b.id_curso_escolar);

--Consultas resumen:

--01 Devuelve el número total de alumnos existentes.

SELECT COUNT(id)
FROM persona
WHERE tipo = "alumno";

--02 Calcula cuántos alumnos nacieron en 1999.

SELECT COUNT(id)
FROM persona
WHERE tipo = "alumno" AND fecha_nacimiento BETWEEN ("1999-01-01") AND ("1999-12-31") ;

--03 Calcula cuántos profesores existen en cada departamento. El resultado sólo debe mostrar dos columnas, una con el nombre del departamento y otra con el número de profesores que hay en ese departamento. El resultado sólo debe incluir los departamentos que tienen profesores asociados y deberá estar ordenado de mayor a menor por el número de profesores.

SELECT COUNT(id_profesor), d.nombre AS departamento_nombre
    FROM profesor pr
       INNER JOIN departamento d
        ON pr.id_departamento = d.id
    GROUP BY d.nombre
    ORDER BY COUNT(id_profesor) DESC

--04 Devuelve un listado con todos los departamentos y el número de profesores que hay en cada uno de ellos. Tenga en cuenta que pueden existir departamentos que carecen de profesores asociados. Estos departamentos también deben aparecer en el listado.

SELECT d.nombre AS departamento_nombre, COUNT(id_profesor)
    FROM profesor pr
       RIGHT JOIN departamento d
        ON pr.id_departamento = d.id
    GROUP BY d.nombre
    ORDER BY COUNT(id_profesor) DESC

--05 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno. Tenga en cuenta que pueden existir grados que carecen de asignaturas asociadas. Estos grados también deben aparecer en el listado. El resultado deberá estar ordenado de mayor a menor por el número de asignaturas.

SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas 
    FROM grado g
       LEFT JOIN asignatura a
        ON a.id_grado = g.id
    GROUP BY g.nombre
    ORDER BY COUNT(a.id) DESC

--06 Devuelve un listado con el nombre de todos los grados existentes en la base de datos y el número de asignaturas que tiene cada uno, de los grados que tengan más de 40 asignaturas asociadas.

SELECT g.nombre AS nombre_grado, COUNT(a.id) AS numero_asignaturas 
    FROM grado g
       LEFT JOIN asignatura a
        ON a.id_grado = g.id
    GROUP BY g.nombre
    HAVING COUNT(a.id) > 40
          
--07 Devuelve un listado que muestre el nombre de los grados y la suma del número total de créditos existentes para cada tipo de asignatura. El resultado debe tener tres columnas: nombre del grado, tipo de asignatura y la suma de los créditos de todas las asignaturas que existen de este tipo.

SELECT 
    g.nombre AS nombre_grado, 
    a.tipo AS tipo_asignatura, 
    SUM(a.creditos) AS total_creditos
    FROM grado g
    INNER JOIN asignatura a
        ON g.id = a.id_grado
GROUP BY a.tipo, g.nombre    

--08 Devuelve un listado que muestre cuántos alumnos se han matriculado de alguna asignatura en cada uno de los cursos escolares. El resultado tendrá que mostrar dos columnas, una columna con el año de inicio del curso escolar y otra con el número de alumnos matriculados.

SELECT 
    ce.anyo_inicio AS año_inicio_curso_escolar, 
    COUNT(id_alumno) AS cantidad_alumnos
    FROM alumno_se_matricula_asignatura b
    INNER JOIN curso_escolar ce
        ON  b.id_curso_escolar = ce.id
    GROUP BY ce.anyo_inicio

--09 Devuelve un listado con el número de asignaturas que imparte cada profesor. El listado debe tener en cuenta a aquellos profesores que no imparten ninguna asignatura. El resultado mostrará cinco columnas: id, nombre, primer apellido, segundo apellido y número de asignaturas. El resultado estará ordenado de mayor a menor por el número de asignaturas.

SELECT p.id, p.nombre, p.apellido1, p.apellido2, 
        COUNT(a.id) AS cantidad_asignaturas
    FROM profesor pr 
    INNER JOIN persona p
        ON p.id = pr.id_profesor
    LEFT JOIN asignatura a
        ON pr.id_profesor = a.id_profesor
    GROUP BY p.id  
    ORDER BY COUNT(a.id) DESC  

--10 Devuelve todos los datos del alumno más joven.

SELECT *
    FROM persona p
    WHERE tipo = "alumno"
    ORDER BY fecha_nacimiento DESC
    LIMIT 1

--11 Devuelve un listado con los profesores que tienen un departamento asociado y que no imparten ninguna asignatura.

SELECT p.id, p.nombre, p.apellido1, p.apellido2
    FROM profesor pr
     INNER JOIN persona p
        ON p.id = pr.id_profesor
    LEFT JOIN asignatura a
        ON pr.id_profesor = a.id_profesor
    WHERE id_departamento is NOT NULL AND a.id is NULL
