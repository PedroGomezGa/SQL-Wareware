--4.5 En base a las asignaciones vigentes en marzo y considerando que cada día laborable 
--(lun-vie) es de 8 hrs, calcular el total de horas trabajadas durante marzo por todos los usuarios.
SELECT sum((
	select count(*) from generate_series(
		(case when start_date > '2022-03-01' then start_date else '2022-03-01' end),
		(case when end_date < '2022-03-31' then end_date else '2022-03-01' end), 
		interval  '1 day') the_day
WHERE  extract('ISODOW' FROM the_day) < 6) *8) as hours
FROM assignments where (start_date >= '2022-03-01' and start_date <= '2022-03-31') or
(end_date >= '2022-03-01' and end_date <= '2022-03-31')
