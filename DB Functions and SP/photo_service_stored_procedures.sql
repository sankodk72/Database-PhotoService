-- stored procedure #1 insert new client
create or replace procedure client_add (
	first_name varchar,
	last_name varchar,
	email varchar,
	password varchar
)
language plpgsql
as $$
begin 
	insert into clients (first_name, last_name, email, password)
	values(first_name,last_name,email,password);
end;
$$;

call client_add('Elon', 'Musk', 'elon.musk@gmail.com', 'Musk1094@')

-- stored procedure #2 - add friends
create or replace procedure friend_add (
	client_id int,
	friend_id int
)
language plpgsql
as $$
begin 
	insert into friends (client_id, friend_id)
	values(client_id, friend_id);
end;
$$;

call friend_add(1,7);

-- stored procedure #3 - del friends
D1 $$
create or replace procedure friend_del (
	in client_id int,
	in friend_id int
)
language plpgsql
as $$
begin 
	delete from friends where friends.client_id = friend_del.client_id and friends.friend_id = friend_del.friend_id;
end;
$$;
END $$;

call friend_del(1,7)
