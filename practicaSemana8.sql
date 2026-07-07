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