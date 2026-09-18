# ExmenSQL

Carpeta diagramas
Carpeta dtablas y datos
Carpeta consultas

 Sistema de Gestión Médica

##  Descripción

Este proyecto consiste en una **base de datos para gestionar la información de una institución médica**.

La base de datos permite almacenar y organizar información relacionada con:

*  Médicos
*  Empleados
*  Pacientes
*  Especialidades médicas
*  Horarios de consulta
*  Vacaciones del personal
*  Sustituciones de médicos
*  Tipos de empleados
*  Tipos de médicos

El proyecto fue desarrollado utilizando **MySQL** y está pensado como una práctica para aprender y aplicar conceptos básicos de SQL y bases de datos relacionales.

---

##  Objetivo

El objetivo principal es crear una base de datos que permita **guardar, relacionar y consultar información de una institución médica** de una manera organizada.

También se busca practicar conceptos importantes de SQL como:

* `CREATE TABLE`
* `INSERT INTO`
* `SELECT`
* `JOIN`
* `COUNT`
* `SUM`
* `AVG`
* `GROUP BY`
* `HAVING`
* `ORDER BY`
* `WHERE`
* Claves primarias (`PRIMARY KEY`)
* Claves foráneas (`FOREIGN KEY`)


## Consultas realizadas

El proyecto incluye diferentes consultas para obtener información de la institución.

Entre ellas:

1. Número de pacientes atendidos por cada médico.
2. Total de días de vacaciones por empleado.
3. Médicos con mayor cantidad de horas de consulta.
4. Número de sustituciones realizadas por cada médico.
5. Médicos que están actualmente en sustitución.
6. Horas de consulta por médico y día.
7. Médico con mayor cantidad de pacientes.
8. Empleados con más de 10 días de vacaciones disfrutadas.
9. Médicos que realizan una sustitución.
10. Promedio de horas de consulta.
11. Pacientes atendidos por médicos relacionados con empleados.
12. Médicos con más de 5 pacientes.
13. Vacaciones por tipo de empleado.
14. Pacientes por tipo de médico.
15. Horas de consulta por médico y día.
16. Sustituciones por tipo de médico.
17. Pacientes por médico y especialidad.
18. Personal con más de 20 días de vacaciones planificadas.
19. Pacientes relacionados con médicos en sustitución.
20. Horas de consulta por especialidad y día.

---

##  Instalación

### 1. Crear la base de datos

Primero se debe crear una base de datos en MySQL:

```sql
CREATE DATABASE CENTROSALUD2;
```

Después seleccionarla:

```sql
USE CENTROSALUD2;
```

### 2. Crear las tablas

Ejecutar el archivo SQL que contiene las instrucciones `CREATE TABLE`.

### 3. Insertar los datos

Después de crear las tablas, ejecutar las instrucciones `INSERT INTO` con los datos de prueba.

### 4. Ejecutar las consultas

Finalmente, se pueden ejecutar las consultas `SELECT` para obtener diferentes reportes de la información almacenada.



## 👨‍💻 Autor

**Brayan Medina**

Proyecto académico realizado para practicar conceptos de **SQL y bases de datos relacionales**.




