# Gestión de fiestas y control de venta de entradas - EventPass

## 📋 Datos Generales

* **Asignatura:** Base de Datos
* **Ciclo:** 3 A
* **Unidad:** 1
* **Resultado de aprendizaje de la unidad:** Modela bases de datos de problemas reales, bajo los principios de solidaridad, responsabilidad, transparencia y honestidad.
* **Nombre del Docente:** Edwin René Guamán Quinche
* **Fecha:** 08/11/2026
* **Estudiante:** Eduardo José Soto Cabrera
* **Universidad:** Universidad Nacional de Loja
* **Facultad / Carrera:** FEIRNNR - Carrera de Computación

---

## 1. Título
Gestión de fiestas y control de venta de entradas - EventPass

---

## 2. Contexto del Problema
En la organización de fiestas y eventos, como reuniones universitarias o celebraciones, es necesario llevar un control de los eventos programados, los clientes que adquieren entradas, los tipos de entradas disponibles y las ventas realizadas por los promotores. Cuando esta información se registra únicamente en cuadernos, mensajes o archivos separados, puede resultar difícil mantenerla ordenada y consultar los datos.

Entre las principales dificultades se encuentran la repetición de información, la posibilidad de confundir los datos de los compradores, la falta de claridad sobre qué tipo de entrada corresponde a cada evento y la dificultad para identificar quién realizó una venta. Estas situaciones pueden afectar a los organizadores, promotores y clientes, porque complican el seguimiento de las ventas y de las entradas disponibles.

Por esta razón, se propone diseñar **EventPass**, una base de datos que almacene la información de los eventos, clientes, promotores, tipos de entradas y ventas. La información se organizará en tablas relacionadas mediante claves primarias y foráneas, con el propósito de facilitar su registro y consulta.

---

## 3. Objetivos

### 3.1. Objetivo General
Diseñar e implementar una base de datos relacional para EventPass, mediante los modelos entidad-relación y relacional y el lenguaje SQL, con el fin de organizar la información de eventos, clientes, promotores, entradas y ventas, y facilitar el control de las ventas y de la disponibilidad de entradas.

### 3.2. Objetivos Específicos
1. Elaborar el modelo entidad-relación y el modelo relacional de EventPass, identificando entidades, atributos, relaciones y cardinalidades, para representar de forma ordenada la información de eventos, entradas, clientes, promotores y ventas.
2. Implementar el esquema de la base de datos en SQL (creación de tablas e inserción de datos) y formular cinco consultas en álgebra relacional con su traducción a SQL, para registrar y consultar las ventas y la disponibilidad de entradas.

---

## 4. Modelos Conceptuales de Bases de Datos

### 4.1. Modelo Entidad-Relación (E-R)
<img width="1296" height="888" alt="image" src="https://github.com/user-attachments/assets/f9620d8b-7373-4cb1-9e4a-d145ec2acb4a" />
Figura 1. Diagrama Entidad-Relación del sistema EventPass.
*
### 4.2. Modelo Relacional
<img width="1478" height="861" alt="image" src="https://github.com/user-attachments/assets/98571aa1-f06d-4fb9-b586-a7c1ff9db2f4" />

* **LINK** https://dbdiagram.io/d/6af207a56fcc7ae4c79cb8b9)

* **EVENTO** (`id_evento` PK, `nombre`, `fecha`, `lugar`)
* **CLIENTE** (`id_cliente` PK, `nombres`, `apellidos`, `cedula`, `telefono`)
* **PROMOTOR** (`id_promotor` PK, `nombres`, `apellidos`, `telefono`, `correo`)
* **ENTRADA** (`id_entrada` PK, `tipo`, `precio`, `cantidad_disponible`, `id_evento` FK → EVENTO)
* **VENTA** (`id_venta` PK, `fecha_venta`, `cantidad`, `id_cliente` FK → CLIENTE, `id_entrada` FK → ENTRADA, `id_promotor` FK → PROMOTOR)

*(Nota: PK = clave primaria; FK = clave foránea y la tabla a la que hace referencia).*

---

## 5. Código SQL

### 5.1. Creación de Tablas (DDL)
```sql
CREATE DATABASE IF NOT EXISTS eventpass;
USE eventpass;

CREATE TABLE EVENTO (
    id_evento INT NOT NULL AUTO_INCREMENT,
    nombre VARCHAR(100) NOT NULL,
    fecha DATE NOT NULL,
    lugar VARCHAR(150) NOT NULL,
    PRIMARY KEY (id_evento)
);

CREATE TABLE CLIENTE (
    id_cliente INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    cedula VARCHAR(10) NOT NULL,
    telefono VARCHAR(15),
    PRIMARY KEY (id_cliente),
    UNIQUE (cedula)
);

CREATE TABLE PROMOTOR (
    id_promotor INT NOT NULL AUTO_INCREMENT,
    nombres VARCHAR(100) NOT NULL,
    apellidos VARCHAR(100) NOT NULL,
    telefono VARCHAR(15),
    correo VARCHAR(100),
    PRIMARY KEY (id_promotor),
    UNIQUE (correo)
);

CREATE TABLE ENTRADA (
    id_entrada INT NOT NULL AUTO_INCREMENT,
    tipo VARCHAR(50) NOT NULL,
    precio DECIMAL (8,2) NOT NULL,
    cantidad_disponible INT NOT NULL DEFAULT 0,
    id_evento INT NOT NULL,
    PRIMARY KEY (id_entrada),
    UNIQUE (id_evento, tipo),
    CHECK (precio >= 0),
    CHECK (cantidad_disponible >= 0),
    FOREIGN KEY (id_evento) REFERENCES EVENTO(id_evento)
);

CREATE TABLE VENTA (
    id_venta INT NOT NULL AUTO_INCREMENT,
    fecha_venta DATE NOT NULL,
    cantidad INT NOT NULL DEFAULT 1,
    id_cliente INT NOT NULL,
    id_entrada INT NOT NULL,
    id_promotor INT NOT NULL,
    PRIMARY KEY (id_venta),
    CHECK (cantidad > 0),
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    FOREIGN KEY (id_entrada) REFERENCES ENTRADA(id_entrada),
    FOREIGN KEY (id_promotor) REFERENCES PROMOTOR(id_promotor)
);
