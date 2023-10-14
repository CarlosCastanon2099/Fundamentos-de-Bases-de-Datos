drop schema if exists public cascade;
create schema public;

create table bioma (
	idBioma serial4,
	tipoBioma varchar(50)
);

-- Restricciones Bioma
-- Dominio
alter table bioma add constraint bioma_d1
check (idBioma is not null);
alter table bioma add constraint bioma_d2
check ( 3 <= char_length(tipoBioma) and char_length(tipoBioma) <= 50 and tipoBioma is not null);

-- Entidad
alter table bioma add constraint bioma_pkey
primary key (idBioma);




CREATE TABLE evento (
    idEvento serial4,
    capacidad int4,
    fecha timestamp,
    tipoEvento varchar(50)
);

-- Restricciones evento
-- Dominio
ALTER TABLE evento ADD CONSTRAINT evento_d1 CHECK (idEvento IS NOT NULL);
ALTER TABLE evento ADD CONSTRAINT evento_d2 CHECK (capacidad > 0);

-- Restricción CHECK para la columna "fecha" (formato dd-mm-aaaa hh:mm)
ALTER TABLE evento ADD CONSTRAINT evento_d3
CHECK (
    TO_CHAR(fecha, 'DD-MM-YYYY HH24:MI') ~ '^\d{2}-\d{2}-\d{4} \d{2}:\d{2}$'
);

-- Entidad
ALTER TABLE evento ADD CONSTRAINT evento_pkey PRIMARY KEY (idEvento);




create table servicio (
	idServicio serial4,
	costoUnitario float4,
	tipoServicio varchar(50)
);

-- Restriccciones servicio
-- Dominio
alter table servicio add constraint servicio_d1
check (costoUnitario > 0);
alter table servicio add constraint servicio_d2
check (3 <= char_length(tipoServicio) and char_length(tipoServicio) <= 50);

-- Entidad
alter table servicio add constraint servicio_pkey
primary key (idServicio);









--------------------------------------


-- CREACIÓN DE TABLAS --


-------------TABLAS CON LLAVES PRIMARIAS-----------------
-------------TABLAS CON LLAVES PRIMARIAS-----------------
-- CLIENTE --
CREATE TABLE cliente(
    idPersona SERIAL8,
    nombre VARCHAR(50),
    paterno VARCHAR(50),
	materno VARCHAR(50),
    genero CHAR(1)
);

-- Restricciones cliente --
-- Dominio --
ALTER TABLE cliente ADD CONSTRAINT cliente_d1
CHECK(nombre <> '');
ALTER TABLE cliente ADD CONSTRAINT cliente_d2
CHECK(paterno <> '');
ALTER TABLE cliente ADD CONSTRAINT cliente_d3
CHECK(materno <> '');
ALTER TABLE cliente ADD CONSTRAINT cliente_d4
--- NOTA: En la sección género se acató la disposición del INE
-- de respetar la identidad de género marcando 'X' si así 
-- está en la documentación oficial de la persona.
CHECK(genero = 'H' OR genero = 'M' OR genero = 'X');

-- Entidad --
ALTER TABLE cliente ADD CONSTRAINT cliente_pkey
PRIMARY KEY(idPersona);

-- Referencial --
-- no hay

-------------------------------------------------------------------

-- VETERINARIO --
CREATE TABLE veterinario(
    idPersona SERIAL8,
    nombre VARCHAR(50),
    paterno VARCHAR(50),
	materno VARCHAR(50),
    genero CHAR(1),
    rfc CHAR(13),
    fechNacimiento DATE,
    calle VARCHAR(50),
    numInterior INT,
    numExterior INT,
    colonia VARCHAR(50),
    estado VARCHAR(50),
    fechInicioC DATE,
    fechFinC DATE,
    salario FLOAT4,
    especialidad VARCHAR(50)
);

-- Restricciones veterinario --
-- Dominio --
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d1
CHECK(nombre <> '');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d2
CHECK(paterno <> '');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d3
CHECK(materno <> '');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d4
CHECK(genero = 'H' OR genero = 'M' OR genero = 'X');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d5
CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE veterinario ALTER COLUMN fechNacimiento
SET NOT NULL;
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d6
CHECK(calle <> '');
ALTER TABLE veterinario ALTER COLUMN numExterior
SET NOT NULL;
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d7
CHECK (numExterior >= 0);
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d8
CHECK(colonia <> '');
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d9
CHECK(estado <> '');
ALTER TABLE veterinario ALTER COLUMN fechInicioC
SET NOT NULL;
ALTER TABLE veterinario ALTER COLUMN salario
SET NOT NULL;
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d10
CHECK(salario >= 0);
ALTER TABLE veterinario ADD CONSTRAINT veterinario_d11
CHECK(especialidad <> '');

-- Entidad --
ALTER TABLE veterinario ADD CONSTRAINT veterinario_pkey
PRIMARY KEY(idPersona);

-- Referencial --
-- No hay

-------------------------------------------------------------------

-- PROVEEDOR --
CREATE TABLE proveedor(
    idPersona SERIAL8,
    nombre VARCHAR(50),
    paterno VARCHAR(50),
	materno VARCHAR(50),
    genero CHAR(1),
    rfc CHAR(13),
    fechNacimiento DATE,
    calle VARCHAR(50),
    numInterior INT,
    numExterior INT,
    colonia VARCHAR(50),
    estado VARCHAR(50),
    fechInicioC DATE,
    fechFinC DATE,
    producto VARCHAR(50),
    frecuencia INT,
    costo FLOAT4
);

-- Restricciones proveedor --
-- Dominio --
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d1
CHECK(nombre <> '');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d2
CHECK(paterno <> '');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d3
CHECK(materno <> '');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d4
CHECK(genero = 'H' OR genero = 'M' OR genero = 'X');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d5
CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE proveedor ALTER COLUMN fechNacimiento
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d6
CHECK(calle <> '');
ALTER TABLE proveedor ALTER COLUMN numExterior
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d12
CHECK (numExterior >= 0);
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d7
CHECK(colonia <> '');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d8
CHECK(estado <> '');
ALTER TABLE proveedor ALTER COLUMN fechInicioC
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d9
CHECK(producto <> '');
ALTER TABLE proveedor ALTER COLUMN frecuencia
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d10
CHECK (frecuencia >= 0);
ALTER TABLE proveedor ALTER COLUMN costo
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d11
CHECK (costo >= 0);

-- Entidad --
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pkey
PRIMARY KEY(idPersona);

-- Referencial --
-- No hay


-------------------------------------------------------------------

---------------TABLAS CON LLAVES COMPUESTAS----------


------------TABLAS CON LLAVES FORANEAS---------------

-- CUIDADOR --
CREATE TABLE cuidador(
    idPersona SERIAL8,
    idBioma SERIAL4,
    nombre VARCHAR(50),
    paterno VARCHAR(50),
	materno VARCHAR(50),
    genero CHAR(1),
    rfc CHAR(13),
    fechNacimiento DATE,
    calle VARCHAR(50),
    numInterior INT,
    numExterior INT,
    colonia VARCHAR(50),
    estado VARCHAR(50),
    fechInicioC DATE,
    fechFinC DATE,
    salario FLOAT4,
    animalCargo VARCHAR(50),
    diasTrabajo VARCHAR(50),
    horario INT
);

-- Restricciones cuidador --
-- Dominio --
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d1
CHECK(nombre <> '');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d2
CHECK(paterno <> '');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d3
CHECK(materno <> '');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d4
CHECK(genero = 'H' OR genero = 'M' OR genero = 'X');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d5
CHECK(CHAR_LENGTH(rfc)=13);
ALTER TABLE cuidador ALTER COLUMN fechNacimiento
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d6
CHECK(calle <> '');
ALTER TABLE cuidador ALTER COLUMN numExterior
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d7
CHECK (numExterior >= 0);
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d8
CHECK(colonia <> '');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d9
CHECK(estado <> '');
ALTER TABLE cuidador ALTER COLUMN fechInicioC
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN salario
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d10
CHECK(animalCargo <> '');
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d11
CHECK(diasTrabajo <> '');
ALTER TABLE cuidador ALTER COLUMN horario
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d12
CHECK(horario >= 0);
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d13
CHECK(horario <= 24);

-- Entidad --
ALTER TABLE cuidador ADD CONSTRAINT cuidador_pkey
PRIMARY KEY(idPersona);

-- Referencial --
ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey2
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma);

-------------------------------------------------------------------









------------------------- TABLAS CON LLAVES PRIMARIAS -------------------------






------------------------- TABLAS COMPUESTAS -------------------------

create table correo (
	idPersona serial8,
	correo varchar(50)
);

-- Restricciones correo
-- Dominio
alter table correo alter column idPersona 
set not null;
alter table correo alter column correo
set not null;
alter table correo add constraint correo_d1
check (correo like '%_@_%._%');

-- Entidad 
alter table correo add constraint correo_pkey
primary key (idPersona, correo);

-- Referencial
alter table correo add constraint correo_fkey1
foreign key (idPersona) references cliente(idPersona);
alter table correo add constraint correo_fkey2
foreign key (idPersona) references cuidador(idPersona);
alter table correo add constraint correo_fkey3
foreign key (idPersona) references veterinario(idPersona);
alter table correo add constraint correo_fkey4
foreign key (idPersona) references proveedor(idPersona);




create table alimento (
	idInsumo serial8,
	idPersona serial8,
	nombre varchar(50),
	fechaCaducidad date,
	cantidad int4,
	refrigeracion bool,
	tipoAlim varchar(50)
);

-- Restricciones 
-- Dominio
alter table alimento add constraint id_insumo
check (idInsumo is not null);
alter table alimento add constraint id_persona
check (idPersona is not null);
alter table alimento add constraint alimento_d1
check(nombre <> '' and nombre is not null);
alter table alimento add constraint alimento_d2 
check (fechaCaducidad is not null);
alter table alimento add constraint alimento_d3
check (cantidad > 0);
alter table alimento add constraint alimento_d4
check (refrigeracion in (true, false));
alter table alimento add constraint alimento_d5
check ( 3 <= char_length(tipoAlim) and char_length(tipoAlim) <= 50 and tipoAlim is not null);

-- Entidad
alter table alimento add constraint alimento_pkey
primary key (idInsumo);

-- Referencial
alter table alimento add constraint alimento_fkey
foreign key (idPersona) references proveedor(idPersona);

-- TELEFONO --
CREATE TABLE telefono(
	idPersona SERIAL8,
	telefono INT8
);

--Restricciones telefono
--Dominio
ALTER TABLE telefono ALTER COLUMN idPersona 
SET NOT NULL;
ALTER TABLE telefono ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefono ADD CONSTRAINT telefono_pkey
PRIMARY KEY(idPersona,telefono);

--Referencial
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey1
FOREIGN KEY(idPersona) REFERENCES cliente(idPersona);
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey2
FOREIGN KEY(idPersona) REFERENCES cuidador(idPersona);
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey3
FOREIGN KEY(idPersona) REFERENCES veterinario(idPersona);
ALTER TABLE telefono ADD CONSTRAINT telefono_fkey4
FOREIGN KEY(idPersona) REFERENCES proveedor(idPersona);


------------------------------------------------------------------------------------------------
-- ANIMAL** --
create table animal(
	idAnimal serial4,
    nombre varchar(50),
    especie varchar(50),
    alimentacion text,
    sexo char(1),
    peso float4,
    altura float4,
    idPersona serial8,
    numJaula serial4
);
-- Restricciones  --
-- Dominio --
alter table animal
alter column nombre set not null;
alter table animal
add constraint check_peso check (peso >= 0);
alter table animal
alter column sexo set default 'M';
-- Entidad --
alter table animal add constraint animal_pkey
primary key(idAnimal); -- p
-- Referencial --

-- JAULA *** --
create table jaula(
  idAnimal serial4,
  numJaula serial4,
  idBioma serial4
);
-- Restricciones --
-- Dominio --
alter table jaula add constraint jaula_d1
check(idAnimal is not null);
alter table jaula add constraint jaula_d2
check(numJaula is not null);
alter table jaula add constraint jaula_d3
check(idBioma is not null);
-- Entidad --
-- Referencial --
alter table jaula add constraint jaula_fkey1
foreign key(idAnimal) references animal(idAnimal);
alter table jaula add constraint jaula_fkey2
foreign key(idBioma) references bioma(idBioma);

-- LABORAR ** --
 create table laborar (
	idPersona serial8,
	idBioma serial4
 );
-- Restricciones --
-- Dominio --
alter table laborar add constraint laborar_d1
check(idPersona is not null);
alter table laborar add constraint laborar_d2
check(idBioma is not null);
-- Entidad --
-- Referencial --
alter table laborar add constraint laborar_fkey1
foreign key(idPersona) references veterinario(idPersona);

-- MEDICINA ** --
create table medicina (
	idInsumo serial8,
	idPersona serial8,
	nombre varchar(50),
	fechCaducidad date,
	cantidad int,
	refrigeracion bool,
	labProd varchar(50),
	lote varchar(50)
);
-- Dominio --
alter table medicina add constraint cantidad check (cantidad >= 0);
alter table medicina add constraint refrigeracion check (refrigeracion in (true, false));
alter table medicina add constraint labProd check (3 <= char_length(labProd) and char_length(labProd) <= 50 and labProd is not null);
alter table medicina alter column refrigeracion set default false;
-- Entidad --
alter table medicina add constraint medicina_pkey
primary key (idInsumo);
-- Referencial --
alter table medicina add constraint medicina_fkey
foreign key (idPersona) references proveedor(idPersona);

-- SUBMINISTRAR *** --
create table subministrar (
	idAnimal serial4,
	idInsumo serial8
);
-- Restricciones --
-- Dominio --
alter table subministrar add constraint subministrar_d1
check(idAnimal is not null);
alter table subministrar add constraint subministrar_d2
check(idInsumo is not null);
-- Entidad --
-- Referencial --
alter table subministrar add constraint subministrar_fkey
foreign key (idInsumo) references alimento(idInsumo);