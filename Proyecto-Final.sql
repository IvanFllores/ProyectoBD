Create database ProyectoFinal

CREATE TABLE Proveedores(
 ProveedorID INT NOT NULL IDENTITY(1,1),
    Nombre VARCHAR(100) NOT NULL,
	Calle VARCHAR(100), 
    Ciudad VARCHAR(100),
	Web VARCHAR(500), 
    PRIMARY KEY (ProveedorID)
)

 CREATE TABLE Sucursal(
 SucursalID INT NOT NULL IDENTITY(1,1),
 Nombre VARCHAR(200) NOT NULL,
 Telefono INT,
 Calle VARCHAR(100),
 Ciudad VARCHAR(100),
 PRIMARY KEY(SucursalID)
 )

 CREATE TABLE Empleados(
 EmpleadoID INT NOT NULL PRIMARY KEY,
 Nombre VARCHAR(15),
 Apellido VARCHAR(20),
 Telefono INT,
 Fecha_Contratacion DATE,
 Sueldo DECIMAL(10,2),
 Ciudad VARCHAR(50),
 Calle VARCHAR(50),
 Sucursal_donde_trabaja INT NOT NULL FOREIGN KEY REFERENCES Sucursal(SucursalID)
 )

 CREATE TABLE Clientes(
 RUT INT NOT NULL IDENTITY(1,1),
 Nombre VARCHAR(100) NOT NULL,
 Apellido VARCHAR(100),
 Telefono INT,
 Calle VARCHAR(100),
 Ciudad VARCHAR(100),
 PRIMARY KEY (RUT)
 )


CREATE TABLE Videojuegos(
VideojuegoID INT NOT NULL PRIMARY KEY,
Nombre VARCHAR(100),
Fecha_de_lanzamiento DATE,
Genero VARCHAR(50),
Clasificacion VARCHAR(20),
Consola VARCHAR(20),
Precio DECIMAL(10,2),
Proveedor VARCHAR(50),
IDproveedor INT NOT NULL FOREIGN KEY REFERENCES Proveedores(ProveedorID)
)

CREATE TABLE Ventas(
VentaID INT NOT NULL PRIMARY KEY,
Fecha DATE,
Monto_final DECIMAL(10,2),
ClienteRUT INT NOT NULL FOREIGN KEY REFERENCES Clientes(RUT),
IDempleado INT NOT NULL FOREIGN KEY REFERENCES Empleados(EmpleadoID)
)

CREATE TABLE DetalleVenta (
Cantidad_De_Productos INT,
Precio DECIMAL(10,2),
IDvideojuego INT NOT NULL FOREIGN KEY REFERENCES Videojuegos(VideojuegoID),
IDventa INT NOT NULL FOREIGN KEY REFERENCES Ventas(VentaID)
)

