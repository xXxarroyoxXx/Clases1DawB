// TABLA DE EMPLEADOS

CREATE TABLE EMPLEADOS (
DNI NUMBER(8) PRIMARY KEY,
NOMBRE VARCHAR2(10) CHECK (NOMBRE = UPPER(NOMBRE)),
APELLIDO1 VARCHAR2(15) CHECK (APELLIDO1 = UPPER(APELLIDO1)),
APELLIDO2 VARCHAR2(15) CHECK (APELLIDO2 = UPPER(APELLIDO2)),
DIRECC1 VARCHAR2(25),
DIRECC2 VARCHAR2(20),
CIUDAD VARCHAR2(20),
MUNICIPIO VARCHAR2(20),
COD_POSTAL VARCHAR2(5),
SEXO CHAR(1) CHECK (SEXO = 'F' OR SEXO = 'M'),
FECHA_NAC DATE);


// TABLA DE DEPARTAMENTOS

CREATE TABLE DEPARTAMENTOS (
DPTO_COD NUMBER(5) PRIMARY KEY,
NOMBRE_DPTO VARCHAR2(30),
JEFE NUMBER(5) REFERENCES EMPLEADOS,
PRESUPUESTO INTEGER,
PRES_ACTUAL INTEGER,
CHECK (PRES_ACTUAL > PRESUPUESTO));


// TABLA DE UNIVERSIDADES

CREATE TABLE UNIVERSIDADES (
univ_cod number(5) primary key,
nombre_univ varchar2(25) check (nombre_univ = upper(nombre_univ)),
ciudad varchar2(20),
municipio varchar2(2),
cod_postal varchar2(5));

// TABLA DE ESTUDIOS

CREATE TABLE estudios (
empleado_dni number(8) references empleados,
universidad number(5) references universidades,
ano smallint,
grado varchar2(3) check (grado = 'SUP' or grado = 'MED'),
especialidad varchar2(20),
PRIMARY KEY(empleado_dni, universidad));

// TABLA DE TRABAJOS

CREATE TABLE TRABAJOS (
trabajo_cod number(5) primary key,
nombre_trab varchar2(20),
salario_min number(2),
salario_max number(2),
check (salario_max > salario_min));

// TABLA DE HISTORIAL LABORAL

CREATE TABLE HISTORIAL_LABORAL (
EMPLEADO_DNI NUMBER(8) REFERENCES EMPLEADOS,
TRAB_COD NUMBER(5) REFERENCES TRABAJOS,
FECHA_INICIO DATE,
FECHA_FIN DATE,
DPTO_COD NUMBER(5) REFERENCES DEPARTAMENTOS,
SUPERVISOR_DNI NUMBER(8) REFERENCES EMPLEADOS,
PRIMARY KEY (EMPLEADO_DNI, TRAB_COD, FECHA_INICIO));


// TABLA DE HISTORIAL SALARIA

CREATE TABLE HISTORIAL_SALARIAL (
EMPLEADO_DNI NUMBER(8) REFERENCES EMPLEADOS,
SALARIO INTEGER CHECK (SALARIO > 0),
FECHA_COMIENZO DATE,
FECHA_FIN DATE,
PRIMARY KEY (EMPLEADO_DNI, FECHA_COMIENZO));