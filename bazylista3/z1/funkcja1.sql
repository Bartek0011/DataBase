drop table rok2014
drop table rok2015

create table rok2014(
miesiac int,
wynik decimal(10,2))

create table rok2015(
miesiac int,
wynik decimal(10,2))

insert into rok2014 (miesiac, wynik)
values(1, 2000.50), (2, 35100.00), (3, 21400.50), (4, 55800.50), (5, 2100.50),
(6, 9000.00), (7, 4000.00), (8, 80900.50), (9, 44500.50), (10, 33000.00),
(11, 12000.50), (12, 4300.00)

insert into rok2015 (miesiac, wynik)
values(1, 33600.50), (2, 14000.00), (3, 99000.50), (4, 21000.50), (5, 4400.50),
(6, 5000.00), (7, 26700.00), (8, 44900.50), (9, 10300.50), (10, 77000.00),
(11, 17000.50), (12, 41100.00)

select * from rok2014
select * from rok2015

--drop function fun1

create function fun1 ()
returns @temptable TABLE
(
	miesiac int,
	rok int,
	wynik decimal(10,2)
)
as
begin
	
	declare @wynik14 decimal(10,2)
	declare @wynik15 decimal(10,2)
	declare @i int
	
	set @i=1

	while @i <13
	begin
		set @wynik14 = (select wynik from rok2014 where miesiac=@i)
		set @wynik15 = (select wynik from rok2015 where miesiac=@i)

		if ( @wynik14 > @wynik15 )
		begin
			insert into @temptable(miesiac, rok, wynik) values(@i, 2014, @wynik14)
		end
		else
		begin
			insert into @temptable(miesiac, rok, wynik) values(@i, 2015, @wynik15)
		end
		set @i+=1
	end

return
end


--select * from fun1()