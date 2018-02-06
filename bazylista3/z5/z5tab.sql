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


with  odleglosc1 (A, B, Dystans, licznik)
as(
    select A, B, Dystans, 0 as licznik
    from (select A,B,Dystans from odleglosc union select B,A,Dystans from odleglosc) as x
	union ALL
	select R1.A, R2.B, R1.Dystans+R2.Dystans, (licznik+1) as licznik
    from odleglosc1 as R1, odleglosc as R2
	where R1.A!=R2.B AND R1.B=R2.A AND licznik<5
)
select A, B, MIN(Dystans) as Dystans
from odleglosc1
group by A, B