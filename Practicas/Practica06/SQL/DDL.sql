drop schema if exists public cascade;
create schema public;
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

-- Comentarios --
COMMENT ON TABLE cliente IS 'Tabla que contiene los datos de los clientes';

COMMENT ON COLUMN cliente.idPersona IS 'Identificador de clientes';
COMMENT ON COLUMN cliente.nombre IS 'Nombre de cliente';
COMMENT ON COLUMN cliente.paterno IS 'Apellido paterno de cliente';
COMMENT ON COLUMN cliente.materno IS 'Apellido paterno de cliente';
COMMENT ON COLUMN cliente.genero IS 'Genero de cliente';

COMMENT ON CONSTRAINT cliente_d1 ON cliente IS 'Restriccion check que nos asegura que el nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT cliente_d2 ON cliente IS 'Restriccion check que nos asegura que el apellido paterno no sea la cadena vacia';
COMMENT ON CONSTRAINT cliente_d3 ON cliente IS 'Restriccion check que nos asegura que el apellido materno no sea la cadena vacia';
COMMENT ON CONSTRAINT cliente_d4 ON cliente IS 'Restriccion check que nos asegura que el genero correspondo a H,M o X';

COMMENT ON CONSTRAINT cliente_pkey ON cliente IS 'La llave primaria de la tabla cliente';


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
ALTER TABLE veterinario ALTER COLUMN fechFinC
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

-- Comentarios --
COMMENT ON TABLE veterinario IS 'Tabla que contiene los datos de los veterinarios';

COMMENT ON COLUMN veterinario.idPersona IS 'Identificador de veterinario';
COMMENT ON COLUMN veterinario.nombre IS 'Nombre de veterinario';
COMMENT ON COLUMN veterinario.paterno IS 'Apellido paterno de veterinario';
COMMENT ON COLUMN veterinario.materno IS 'Apellido paterno de veterinario';
COMMENT ON COLUMN veterinario.genero IS 'Genero de veterinario';
COMMENT ON COLUMN veterinario.rfc IS 'Registro federal de contribuyente de veterinario';
COMMENT ON COLUMN veterinario.fechNacimiento IS 'Fecha de nacimiento de veterinario';
COMMENT ON COLUMN veterinario.calle IS 'Calle en la que habita la persona de veterinario';
COMMENT ON COLUMN veterinario.numInterior IS 'Numero interior de la residencia de veterinario';
COMMENT ON COLUMN veterinario.numExterior IS 'Numero exterior de la residencia de veterinario';
COMMENT ON COLUMN veterinario.colonia IS 'Colonia en la que se ubica la residencia de veterinario';
COMMENT ON COLUMN veterinario.estado IS 'Estado en la que se ubica la residencia de veterinario';
COMMENT ON COLUMN veterinario.fechFinC IS 'Fecha en que fue contratado el veterinario';
COMMENT ON COLUMN veterinario.fechFinC IS 'Fecha en que termina el contrata del veterinario, puede ser vacio cuando es contrato idenfinido';
COMMENT ON COLUMN veterinario.salario IS 'Salario quincenal percibido por el veterinario';
COMMENT ON COLUMN veterinario.especialidad IS 'Rama de la medicina en la que se especializa el veterinario';

COMMENT ON CONSTRAINT veterinario_d1 ON veterinario IS 'Restriccion check que nos asegura que el nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT veterinario_d2 ON veterinario IS 'Restriccion check que nos asegura que el apellido paterno no sea la cadena vacia';
COMMENT ON CONSTRAINT veterinario_d3 ON veterinario IS 'Restriccion check que nos asegura que el apellido materno no sea la cadena vacia';
COMMENT ON CONSTRAINT veterinario_d4 ON veterinario IS 'Restriccion check que nos asegura que el genero correspondo a H,M o X';
COMMENT ON CONSTRAINT veterinario_d5 ON veterinario IS 'Restriccion check que nos asegura que el RFC posee los 13 digitos reglamentarios (incluye homoclave)';
COMMENT ON CONSTRAINT veterinario_d6 ON veterinario IS 'Restriccion check que nos asegura que el nombre de la calle donde reside no sea la cadena vacia';
COMMENT ON CONSTRAINT veterinario_d7 ON veterinario IS 'Restriccion check que nos asegura que el numero de la residencia no sea negativo';
COMMENT ON CONSTRAINT veterinario_d8 ON veterinario IS 'Restriccion check que nos asegura que el nombre de la colonia no sea la cadena vacia';
COMMENT ON CONSTRAINT veterinario_d9 ON veterinario IS 'Restriccion check que nos asegura que el nombre del estado no sea la cadena vacia';
COMMENT ON CONSTRAINT veterinario_d10 ON veterinario IS 'Restriccion check que nos asegura que el salario no sea negativo';
COMMENT ON CONSTRAINT veterinario_d11 ON veterinario IS 'Restriccion check que nos asegura que la especialidad no sea la cadena vacia';


COMMENT ON CONSTRAINT veterinario_pkey ON veterinario IS 'La llave primaria de la tabla veterinario';

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
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d7
CHECK (numExterior >= 0);
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d8
CHECK(colonia <> '');
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d9
CHECK(estado <> '');
ALTER TABLE proveedor ALTER COLUMN fechInicioC
SET NOT NULL;
ALTER TABLE proveedor ALTER COLUMN fechFinC
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d10
CHECK(producto <> '');
ALTER TABLE proveedor ALTER COLUMN frecuencia
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d11
CHECK (frecuencia >= 0);
ALTER TABLE proveedor ALTER COLUMN costo
SET NOT NULL;
ALTER TABLE proveedor ADD CONSTRAINT proveedor_d12
CHECK (costo >= 0);

-- Entidad --
ALTER TABLE proveedor ADD CONSTRAINT proveedor_pkey
PRIMARY KEY(idPersona);

-- Referencial --
-- No hay

-- Comentarios --
COMMENT ON TABLE proveedor IS 'Tabla que contiene los datos de proveedor';

COMMENT ON COLUMN proveedor.idPersona IS 'Identificador de proveedor';
COMMENT ON COLUMN proveedor.nombre IS 'Nombre de proveedor';
COMMENT ON COLUMN proveedor.paterno IS 'Apellido paterno de proveedor';
COMMENT ON COLUMN proveedor.materno IS 'Apellido paterno de proveedor';
COMMENT ON COLUMN proveedor.genero IS 'Genero de proveedor';
COMMENT ON COLUMN proveedor.rfc IS 'Registro federal de contribuyente de proveedor';
COMMENT ON COLUMN proveedor.fechNacimiento IS 'Fecha de nacimiento de proveedor';
COMMENT ON COLUMN proveedor.calle IS 'Calle en la que habita la persona de proveedor';
COMMENT ON COLUMN proveedor.numInterior IS 'Numero interior de la residencia de proveedor';
COMMENT ON COLUMN proveedor.numExterior IS 'Numero exterior de la residencia de proveedor';
COMMENT ON COLUMN proveedor.colonia IS 'Colonia en la que se ubica la residencia de proveedor';
COMMENT ON COLUMN proveedor.estado IS 'Estado en la que se ubica la residencia de proveedor';
COMMENT ON COLUMN proveedor.fechFinC IS 'Fecha en que fue contratado el proveedor';
COMMENT ON COLUMN proveedor.fechFinC IS 'Fecha en que termina el contrata del proveedor, puede ser vacio cuando es contrato idenfinido';
COMMENT ON COLUMN proveedor.producto IS 'Producto que distrubuye al zoologico el proveedor';
COMMENT ON COLUMN proveedor.frecuencia IS 'Frecuencia quincenal con la que se provee al zoologio por parte del proveedor';
COMMENT ON COLUMN proveedor.costo IS 'Costo del producto que provee el proveedor';

COMMENT ON CONSTRAINT proveedor_d1 ON proveedor IS 'Restriccion check que nos asegura que el nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d2 ON proveedor IS 'Restriccion check que nos asegura que el apellido paterno no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d3 ON proveedor IS 'Restriccion check que nos asegura que el apellido materno no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d4 ON proveedor IS 'Restriccion check que nos asegura que el genero correspondo a H,M o X';
COMMENT ON CONSTRAINT proveedor_d5 ON proveedor IS 'Restriccion check que nos asegura que el RFC posee los 13 digitos reglamentarios (incluye homoclave)';
COMMENT ON CONSTRAINT proveedor_d6 ON proveedor IS 'Restriccion check que nos asegura que el nombre de la calle donde reside no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d7 ON proveedor IS 'Restriccion check que nos asegura que el numero de la residencia no sea negativo';
COMMENT ON CONSTRAINT proveedor_d8 ON proveedor IS 'Restriccion check que nos asegura que el nombre de la colonia no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d9 ON proveedor IS 'Restriccion check que nos asegura que el nombre del estado no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d10 ON proveedor IS 'Restriccion check que nos asegura que el nombre del producto no sea la cadena vacia';
COMMENT ON CONSTRAINT proveedor_d11 ON proveedor IS 'Restriccion check que nos asegura que la frecuencia no sea negativa';
COMMENT ON CONSTRAINT proveedor_d12 ON proveedor IS 'Restriccion check que nos asegura que el costo no sea negativo';


COMMENT ON CONSTRAINT proveedor_pkey ON proveedor IS 'La llave primaria de la tabla proveedor';


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

-- ANIMAL --
create table animal(
	idAnimal serial4,
    nombre varchar(50),
    especie varchar(50),
    alimentacion text,
    sexo char(1),
    peso float4,
    altura float4,
    idPersona serial8
);
-- Restricciones  --
-- Dominio --
alter table animal
alter column nombre set not null;
alter table animal
add constraint check_peso check (peso >= 0);
alter table animal
add constraint check_altura check (altura >= 0);
alter table animal
alter column sexo set default 'M';
-- Entidad --
alter table animal add constraint animal_pkey
primary key(idAnimal); -- p
-- Referencial --


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
ALTER TABLE cuidador ALTER COLUMN fechFinC
SET NOT NULL;
ALTER TABLE cuidador ALTER COLUMN salario
SET NOT NULL;
ALTER TABLE cuidador ADD CONSTRAINT cuidador_d10
CHECK(salario >= 0);
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
ALTER TABLE cuidador ADD CONSTRAINT cuidador_fkey
FOREIGN KEY(idBioma) REFERENCES bioma(idBioma)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE cuidador IS 'Tabla que contiene los datos de cuidador';

COMMENT ON COLUMN cuidador.idPersona IS 'Identificador de cuidador';
COMMENT ON COLUMN cuidador.nombre IS 'Nombre de cuidador';
COMMENT ON COLUMN cuidador.paterno IS 'Apellido paterno de cuidador';
COMMENT ON COLUMN cuidador.materno IS 'Apellido paterno de cuidador';
COMMENT ON COLUMN cuidador.genero IS 'Genero de cuidador';
COMMENT ON COLUMN cuidador.rfc IS 'Registro federal de contribuyente de cuidador';
COMMENT ON COLUMN cuidador.fechNacimiento IS 'Fecha de nacimiento de cuidador';
COMMENT ON COLUMN cuidador.calle IS 'Calle en la que habita la persona de cuidador';
COMMENT ON COLUMN cuidador.numInterior IS 'Numero interior de la residencia de cuidador';
COMMENT ON COLUMN cuidador.numExterior IS 'Numero exterior de la residencia de cuidador';
COMMENT ON COLUMN cuidador.colonia IS 'Colonia en la que se ubica la residencia de cuidador';
COMMENT ON COLUMN cuidador.estado IS 'Estado en la que se ubica la residencia de cuidador';
COMMENT ON COLUMN cuidador.fechFinC IS 'Fecha en que fue contratado el cuidador';
COMMENT ON COLUMN cuidador.fechFinC IS 'Fecha en que termina el contrato del cuidador, puede ser vacio cuando es contrato idenfinido';
COMMENT ON COLUMN cuidador.salario IS 'Salacio quincenal percibido por el cuidador';
COMMENT ON COLUMN cuidador.diasTrabajo IS 'Dias en los que la persona cuidadora trabaja en el zoologico';
COMMENT ON COLUMN cuidador.horario IS 'Hora de entrada de la persona, se asumen que son 8 horas de labor despues de su ingreso';

COMMENT ON CONSTRAINT cuidador_d1 ON cuidador IS 'Restriccion check que nos asegura que el nombre no sea la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d2 ON cuidador IS 'Restriccion check que nos asegura que el apellido paterno no sea la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d3 ON cuidador IS 'Restriccion check que nos asegura que el apellido materno no sea la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d4 ON cuidador IS 'Restriccion check que nos asegura que el genero correspondo a H,M o X';
COMMENT ON CONSTRAINT cuidador_d5 ON cuidador IS 'Restriccion check que nos asegura que el RFC posee los 13 digitos reglamentarios (incluye homoclave)';
COMMENT ON CONSTRAINT cuidador_d6 ON cuidador IS 'Restriccion check que nos asegura que el nombre de la calle donde reside no sea la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d7 ON cuidador IS 'Restriccion check que nos asegura que el numero de la residencia no sea negativo';
COMMENT ON CONSTRAINT cuidador_d8 ON cuidador IS 'Restriccion check que nos asegura que el nombre de la colonia no sea la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d9 ON cuidador IS 'Restriccion check que nos asegura que el nombre del estado no sea la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d10 ON cuidador IS 'Restriccion check que nos asegura que el salario no sea negativo';
COMMENT ON CONSTRAINT cuidador_d11 ON cuidador IS 'Restriccion check que nos asegura que los dias de trabajo no sean la cadena vacia';
COMMENT ON CONSTRAINT cuidador_d12 ON cuidador IS 'Restriccion check que nos asegura que la hora de entrada no sea negativa';
COMMENT ON CONSTRAINT cuidador_d13 ON cuidador IS 'Restriccion check que nos asegura que la hora de salida no mayor a las 24hrs';


COMMENT ON CONSTRAINT cuidador_pkey ON cuidador IS 'La llave primaria de la tabla cuidador';
COMMENT ON CONSTRAINT cuidador_fkey ON cuidador IS 'Una llave foreanea de la tabla cuidador, referencia al bioma';


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


-- TELEFONO --
-- Telefono cliente --
CREATE TABLE telefonoCliente(
	idPersona SERIAL8,
	telefono INT8
);

--Restricciones telefonoCliente
--Dominio
ALTER TABLE telefonoCliente ALTER COLUMN idPersona 
SET NOT NULL;
ALTER TABLE telefonoCliente ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoCliente_pkey
PRIMARY KEY(idPersona,telefono);

--Referencial
ALTER TABLE telefonoCliente ADD CONSTRAINT telefonoCliente_fkey
FOREIGN KEY(idPersona) REFERENCES cliente(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE telefonoCliente IS 'Tabla que contiene los datos de telefonos asociados a clientes';

COMMENT ON COLUMN telefonoCliente.idPersona IS 'Identificador de persona a la que le corresponden los numeros telefonicos de contacto';
COMMENT ON COLUMN telefonoCliente.telefono IS 'Numero telefonico de contacto';

COMMENT ON CONSTRAINT telefonoCliente_pkey ON telefonoCliente IS 'La llave primaria (compuesta) de la tabla telefonoCliente';
COMMENT ON CONSTRAINT telefonoCliente_fkey ON telefonoCliente IS 'La llave foranea con la que asociamos los telefonos a un cliente';

-- Telefono veterinario --
CREATE TABLE telefonoVeterinario(
	idPersona SERIAL8,
	telefono INT8
);

--Restricciones telefonoVeterinario
--Dominio
ALTER TABLE telefonoVeterinario ALTER COLUMN idPersona 
SET NOT NULL;
ALTER TABLE telefonoVeterinario ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoVeterinario ADD CONSTRAINT telefonoVeterinario_pkey
PRIMARY KEY(idPersona,telefono);

--Referencial
ALTER TABLE telefonoVeterinario ADD CONSTRAINT telefonoVeterinario_fkey
FOREIGN KEY(idPersona) REFERENCES veterinario(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Comentarios --
COMMENT ON TABLE telefonoVeterinario IS 'Tabla que contiene los datos de telefonos asociados a veterinarios';

COMMENT ON COLUMN telefonoVeterinario.idPersona IS 'Identificador de persona a la que le corresponden los numeros telefonicos de contacto';
COMMENT ON COLUMN telefonoVeterinario.telefono IS 'Numero telefonico de contacto';

COMMENT ON CONSTRAINT telefonoVeterinario_pkey ON telefonoVeterinario IS 'La llave primaria (compuesta) de la tabla telefonoVeterinario';
COMMENT ON CONSTRAINT telefonoVeterinario_fkey ON telefonoVeterinario IS 'La llave foranea con la que asociamos los telefonos a un veterinario';

-- Telefono proveedor --
CREATE TABLE telefonoProveedor(
	idPersona SERIAL8,
	telefono INT8
);

--Restricciones telefonoProveedor
--Dominio
ALTER TABLE telefonoProveedor ALTER COLUMN idPersona 
SET NOT NULL;
ALTER TABLE telefonoProveedor ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_pkey
PRIMARY KEY(idPersona,telefono);

--Referencial
ALTER TABLE telefonoProveedor ADD CONSTRAINT telefonoProveedor_fkey
FOREIGN KEY(idPersona) REFERENCES proveedor(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Comentarios --
COMMENT ON TABLE telefonoProveedor IS 'Tabla que contiene los datos de telefonos asociados a proveedores';

COMMENT ON COLUMN telefonoProveedor.idPersona IS 'Identificador de persona a la que le corresponden los numeros telefonicos de contacto';
COMMENT ON COLUMN telefonoProveedor.telefono IS 'Numero telefonico de contacto';

COMMENT ON CONSTRAINT telefonoProveedor_pkey ON telefonoProveedor IS 'La llave primaria (compuesta) de la tabla telefonoProveedor';
COMMENT ON CONSTRAINT telefonoProveedor_fkey ON telefonoProveedor IS 'La llave foranea con la que asociamos los telefonos a un proveedor';

-- Telefono cuidador --
CREATE TABLE telefonoCuidador(
	idPersona SERIAL8,
	telefono INT8
);

--Restricciones telefonoCuidador
--Dominio
ALTER TABLE telefonoCuidador ALTER COLUMN idPersona 
SET NOT NULL;
ALTER TABLE telefonoCuidador ALTER COLUMN telefono
SET NOT NULL;

--Entidad
ALTER TABLE telefonoCuidador ADD CONSTRAINT telefonoCuidador_pkey
PRIMARY KEY(idPersona,telefono);

--Referencial
ALTER TABLE telefonoCuidador ADD CONSTRAINT telefonoCuidador_fkey
FOREIGN KEY(idPersona) REFERENCES cuidador(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;


-- Comentarios --
COMMENT ON TABLE telefonoCuidador IS 'Tabla que contiene los datos de telefonos asociados a cuidador';

COMMENT ON COLUMN telefonoCuidador.idPersona IS 'Identificador de persona a la que le corresponden los numeros telefonicos de contacto';
COMMENT ON COLUMN telefonoCuidador.telefono IS 'Numero telefonico de contacto';

COMMENT ON CONSTRAINT telefonoCuidador_pkey ON telefonoCuidador IS 'La llave primaria (compuesta) de la tabla telefonoCuidador';
COMMENT ON CONSTRAINT telefonoCuidador_fkey ON telefonoCuidador IS 'La llave foranea con la que asociamos los telefonos a un cuidador';

-- CORREO --
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


-- ALIMENTO --
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


-- MEDICINA  --
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


-- SUBMINISTRAR  --
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
alter table subministrar add constraint idInsumo_fkey
foreign key (idInsumo) references medicina(idInsumo);
alter table subministrar add constraint idAnimal_fkey
foreign key (idAnimal) references animal(idAnimal);


-- JAULA  --
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

-- LABORAR --
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
ALTER TABLE laborar ADD CONSTRAINT laborar_fkey2
foreign key(idBioma) REFERENCES bioma(idBioma);


-- ATENDER --
CREATE TABLE atender (
    idPersona serial8,
    idAnimal serial4,
    indicacionesMedicas text
);
-- Restricciones --
-- Dominio --
alter table atender add constraint atender_d1
check(idPersona is not null);
alter table atender add constraint atender_d2
check(idAnimal is not null);
alter table atender add constraint atender_d3
check(indicacionesMedicas <> '');
-- Entidad --

-- Referencial --
ALTER TABLE atender ADD CONSTRAINT idPersona_fkey
foreign key (idPersona) references veterinario(idPersona);
ALTER TABLE atender ADD CONSTRAINT idAnimal_fkey
foreign key (idAnimal) references animal(idAnimal);

-- ASISTIR CLIENTE --
CREATE TABLE asistirCliente (
    IdPersona serial8,
    IdEvento serial4
);
-- Restricciones --
-- Dominio --
ALTER TABLE asistirCliente ADD CONSTRAINT asistirCliente_d1
CHECK(idPersona IS NOT NULL);
ALTER TABLE asistirCliente add constraint asistirCliente_d2
CHECK(idEvento IS NOT NULL);

-- Entidad --

-- Referencial --
ALTER TABLE asistirCliente ADD CONSTRAINT idPersona_fkey
FOREIGN KEY (idPersona) REFERENCES cliente(idPersona);
ALTER TABLE asistirCliente ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento);



-- ASISTIR VETERINARIO --
CREATE TABLE asistirVeterinario (
    IdPersona serial8,
    IdEvento serial4
);

-- Restricciones --
-- Dominio -- 
ALTER TABLE asistirVeterinario ADD CONSTRAINT asistirVeterinario_d1
CHECK(idPersona IS NOT NULL);
ALTER TABLE asistirVeterinario add constraint asistirVeterinario_d2
CHECK(idEvento IS NOT NULL);
-- Entidad --
-- Referencial --
ALTER TABLE asistirVeterinario ADD CONSTRAINT asistirVeterinario_fkey
FOREIGN KEY (idPersona) REFERENCES veterinario(idPersona);
ALTER TABLE asistirVeterinario ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento);



-- ASISTIR PROVEEDOR --
CREATE TABLE asistirProveedor (
    IdPersona serial8,
    IdEvento serial4
);
-- Restricciones --
-- Dominio --
ALTER TABLE asistirProveedor ADD CONSTRAINT asistirProveedor_d1
CHECK(idPersona IS NOT NULL);
ALTER TABLE asistirProveedor add constraint asistirProveedor_d2
CHECK(idEvento IS NOT NULL);

-- Entidad --

-- Referencial --
ALTER TABLE asistirProveedor ADD CONSTRAINT idPersona_fkey
FOREIGN KEY (idPersona) REFERENCES proveedor(idPersona);
ALTER TABLE asistirProveedor ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento);


-- ASISTIR CUIDADOR --
CREATE TABLE asistirCuidador (
    IdPersona serial8,
    IdEvento serial4
);
-- Restricciones --
-- Dominio --
ALTER TABLE asistirCuidador ADD CONSTRAINT asistirCuidador_d1
CHECK(idPersona IS NOT NULL);
ALTER TABLE asistirCuidador ADD CONSTRAINT asistirCuidador_d2
CHECK(idEvento IS NOT NULL);

-- Entidad --

-- Referencial --
ALTER TABLE asistirCuidador ADD CONSTRAINT idPersona_fkey
FOREIGN KEY (idPersona) REFERENCES cuidador(idPersona);
ALTER TABLE asistirCuidador ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento);


-- OFRECER --
CREATE TABLE ofrecer (
    idBioma serial4,
    idServicio serial4
);
-- Restricciones --
-- Dominio --
ALTER TABLE ofrecer ADD CONSTRAINT ofrecer_d1
CHECK(idBioma IS NOT NULL);
ALTER TABLE ofrecer ADD CONSTRAINT ofrecer_d2
CHECK(idServicio IS NOT NULL);

-- Entidad --

-- Referencial --
ALTER TABLE ofrecer ADD CONSTRAINT idBioma_fkey
FOREIGN KEY (idBioma) REFERENCES bioma(idBioma);
ALTER TABLE ofrecer ADD CONSTRAINT idServicio_fkey
FOREIGN KEY (idServicio) REFERENCES servicio(idServicio);


-- NOTIFICACIÓN --
CREATE TABLE notificacion(
    idEvento serial4,
    idNotificacion serial8
);
-- Dominio --
ALTER TABLE notificacion ALTER COLUMN idEvento
SET NOT NULL;
ALTER TABLE notificacion ALTER COLUMN idNotificacion
SET NOT NULL;
ALTER TABLE notificacion ADD CONSTRAINT notificacion_unique
UNIQUE (idNotificacion);

-- Entidad --
ALTER TABLE notificacion ADD CONSTRAINT notificacion_pkey
PRIMARY KEY (idEvento, idNotificacion);
-- Referencial --
ALTER TABLE notificacion ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento);


-- NOTIFICAR --
CREATE TABLE notificar (
    IdPersona serial8,
    idNotificacion serial8
);
-- Restricciones --
-- Dominio --
ALTER TABLE notificar ADD CONSTRAINT notificar_d1
CHECK(idPersona IS NOT NULL);
ALTER TABLE notificar ADD CONSTRAINT notificar_d2
CHECK(idNotificacion IS NOT NULL);

-- Entidad --

-- Referencial --
ALTER TABLE notificar ADD CONSTRAINT idPersona_fkey
FOREIGN KEY (idPersona) REFERENCES cliente(idPersona);
ALTER TABLE notificar ADD CONSTRAINT idNotificacion_fkey
FOREIGN KEY (idNotificacion) REFERENCES notificacion(idNotificacion);


-- ALIMENTAR --
CREATE TABLE alimentar (
    idAnimal serial4,
    idInsumo serial8
);
-- Restricciones --
-- Dominio --
ALTER TABLE alimentar ADD CONSTRAINT alimentar_d1
CHECK(idAnimal IS NOT NULL);
ALTER TABLE alimentar ADD CONSTRAINT alimentar_d2
CHECK(idInsumo IS NOT NULL);

-- Entidad --

-- Referencial --
ALTER TABLE alimentar ADD CONSTRAINT idAnimal_fkey
FOREIGN KEY (idAnimal) REFERENCES animal(idAnimal);
ALTER TABLE alimentar ADD CONSTRAINT idInsumo_fkey
FOREIGN KEY (idInsumo) REFERENCES alimento(idInsumo);


-- TICKET --
CREATE TABLE ticket(
    idTicket serial8,
    idServicio serial4,
    idPersona serial4,
    fecha date,
    porcentajeDesc float4
);
-- Dominio --
ALTER TABLE ticket ALTER COLUMN idTicket
SET NOT NULL;
ALTER TABLE ticket ADD CONSTRAINT ticket_unique
UNIQUE (idTicket);
ALTER TABLE ticket ALTER COLUMN idServicio
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN idPersona
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN fecha
SET NOT NULL;
ALTER TABLE ticket ALTER COLUMN porcentajeDesc
SET NOT NULL;
ALTER TABLE ticket ADD CONSTRAINT porcentaje_Desc
CHECK(porcentajeDesc >= 0);

-- Entidad --
ALTER TABLE ticket ADD CONSTRAINT ticket_pkey
PRIMARY KEY (idTicket, idServicio, idPersona);
-- Referencial --
ALTER TABLE ticket ADD CONSTRAINT idServicio_fkey
FOREIGN KEY (idServicio) REFERENCES servicio(idServicio);
ALTER TABLE ticket ADD CONSTRAINT idPersona_fkey
FOREIGN KEY (idPersona) REFERENCES cliente(idPersona);
