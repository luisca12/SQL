/*
First DB practice
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

