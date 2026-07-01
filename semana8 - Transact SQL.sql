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
    print "Nuevo proveedor agregado" @nombreProveedor
end
else
begin
    print "Ya existe el proveedor" @nombreProveedor
end

    ------------------
-- Obetnert el precio del producto con id 7 y validar si es mayor 750
select * from tProductos

declare @precio int;
select @precio = precio from tProductos where id = 7;

if @precio > 750
begin
    print "Precio del procuto " + @producto + " mayor a 750" -- Esto si hubiera otra variable llamada @producto
end
else
begin
    print "Precio menor a 750"
end