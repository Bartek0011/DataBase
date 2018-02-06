--drop table odleglosc
create table odleglosc(
	A varchar(40),
	B varchar(40),
	Dystans int
)

insert odleglosc (A,B,Dystans) values
	('Warszawa','Krakow',300),
	('Krakow','Poznan',450),
	('Poznan','Gdansk',300),
	('Gdansk','Warszawa',250),
	('Gdansk','Szczecin',200),
	('Gdansk','Poznan',300),
	('Poznan','Gdansk',300)

--drop procedure pro
create procedure pro
as begin
	create table #t(	A varchar(40),	B varchar(40),	Dystans int	)
	
	select * into #temp from #t
	select * into #temp1 from #t
	select * into #temp2 from #t

	insert #temp select * from odleglosc
	insert #temp1 select x.A, x.B ,x.Dystans  from (select A, B, Dystans from #temp union select B, A, Dystans from #temp) as x
	delete #temp 
	insert #temp2 select A,B, MIN(Dystans) from #temp1 group by A,B
	delete #temp1
	declare @ilosc int = (select COUNT(*) from #temp2)

	declare @i int = 0;
	while @i<@ilosc begin --polaczenie kazdego miasta z kazdym
		insert #temp select * from #temp2
		insert #temp select x.A, y.B, (x.Dystans+y.Dystans) as Dystans from #temp2 as x, #temp2 as y where x.B=y.A AND x.A!=y.B--przejscie do nastepnego miasta
		delete #temp2
		insert #temp1 select * from (select A, B, Dystans from #temp union select B, A, Dystans from #temp) as x--przechodne
		delete #temp
		insert #temp2 select A,B, MIN(Dystans) from #temp1 group by  A,B
		delete #temp1
		set @i=@i+1
	end
	select * into odleglosc1 from #temp2
	drop table #temp, #temp1, #temp2
end


exec pro

select * from odleglosc1

select * from odleglosc