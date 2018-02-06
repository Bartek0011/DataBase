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


--drop procedure pro

create procedure pro
as
begin
	declare @tabela varchar(40)
	declare @kolumna varchar(40)
	declare @zap varchar(300)


	declare kursor cursor for
	select tabela, kolumna from lista
	open kursor
	fetch next from kursor into @tabela, @kolumna

	while @@FETCH_STATUS = 0
	begin
		
		

		set @zap = 'update lista set maximum = (select max(' +@kolumna + ') from ' + @tabela + ')' + 'where current of kursor'
		execute sp_sqlexec @zap


		fetch next from kursor into @tabela, @kolumna
	end

	close kursor
	deallocate kursor
		
	

end

execute pro

select * from lista