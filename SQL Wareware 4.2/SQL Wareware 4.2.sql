--4.2 Obtener la lista de usuarios (name, handle) que están activos, 
--saben elixir al menos en un nivel competent y además saben aws en cualquier nivel. 
--(Los niveles de competencia son, en orden: novice, advanced_beginner, competent, proficient, expert)
select u.name, u.handle from users u
inner join user_skills us on us.user_id = u.id
inner join skills s on s.id = us.skill_id
where enabled = true and
u.id in (select  u.id from users u
inner join user_skills us on us.user_id = u.id
inner join skills s on s.id = us.skill_id
where enabled = true and
(s.name = 'Elixir' and
 (us.level != 'novice' or
  us.level != 'advanced_beginner')
) group by u.id) and
s.name = 'AWS'
