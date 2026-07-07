-- Transact SQL
-- Es un lenguaje de programacion por Microsoft SQL Server para extender el SQL standar
-- Podemos hacer:
-- Procedimientos almacenados, funciones y triggers

-- Comentarios .
    -- Son obligatorios en Transact SQL
    -- ejemplo:
        /* Aqui adentro 
        viene el texto*/


-- declare
    -- Para declarar variable sobre el cual realizamos modificaciones
    -- ejemplo:
        -- declare @nombre varchar(25);
    -- usos:
        -- asignacion directa
        -- declare @nombre varchar(25) = 'Sofia Lopez';

        -- asignacion instrucction set
        -- declar @telefono varchar(8) set @telefono = '123456';
        -- declare @telefono varchar(8), @correo nvarchar(50), @nombre varchar(50);
        -- set @telefono = ''; set @correo = ''; @nombre = '';

        -- asignacion por medio de select
        -- declare @cedula int = (select cedula from Tclients where id=1);

-- Operador aritmeticos
    -- suma, resta, multiplicacion, division
    -- comparadores = igual, distinto de, menor que, mayor que, mayor igual que, menor igual que}
    -- <> esto signfica distinto, es igual a !=

-- Operadores logicos
    -- AND
    -- OR
    -- NOT

-- Otros operadores
    -- Between, exists, in, like

-- If, else
    -- ejemplo:
        -- declare @nombre varchar(25) = 'Warner'
        -- if (@nombre <> 'Warner')
        -- begin
        --      print 'Hola soy ' @nombre
        -- end
        -- else
        -- begin
        --      print 'Nombre no permitido'
        -- end

----------------------------------
/*      Practica en Clase       */
----------------------------------

-- Mostrar todos los proveedores inactivos
declare @indicador bit;
set @indicador = 0;

select * from tProveedores where estado = @indicador;

    ------------------
-- Mostrar los productos que tengan un stock entre 20 y 30
declare @rango0 int, @rango1 int;
set @rango0 = 20; set @rango1 = 30;

select * from tProductos where stock between @rango0 and @rango1;

    ------------------
-- Mostrar los nombres de los productos con id 1,3,5 y 6
select id, nombre from tProductos where id in (1,3,5,6);
    
    ------------------
-- Mostrar los nombres de los clientes que inicien con S
select * from tClientes where nombre like 'S%'; -- el % es como el * en regex
select * from tClientes where nobmre regexp_like (nombre, '^S')
-- Para usar regex ocupamos lo siguiente seteado en la bsae de datos
/* 
    ALTER DATABASE [DatabaseName]
    SET COMPATIBILITY_LEVEL = 170;
*/

    ------------------
-- Insertar un proveedor nuevo si este no existe
declare @nombreProveedor nvarchar(15) = 'Tosty';

if not exists (select 1 from tProveedores where nombre = @nombreProveedor)
begin
    insert into tProveedores values(@nombreProveedor, 123456, 'proveedor@gmail.com', 1);
    print 'Nuevo proveedor agregado' @nombreProveedor
end
else
begin
    print 'Ya existe el proveedor' @nombreProveedor
end

    ------------------
-- Obetnert el precio del producto con id 7 y validar si es mayor 750
select * from tProductos

declare @precio int;
select @precio = precio from tProductos where id = 7;

if @precio > 750
begin
    print 'Precio del procuto ' + @producto + ' mayor a 750' -- Esto si hubiera otra variable llamada @producto
end
else
begin
    print 'Precio menor a 750'
end


----------------------------------------------------
            -- Practica de Semana 8 --
----------------------------------------------------
-- T_Proveedores, T_Productos, T_Clientes, T_Pedidos
----------------------------------------------------
-- 1. Mostrar los nombres de los clientes que han comprando los productos con los ids 5, 4 y 3

select distinct C.nombre
from T_Clientes C
inner join T_Pedidos P on C.id = P.cod_cliente
where P.cod_producto in (5, 4, 3);

--------------------------
-- 2. Mostrar los productos que están inactivos y que tengan un precio menor o igual a 500

declare @status bit;
declare @precio int;

set @status = 0;
set @precio = 500;

select * from T_Productos where estado = @status and precio <= @precio;

--------------------------
-- 3. Validar que exista el producto con id 10, si no existe deberá indicarlo en consola.

declare @productID int = 10;

if exists (select 1 from T_Productos where id = @productID)
begin
    print 'Producto con ID 10 existe';
end
else
begin
    print 'Producto con ID 10 no existe';
end


--------------------------
-- 4. Mostrar los productos que tengan un precio entre los 500 y 650 y que estén activos
declare @status bit;
set @status = 1;

declare @rango0 int, @rango1 int;
ser @rango0 = 500; set @rango1 = 650;

select nobmre from T_Productos where estado = @status and stock between @rango0 and @rango1;

--------------------------
--5. Mostrar los nombres de los proveedores que contengan “T” y que estén activos
declare @status bit = 1;

select nombre from T_Proveedores where nombre like '%T%' and estado = @estado;

--------------------------
-- 6. Sumar los precios de los productos con id 4, 8 y 4 y mostrar el resultado en consola
declare @precioTotal float;

select @precioTotal = (select precio from T_Productos where id = 4) + (select precio from T_Productos where id = 8) 
print 'Precio Total ' + @precioTotal

--------------------------
-- 7. Validar que exista un cliente por medio del id y cambiar el nombre y el telefono, en caso que
-- no exista deberá de guardar el nuevo cliente
declare @userIDtest int;
set @userIDtest = 1;

if exists (select 1 from T_Clientes where id = @userIDtest)
begin
    update T_Clientes set nombre = 'nuevo nombre', telefono = 22550011 where id = @userIDtest;
end
else
begin
    insert into T_Clientes values('Luis Alfaro',1113233,'luisAlfaro@gmail.com',1);
end