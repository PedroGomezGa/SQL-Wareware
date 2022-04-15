--4.3 Obtener la lista de los 10 usuarios activos (name, handle) que son los que tienen menos skills 
--registrados, ordenados de menor a mayor.
select u.name, u.handle, count(us.skill_id) from users u	
inner join user_skills us on us.user_id = u.id
where u.enabled = true
group by u.name, u.handle
order by count(us.skill_id) asc
limit 10;

