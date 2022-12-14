--SQL
USE master;
GO
IF DB_ID (N'Carretera') IS NOT NULL
DROP DATABASE Carretera;
GO
CREATE DATABASE Carretera
ON 
(NAME = Carretera_dat,
FILENAME = 'C:\BD\Carretera.mdf',
SIZE = 10,a
MAXSIZE = 50,
FILEGROWTH = 5)
LOG ON 
(NAME = Carretera_log,
FILENAME = 'C:\BD\Carretera.ldf',
SIZE = 5MB,
MAXSIZE = 25MB,
FILEGROWTH = 5MB);
GO
USE Carretera;
GO

--------------TABLAS------
CREATE TABLE  Carretera
( 
idCarretera int not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
);

CREATE  TABLE Tramo
(
idTramo int not null,
numeroTramo int not null,
Descripcion varchar (50) not null,
idCarretera int not null,
estatus bit default 1 not null,
);

CREATE TABLE Municipio
(
idMunicipio int not null,
nombre varchar (50) not null,
estatus bit default 1 not null,
);

CREATE TABLE MunicipioTramo
(
idMunicipioTramo int not null,
kmEntrada int not null,
kmSalida int not null,
idMunicipio int not null,
idTramo int not null,
estatus bit default 1 not null,
);

--------------------------------LLAVES PRIMARIAS-------------------
ALTER TABLE Carretera ADD CONSTRAINT PK_Carretera PRIMARY KEY (idCarretera)
ALTER TABLE Tramo ADD CONSTRAINT PK_Tramo PRIMARY KEY (idTramo)
ALTER TABLE Municipio ADD CONSTRAINT PK_Municipio PRIMARY KEY (idMunicipio)


-------------------------------LLAVES FORANEAS----------------------
ALTER TABLE Tramo ADD CONSTRAINT FK_TramoCarretera FOREIGN KEY (idCarretera) REFERENCES Carretera (idCarretera)
GO

ALTER TABLE MunicipioTramo ADD CONSTRAINT FK_MunicipioTramoMunicipio FOREIGN KEY (idMunicipio) REFERENCES Municipio (idMunicipio)
GO

ALTER TABLE MunicipioTramo ADD CONSTRAINT FK_MunicipioTramoTramo FOREIGN KEY (idTramo) REFERENCES Tramo(idTramo)
GO


--------------------------------INDEX------------------------------

CREATE INDEX IX_Carretera ON Carretera(idCarretera);
GO

CREATE INDEX IX_Tramo ON Tramo(idTramo);
GO

CREATE INDEX IX_Municipio ON Municipio(idMunicipio);
GO

CREATE INDEX IX_MunicipioTramo ON MunicipioTramo(idMunicipioTramo);
GO

