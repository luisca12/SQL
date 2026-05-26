create database dbVet;

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

/* Second DB Homework */

create database dbStreaming;
use dbStreaming;

create table tUser(
    userID INT Primary key,
    firstName varchar(25) not null,
    surname varchar(40) not null,
    phoneNum varchar(20) unique,
    age int Check(age >=18),
    email nvarchar(60) unique
);

create table tVideos(
    videoID INT Primary key,
    userID INT,
    videoName nvarchar(120) not null,
    videoDesc nvarchar(300),
    videoLeng int, -- Duracion del video
    videoView int  default 0, -- Vistas del video

    Foreign KEY (userID) REFERENCES tUser(userID)
);

create table tVideoRevenue(
    revenueID INT Primary key,
    videoID int,
    revenueAmount money,
    revenueDate datetime,
    revenueApproved varchar(30), -- Para comentarios relacionado al dinero generado

    Foreign KEY (videoID) REFERENCES tVideos(videoID)
);

insert into tUser values
(1, 'Luis', 'Alfaro','1000',24,'user@gmail.com'),
(2, 'Jaz', 'Mora','1001',20,'user1@gmail.com'),
(3, 'Nicole', 'Martrinez','1010',30,'user2@gmail.com'),
(4, 'Michelle', 'Solera','1011',19,'user3@gmail.com'),
(5, 'Gloriana', 'Alvarado','1100',18,'user4@gmail.com');

insert into tVideos values
(1, 1, 'Video 0', null, 10, 10),
(2, 2, 'Video 1', 'prueba 1', 10, 10),
(3, 3, 'Video 2', 'comida japonesa', 10, 10),
(4, 4, 'Video 3', 'luisito no comunica', 10, 10),
(5, 5, 'Video 4', 'luisito descomunica?', 10, 10);

insert into tVideoRevenue values
(1, 1, 1.75, '2026-05-26 16:30:00', 'Denegado'),
(2, 2, 520.75, '2026-05-26 16:30:00', 'Aprobado'),
(3, 3, 1520.75, '2026-05-26 16:30:00', 'Denegado'),
(4, 4, 99999999, '2026-05-26 16:30:00', 'Aprobado'),
(5, 5, 10000000, '2026-05-26 16:30:00', 'Aprobado');
