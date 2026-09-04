--creating a database that is called RaceDay--
create  database RaceDay;

--using the database--
use RaceDay;

--creating tables for database--
--users table--
create table users(userID int identity(1,1) primary key,
fullName varchar(50) not null,
email nvarchar(50) not null unique,
role varchar(50) not null,
phoneNumber nvarchar(10),
password nvarchar(150) not null
);

--event--
create table event(eventID int identity(1,1) primary key,
eventName varchar(255) not null,
eventDescription varchar(MAX),
eventDate DATE not null,
location varchar(150) not null,
entryFee decimal(10,2) default 0.00,
userID int not null,
foreign key (userID) references users(userID)
);

--category table--
create table category(categoryID int identity(1,1) primary key,
categoryName varchar(100) not null unique,
categoryDescription varchar(MAX)
);

--eventCategory--
create table eventCategory(eventCategoryID int primary key identity(1,1),
eventID int not null,
categoryID int not null,
foreign key (eventID) references event(eventID),
 foreign key (categoryID) references category(categoryID)
);

--enrolment table--
create table enrolment(enrolmentID int primary key identity(1,1),
userID int not null,
eventCategoryID int not null,
enrolmentDate date not null,
paymentStatus varchar(20) not null,
paymentAmount decimal(10,2) not null,
foreign key (userID) references users(userID),
foreign key (eventCategoryID) references eventCategory(eventCategoryID)
);

--result table--
create table result(resultID int primary key identity(1,1),
enrolmentID int not null,
position int not null,
finishTime time not null,
foreign key (enrolmentID) references enrolment(enrolmentID)
);
drop database RaceDay;

--populating the tables--
--users table--
insert into users(fullName, email, role, phoneNumber, password)
values
('Thabo Mokoena','thabo@raceday.co.za','Organizer','0712345678','Thabo123'),
('Lerato Nkosi','lerato@raceday.co.za','Organizer','072345689','Lerato123'),
('Sipho Dlamini','sipho@gmail.com','Participant','0734566974','Sipho364'),
('Amahle Ndlovu','amahle@gmail.com','Participant','0745678901','Amahle3781');

--event table--
insert into event(eventName, eventDescription, eventDate, location, entryFee, userID)
values
('Johannesburg City Run','A road running event through the streets of Johannesburg.','2026-10-10','Johannesburg', 150.00,1),
('Cape Town Cycle Challenge','A cycling event for participants of different experience levels.','2026-11-15','Cape Town', 250.00,2),
('Pretoria Community Walk','A community walking event promoting health and fitness.','2026-09-26','Pretoria', 80.00,1);

--category table--
insert into category(categoryName, categoryDescription)
values
('Road Running', 'Running events held on roads and paved routes.'),
('Marathon', 'Long-distance running events.'),
('Cycling', 'Cycling events for recreational and competitive participants.'),
('Walking', 'Community and recreational walking events.'),
('Charity', 'Events organised to support charitable causes.');

--eventCategory--
insert into eventCategory(eventID, categoryID)
values
(1, 1),
(1, 2),
(1, 5),
(2, 3),
(2, 5),
(3, 4),
(3, 5);

--enrolment table--
insert into Enrolment(userID, eventCategoryID, enrolmentDate, paymentStatus, paymentAmount)
values
(3, 1, '2026-08-20', 'Paid', 150.00),
(4, 2, '2026-08-21', 'Pending', 150.00),
(3, 4, '2026-08-22', 'Paid', 250.00),
(4, 6, '2026-08-23', 'Pending', 80.00),
(3, 7, '2026-08-24', 'Pending', 80.00);

--result table--
insert into result(enrolmentID, position, finishTime)
values
(1, 15, '01:42:35'),
(2, 22, '01:51:20'),
(3, 8, '03:25:40');

select * from users;
select * from event;
select * from eventCategory;
select * from category;
select * from enrolment;
select * from result;
Create RaceDay database
Create users table
Create event table
