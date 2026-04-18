
-- UNION: combina empleados y proyectos en una sola lista sin duplicados
SELECT nombre, departamento
FROM empleados 
UNION 
SELECT nombre_proyecto, departamento
FROM proyectos;

SELECT departamento FROM empleados 
UNION
SELECT departamento FROM proyectos;

-- UNION ALL: igual que UNION pero mantiene duplicados
SELECT nombre, departamento
FROM empleados
UNION ALL
SELECT nombre_proyecto, departamento
FROM proyectos;

SELECT departamento FROM empleados 
UNION ALL
SELECT departamento FROM proyectos;

-- INTERSECT: departamentos que existen en ambas tablas
SELECT  departamento FROM empleados
INTERSECT
SELECT departamento FROM proyectos;

-- EXCEPT: empleado sin proyecto asignado

SELECT id FROM empleados
EXCEPT 
SELECT empleado_id FROM proyectos;

-- EXCEPT en SUBQUERY: el output muestra directamente el nombre del empleado sin proyecto asignado

SELECT nombre
FROM empleados 
WHERE id IN
    (SELECT id FROM empleados
     EXCEPT 
     SELECT empleado_id FROM proyectos);