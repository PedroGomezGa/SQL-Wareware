--4.4 En base a las asignaciones vigentes, calcular la fecha en la que al menos la mitad 
--de los usuarios activos ya no tienen trabajo asignado.
select min(end_date) +
cast((select PERCENTILE_CONT(0.5) WITHIN GROUP(ORDER BY 
										end_date) from (
										select abs(end_date-
											   (select min(end_date) from assignments
where (start_date >= '2022-03-01' and start_date <= '2022-03-31') or
(end_date >= '2022-03-01' and end_date <= '2022-03-31'))) as end_date from assignments
where (start_date >= '2022-03-01' and start_date <= '2022-03-31') or
(end_date >= '2022-03-01' and end_date <= '2022-03-31')) as my_table) as int) + 1
from assignments where (start_date >= '2022-03-01' and start_date <= '2022-03-31') or
(end_date >= '2022-03-01' and end_date <= '2022-03-31')
