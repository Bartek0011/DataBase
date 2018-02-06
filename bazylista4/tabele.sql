create table Firma(
Nazwa varchar(30) not null primary key
)
go
create table W³aœciciel(
Imiê varchar(20),
Nazwisko varchar(20),
NazwaFirmy varchar(30)
)
go
alter table W³aœciciel add constraint wlascfk
foreign key (NazwaFirmy) references Firma(Nazwa)
go
create table Wydzia³(
Nazwa varchar(25),
NazwaFirmy varchar(30)
)
go
alter table Wydzia³ add constraint wydzialfk
foreign key (NazwaFirmy) references Firma(Nazwa)
go
create table Pracownik(
Imiê varchar(25),
Nazwisko varchar(25),
Miasto varchar(20),
Ulica varchar(20),
telefon int,
NazwaFirmy varchar(30)
)
go
alter table Pracownik add constraint pracownikfk
foreign key (NazwaFirmy) references Firma(Nazwa)
go
create table Dyrektor(
Imiê varchar(25),
Nazwisko varchar(25),
telefon int,
NazwaFirmy varchar(30)
)
go
alter table Dyrektor add constraint dyrektorfk
foreign key (NazwaFirmy) references Firma(Nazwa)
go
insert into Firma(Nazwa) values ('Mercedes'), ('Audi')
insert into W³aœciciel(Imiê, Nazwisko, NazwaFirmy) values ('Marcin', 'Nowak', 'Mercedes'), ('Adam', 'Kowalski', 'Audi')
insert into Wydzia³ (Nazwa, NazwaFirmy) values ('NoweTechnologie', 'Audi'), ('Aerodynamika', 'Audi'), ('Silniki', 'Mercedes')
insert into Pracownik (Imiê, Nazwisko, Miasto, Ulica, telefon, NazwaFirmy) values
('Marian', 'Nisko', 'Warszawa', 'G³ówna', 444333212, 'Audi'), ('Kamil', 'Tromba', 'Warszawa', 'Ma³a', 669555123, 'Audi'),
('Marek', 'Sokowski', 'Warszawa', 'Trasowa', 666898878, 'Audi'), ('Maria', 'Paka', 'Wroc³aw', 'Sienkiewicza', 777300450, 'Mercedes'),
('Florentyna', 'Dolna', 'Wroc³aw', 'Hutnicza', 889900300, 'Mercedes')
insert into Dyrektor (Imiê, Nazwisko, telefon, NazwaFirmy) values ('Dorota', 'Ma³ecka', 505670222, 'Audi'),
('S³awomir', 'Petarda', 708300211, 'Mercedes')

