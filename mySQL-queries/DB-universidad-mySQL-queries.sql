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