INSERT INTO clients (first_name, last_name, email, password) VALUES
  ('James', 'Tanner', 'jam.tan@gmail.com', 'Martis1094@'),
  ('Willy', 'Grande', 'will.GD@gmail.com', 'Martis1094!'),
  ('Martha', 'Mortis', 'mm.beauty@bing.com', 'Martis1094#'),
  ('Emma', 'Lanter', 'Emilly.LA@gmail.com', 'Martis1094$'),
  ('Dominic', 'Fisht', 'dom.fst@bing.com', 'Martis1094*'),
  ('Lisa', 'Stacy', 'M0NA.Lisa212@gmail.com', 'Martis1094&');

select *
from clients c 


insert into photos (client_id, title, file_location, permissions) values
(1, 'MazdacarJDM', 'https://onedrive.live.com/?authkey=%39MQKF9458js=dhjqu2318DUf', 'all'),
(3, 'Honolulu Pier', 'https://onedrive.live.com/?authkey=%235N&RYS3472ddlak2vbcvb', 'all'),
(1, 'Tokyo Skytree', 'https://onedrive.live.com/?authkey=%39MQKF9458js=dhjqu2318DUf', 'friendly'),
(5, 'Museo Ferrari Maranello', 'https://onedrive.live.com/?authkey=%9431ghMRGh-5fdkmhjW', 'friendly'),
(6, 'Downtown Los Angeles', 'https://onedrive.live.com/?authkey=%235NRYS3472ddlak2vbcvb', 'friendly'),
(5, 'Program of CinemaFest', 'https://onedrive.live.com/?authkey=%9431ghMRGh-5fdkmhjW', 'private'),
(4, 'IDEA World Convention 2023', 'https://onedrive.live.com/?authkey=%347DHFG465960mdjhahwjgi', 'all'),
(2, 'Comic-Con International: San Diego', 'https://onedrive.live.com/?authkey=%545mbnOUhwpI=kfhgbflGGKq12M', 'all'),
(2, 'Obi Wan Kenobi', 'https://onedrive.live.com/?authkey=%545mbnOUhwpI=kfhgbflGGKq12M', 'all'),
(4, 'LA Market Week 2024', 'https://onedrive.live.com/?authkey=%347DHFG465960mdjhahwjgi', 'private'),
(1, 'RAUH-Welt Begriff 911', 'https://onedrive.live.com/?authkey=%39MQKF9458js=dhjqu2318DUf', 'private')

select *
from photos p


-- 1 is a friend for 4 and 5
-- 2 is a friend for 6
-- 3 is a friend for 4

insert into friends (client_id, friend_id) values 
(4, 3),
(4, 1), 
(5, 1), 
(6, 2)

select *
from friends f


insert into comments (photo_id, client_id, comment_text) values (1, 5, 'Cool car!');
insert into comments (photo_id, client_id, comment_text) values (9, 6, 'Nice cosplay!)');
insert into comments (photo_id, client_id, comment_text) values (2, 4, 'Beautiful sunset!');
insert into comments (photo_id, client_id, comment_text) values (5, 2, 'Lighs of this city is amazing!');

select *
from comments c 
