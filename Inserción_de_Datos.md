# 5.2. Inserción de datos (DML)

## 5.2.1. Inserción de eventos

Se registran cinco eventos con su respectivo identificador, nombre, fecha y lugar de realización.

```sql
INSERT INTO EVENTO (id_evento, nombre, fecha, lugar) VALUES
(1, 'Fiesta de Bienvenida', '2026-12-05', 'Salón Central'),
(2, 'Noche de Música en Vivo', '2026-12-12', 'Teatro Municipal'),
(3, 'Fiesta de Fin de Año', '2026-12-31', 'Club Social'),
(4, 'Fiesta Temática 80s', '2027-01-16', 'Casa de Eventos Norte'),
(5, 'Festival Universitario', '2027-02-20', 'Coliseo Universitario');
```

## 5.2.2. Inserción de clientes

Se registran cinco clientes con sus datos personales, número de cédula y teléfono. Algunos campos telefónicos contienen valores `NULL`, indicando que no se dispone de esa información.

```sql
INSERT INTO CLIENTE (id_cliente, nombres, apellidos, cedula, telefono) VALUES
(1, 'Ana María', 'Pérez Loor', '0900000001', '0991111111'),
(2, 'Carlos', 'Mendoza Ruiz', '0900000002', '0992222222'),
(3, 'Lucía', 'Vera Castro', '0900000003', '0993333333'),
(4, 'Diego', 'Salazar Mora', '0900000004', NULL),
(5, 'Valeria', 'Torres Andrade', '0900000005', '0995555555');
```

## 5.2.3. Inserción de promotores

Se registran cinco promotores encargados de participar en la comercialización de las entradas de los diferentes eventos. Se incluyen sus nombres, apellidos, teléfonos y correos electrónicos.

```sql
INSERT INTO PROMOTOR (id_promotor, nombres, apellidos, telefono, correo) VALUES
(1, 'Jorge', 'Intriago Paz', '0981000001', 'jintriago@eventpass.com'),
(2, 'Karen', 'Zambrano Gil', '0981000002', 'kzambrano@eventpass.com'),
(3, 'Mateo', 'Cedeño Rosado', '0981000003', 'mcedeno@eventpass.com'),
(4, 'Paola', 'Guerrero Vite', NULL, 'pguerrero@eventpass.com'),
(5, 'Esteban', 'Macías Lucas', '0981000005', NULL);
```

## 5.2.4. Inserción de entradas

Se registran los diferentes tipos de entradas disponibles para cada evento, incluyendo su precio, cantidad disponible e identificador del evento al que pertenecen.

La cantidad disponible corresponde al stock inicial menos las unidades vendidas.

```sql
INSERT INTO ENTRADA (id_entrada, tipo, precio, cantidad_disponible, id_evento) VALUES
(1, 'General', 10.00, 194, 1),
(2, 'VIP', 25.00, 49, 1),
(3, 'General', 8.00, 141, 2),
(4, 'VIP', 20.00, 38, 2),
(5, 'Palco', 35.00, 28, 3),
(6, 'General', 12.00, 95, 3),
(7, 'General', 15.00, 80, 4);
```

## 5.2.5. Inserción de ventas

Finalmente, se registran ocho ventas realizadas por los clientes y gestionadas por los promotores. Cada registro contiene la fecha de venta, cantidad de entradas adquiridas y las referencias correspondientes al cliente, entrada y promotor.

```sql
INSERT INTO VENTA (id_venta, fecha_venta, cantidad, id_cliente, id_entrada, id_promotor) VALUES
(1, '2026-11-01', 2, 1, 1, 1),
(2, '2026-11-02', 1, 2, 2, 2),
(3, '2026-11-03', 4, 3, 1, 1),
(4, '2026-11-03', 3, 4, 3, 3),
(5, '2026-11-04', 2, 5, 5, 2),
(6, '2026-11-05', 5, 1, 6, 4),
(7, '2026-11-06', 2, 2, 4, 3),
(8, '2026-11-07', 6, 3, 3, 5);
```


<p align="center">
  <a href="https://github.com/eduardo2006soto-dot/Proyecto_Final_U1">
    <img src="https://img.shields.io/badge/🏠%20VOLVER%20AL%20INICIO-EventPass-00758F?style=for-the-badge&logo=github&logoColor=white" alt="Volver al inicio" />
  </a>
</p>
