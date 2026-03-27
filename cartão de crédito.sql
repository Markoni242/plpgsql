create or replace function numCartao(str varchar(16)) returns
varchar
as
$corpo$

declare
	acumular integer = 0;
	i integer;
	soma_par integer = 0;
	contador integer = 0;
begin

	for i in reverse length(str) ..1 loop
		contador := contador + 1;
		if (contador % 2 = 0) then
			soma_par := 2 * substr(str,i,1)::integer;
			if (soma_par > 9) then
				soma_par :=soma_par - 9;
				end if;

		acumular := acumular + soma_par;
		else				
			acumular := acumular + substr(str,i,1)::integer;
		end if;
	
	end loop;

if (acumular % 10 = 0) then
	raise notice 'cartão válido';
else 
	raise notice 'cartão inválido';
end if;

return 0;
end;
$corpo$ language plpgsql;
	
select numCartao('5502096617097548');
-- (2 4 9 1 3 9 7 6);


 DROP FUNCTION numcartao(character varying);