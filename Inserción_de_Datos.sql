-- ==========================================

-- 5.2. INSERCIÓN DE DATOS (DML)

-- ==========================================

-- Inserción de Eventos
INSERT INTO EVENTO (id_evento, nombre, fecha, lugar) VALUES
(1, 'Fiesta de Bienvenida',      '2026-12-05', 'Salón Central'),
(2, 'Noche de Música en Vivo',   '2026-12-12', 'Teatro Municipal'),
(3, 'Fiesta de Fin de Año',      '2026-12-31', 'Club Social'),
(4, 'Fiesta Temática 80s',       '2027-01-16', 'Casa de Eventos Norte'),
(5, 'Festival Universitario',    '2027-02-20', 'Coliseo Universitario');


-- Inserción de Clientes
INSERT INTO CLIENTE (id_cliente, nombres, apellidos, cedula, telefono) VALUES
(1, 'Ana María', 'Pérez Loor',     '0900000001', '0991111111'),

(2, 'Carlos',    'Mendoza Ruiz',   '0900000002', '0992222222'),

(3, 'Lucía',     'Vera Castro',    '0900000003', '0993333333'),

(4, 'Diego',     'Salazar Mora',   '0900000004', NULL),

(5, 'Valeria',   'Torres Andrade', '0900000005', '0995555555');


-- Inserción de Promotores
INSERT INTO PROMOTOR (id_promotor, nombres, apellidos, telefono, correo) VALUES

(1, 'Jorge',   'Intriago Paz',   '0981000001', 'jintriago@eventpass.com'),

(2, 'Karen',   'Zambrano Gil',   '0981000002', 'kzambrano@eventpass.com'),

(3, 'Mateo',   'Cedeño Rosado',  '0981000003', 'mcedeno@eventpass.com'),

(4, 'Paola',   'Guerrero Vite',  NULL,         'pguerrero@eventpass.com'),

(5, 'Esteban', 'Macías Lucas',   '0981000005', NULL);


-- Inserción de Entradas (cantidad_disponible = stock inicial - unidades vendidas)

INSERT INTO ENTRADA (id_entrada, tipo, precio, cantidad_disponible, id_evento) VALUES

(1, 'General', 10.00, 194, 1), -- Stock: 200 | Vendidas: 6

(2, 'VIP',     25.00,  49, 1), -- Stock: 50  | Vendidas: 1

(3, 'General',  8.00, 141, 2), -- Stock: 150 | Vendidas: 9

(4, 'VIP',     20.00,  38, 2), -- Stock: 40  | Vendidas: 2

(5, 'Palco',   35.00,  28, 3), -- Stock: 30  | Vendidas: 2

(6, 'General', 12.00,  95, 3), -- Stock: 100 | Vendidas: 5

(7, 'General', 15.00,  80, 4); -- Stock: 80  | Vendidas: 0


-- Inserción de Ventas

INSERT INTO VENTA (id_venta, fecha_venta, cantidad, id_cliente, id_entrada, id_promotor) VALUES

(1, '2026-11-01', 2, 1, 1, 1),

(2, '2026-11-02', 1, 2, 2, 2),

(3, '2026-11-03', 4, 3, 1, 1),

(4, '2026-11-03', 3, 4, 3, 3),

(5, '2026-11-04', 2, 5, 5, 2),

(6, '2026-11-05', 5, 1, 6, 4),

(7, '2026-11-06', 2, 2, 4, 3),

(8, '2026-11-07', 6, 3, 3, 5);

<p align="center">
  <a href="https://github.com/eduardo2006soto-dot/Proyecto_Final_U1/blob/main/Inserci%C3%B3n_de_Datos.sql">
    <img src="https://img.shields.io/badge/🗄️%20Ir%20a-Inserci%C3%B3n%20de%20Datos%20SQL-00758F?style=for-the-badge&logo=postgresql&logoColor=white" alt="Ir a SQL" />
  </a>
</p>
