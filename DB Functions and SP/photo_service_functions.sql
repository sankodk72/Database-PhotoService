-- functions #1 - return full name of client
-- drop function customer_name(integer)
create or replace function customer_name(id int, out full_name varchar)
as $$
	select first_name || ' ' ||  last_name  as full_name from clients where client_id = $1
	$$
	language sql;

select * from customer_name('1')

-- functions #2
-- drop function client_photos(integer)
create function client_photos(id int)
returns table (photo_id int, title varchar)
as $$
	select photo_id, title from photos where client_id = $1
$$
language sql;

select * from client_photos('1')


-- functions #3
create function combined_photos_client(id int)
returns table (photo_id int, title varchar)
as $$
	select photo_id, title 
	from (
	select
		p.photo_id
		,p.title
	from photos as p
	where p.client_id = $1
	
	union 
	select
		p.photo_id
		,p.title
	from photos as p
	where p.client_id = (
		select f.friend_id
		from friends as f
		where f.client_id = $1
	)
	
	union 
	select
		p.photo_id
		,p.title
	from photos as p
	where p.permissions = 'all'
	
	) as combined_ids
	order by photo_id;
$$
language sql;

select * from combined_photos_client('1');
