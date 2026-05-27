create database booksDB
use booksDB

create table publisherT(
    publisherID int primary key,
    publisherName varchar(100),
    country nvarchar(70)
);

create table authorT(
    authorID int primary key,
    authorName nvarchar(70),
    nationality nvarchar(70)
);

create table bookT(
    bookID int primary key,
    title varchar(30),
    publishDate date,
    publisherID int,

    Foreign key (publisherID) REFERENCES publisherT(publisherID)
);

-- This is a shared table, relation many to many
-- When there is a reltion many to many we MUST have a shared table
create table bookAuthorT(
    bookID int,
    authorID int,
    primary key (bookID, authorID),
    Foreign key (bookID) REFERENCES bookT(bookID),
    Foreign key (authorID) REFERENCES authorT(authorID)
);

insert into publisherT values
(1, 'Tio Conejo', 'Costa Rica'),
(2, 'Publicadora ATOM', 'Colombia');

insert into authorT values
(1, 'Luis', 'Alemania'),
(2, 'Jaz', 'Nicaragua'),
(3, 'Gloriana', 'Venezuela'),
(4, 'Nicole', 'India'),
(5, 'Michelle', 'South Africa');

insert into bookT values
(1, 'Los 2 cuentos', '2010', 1),
(2, 'Los 3 cuentos', '2000', 2),
(3, 'Los 6 cuentos', '2020', 1),
(4, 'La guerra', '1989', 2);

-- Now we need to map the books to the authors

insert into bookAuthorT values
(1, 2), -- Book with ID 1 has author Jaz
(1, 3), -- To the same book I can add another Author
(2, 1), -- Book with ID 2 has author Luis
(3, 4), -- Book with ID 3 has author Nicole
(4, 5); -- Book with ID 4 has author Michelle

-- Now we can SELECT, display data
-- We can use an acronym, for example, the table 'bookT' as BT
select BT.title from bookT BT

-- We can select at the same time from different tables
-- the table 'bookT' as BT
-- the table 'authorT' as AuT
select BT.title, BT.publishDate, AuT.authorName 
from bookT BT, authorT AuT, bookAuthorT BAuT
where BAuT.authorID = AuT.authorID and BT.bookID = BAuT.bookID

