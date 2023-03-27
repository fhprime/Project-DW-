create database supermercado;

use supermercado;

CREATE TABLE Region(
    Id_region int  NOT NULL auto_increment,
    Nombre_region varchar(128)  NOT NULL,
    CONSTRAINT Id_region_pk PRIMARY KEY (Id_region)
   );
   
CREATE TABLE Ubicacion (
	ID_Ubicacion int auto_increment,
    Codigo_postal int  NOT NULL,
    Pais varchar(128)  NOT NULL,
    Estado varchar(128)  NOT NULL,
    Ciudad varchar(128)  NOT NULL,
    CONSTRAINT ID_UbicacionPK PRIMARY KEY (ID_Ubicacion)
);



CREATE TABLE Envio (
    Id_Envio int auto_increment,
    Tipo_envio varchar(128)  NOT NULL,
    CONSTRAINT Id_ordenPK PRIMARY KEY (Id_Envio)
);



CREATE TABLE Cliente (
    Id_cliente varchar(20) unique NOT NULL,
    Nombre varchar(128)  NOT NULL,
    Segmento varchar(128)  NOT NULL,
    CONSTRAINT Id_clientePK PRIMARY KEY (Id_cliente)
);

CALL SDC_CLIENT('AA-10315','Consumer');


CREATE TABLE Producto (
	ID_Product int auto_increment,
	Id_producto text  NOT NULL,
    Categoria text NOT NULL,
    Subcategoria text  NOT NULL,
    Nombre text NOT NULL,
    CONSTRAINT Id_productoPK PRIMARY KEY (ID_Product)
);





CREATE TABLE Fechas_orden(
	date_key int,
	full_date datetime,
    day_of_week int,
    day_num_in_month int,
    day_name varchar(50),
    weekday_flag varchar(50),
    month_name varchar(50),
    month_abbrev varchar(50),
	_year int,
    CONSTRAINT Id_dateordenPK PRIMARY KEY (date_key)
);


CREATE TABLE Fechas_envio(
    date_key int,
	full_date datetime,
    day_of_week int,
    day_num_in_month int,
    day_name varchar(50),
    weekday_flag varchar(50),
    month_name varchar(50),
    month_abbrev varchar(50),
	_year year,
    
    CONSTRAINT Id_dateenvioPK PRIMARY KEY (date_key)
);

CREATE TABLE Fact_super (
sk_super_fact int auto_increment,
Fecha_orden int,
Fecha_envio int, 
Id_orden varchar(14) not null,
Id_region int NOT NULL,
Id_ubicacion int NOT NULL,
Id_cliente varchar(20)  NOT NULL,
Id_producto int NOT NULL,
Id_envio int NOT NULL, 
Venta float NOT NULL,
Cantidad int NOT NULL,
Descuento float,
Ganancia float NOT NULL,
CONSTRAINT Id_ventaPK PRIMARY KEY (sk_super_fact)
);

ALTER TABLE Fact_super ADD CONSTRAINT fact_Fechas_orden
    FOREIGN KEY (Fecha_orden)
    REFERENCES Fechas_orden (date_key);
    
ALTER TABLE Fact_super ADD CONSTRAINT fact_Fechas_envio
    FOREIGN KEY (Fecha_envio)
    REFERENCES Fechas_envio (date_key);

ALTER TABLE Fact_super ADD CONSTRAINT fact_region
    FOREIGN KEY (Id_region)
    REFERENCES Region (Id_region);
    
ALTER TABLE Fact_super ADD CONSTRAINT fact_Ubicacion
    FOREIGN KEY (Id_ubicacion)
    REFERENCES Ubicacion (ID_Ubicacion);
    
ALTER TABLE Fact_super ADD CONSTRAINT fact_cliente
    FOREIGN KEY (Id_cliente)
    REFERENCES Cliente (Id_cliente);
    
ALTER TABLE Fact_super ADD CONSTRAINT fact_producto
    FOREIGN KEY (Id_producto)
    REFERENCES Producto (ID_Product);

ALTER TABLE Fact_super ADD CONSTRAINT fact_orden
    FOREIGN KEY (Id_envio)
    REFERENCES Envio (Id_Envio);
    


SELECT * FROM dl_test;
SELECT max(`Order Date`),min(`Order Date`) from dl_test; # Fecha maxima 30/!2/2018 // Fecha minima 03/01/2015

SELECT * FROM Envio;
SELECT * FROM Cliente;
SELECT * FROM Fechas_orden;
SELECT * FROM fechas_envio;
SELECT * FROM Region;
SELECT * FROM Ubicacion;
SELECT * FROM producto;
SELECT * FROM Fact_super;

DROP TABLE fechas_envio;
DROP TABLE fechas_orden;
DROP TABLE fact_super;
DROP TABLE cliente;
DROP TABLE Producto;
DROP TABLE Ubicacion;
DROP TABLE Envio;

SHOW CREATE TABLE fact_super;

SELECT CHAR_LENGTH(Id_orden) FROM fact_super;
#Sugerencias unir tabla de region con ubicacion