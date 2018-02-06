--drop procedure pro

select ROW_NUMBER() over(order by tabela) as lp, *
	into newtable from lista



create procedure pro
as
begin
	declare @maxi varchar(40)
	declare @tabela varchar(40)
	declare @kolumna varchar(40)
	declare @i int
	declare @zap varchar(300)

	set @i=1

	set @tabela=(select tabela from newtable where lp=@i)
	set @kolumna=(select kolumna from newtable where lp=@i)

	
	--set @maxi = ' select ' + max(@kolumna) + ' from ' + @tabela

	--set @maxi=( select max(@kolumna) from CAST(@tabela AS VARCHAR)  )

	--set @maxi=( select max( Cast(@kolumna as varchar)) from (cast(@tabela as varchar))  )

	--set @maxi= ( select max(panstwo) from tab1 )



	--select max(panstwo) from tab1
	--select max(@panstwo) from cast(@tabela as varchar)

	--set @zap ='select max(' + @kolumna + ') from ' + @tabela
	
	
	
	
	--set @zap = 'update lista set maximum = (select max(' + CAST(@kolumna as VARCHAR) + ') from ' + CAST(@tabela AS VARCHAR) + ')'
	-- where tabela=' + CAST(@tabela AS VARCHAR) + ' and kolumna=' + CAST(@kolumna as VARCHAR)

	--set @zap = 'update lista set maximum = (select max(' + CAST(@kolumna as VARCHAR) + ') from ' + CAST(@tabela AS VARCHAR) +
	-- 'where tabela=' + CAST(@tabela AS VARCHAR) + ' and kolumna=' + CAST(@kolumna as VARCHAR) + ')'

	 set @zap = Concat('update lista set maximum = (select max(' , CAST(@kolumna as VARCHAR) , ') from ' , CAST(@tabela AS VARCHAR) , ')' ,
	 ' where tabela= ' ,  CAST(@tabela AS VARCHAR) , ' and kolumna= ',CAST(@kolumna as VARCHAR))
	
	 --JAK WSTAWIC WYZEJ '' ' '

	execute sp_sqlexec @zap

	--update lista
	--set maximum=@maxi
	--where tabela=@tabela and kolumna=@kolumna

	--insert into lista (maximum) values ( (execute sp_sqlexec @zap) )


	--print @maxi
	--print @kolumna
	--print @tabela
	--update lista set 

end

execute pro

set @zap = 'update lista set maximum = (select max(' + CAST(@kolumna as VARCHAR) + ') from ' + CAST(@tabela AS VARCHAR) + ' where tabela=' + @tabela
	+ ' and kolumna=' + @kolumna + ')'
	execute sp_sqlexec @zap


update lista set maximum = ( select max(miasto) from tab1 ) where kolumna='miasto' and tabela=tab1