create table dbVet

use dbVet;

create table tDoc(
    idDoctor INT Primary key,       -- To define a unique identifier for each registry inside a table
    firstName varchar(25) not null, -- not null means it's a must
    surname varchar(40) not null,
    phoneNum int unique,            -- unique = this phone number can't repeat
    specialty varchar(75)
);

create table tPatient(
    idPatient INT Primary key,
    firstName varchar(25) not null,
    surname varchar(40) not null,
    phoneNum int unique,
    age int Check(age <18) -- Check will validate
);

create table tClient(
    idClient INT Primary key,
    firstName varchar(25) not null,
    surname varchar(40) not null,
    phoneNum int unique,
    age int,
    email nvarchar(60)
);

/* Now we can insert data into the tables*/

insert into tClient values(); -- To input data in the order previously defined
insert into tClient(idClient, firstName, phoneNum) values(); --To manually choose where to input data 

insert into tClient values(
    1,
    'Luis',
    'White',
    88666688,
    null,
    'test@gmail.com'
);
    -- We can add several
    -- The idClient number and unique values can't appear twice
insert into tClient values(
    1,
    'Luis',
    'White',
    88666688,
    null,
    'test@gmail.com'
),(
    2,
    'Luis',
    'White',
    88666677,
    null,
    'test123@gmail.com'
),(
    3,
    'Luis',
    'White',
    88666699,
    null,
    'test999@gmail.com'
);

/* Now we can consult the tables*/

    --  Using the * will display everything on this table
select * from tClient;

    -- Here you select idClient, firstName and email from tClient table
select idClient, firstName, email from tClient;

    -- Here idClient will appear as 'identificador'
select idClient as 'identificador', firstName, email from tClient;

    -- Here we can use a conditional, when something equals something else
select * from tClient where idClient=3;

select * from tClient where edad is null;

select * from tClient where edad is not null;

    -- Here we can change the age on the tClient table where the idClient equals 2
update tClient set age = 18 where idClient = 2;
    -- Here we can modify two attributes on the tClient table
    -- using 'and' is to add another condition to modify the table
update tClient set age = 20, phoneNum = 1223321 
where idClient = 3 and firstName = 'Luis';

    -- Here we can delete something from a table
delete from tClient where idClient = 3;

