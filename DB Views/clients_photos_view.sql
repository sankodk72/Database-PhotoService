-- view #1
create view clients_photos as
select p.photo_id, p.title, c.first_name, c.last_name
from clients c, photos p 
where c.client_id = p.client_id
order by c.client_id

select * from clients_photos

-- view #2 client view show the photo which he can see (public, private)
create view combined_photos_client_5 as
select photo_id, title 
from (
select
	p.photo_id
	,p.title
from photos as p
where p.client_id = '5'

union 
select
	p.photo_id
	,p.title
from photos as p
where p.client_id = (
	select f.friend_id
	from friends as f
	where f.client_id = '5'
)

union 
select
	p.photo_id
	,p.title
from photos as p
where p.permissions = 'all'
  
) as combined_ids
order by photo_id

-- view #3 show all public photos
create view public_photos as
select p.photo_id, p.title
from photos as p
where p.permissions = 'all'

-- view #4 show public photos without comments
create view photos_without_comments as
select 
	p.photo_id
	,p.title
--	,c.comment_id
from photos as p
left join comments as c on c.photo_id = p.photo_id
where c.comment_id is NULL

-- view #5 show photos with max comments
create view top5_max_comments as
select
	p.photo_id
	,p.title
	,count(c.comment_id) as total_comments
from photos as p
left join comments as c on c.photo_id = p.photo_id
group by p.photo_id
order by total_comments desc, p.photo_id asc
limit 5
