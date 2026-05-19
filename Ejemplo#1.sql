/*
First DB example
*/

create databse dbUltinaStudents --To create a DB
use dbUltinaStudents -- To start using the DB dbUltinaStudents

-- It's a good practice to comment everything that you're not using
-- So create and use will be commented in a future

create table tStudents(     -- To create a Table
    studentID varchar(15),  -- To define a attribute (column), 15 characters
    fullName varchar(100),
    signUpDate date,
    major nvarchar(20)        
);

alter table tStudents       -- To add a attribute (column)
add email nvarchar(30),     -- Adds the email column to table tStudents
add country nvarchar(20);

alter table tStudents       -- To modify a attribute (column)
alter email nvarchar(50);   -- Modifies the character lenght of email column

drop table tStudents;       -- To delete a table

alter table tStudents       -- To delete a specific column
drop email;

/* First DB Homework */

create table dentistaA(
    doctor varchar(100),
    treatment nvarchar(500),
    patient varchar(100),
    appDate datetime,
    total money
);
