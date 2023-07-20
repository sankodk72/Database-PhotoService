create table clients_audit
(
  id int generated always as identity primary key
  ,client_id integer
  ,first_name varchar(50)
  ,last_name varchar(50)
  ,email varchar 
  ,password varchar
)

select * from clients_audit

create or replace function clients_audit()
returns trigger
language plpgsql
as
$$
begin 
	insert into clients_audit
	(
	client_id
	,first_name
	,last_name
	,email
	,password
	)
	values 
	(
	new.client_id
	,new.first_name
	,new.last_name
	,new.email
	,new.password
	);
	return null;
end
$$

CREATE or replace TRIGGER tr_client_ins_upd
    AFTER insert or update
    ON public.clients
    FOR EACH ROW
    EXECUTE PROCEDURE public.clients_audit();
   

INSERT INTO clients (first_name, last_name, email, password) 
values ('Stiv', 'Vozniak', 'stiv.vozniak@gmail.com', 'Stiv1094@')

update clients
set email= 'new' || email
where last_name = 'Vozniak'
