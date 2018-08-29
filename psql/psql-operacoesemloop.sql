DO $$
	DECLARE
		cursor record;
	BEGIN

	FOR cursor IN

			select administracao
			from periodo_folha
			where ativo
			and periodo >= 201801
			group by administracao

	LOOP

		raise notice '%', cursor.administracao;

			FOR p IN 201808..201812 LOOP

 				raise notice '---> Deletando %', p;

 				delete from periodo_folha 
 					where administracao = cursor.administracao
 					and periodo = p;

				raise notice '------> Criando % %', p, (
						to_char(
					       	to_date(p::varchar, 'YYYYMM'),
					       	'TMMonth "de" YYYY'
				       ));

				insert into periodo_folha (periodo, descricao, administracao)
					values (p, (
						to_char(
					       	to_date(p::varchar, 'YYYYMM'),
					       	'TMMonth "de" YYYY'
				       )), cursor.administracao);

   			END LOOP;

	END LOOP;

END $$;