create user admin1 

ALTER USER admin1 WITH PASSWORD 'ADM*623a'

create user moderator1

ALTER USER moderator1 WITH PASSWORD 'TesQA721'

select *
from pg_catalog.pg_user

create role admin
grant all on clients, friends, comments, photos to admin with grant option
grant admin to admin1 

create role moderator
grant select on friends, comments, photos to moderator
grant update (comment_text) on comments to moderator
grant moderator to moderator1

select rolname from pg_roles

select grantee, table_name, privilege_type
from information_schema.table_privileges
where grantee = 'admin1'
--where grantee = 'moderator1'

select *
from information_schema.table_privileges
where grantee = 'admin1'
--where grantee = 'moderator1'


begin transaction

insert into comments (photo_id, client_id, comment_text) values (7, 3, 'I was excired to see you there')

update comments set comment_text = 'I was excired to see you there :-)' where photo_id = 7

commit transaction 

select *
from comments c 