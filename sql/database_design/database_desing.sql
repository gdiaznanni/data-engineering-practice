-- Crear tabla departamentos como entidad separada

CREATE TABLE departamentos (
			id SERIAL PRIMARY KEY, 
			nombre VARCHAR(50)
);

-- Migrar departamentos únicos desde empleados para eliminar redundancia

INSERT INTO departamentos (nombre)
SELECT DISTINCT departamento
FROM empleados;