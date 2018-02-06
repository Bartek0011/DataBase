--drop table tab1, tab2, lista

create table tab1(
panstwo nchar(20),
miasto nchar(20),
ulica nchar(20),
numer int )

create table tab2(
koncern nchar(20),
marka nchar(20),
model nchar(20),
wersja nchar(20),
vin int)

create table lista(
tabela varchar(40),
kolumna varchar(30),
maximum varchar(30) )

insert into tab1 (panstwo, miasto, ulica, numer)
values ('Polska', 'Warszawa', 'Glowna', 12), ('Niemcy', 'Drezno', 'Grosse', 10), ('Francja', 'Paryz', 'Curie', 4)

insert into tab2 (koncern, marka, model, wersja, vin)
values ('VA', 'Volkswagen', 'Polo', 'HighLine', 3440), ('PCA', 'Peugeot', '308', 'Sport', 1130)

insert into lista (tabela, kolumna, maximum)
values ('tab1', 'panstwo', ''), ('tab1', 'miasto', ''), ('tab1', 'ulica', ''), ('tab1', 'numer', ''), 
('tab2', 'koncern', ''), ('tab2', 'marka', ''), ('tab2', 'model', ''), ('tab2', 'wersja', ''), ('tab2', 'vin', '')

select * from tab1; select * from tab2; select * from lista;

select max(panstwo) from tab1

select ROW_NUMBER() over(order by tabela) as lp, tabela, kolumna, 
maximum from lista


select ROW_NUMBER() over(order by tabela) as lp, *
into newtable
from lista

select * from newtable
