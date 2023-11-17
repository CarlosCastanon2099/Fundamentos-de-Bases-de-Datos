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
--- NOTA: En la seccion genero se acato la disposicion del INE
-- de respetar la identidad de genero marcando 'X' si asi 
-- esta en la documentacion oficial de la persona.
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


-- Comentarios
comment on table bioma is 'Tabla que contiene los biomas que hay en el zoologico';
comment on column bioma.idBioma is 'Identificador del bioma';
comment on column bioma.tipoBioma is 'Es el tipo de Bioma que hay';
comment on constraint bioma_d1 on bioma is 'El idBioma no puede ser null';
comment on constraint bioma_d2 on bioma is 'El tipo de bioma debe tener una longitud entre [3, 50] y no puede ser nulo';
comment on constraint bioma_pkey on bioma is 'La llave primaria de la tabla bioma';




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
alter table animal
add constraint check_sexo check (sexo <> 'M' or sexo <> 'H' or sexo <> 'X');
-- Entidad --
alter table animal add constraint animal_pkey
primary key(idAnimal); -- p
-- Referencial --

ALTER TABLE animal ADD CONSTRAINT animal_fkey
FOREIGN KEY(idPersona) REFERENCES cuidador(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
comment on table animal is 'Tabla que contiene los datos de los animales';
comment on column animal.idAnimal is 'Identificador del animal';
comment on column animal.nombre is 'Nombre del animal';
comment on column animal.especie is 'Especie del animal';
comment on column animal.alimentacion is 'Alimentacion del animal';

comment on constraint animal_pkey on animal is 'La llave primaria de la tabla animal';
comment on constraint check_peso on animal is 'El peso debe ser mayor o igual a 0';
comment on constraint check_altura on animal is 'La altura debe ser mayor o igual a 0';
comment on constraint check_sexo on animal is 'El sexo debe ser H, M o X';
comment on constraint animal_fkey on animal is 'El idPersona debe ser un cuidador';




CREATE TABLE evento (
    idEvento serial4,
    capacidad int4,
    fecha timestamp,
    tipoEvento varchar(50)
);

-- Restricciones evento
-- Dominio
ALTER TABLE evento ADD CONSTRAINT evento_d1 CHECK (idEvento IS NOT null);
ALTER TABLE evento ADD CONSTRAINT evento_d2 CHECK (capacidad > 0);

-- Restriccion CHECK para la columna "fecha" (formato dd-mm-aaaa hh:mm)
ALTER TABLE evento ADD CONSTRAINT evento_d3
CHECK (
    TO_CHAR(fecha, 'YYYY-MM-DD HH24:MI') ~ '^\d{4}-\d{2}-\d{2} \d{2}:\d{2}$'
);
alter table evento add constraint evento_d4 check (3 <= char_length(tipoEvento) and char_length(tipoEvento) <= 50);

-- Entidad
ALTER TABLE evento ADD CONSTRAINT evento_pkey PRIMARY KEY (idEvento);


-- Comentarios
comment on table evento is 'Tabla que contiene todos la informacion de los eventos realizados en el Zoologico';
comment on column evento.idEvento is 'Identificador del evento';
comment on column evento.capacidad is 'Es el numero de capacidad de personas del evento';
comment on column evento.fecha is 'Es la fecha en la que se va a llevar dicho evento, incluye hora.';
comment on column evento.tipoEvento is 'Es el tipo de evento que se va a llevar a cabo';
COMMENT ON CONSTRAINT evento_d1 ON evento IS 'Restriccion que asegura que idEvento no sea nulo';
COMMENT ON CONSTRAINT evento_d2 ON evento IS 'Restriccion que asegura que capacidad sea mayor que 0';
COMMENT ON CONSTRAINT evento_d3 ON evento IS 'Restriccion que asegura que la fecha este en el formato correcto (dd-mm-aaaa hh:mm)';
COMMENT ON CONSTRAINT evento_d4 ON evento IS 'Restriccion que asegura que la longitud de tipoEvento este entre 3 y 50 caracteres';
comment on constraint evento_pkey on evento is 'La llave primaria de la tabla evento';




create table servicio (
	idServicio serial4,
	costoUnitario float4,
	tipoServicio varchar(50)
);

-- Restriccciones servicio
-- Dominio
ALTER TABLE servicio ADD CONSTRAINT servicio_d11 CHECK (idServicio IS NOT null);
alter table servicio add constraint servicio_d1
check (costoUnitario > 0);
alter table servicio add constraint servicio_d2
check (3 <= char_length(tipoServicio) and char_length(tipoServicio) <= 50);

-- Entidad
alter table servicio add constraint servicio_pkey
primary key (idServicio);


-- Comentarios
comment on table servicio is 'Tabla que contiene los servicios que hay en el zoologico.';
comment on column servicio.idServicio is 'Identificador del servicio.';
comment on column servicio.costoUnitario is 'Precio que cuesta el servicio.';
comment on column servicio.tipoServicio is 'Tipo der servicio que se hay.';
comment on constraint servicio_d11 on servicio is 'Restriccion que asegura que idServicio no sea nulo';
comment on constraint servicio_d1 on servicio is 'El costo unitario mayor a 0';
comment on constraint servicio_d2 on servicio is 'Restriccion que asegura que la longitud de tipoServicio este entre [3, 50] caracteres';
comment on constraint servicio_pkey on servicio is 'La llave primaria de la tabla servicio';




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



-- CORREOCLIENTE --
create table correoCliente (
	idPersona serial8,
	correo varchar(50)
);

-- Restricciones correoCliente
-- Dominio
alter table correoCliente alter column idPersona 
set not null;
alter table correoCliente alter column correo
set not null;
alter table correoCliente add constraint correo_d1
check (correo like '%_@_%._%');

-- Entidad 
alter table correoCliente add constraint correoc_pkey
primary key (idPersona, correo);

-- Referencial
alter table correoCliente add constraint correoc_fkey
foreign key (idPersona) references cliente(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
comment on table correoCliente is 'Tabla que contiene los correos electronicos de los clientes';
comment on column correoCliente.idPersona is 'Es el id del cliente';
comment on column correoCliente.correo is 'Es el correo del cliente';
comment on constraint correo_d1 on correoCliente is 'Restriccion que asegura que el correo tiene un @';
comment on constraint correoc_pkey on correoCliente is 'LLave compuesta primaria por el id del Cliente y el correo';
comment on constraint correoc_fkey on correoCliente is 'LLave foranea del id del Cliente';




create table correoCuidador (
	idPersona serial8,
	correo varchar(50)
);

-- Restricciones correoCuidador
-- Dominio
alter table correoCuidador alter column idPersona 
set not null;
alter table correoCuidador alter column correo
set not null;
alter table correoCuidador add constraint correo_d1
check (correo like '%_@_%._%');

-- Entidad 
alter table correoCuidador add constraint correocu_pkey
primary key (idPersona, correo);

-- Referencial
alter table correoCuidador add constraint correocu_fkey
foreign key (idPersona) references cuidador(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
comment on table correoCuidador is 'Tabla que contiene los correos electronicos de los cuidadores';
comment on column correoCuidador.idPersona is 'Es el id del cuidador';
comment on column correoCuidador.correo is 'Es el correo del cuidador';
comment on constraint correo_d1 on correoCuidador is 'Restriccion que asegura que el correo tiene un @';
comment on constraint correocu_pkey on correoCuidador is 'LLave compuesta primaria por el id del Cuidador y el correo';
comment on constraint correocu_fkey on correoCuidador is 'LLave foranea del id del Cuidador';




create table correoVeterinario (
	idPersona serial8,
	correo varchar(50)
);

-- Restricciones correoVeterinario
-- Dominio
alter table correoVeterinario alter column idPersona 
set not null;
alter table correoVeterinario alter column correo
set not null;
alter table correoVeterinario add constraint correo_d1
check (correo like '%_@_%._%');

-- Entidad 
alter table correoVeterinario add constraint correov_pkey
primary key (idPersona, correo);

-- Referencial
alter table correoVeterinario add constraint correov_fkey
foreign key (idPersona) references veterinario(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
comment on table correoVeterinario is 'Tabla que contiene los correos electronicos de los veterinarios';
comment on column correoVeterinario.idPersona is 'Es el id del veterinario';
comment on column correoVeterinario.correo is 'Es el correo del cuidador';
comment on constraint correo_d1 on correoVeterinario is 'Restriccion que asegura que el correo tiene un @';
comment on constraint correov_pkey on correoVeterinario is 'LLave compuesta primaria por el id del Veterinario y el correo';
comment on constraint correov_fkey on correoVeterinario is 'LLave foranea del id del Veterinario';




create table correoProveedor (
	idPersona serial8,
	correo varchar(50)
);

-- Restricciones correoProveedor
-- Dominio
alter table correoProveedor alter column idPersona 
set not null;
alter table correoProveedor alter column correo
set not null;
alter table correoProveedor add constraint correo_d1
check (correo like '%_@_%._%');

-- Entidad 
alter table correoProveedor add constraint correop_pkey
primary key (idPersona, correo);

-- Referencial
alter table correoProveedor add constraint correop_fkey
foreign key (idPersona) references proveedor(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
comment on table correoProveedor is 'Tabla que contiene los correos electronicos de los proveedores';
comment on column correoProveedor.idPersona is 'Es el id del proveedor';
comment on column correoProveedor.correo is 'Es el correo del proveedor';
comment on constraint correo_d1 on correoProveedor is 'Restriccion que asegura que el correo tiene un @';
comment on constraint correop_pkey on correoProveedor is 'LLave compuesta primaria por el id del Proveedor y el correo';
comment on constraint correop_fkey on correoProveedor is 'LLave foranea del id del Proveedor';



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
foreign key (idPersona) references proveedor(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios
comment on table alimento is 'Tabla que contiene los alimentos para los animales del zoologico';
comment on column alimento.idInsumo is 'Identificador del alimento';
comment on column alimento.idPersona is 'Identificador del provedor que entrego el alimento';
comment on column alimento.nombre is 'Nombre del alimento';
comment on column alimento.fechaCaducidad is 'Es la fecha de caducidad del alimento';
comment on column alimento.cantidad is 'Es la cantidad que hay de dicho alimento';
comment on column alimento.refrigeracion is 'true en caso de necesitar refrigeracion, false en caso de que el alimento no necesite';
comment on column alimento.tipoAlim is 'Es el tipo de ese alimento';
comment on constraint id_insumo on alimento is 'El idInsumo asegura que no sea nulo.';
comment on constraint id_persona on alimento is 'El idPersona asegura que no sea nulo';
comment on constraint alimento_d1 on alimento is 'Restriccion que asegura que el nombre no sea nulo ni tampoco la cadena vacia';
comment on constraint alimento_d2 on alimento is 'Restriccion que asegura que la fecha de caducidad no puede ser nula';
comment on constraint alimento_d3 on alimento is 'Restriccion que asegura que la cantidad del alimento debe ser mayor a 0';
comment on constraint alimento_d4 on alimento is 'Restriccion que asegura que la refrigeracion debe ser true or false';
comment on constraint alimento_d5 on alimento is 'Restriccion que asegura que la cadena del tipo de alimento debe tener una longitud de entre [3, 5] caracteres';
comment on constraint alimento_pkey on alimento is 'LLave primaria de la tabla alimento';
comment on constraint alimento_fkey on alimento is 'LLave foranea del proveedor que entrego dicho alimento';




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
foreign key (idPersona) references proveedor(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
comment on table medicina is 'Tabla que almacena informacion sobre medicamentos e insumos medicos.';
comment on column medicina.idInsumo is 'ID unico del insumo medico.';
comment on column medicina.idPersona is 'ID de la persona (proveedor) asociada a la medicina.';
comment on column medicina.nombre is 'Nombre de la medicina o insumo medico.';
comment on column medicina.fechCaducidad is 'Fecha de caducidad de la medicina.';
comment on column medicina.cantidad is 'Cantidad disponible del insumo.';
comment on column medicina.refrigeracion is 'Indica si la medicina requiere refrigeracion (verdadero o falso).';
comment on column medicina.labProd is 'Nombre del laboratorio productor de la medicina.';
comment on column medicina.lote is 'Numero de lote de la medicina.';
comment on constraint cantidad on medicina is 'Restriccion para que que la cantidad de insumo sea mayor o igual a cero.';
comment on constraint refrigeracion on medicina is 'Restriccion que asegura que el valor de refrigeracion sea verdadero o falso.';
comment on constraint labProd on medicina is 'Restriccion que asegura que el nombre del laboratorio productor tenga entre 3 y 50 caracteres y no sea nulo.';
comment on constraint refrigeracion on medicina is 'Establece un valor predeterminado de "false" para la columna de refrigeracion.';
comment on constraint medicina_pkey on medicina is 'Clave primaria que utiliza el ID unico del insumo.';
comment on constraint medicina_fkey on medicina is 'Clave foranea que relaciona el ID de la persona (proveedor) con la tabla proveedor.';


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
foreign key (idInsumo) references medicina(idInsumo)
ON DELETE CASCADE ON UPDATE CASCADE;
alter table subministrar add constraint idAnimal_fkey
foreign key (idAnimal) references animal(idAnimal)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios--
comment on table subministrar is 'Tabla que registra la relacion entre animales e insumos suministrados';
comment on column subministrar.idAnimal is 'ID del animal al que se suministra el insumo';
comment on column subministrar.idInsumo is 'ID del insumo suministrado';
comment on constraint subministrar_d1 on subministrar is 'Restriccion para que el ID del animal no sea nulo';
comment on constraint subministrar_d2 on subministrar is 'Restriccion para que el ID del insumo no sea nulo';
comment on constraint idInsumo_fkey on subministrar is 'Clave foranea que relaciona el ID del insumo con la tabla medicina';
comment on constraint idAnimal_fkey on subministrar is 'Clave foranea que relaciona el ID del animal con la tabla animal';

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
alter table jaula add constraint jaula_pkey
primary key (idAnimal, numJaula);
-- Referencial --
alter table jaula add constraint jaula_fkey1
foreign key(idAnimal) references animal(idAnimal)
ON DELETE CASCADE ON UPDATE CASCADE;
alter table jaula add constraint jaula_fkey2
foreign key(idBioma) references bioma(idBioma)
ON DELETE CASCADE ON UPDATE CASCADE;

--Comentarios--
comment on table jaula is 'Tabla que tiene informacon de las jaulas de animales';
comment on column jaula.idAnimal is 'ID del animal que esta en la jaula';
comment on column jaula.numJaula is 'Numero de la jaula';
comment on column jaula.idBioma is 'ID del bioma al que pertenece la jaula';
comment on constraint jaula_d1 on jaula is 'Restriccion para que el id no sea nulo';
comment on constraint jaula_d2 on jaula is 'Restriccion para que el numero de la jaula no se nulo';
comment on constraint jaula_d3 on jaula is 'Restriccion para que el ID del bioma no sea nulo';
comment on constraint jaula_fkey1 on jaula is 'Clave foranea que relaciona el ID del animal con la tabla animal';
comment on constraint jaula_fkey2 on jaula is 'Clave foranea que relaciona el ID del bioma con la tabla bioma';

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
foreign key(idPersona) references veterinario(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE laborar ADD CONSTRAINT laborar_fkey2
foreign key(idBioma) REFERENCES bioma(idBioma)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
comment on table laborar is 'Tabla que registra la asignacion de veterinarios a biomas para trabajar en ellos';
comment on column laborar.idPersona is 'ID de la persona (veterinario) asignada a trabajar en un bioma';
comment on column laborar.idBioma is 'ID del bioma al que se asigna un veterinario para trabajar';
comment on constraint laborar_d1 on laborar is 'Restriccion que asegura que el ID de la persona (veterinario) no sea nulo';
comment on constraint laborar_d2 on laborar is 'Restriccion que asegura que el ID del bioma no sea nulo';
comment on constraint laborar_fkey1 on laborar is 'Clave foranea que relaciona el ID de la persona (veterinario) con la tabla veterinario';
comment on constraint laborar_fkey2 on laborar is 'Clave foranea que relaciona el ID del bioma con la tabla bioma';

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
foreign key (idPersona) references veterinario(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE atender ADD CONSTRAINT idAnimal_fkey
foreign key (idAnimal) references animal(idAnimal)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
comment on table atender is 'Tabla que registra la relacion entre veterinarios y animales que atienden';

comment on column atender.idPersona is 'ID de la persona (veterinario) que atiende al animal';
comment on column atender.idAnimal is 'ID del animal que es atendido por un veterinario';
comment on column atender.indicacionesMedicas is 'Indicaciones medicas que el veterinario da al animal';

comment on constraint atender_d1 on atender is 'Restriccion que asegura que el ID de la persona (veterinario) no sea nulo';
comment on constraint atender_d2 on atender is 'Restriccion que asegura que el ID del animal no sea nulo';
comment on constraint atender_d3 on atender is 'Restriccion que asegura que las indicaciones medicas no sean la cadena vacia';

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
FOREIGN KEY (idPersona) REFERENCES cliente(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE asistirCliente ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --   
COMMENT ON TABLE asistirCliente IS 'Tabla que contiene los datos de los clientes que asistieron a los eventos';

COMMENT ON COLUMN asistirCliente.idPersona IS 'Identificador de el cliente que asistio al evento';
COMMENT ON COLUMN asistirCliente.idEvento IS 'Identificador del evento al que asistio el cliente';

COMMENT ON CONSTRAINT asistirCliente_d1 ON asistirCliente IS 'Restriccion check que nos asegura que el id de el cliente no sea nulo';
COMMENT ON CONSTRAINT asistirCliente_d2 ON asistirCliente IS 'Restriccion check que nos asegura que el id del evento no sea nulo';



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
FOREIGN KEY (idPersona) REFERENCES veterinario(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE asistirVeterinario ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios -- 
COMMENT ON TABLE asistirVeterinario IS 'Tabla que contiene los datos de los veterinarios que asistieron a los eventos';

COMMENT ON COLUMN asistirVeterinario.idPersona IS 'Identificador de el veterinario que asistio al evento';
COMMENT ON COLUMN asistirVeterinario.idEvento IS 'Identificador del evento al que asistio el veterinario';

COMMENT ON CONSTRAINT asistirVeterinario_d1 ON asistirVeterinario IS 'Restriccion check que nos asegura que el id de el veterinario no sea nulo';
COMMENT ON CONSTRAINT asistirVeterinario_d2 ON asistirVeterinario IS 'Restriccion check que nos asegura que el id del evento no sea nulo';



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
FOREIGN KEY (idPersona) REFERENCES proveedor(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE asistirProveedor ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE asistirProveedor IS 'Tabla que contiene los datos de los proveedores que asistieron a los eventos';

COMMENT ON COLUMN asistirProveedor.idPersona IS 'Identificador de el proveedor que asistio al evento';
COMMENT ON COLUMN asistirProveedor.idEvento IS 'Identificador del evento al que asistio el proveedor';

COMMENT ON CONSTRAINT asistirProveedor_d1 ON asistirProveedor IS 'Restriccion check que nos asegura que el id de el proveedor no sea nulo';
COMMENT ON CONSTRAINT asistirProveedor_d2 ON asistirProveedor IS 'Restriccion check que nos asegura que el id del evento no sea nulo';


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
FOREIGN KEY (idPersona) REFERENCES cuidador(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE asistirCuidador ADD CONSTRAINT idEvento_fkey
FOREIGN KEY (idEvento) REFERENCES evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE asistirCuidador IS 'Tabla que contiene los datos de los cuidadores que asistieron a los eventos';

COMMENT ON COLUMN asistirCuidador.idPersona IS 'Identificador de el cuidador que asistio al evento';
COMMENT ON COLUMN asistirCuidador.idEvento IS 'Identificador del evento al que asistio el cuidador';

COMMENT ON CONSTRAINT asistirCuidador_d1 ON asistirCuidador IS 'Restriccion check que nos asegura que el id de el cuidador no sea nulo';
COMMENT ON CONSTRAINT asistirCuidador_d2 ON asistirCuidador IS 'Restriccion check que nos asegura que el id del evento no sea nulo';


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
FOREIGN KEY (idBioma) REFERENCES bioma(idBioma)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ofrecer ADD CONSTRAINT idServicio_fkey
FOREIGN KEY (idServicio) REFERENCES servicio(idServicio)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE ofrecer IS 'Tabla que contiene los datos de los servicios que se ofrecen en los biomas';

COMMENT ON COLUMN ofrecer.idBioma IS 'Identificador del bioma en el que se ofrece el servicio';
COMMENT ON COLUMN ofrecer.idServicio IS 'Identificador del servicio que se ofrece en el bioma';

COMMENT ON CONSTRAINT ofrecer_d1 ON ofrecer IS 'Restriccion check que nos asegura que el id del bioma no sea nulo';
COMMENT ON CONSTRAINT ofrecer_d2 ON ofrecer IS 'Restriccion check que nos asegura que el id del servicio no sea nulo';




-- NOTIFICACIoN --
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
FOREIGN KEY (idEvento) REFERENCES evento(idEvento)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE notificacion IS 'Tabla que contiene los datos de las notificaciones que se le envian a los clientes';
COMMENT ON COLUMN notificacion.idEvento IS 'Identificador del evento al que se le envia la notificacion';
COMMENT ON COLUMN notificacion.idNotificacion IS 'Identificador de la notificacion que se le envia al cliente';

COMMENT ON CONSTRAINT notificacion_unique ON notificacion IS 'Restriccion que nos asegura que el id de la notificacion sea unico';
COMMENT ON CONSTRAINT notificacion_pkey ON notificacion IS 'Llave primaria (compuesta) de la tabla notificacion';
COMMENT ON CONSTRAINT idEvento_fkey ON notificacion IS 'Llave foranea que relaciona el id del evento con la tabla evento';



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
FOREIGN KEY (idPersona) REFERENCES cliente(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE notificar ADD CONSTRAINT idNotificacion_fkey
FOREIGN KEY (idNotificacion ) REFERENCES notificacion(idNotificacion)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE notificar IS 'Tabla que contiene los datos de las notificaciones que se le envian a los clientes';

COMMENT ON COLUMN notificar.idPersona IS 'Identificador de el cliente al que se le envia la notificacion';
COMMENT ON COLUMN notificar.idNotificacion IS 'Identificador de la notificacion que se le envia al cliente';
    
COMMENT ON CONSTRAINT notificar_d1 ON notificar IS 'Restriccion check que nos asegura que el id de el cliente no sea nulo';
COMMENT ON CONSTRAINT notificar_d2 ON notificar IS 'Restriccion check que nos asegura que el id de la notificacion no sea nulo';

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
FOREIGN KEY (idAnimal) REFERENCES animal(idAnimal)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE alimentar ADD CONSTRAINT idInsumo_fkey
FOREIGN KEY (idInsumo) REFERENCES alimento(idInsumo)
ON DELETE CASCADE ON UPDATE CASCADE;

--Comentarios--
comment on table alimentar is 'Tabla que registra la relacion entre animales e insumos de alimentacion suministrados';
comment on column alimentar.idAnimal is 'ID del animal al que se suministra el insumo de alimentacion';
comment on column alimentar.idInsumo is 'ID del insumo de alimentacion suministrado';
comment on constraint alimentar_d1 on alimentar is 'Restriccion que asegura que el ID del animal no sea nulo';
comment on constraint alimentar_d2 on alimentar is 'Restriccion que asegura que el ID del insumo de alimentacion no sea nulo';
comment on constraint idAnimal_fkey on alimentar is 'Clave foranea que relaciona el ID del animal con la tabla animal';
comment on constraint idInsumo_fkey on alimentar is 'Clave foranea que relaciona el ID del insumo de alimentacion con la tabla alimento';




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
PRIMARY KEY (idTicket, idServicio);
-- Referencial --
ALTER TABLE ticket ADD CONSTRAINT idServicio_fkey
FOREIGN KEY (idServicio) REFERENCES servicio(idServicio)
ON DELETE CASCADE ON UPDATE CASCADE;
ALTER TABLE ticket ADD CONSTRAINT idPersona_fkey
FOREIGN KEY (idPersona) REFERENCES cliente(idPersona)
ON DELETE CASCADE ON UPDATE CASCADE;

-- Comentarios --
COMMENT ON TABLE ticket IS 'Tabla que contiene los datos de los tickets de los clientes';

COMMENT ON COLUMN ticket.idTicket IS 'Identificador del ticket';
COMMENT ON COLUMN ticket.idServicio IS 'Identificador del servicio que se pago';
COMMENT ON COLUMN ticket.idPersona IS 'Identificador de la persona que pago el servicio';
COMMENT ON COLUMN ticket.fecha IS 'Fecha en la que se pago el servicio';
COMMENT ON COLUMN ticket.porcentajeDesc IS 'Porcentaje de descuento que se le aplico al servicio';

COMMENT ON CONSTRAINT ticket_unique ON ticket IS 'Restriccion que asegura que el id del ticket sea unico';
COMMENT ON CONSTRAINT idServicio_fkey ON ticket IS 'Restriccion que asegura que el id del servicio no sea nulo';
COMMENT ON constraint idPersona_fkey ON ticket IS 'Restriccion que asegura que el id de la persona no sea nulo';
COMMENT ON CONSTRAINT porcentaje_Desc ON ticket IS 'Restriccion que asegura que el porcentaje de descuento sea mayor o igual a 0';


