create table cinema
(
    id      integer      not null primary key,
    name    varchar(255) not null,
    city    varchar(255),
    is_open boolean,
    rating  text
);

create table film
(
    id           integer      not null
        primary key,
    title        varchar(255) not null,
    year         integer,
    release_date date         not null,
    duration     integer      not null,
    age_category varchar(255),
    genre        varchar(255),
    description  varchar(255),
    director     varchar(255),
    actors       varchar(255),
    image_url    varchar(255)
);

create table "user"
(
    id        integer      not null
        primary key,
    username  varchar(255) not null,
    password  varchar(255) not null,
    email     varchar(255) not null,
    telephone varchar(255) not null
);

create table seat_type
(
    id   integer      not null
        primary key,
    name varchar(255) not null,
    cost real         not null
);

create table room
(
    id          integer not null
        primary key,
    room_number integer not null,
    capacity    integer not null,
    occupied    integer not null,
    is_open     boolean,
    cinema_id   integer not null
        references cinema
);

create table seat
(
    id            integer      not null
        primary key,
    row_letter    varchar(255) not null,
    column_number integer      not null,
    is_occupied   boolean,
    room_id       integer      not null
        references room,
    type_id       integer      not null
        references seat_type
);

create table projection
(
    id      integer   not null
        primary key,
    time    timestamp not null,
    film_id integer   not null
        references film,
    room_id integer   not null
        references room
);

create table ticket
(
    id            integer not null
        primary key,
    user_id       integer not null
        references "user",
    projection_id integer not null
        references projection,
    seat_id       integer not null
        references seat
);

delete from ticket;
delete from projection;
delete from seat;
delete from room;
delete from seat_type;
delete from "user";
delete from film;
delete from cinema;

insert into cinema (id, name, city, is_open, rating) values (1, 'CinemaYay', 'Kraków', true, '5 stars');
insert into cinema (id, name, city, is_open, rating) values (2, 'HelloCinema', 'Kraków', true, 'great');
insert into cinema (id, name, city, is_open, rating) values (3, '123Cinema', 'Warszawa', true, 'nice');
insert into cinema (id, name, city, is_open, rating) values (4, 'cin', 'Wrocław', true, 'sin');
insert into cinema (id, name, city, is_open, rating) values (5, 'xCinema', 'Kraków', true, 'x');
insert into cinema (id, name, city, is_open, rating) values (6, 'Wielkie Kino', 'Katowice', true, 'uwielbiam filmy :)');
insert into cinema (id, name, city, is_open, rating) values (7, 'WowKino', 'Katowice', true, 'wow!!!');

insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (1, 'Rogue One: A Star Wars Story', 2016, '2016-12-13', 133, 'PG-13', 'Action|Science fiction', 'Jyn''s father is forcibly taken by the Galactic Empire to help them complete the Death Star. When she grows up, she joins a group of resistance fighters who aim to steal the Empire''s blueprints.', 'Gareth Edwards', 'Felicity Jones|Diego Luna', 'https://images-cdn.ubuy.co.in/63ef0a397f1d781bea0a2464-star-wars-rogue-one-movie-poster.jpg');
insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (2, 'Interstellar', 2014, '2014-11-07', 169, 'PG-13', 'Science fiction|Adventure', 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', 'Christopher Nolan', 'Matthew McConaughey|Jessica Chastain', 'https://www.ubuy.com.pl/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFrejA2b1NVZUwuX0FDX1NMMTUwMF8uanBn.jpg');
insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (3, 'Pulp Fiction', 1994, '1994-10-14', 169, 'R', 'Crime|Thriller', 'In the realm of underworld, a series of incidents intertwines the lives of two Los Angeles mobsters, a gangster''s wife, a boxer and two small-time criminals.', 'Quentin Tarantino', 'John Travolta|Uma Thurman', 'https://i5.walmartimages.com/seo/Pulp-Fiction-Movie-Poster-Regular-Mia-Wallace-On-Bed-Size-24-X-36_ce193b8f-4979-4dd4-89fb-cb5bda97b87b.47bd5508be83004cfd0b4ae1123a208e.jpeg');
insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (4, 'Parasite', 2019, '2019-05-30', 132, 'R', 'Thriller|Comedy', 'The struggling Kim family sees an opportunity when the son starts working for the wealthy Park family. Soon, all of them find a way to work within the same household and start living a parasitic life.', 'Bong Joon-ho', 'Lee Sun-kyun|Cho Yeo-jeong', 'https://m.media-amazon.com/images/I/91KArYP03YL._AC_SL1500_.jpg');
insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (5, 'Guardians of the Galaxy', 2014, '2014-08-01', 121, 'PG-13', 'Action|Science fiction', 'A bunch of skilled criminals led by brash adventurer Peter Quill join hands to fight a villain named Ronan the Accuser who wants to control the universe with the help of a mystical orb.', 'James Gunn', 'Chris Pratt|Zoe Saldana', 'https://images-cdn.ubuy.co.in/634d3801caf5d162792f7516-poster-stop-online-guardians-of-the.jpg');



insert into "user" (id, username, password, email, telephone) values (1, 'sigma', 'sigma123', 'sigma@mail.com', '111-111-111');
insert into "user" (id, username, password, email, telephone) values (2, 'skibidi', 'skibidi123', 'skibidi@mail.com', '444-444-444');
insert into "user" (id, username, password, email, telephone) values (3, 'skibidi2', 'skibidi1234', 'skibidi2@mail.com', '244-444-444');

insert into seat_type (id, name, cost) values (1, 'normal', 22.99);
insert into seat_type (id, name, cost) values (2, 'vip', 25.99);
insert into seat_type (id, name, cost) values (3, 'super vip', 32.99);

insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (1, 1, 12, 3, true, 1);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (2, 2, 20, 0, true, 1);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (3, 3, 20, 0, true, 1);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (4, 1, 36, 0, true, 2);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (5, 2, 20, 0, true, 2);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (6, 3, 60, 0, true, 2);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (7, 1, 108, 0, true, 3);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (8, 1, 30, 0, true, 4);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (9, 1, 12, 0, true, 5);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (10, 2, 42, 0, true, 5);


insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (1, 'A', 1, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (2, 'A', 2, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (3, 'A', 3, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (4, 'A', 4, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (5, 'B', 1, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (6, 'B', 2, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (7, 'B', 3, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (8, 'B', 4, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (9, 'C', 1, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (10, 'C', 2, true, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (11, 'C', 3, true, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (12, 'C', 4, true, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (13, 'A', 1, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (14, 'A', 2, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (15, 'A', 3, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (16, 'A', 4, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (17, 'A', 5, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (18, 'B', 1, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (19, 'B', 2, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (20, 'B', 3, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (21, 'B', 4, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (22, 'B', 5, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (23, 'C', 1, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (24, 'C', 2, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (25, 'C', 3, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (26, 'C', 4, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (27, 'C', 5, false, 2, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (28, 'D', 1, false, 2, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (29, 'D', 2, false, 2, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (30, 'D', 3, false, 2, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (31, 'D', 4, false, 2, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (32, 'D', 5, false, 2, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (33, 'A', 1, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (34, 'A', 2, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (35, 'A', 3, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (36, 'A', 4, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (37, 'A', 5, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (38, 'B', 1, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (39, 'B', 2, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (40, 'B', 3, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (41, 'B', 4, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (42, 'B', 5, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (43, 'C', 1, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (44, 'C', 2, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (45, 'C', 3, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (46, 'C', 4, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (47, 'C', 5, false, 3, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (48, 'D', 1, false, 3, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (49, 'D', 2, false, 3, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (50, 'D', 3, false, 3, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (51, 'D', 4, false, 3, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (52, 'D', 5, false, 3, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (53, 'A', 1, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (54, 'A', 2, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (55, 'A', 3, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (56, 'A', 4, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (57, 'A', 5, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (58, 'A', 6, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (59, 'B', 1, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (60, 'B', 2, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (61, 'B', 3, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (62, 'B', 4, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (63, 'B', 5, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (64, 'B', 6, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (65, 'C', 1, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (66, 'C', 2, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (67, 'C', 3, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (68, 'C', 4, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (69, 'C', 5, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (70, 'C', 6, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (71, 'D', 1, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (72, 'D', 2, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (73, 'D', 3, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (74, 'D', 4, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (75, 'D', 5, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (76, 'D', 6, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (77, 'E', 1, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (78, 'E', 2, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (79, 'E', 3, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (80, 'E', 4, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (81, 'E', 5, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (82, 'E', 6, false, 4, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (83, 'F', 1, false, 4, 3);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (84, 'F', 2, false, 4, 3);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (85, 'F', 3, false, 4, 3);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (86, 'F', 4, false, 4, 3);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (87, 'F', 5, false, 4, 3);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (88, 'F', 6, false, 4, 3);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (89, 'A', 1, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (90, 'A', 2, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (91, 'A', 3, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (92, 'A', 4, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (93, 'A', 5, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (94, 'A', 6, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (95, 'A', 7, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (96, 'A', 8, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (97, 'A', 9, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (98, 'A', 10, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (99, 'B', 1, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (100, 'B', 2, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (101, 'B', 3, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (102, 'B', 4, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (103, 'B', 5, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (104, 'B', 6, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (105, 'B', 7, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (106, 'B', 8, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (107, 'B', 9, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (108, 'B', 10, false, 5, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (109, 'A', 1, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (110, 'A', 2, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (111, 'A', 3, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (112, 'A', 4, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (113, 'A', 5, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (114, 'A', 6, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (115, 'A', 7, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (116, 'A', 8, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (117, 'A', 9, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (118, 'A', 10, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (119, 'B', 1, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (120, 'B', 2, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (121, 'B', 3, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (122, 'B', 4, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (123, 'B', 5, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (124, 'B', 6, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (125, 'B', 7, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (126, 'B', 8, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (127, 'B', 9, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (128, 'B', 10, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (129, 'C', 1, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (130, 'C', 2, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (131, 'C', 3, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (132, 'C', 4, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (133, 'C', 5, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (134, 'C', 6, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (135, 'C', 7, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (136, 'C', 8, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (137, 'C', 9, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (138, 'C', 10, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (139, 'D', 1, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (140, 'D', 2, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (141, 'D', 3, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (142, 'D', 4, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (143, 'D', 5, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (144, 'D', 6, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (145, 'D', 7, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (146, 'D', 8, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (147, 'D', 9, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (148, 'D', 10, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (149, 'E', 1, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (150, 'E', 2, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (151, 'E', 3, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (152, 'E', 4, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (153, 'E', 5, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (154, 'E', 6, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (155, 'E', 7, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (156, 'E', 8, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (157, 'E', 9, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (158, 'E', 10, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (159, 'F', 1, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (160, 'F', 2, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (161, 'F', 3, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (162, 'F', 4, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (163, 'F', 5, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (164, 'F', 6, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (165, 'F', 7, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (166, 'F', 8, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (167, 'F', 9, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (168, 'F', 10, false, 6, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (169, 'A', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (170, 'A', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (171, 'A', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (172, 'A', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (173, 'A', 5, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (174, 'A', 6, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (175, 'A', 7, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (176, 'A', 8, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (177, 'A', 9, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (178, 'A', 10, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (179, 'A', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (180, 'B', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (181, 'B', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (182, 'B', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (183, 'B', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (184, 'B', 5, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (185, 'B', 6, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (186, 'B', 7, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (187, 'B', 8, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (188, 'B', 9, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (189, 'B', 10, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (190, 'B', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (191, 'C', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (192, 'C', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (193, 'C', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (194, 'C', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (195, 'C', 5, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (196, 'C', 6, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (197, 'C', 7, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (198, 'C', 8, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (199, 'C', 9, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (200, 'C', 10, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (201, 'C', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (202, 'C', 12, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (203, 'C', 13, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (204, 'D', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (205, 'D', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (206, 'D', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (207, 'D', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (208, 'D', 5, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (209, 'D', 6, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (210, 'D', 7, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (211, 'D', 8, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (212, 'D', 9, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (213, 'E', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (214, 'E', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (215, 'E', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (216, 'E', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (217, 'E', 5, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (218, 'E', 6, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (219, 'E', 7, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (220, 'E', 8, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (221, 'E', 9, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (222, 'E', 10, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (223, 'F', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (224, 'F', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (225, 'F', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (226, 'F', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (227, 'F', 5, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (228, 'F', 6, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (229, 'F', 7, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (230, 'F', 8, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (231, 'F', 9, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (232, 'F', 10, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (233, 'F', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (234, 'F', 12, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (235, 'G', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (236, 'G', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (237, 'G', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (238, 'G', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (239, 'G', 5, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (240, 'G', 6, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (241, 'G', 7, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (242, 'G', 8, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (243, 'G', 9, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (244, 'G', 10, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (245, 'G', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (246, 'G', 12, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (247, 'G', 13, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (248, 'G', 14, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (249, 'H', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (250, 'H', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (251, 'H', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (252, 'H', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (253, 'H', 5, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (254, 'H', 6, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (255, 'H', 7, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (256, 'H', 8, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (257, 'H', 9, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (258, 'H', 10, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (259, 'H', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (260, 'H', 12, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (261, 'H', 13, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (262, 'H', 14, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (263, 'I', 1, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (264, 'I', 2, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (265, 'I', 3, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (266, 'I', 4, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (267, 'I', 5, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (268, 'I', 6, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (269, 'I', 7, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (270, 'I', 8, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (271, 'I', 9, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (272, 'I', 10, false, 7, 2);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (273, 'I', 11, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (274, 'I', 12, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (275, 'I', 13, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (276, 'I', 14, false, 7, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (277, 'A', 1, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (278, 'A', 2, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (279, 'A', 3, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (280, 'A', 4, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (281, 'A', 5, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (282, 'A', 6, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (283, 'B', 1, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (284, 'B', 2, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (285, 'B', 3, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (286, 'B', 4, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (287, 'B', 5, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (288, 'B', 6, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (289, 'C', 1, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (290, 'C', 2, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (291, 'C', 3, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (292, 'C', 4, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (293, 'C', 5, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (294, 'C', 6, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (295, 'D', 1, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (296, 'D', 2, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (297, 'D', 3, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (298, 'D', 4, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (299, 'D', 5, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (300, 'D', 6, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (301, 'E', 1, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (302, 'E', 2, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (303, 'E', 3, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (304, 'E', 4, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (305, 'E', 5, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (306, 'E', 6, false, 8, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (307, 'A', 1, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (308, 'A', 2, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (309, 'A', 3, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (310, 'A', 4, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (311, 'B', 1, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (312, 'B', 2, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (313, 'B', 3, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (314, 'B', 4, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (315, 'C', 1, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (316, 'C', 2, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (317, 'C', 3, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (318, 'C', 4, false, 9, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (319, 'A', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (320, 'A', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (321, 'A', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (322, 'A', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (323, 'A', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (324, 'A', 6, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (325, 'B', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (326, 'B', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (327, 'B', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (328, 'B', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (329, 'B', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (330, 'B', 6, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (331, 'C', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (332, 'C', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (333, 'C', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (334, 'C', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (335, 'C', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (336, 'C', 6, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (337, 'D', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (338, 'D', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (339, 'D', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (340, 'D', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (341, 'D', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (342, 'D', 6, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (343, 'E', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (344, 'E', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (345, 'E', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (346, 'E', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (347, 'E', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (348, 'E', 6, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (349, 'F', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (350, 'F', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (351, 'F', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (352, 'F', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (353, 'F', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (354, 'F', 6, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (355, 'G', 1, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (356, 'G', 2, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (357, 'G', 3, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (358, 'G', 4, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (359, 'G', 5, false, 10, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (360, 'G', 6, false, 10, 1);


insert into projection (id, time, film_id, room_id) values (1, '2025-01-07 11:40:37.000000', 1, 1);
insert into projection (id, time, film_id, room_id) values (2, '2025-01-07 12:55:47.000000', 2, 2);
insert into projection (id, time, film_id, room_id) values (3, '2025-01-07 16:12:11.000000', 3, 1);
insert into projection (id, time, film_id, room_id) values (4, '2025-01-07 22:40:27.000000', 1, 3);
insert into projection (id, time, film_id, room_id) values (5, '2025-01-07 11:40:37.000000', 1, 1);
insert into projection (id, time, film_id, room_id) values (6, '2025-01-08 12:55:47.000000', 2, 2);
insert into projection (id, time, film_id, room_id) values (7, '2025-01-08 16:12:11.000000', 3, 1);
insert into projection (id, time, film_id, room_id) values (8, '2025-01-08 22:40:27.000000', 1, 3);
insert into projection (id, time, film_id, room_id) values (9, '2025-01-08 11:40:37.000000', 1, 1);
insert into projection (id, time, film_id, room_id) values (10, '2025-01-10 12:55:47.000000', 2, 2);
insert into projection (id, time, film_id, room_id) values (11, '2025-01-10 16:12:11.000000', 3, 1);
insert into projection (id, time, film_id, room_id) values (12, '2025-01-09 22:40:27.000000', 1, 4);
insert into projection (id, time, film_id, room_id) values (13, '2025-01-07 17:13:11.000000', 4, 2);
insert into projection (id, time, film_id, room_id) values (14, '2025-01-07 15:22:00.000000', 2, 3);
insert into projection (id, time, film_id, room_id) values (15, '2025-01-08 20:01:59.000000', 4, 1);
insert into projection (id, time, film_id, room_id) values (16, '2025-01-08 15:55:47.000000', 4, 2);
insert into projection (id, time, film_id, room_id) values (17, '2025-01-08 21:12:11.000000', 3, 1);
insert into projection (id, time, film_id, room_id) values (18, '2025-01-08 18:40:27.000000', 5, 3);
insert into projection (id, time, film_id, room_id) values (19, '2025-01-08 16:40:37.000000', 4, 1);
insert into projection (id, time, film_id, room_id) values (20, '2025-01-08 13:40:27.000000', 5, 4);
insert into projection (id, time, film_id, room_id) values (21, '2025-01-08 19:40:37.000000', 4, 4);

insert into ticket (id, user_id, projection_id, seat_id) values (1, 1, 1, 10);
insert into ticket (id, user_id, projection_id, seat_id) values (2, 1, 1, 11);
insert into ticket (id, user_id, projection_id, seat_id) values (3, 1, 1, 12);
insert into ticket (id, user_id, projection_id, seat_id) values (4, 1, 4, 45);
insert into ticket (id, user_id, projection_id, seat_id) values (5, 2, 2, 28);
insert into ticket (id, user_id, projection_id, seat_id) values (6, 1, 2, 29);
insert into ticket (id, user_id, projection_id, seat_id) values (7, 1, 9, 11);
insert into ticket (id, user_id, projection_id, seat_id) values (8, 1, 9, 10);
insert into ticket (id, user_id, projection_id, seat_id) values (9, 1, 9, 9);
insert into ticket (id, user_id, projection_id, seat_id) values (10, 1, 11, 11);
insert into ticket (id, user_id, projection_id, seat_id) values (11, 1, 11, 10);
insert into ticket (id, user_id, projection_id, seat_id) values (12, 1, 11, 9);
insert into ticket (id, user_id, projection_id, seat_id) values (13, 3, 11, 2);
insert into ticket (id, user_id, projection_id, seat_id) values (14, 3, 11, 3);

