--drop procedure roznica

create procedure roznica
@data1 datetime,
@data2 datetime,
@wynika int output,
@wynikb int output,
@wynikc int output
as begin
	set @wynika = (select DATEDIFF(DAY, @data1, @data2))
	set @wynikb = (select DATEDIFF(HOUR, @data1, @data2))
	set @wynikc = (select DATEDIFF(SECOND, @data1, @data2))
end


declare @wynika int
declare @wynikb int
declare @wynikc int
exec roznica '2011-12-17', '2011-12-19', @wynika output, @wynikb output, @wynikc output
select @wynika as dni, @wynikb as godziny, @wynikc as sekundy