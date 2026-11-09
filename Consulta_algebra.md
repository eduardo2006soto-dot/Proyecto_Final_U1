# 6. Consultas de Álgebra Relacional y SQL

En esta sección se presentan cinco consultas aplicadas al proyecto **EventPass**, utilizando diferentes operadores del álgebra relacional y su respectiva implementación en SQL.

## 6.1. Resumen de consultas

| N.º | Operador | Consulta |
|:---:|---|---|
| 1 | Selección (σ) y Proyección (π) | Entradas con precio mayor o igual a $20 y más de 30 unidades disponibles. |
| 2 | Reunión natural (⋈) | Ventas con `id_venta` mayor o igual a 5, mostrando cliente, evento y tipo de entrada. |
| 3 | Diferencia (−) | Entradas que nunca se han vendido. |
| 4 | Intersección (∩) | Clientes que compraron en la Fiesta de Bienvenida y en la Fiesta de Fin de Año. |
| 5 | División (÷) | Clientes que compraron en todos los eventos con `id_evento` menor o igual a 2. |

---

## 6.2. Consulta 1: Selección y proyección (σ y π)

**Descripción:** Obtener las entradas cuyo precio sea mayor o igual a $20 y que tengan más de 30 unidades disponibles. Se muestran únicamente el identificador, el precio y la cantidad disponible.

**Álgebra relacional:**

```text
π_id_entrada, precio, cantidad_disponible
(
    σ_precio >= 20 AND cantidad_disponible > 30 (ENTRADA)
)
```

**Código SQL:**

```sql
SELECT id_entrada, precio, cantidad_disponible
FROM ENTRADA
WHERE precio >= 20
AND cantidad_disponible > 30;
```

## 6.3. Consulta 2: Reunión natural de cuatro tablas (⋈)

**Descripción:** Mostrar las ventas cuyo identificador sea mayor o igual a 5, incluyendo los nombres y apellidos del cliente, el nombre del evento, el tipo de entrada, la cantidad y el precio.

**Álgebra relacional:**

```text
π_nombres, apellidos, nombre, tipo, cantidad, precio
(
    σ_id_venta >= 5
    (
        CLIENTE ⋈ VENTA ⋈ ENTRADA ⋈ EVENTO
    )
)
```

**Código SQL:**

```sql
SELECT
    c.nombres,
    c.apellidos,
    ev.nombre,
    e.tipo,
    v.cantidad,
    e.precio
FROM CLIENTE c
JOIN VENTA v ON v.id_cliente = c.id_cliente
JOIN ENTRADA e ON e.id_entrada = v.id_entrada
JOIN EVENTO ev ON ev.id_evento = e.id_evento
WHERE v.id_venta >= 5;
```

## 6.4. Consulta 3: Diferencia (−)

**Descripción:** Obtener las entradas que nunca han sido vendidas. Para ello, se identifican todas las entradas y se excluyen aquellas que aparecen en la tabla de ventas.

**Álgebra relacional:**

```text
π_id_entrada, tipo, precio, id_evento (ENTRADA)
-
π_id_entrada, tipo, precio, id_evento
(
    ENTRADA ⋈ VENTA
)
```

**Código SQL:**

```sql
SELECT id_entrada, tipo, precio, id_evento
FROM ENTRADA
WHERE id_entrada NOT IN (
    SELECT id_entrada
    FROM VENTA
);
```

## 6.5. Consulta 4: Intersección (∩)

**Descripción:** Encontrar los clientes que realizaron compras tanto en la Fiesta de Bienvenida (`id_evento = 1`) como en la Fiesta de Fin de Año (`id_evento = 3`).

**Álgebra relacional:**

```text
e1 = π_id_cliente
(
    VENTA ⋈ σ_id_evento = 1 (ENTRADA)
)

e3 = π_id_cliente
(
    VENTA ⋈ σ_id_evento = 3 (ENTRADA)
)

(e1 ∩ e3) ⋈ CLIENTE
```

**Código SQL:**

```sql
SELECT c.*
FROM CLIENTE c
WHERE c.id_cliente IN (
    SELECT v.id_cliente
    FROM VENTA v
    JOIN ENTRADA e ON e.id_entrada = v.id_entrada
    WHERE e.id_evento = 1
)
AND c.id_cliente IN (
    SELECT v.id_cliente
    FROM VENTA v
    JOIN ENTRADA e ON e.id_entrada = v.id_entrada
    WHERE e.id_evento = 3
);
```

## 6.6. Consulta 5: División (÷)

**Descripción:** Obtener los clientes que hayan comprado entradas en todos los eventos cuyo identificador sea menor o igual a 2. Esta consulta permite comprobar qué clientes participaron en todos los eventos seleccionados.

**Álgebra relacional:**

```text
(
    π_id_cliente, id_evento (VENTA ⋈ ENTRADA)
    ÷
    π_id_evento
    (
        σ_id_evento <= 2 (ENTRADA)
    )
)
⋈ CLIENTE
```

**Código SQL:**

```sql
SELECT
    c.id_cliente,
    c.nombres,
    c.apellidos,
    c.cedula,
    c.telefono
FROM CLIENTE c
JOIN VENTA v ON v.id_cliente = c.id_cliente
JOIN ENTRADA e ON e.id_entrada = v.id_entrada
WHERE e.id_evento <= 2
GROUP BY
    c.id_cliente,
    c.nombres,
    c.apellidos,
    c.cedula,
    c.telefono
HAVING COUNT(DISTINCT e.id_evento) = (
    SELECT COUNT(DISTINCT id_evento)
    FROM ENTRADA
    WHERE id_evento <= 2
);
```

---

# 7. Conclusiones

**Conclusión 1: Modelo entidad-relación y modelo relacional**

Al elaborar el diagrama entidad-relación y el modelo relacional de EventPass, identificar las entidades, los atributos y las relaciones resultó sencillo. La dificultad apareció al transformar el diagrama en tablas. El aprendizaje principal fue comprender cómo se relacionan las entidades fuertes y débiles para construir correctamente la estructura de una base de datos.

**Conclusión 2: Implementación de SQL**

La escritura del código SQL, mediante las instrucciones DDL y DML, permitió comprender el funcionamiento de las bases de datos y la importancia de contar con un modelo relacional bien estructurado. También se reconoció la utilidad de las restricciones, especialmente `FOREIGN KEY` y `REFERENCES`, para mantener la integridad referencial entre las tablas.

**Conclusión 3: Álgebra relacional**

El álgebra relacional facilita la consulta y el análisis de información mediante diferentes operadores, evitando tener que revisar los registros individualmente. Mediante la herramienta Relational se pudieron validar los resultados antes de traducir las operaciones a SQL. Los operadores de selección, reunión y división permitieron comprender mejor cómo recuperar información relacionada entre varias tablas.

---

# 8. Bibliografía

[1] R. Guamán-Quinche, *Álgebra Relacional*, presentación de clase, Carrera de Computación, Facultad de la Energía, las Industrias y los Recursos Naturales No Renovables, Universidad Nacional de Loja, Loja, Ecuador, 2024.

