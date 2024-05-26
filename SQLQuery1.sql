CREATE DATABASE EldenPizza
GO

USE EldenPizza
GO

CREATE TABLE TipoProducto
(
	Id INT IDENTITY(1,1),
	Descripcion VARCHAR(75) NOT NULL,
	PRIMARY KEY(Id)
)
GO

CREATE TABLE Producto
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(250) NOT NULL,
	TipoProductoId INT NOT NULL,
	Precio DECIMAL(8,2) NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY (TipoProductoId) REFERENCES TipoProducto(Id)
)
GO

CREATE TABLE Cliente
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(250) NOT NULL,
	Telefono VARCHAR(15),
	PRIMARY KEY(Id)
)
GO

CREATE TABLE ClienteDireccion
(
	Id INT IDENTITY(1,1),
	Direccion VARCHAR(MAX) NOT NULL,
	ClienteId INT NOT NULL,
	PRIMARY KEY(Id),
	FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
)
GO

CREATE TABLE Usuario
(
	Id INT IDENTITY(1,1),
	Nombre VARCHAR(250),
	Email VARCHAR(60),
	Usuario	VARCHAR(20),
	Salt VARCHAR(32),
	Clave VARBINARY(64),
	PRIMARY KEY (Id)
)
GO

CREATE TABLE Pedido
(
	Id INT IDENTITY (1,1),
	ClienteDireccionId INT NOT NULL,
	ClienteId INT NOT NULL,
	TotalProducto INT NOT NULL,
	Total Decimal(8,2),
	PRIMARY KEY (Id),
	FOREIGN KEY (ClienteDireccionId) REFERENCES ClienteDireccion(Id),
	FOREIGN KEY (ClienteId) REFERENCES Cliente(Id)
)
GO

CREATE TABLE DetallePedido
(
	Id INT IDENTITY (1,1),
	PedidoId INT NOT NULL,
	ProductoId INT NOT NULL,
	Cantidad INT NOT NULL,
	Precio DECIMAL(8,2),
	Total DECIMAL (8,2),
	PRIMARY KEY (Id),
	FOREIGN KEY (PedidoId) REFERENCES Pedido(Id),
	FOREIGN KEY (ProductoId) REFERENCES Producto(Id),

)
GO

INSERT INTO Usuario (Nombre, Email, Usuario, Salt, Clave)
VALUES (
    'Admin Name', -- Nombre del administrador
    'admin@example.com', -- Email del administrador
    'admin', -- Nombre de usuario del administrador
    0xA1B2C3D4E5F67890A1B2C3D4E5F67890, -- Salt en formato hexadecimal
    0x0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF0123456789ABCDEF -- Clave en formato hexadecimal
);