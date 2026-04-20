CREATE TABLE empleados (
    id SERIAL PRIMARY KEY,
    nombre VARCHAR(100),
    edad INTEGER,
    departamento VARCHAR(50),
    salario DECIMAL(10,2)
    ); 

INSERT INTO empleados (nombre, edad, departamento, salario) VALUES
('Ana García', 31, 'Tecnología', 45000.00),
('Luis Martínez', 45, 'Legal', 62000.00),
('María López', 28, 'Datos', 48000.00),
('Pedro Sánchez', 38, 'Tecnología', 51000.00),
('Carmen Ruiz', 52, 'Legal', 71000.00)

SELECT nombre,
       salario
FROM empleados;

SELECT nombre,
       departamento
FROM empleados
WHERE departamento = 'Tecnología';

SELECT nombre, 
       salario
FROM empleados
ORDER BY salario DESC;

SELECT nombre, 
     salario
FROM empleados
WHERE salario > 50000;

SELECT nombre, 
       salario
FROM empleados
WHERE departamento = 'Legal' AND salario > 60000;

SELECT COUNT(nombre),
      departamento
FROM empleados
GROUP BY departamento;

SELECT departamento,
       COUNT(nombre) AS cantidad_empleados
FROM empleados
GROUP BY departamento;

SELECT AVG(salario) AS salario_promedio,
       departamento
FROM empleados
GROUP BY departamento 
ORDER BY salario_promedio DESC;

SELECT departamento,
       AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento
ORDER BY salario_promedio DESC;

SELECT departamento,
      AVG(salario) AS salario_promedio
FROM empleados
GROUP BY departamento
ORDER BY salario_promedio DESC, departamento;

SELECT departamento, 
       AVG(salario)AS salario_promedio 
 FROM empleados
 GROUP BY departamento 
 HAVING AVG(salario) > 50000;

CREATE TABLE proyectos (
      id SERIAL PRIMARY KEY,
      nombre_proyecto VARCHAR(100),
      departamento VARCHAR(50),
      presupuesto DECIMAL(10,2)
      );

INSERT INTO proyectos (nombre_proyecto, departamento, presupuesto) VALUES
('Sistema de Gestión', 'Tecnología', 85000.00),
('Autoría Regulatoria', 'Legal', 120000.00),
('Pipeline de Datos', 'Datos', 95000.00),
('App Mobile', 'Tecnología', 60000.00)

SELECT empleados.nombre AS empleado, 
       proyectos.nombre_proyecto AS proyecto  
FROM empleados
INNER JOIN proyectos
USING (departamento);

ALTER TABLE proyectos
ADD COLUMN empleado_id INTEGER;

SELECT  * FROM proyectos;


UPDATE proyectos
SET empleado_id = 4
WHERE id = 1;

UPDATE proyectos
SET empleado_id = 3
WHERE id = 3;

UPDATE proyectos
SET empleado_id = 1
WHERE id = 4;

UPDATE proyectos
SET empleado_id = 5
WHERE id = 2;


SELECT empleados.nombre, proyectos.nombre_proyecto
FROM empleados
LEFT JOIN proyectos
ON empleados.id = proyectos.empleado_id;

-- LEFT JOIN: todos los empleados con su proyecto, NULL si no tienen proyecto
SELECT empleados.nombre, proyectos.nombre_proyecto
FROM empleados
LEFT JOIN proyectos
ON empleados.id = proyectos.empleado_id;

-- RIGHT JOIN: todos los proyectos con su empleado, NULL si no tienen empleado
SELECT empleados.nombre, proyectos.nombre_proyecto
FROM empleados
RIGHT JOIN proyectos
ON empleados.id = proyectos.empleado_id;

-- FULL JOIN: todos los empleados y todos los proyectos, NULL donde no hay coincidencia
SELECT empleados.nombre, proyectos.nombre_proyecto
FROM empleados
FULL JOIN proyectos
ON empleados.id = proyectos.empleado_id;



SELECT nombre, departamento
FROM empleados 
UNION 
SELECT nombre_proyecto, departamento
FROM proyectos;

SELECT nombre, departamento
FROM empleados
UNION ALL
SELECT nombre_proyecto, departamento
FROM proyectos;


SELECT departamento FROM empleados 
UNION
SELECT departamento FROM proyectos;


SELECT departamento FROM empleados 
UNION ALL
SELECT departamento FROM proyectos;


SELECT  departamento FROM empleados
INTERSECT
SELECT departamento FROM proyectos;

SELECT departamento FROM empleados
EXCEPT
SELECT departamento FROM proyectos;

SELECT departamento FROM proyectos 
EXCEPT
SELECT departamento FROM empleados;

SELECT nombre FROM empleados
EXCEPT 
SELECT nombre_proyecto FROM proyectos;

SELECT id FROM empleados
EXCEPT 
SELECT empleado_id FROM proyectos;



	SELECT nombre
	FROM empleados 
	WHERE id IN
	    (SELECT id FROM empleados
	     EXCEPT 
	     SELECT empleado_id FROM proyectos);

-- Empleados con salarios por arriba del salario promedio
	SELECT nombre, salario
	FROM empleados
	WHERE salario > (SELECT AVG(salario)
	FROM empleados); 
	
-- Proyectos cuyo presupuesto es mayor al presupuesto promedio de todos los proyectos


SELECT nombre_proyecto, presupuesto
FROM proyectos
WHERE presupuesto > (SELECT AVG(presupuesto) 
FROM proyectos);
	
-- Empleados que trabajan en el mismo departamento que el proyecto con mayor presupuesto

SELECT nombre, departamento
FROM empleados
WHERE departamento IN (SELECT departamento FROM proyectos
WHERE presupuesto = (SELECT MAX(presupuesto) FROM proyectos));

-- Empleados cuyo salario es mayor al salario promedio de sus departamentos


SELECT AVG(salario)
FROM empleados
WHERE departamento = 'Tecnología';


SELECT nombre, salario, departamento
FROM empleados e1
WHERE salario > (
    SELECT AVG(salario)
    FROM empleados e2
    WHERE e2.departamento = e1.departamento
);



SELECT *
FROM empleados;

SELECT *
FROM proyectos;






