use master
go
drop database bd_pedidos
go
create database bd_pedidos 
go
use bd_pedidos
go

create table T_Proveedores (
id int identity(1,1) constraint pk_Proveedor primary key,
nombre varchar (100) not null,
telefeno int constraint un_telefonoP unique not null,
correo varchar (100) constraint un_correoP unique not null,
estado bit not null
)
go
create table T_Productos (
id int identity (1,1) constraint pk_Producto primary key,
nombre varchar (100) not null,
stok int not null,
estado bit not null,
precio float not null,
cod_Proveedor int constraint fk_CodProveedor foreign key references T_Proveedores(id)
)
go
create table T_Clientes(
id int identity (1,1) constraint pk_Cliente primary key,
nombre varchar (100) not null,
telefono int constraint un_telefonoC unique not null,
correo varchar (100) constraint un_correoC unique not null,
estado bit not null
)
create table T_Pedidos (
id int identity (1,1) constraint pk_pedido primary key,
fechaPedido date constraint df_FechaPedido default (getdate()),
codigoPedido int not null,
cod_cliente int constraint fk_CodCliente foreign key references T_Clientes(id),
cod_producto int constraint fk_CodProducto foreign key references T_Productos(id)
)
go
insert into T_Proveedores (nombre, telefeno,correo,estado)
					values('Tosty',234234,'tosty@tsty.com',1),
						  ('Coca Cola',23423,'coca@cola.com',1),
						  ('Diana',394803,'productos_diana@diana.com',1),
						  ('Dos Pinos',324234,'dospinos@dosP.com',1),
						  ('Los patitos', 29903,'Patitlos@patos.com',0),
						  ('Los michis',32342,'michiis@mich.com',1)
go
select * from T_Proveedores
go
insert into T_Productos (nombre, stok,estado,precio,cod_Proveedor)
				  values('Chirulitos',20, 1,350,1),
						('Bolitas de queso',12, 1,350,1),
						('Chirulitos',20, 1,350,1),
						('Coca cola',100, 1,500,2),
						('Fanta naranja',0, 0,500,2),
						('Hi-c',30, 1,650,2),
						('Centavitos',13,1,200,3),
						('Alborotos',34,1,200,3),
						('Maiz chino picante',32,1,200,3),
						('Frecoleche fresa', 12,1,650,4),
						('Frecoleche chocolate', 12,1,650,4),
						('Frecoleche vainilla', 12,1,650,4),
						('Frecoleche caramelo', 0,0,650,4),
						('patito de hule' , 0, 0,250,5)
go
select * from T_Productos
go

insert into T_Clientes (nombre,telefono,correo,estado)
				values('Sara Vargas',34323233,'saravargas@gmail.com',1),
					  ('Mariana Marin',6533433,'nana@gmial.com',0),
					  ('Daniel Fernandez',3343533,'dafer@gmail.com',1),
					  ('Alexis Mata',23242,'alexis@hotmail.com',0),
					  ('Sharon Cordero',9909768,'sharon@outlook.com',1)
go
select * from T_Clientes
go

insert into T_Pedidos (cod_cliente,cod_producto,codigoPedido)
				values(1,1,1),
				(1,3,1),
				(1,5,1),
				(1,6,2),
				(2,7,3),
				(3,2,3),
				(3,1,3),
				(3,7,4),
				(3,9,4),
				(5,6,5),
				(5,8,5)
select * from T_Pedidos