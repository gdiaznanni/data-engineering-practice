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

-- Proyectos cuyo presupuesto es mayor al presupuesto promedio de los proyectos del mismo departamento

SELECT nombre_proyecto, departamento, presupuesto
FROM proyectos AS p1
WHERE presupuesto > (
     SELECT AVG(presupuesto)
     FROM proyectos AS p2
     WHERE p2.departamento = p1.departamento  
     );


-- Para cada empleado: nombre, salario, y la diferencia entre su salario y el promedio de la empresa

SELECT nombre, 
       salario,
       salario - (SELECT AVG(salario) FROM empleados) AS dif_salario_promedio      
FROM empleados;



-- Nombre y salario de los empleados que trabajan en departamentos cuyo promedio de salario supera 50000

SELECT nombre, salario
FROM empleados
WHERE departamento IN (
    SELECT departamento
    FROM empleados
    GROUP BY departamento
    HAVING AVG(salario) > 50000
);


-- Nombre y salario de los empleados que ganan más que el promedio de su departamento, y agregá una columna que muestre cuánto ganan por encima de ese promedio.
    
 SELECT nombre,
       salario,
       salario - (
           SELECT AVG(salario)
           FROM empleados e2
           WHERE e2.departamento = e1.departamento
       ) AS por_encima_del_promedio
FROM empleados e1
WHERE salario > (
    SELECT AVG(salario)
    FROM empleados e2
    WHERE e2.departamento = e1.departamento
);

