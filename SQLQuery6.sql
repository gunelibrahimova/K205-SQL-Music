Create table Singers(
	Id int Identity(1,1) Primary key,
	SingerName nvarchar(100),
	SingerSurname nvarchar(100),
	Birthday DateTime,
	PhotoURL varchar(500)
)

Create table Genres(
	Id int Identity(1,1) Primary key,
	GenreName nvarchar(250)
)

Create table Songs(
	Id int Identity(1,1) Primary key,
	SongName nvarchar(100),
	LaunchDate DateTime,
	Duration int 
)

Create table SingerToSong(
	Id int Identity(1,1) Primary key,
	SingerID int foreign key references Singers(Id),
	SongId int foreign key references Songs(Id)
)

Create table SongToGenre(
	Id int Identity(1,1) primary key,
	GenreId int foreign key references Genres(Id),
	SongId int foreign key references Songs(Id),
)

Create table Countries(
	Id int Identity(1,1) Primary key,
	CountryName nvarchar(200)
)

Create table Users(
	Id int Identity(1,1) primary key,
	UserName nvarchar(100),
	UserSurname nvarchar(100),
	Birthday DateTime,
	Email nvarchar(100),
	CountryId int foreign key references Countries(Id)
)

Create table SongList(
	Id int Identity(1,1) Primary key,
	UserId int foreign key references Users(Id),
	SongId int foreign key references Songs(Id),
	SongDate DateTime 
)

Create table LikedList(
	Id int Identity(1,1) Primary key,
	UserId int foreign key references Users(Id),
	SongId int foreign key references Songs(Id),
)

insert into Singers(SingerName, SingerSurname, Birthday, PhotoURL)
values
('Röya', N'Ayxan', '06.14.1982', 'sekil2.jpg'),
('Elza', N'Seyidcahan', '07.07.1968', 'sekil3.jpg')


insert into Genres(GenreName)
values('Rap'), ('Caz'),('Pop'), ('Hip-hop')

insert into Songs(SongName, Duration, LaunchDate)
values 
(N'Zəng elə', 120, '01.01.2021'),
(N'Karma', 180, '05.05.2021'),
(N'Kəpənəklər', 120, '07.07.2021'),
(N'Bu Gecə', 180, '01.01.2021'),
(N'Ulduz nağılı', 120, '01.01.2021'),
(N'Dostumsan yoxsa sevgilim', 120, '01.01.2021'),
(N'Gözəllik', 180, '07.07.2021')


insert into SingerToSong(SingerID, SongId)
values(2,1), (2,2), (2,3), (5,4), (4,5),(4,6),(5,7)

insert into SongToGenre(SongId,GenreId)
values (1,1), (1,2), (2,2), (3,3),(4,3),(5,3),(6,3),(7,3)


insert into Countries (CountryName)
values (N'Azərbaycan'), (N'Türkiyə'), ('Fransa'), ('İtalya')

insert into Users(UserName, UserSurname,Birthday, Email, CountryId)
values ('Aytac', 'Rustemli', '02.01.2001', 'gunel.2002@gmail.com', (1)),
('Günel', 'İbrahimova', '01.01.2001', 'gunel.2002@gmail.com', (2)),
 ('Aysel', 'İbrahimova', '04.03.2001', 'aysel.2002@gmail.com', (3)),
 ('Davud', 'Seyfullayev','07.02.2001', 'davud.2002@gmail.com', (4))

 insert into SongList (UserId, SongId, SongDate)
 values (7,1, '01.01.2001'),
 (8,2, '01.01.2001'),
 (9,3, '03.01.2001'),
 (10,4, '02.01.2021'),
 (7,5, '05.01.2020'),
 (8,6, '01.01.2001'),
 (9,7, '02.01.2011')

 insert into LikedList(UserId, SongId)
 values (7,1),
 (8,2),
 (9,3),
 (10,4),
 (10,5),
 (8,6),
 (9,7)


--select Singers.SingerName, Singers.SingerSurname,Songs.SongName
--from SingerToSong
--INNER JOIN Singers on SingerId = Singers.ID
--INNER JOIN Songs on SongId = Songs.Id


create view [MyMusics] as
Select Songs.SongName
from SingerToSong
INNER JOIN Songs on SongId = Songs.Id

Select * from [MyMusics]


create view [MySongList] as 
select Singers.SingerName, Singers.SingerSurname,Songs.SongName,
Songs.Duration,Songs.LaunchDate
from SingerToSong
INNER JOIN Singers on SingerId = Singers.ID
INNER JOIN Songs on SongId = Songs.Id


Select * from [MySongList]


 



