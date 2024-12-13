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

insert into cinema (id, name, city, is_open, rating) values (1, 'CinemaYay', 'Kraków', true, '5 stars');
insert into cinema (id, name, city, is_open, rating) values (2, 'HelloCinema', 'Kraków', true, 'great');
insert into cinema (id, name, city, is_open, rating) values (3, '123Cinema', 'Warszawa', true, 'nice');

insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (111, 'Rogue One: A Star Wars Story', 2016, '2016-12-13', 133, 'PG-13', 'Action|Science fiction', 'Jyn''s father is forcibly taken by the Galactic Empire to help them complete the Death Star. When she grows up, she joins a group of resistance fighters who aim to steal the Empire''s blueprints.', 'Gareth Edwards', 'Felicity Jones|Diego Luna', 'https://images-cdn.ubuy.co.in/63ef0a397f1d781bea0a2464-star-wars-rogue-one-movie-poster.jpg');
insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (112, 'Interstellar', 2014, '2014-11-07', 169, 'PG-13', 'Science fiction|Adventure', 'When Earth becomes uninhabitable in the future, a farmer and ex-NASA pilot, Joseph Cooper, is tasked to pilot a spacecraft, along with a team of researchers, to find a new planet for humans.', 'Christopher Nolan', 'Matthew McConaughey|Jessica Chastain', 'https://www.ubuy.com.pl/productimg/?image=aHR0cHM6Ly9tLm1lZGlhLWFtYXpvbi5jb20vaW1hZ2VzL0kvODFrejA2b1NVZUwuX0FDX1NMMTUwMF8uanBn.jpg');
insert into film (id, title, year, release_date, duration, age_category, genre, description, director, actors, image_url) values (113, 'Pulp Fiction', 1994, '1994-10-14', 169, 'R', 'Crime|Thriller', 'In the realm of underworld, a series of incidents intertwines the lives of two Los Angeles mobsters, a gangster''s wife, a boxer and two small-time criminals.', 'Quentin Tarantino', 'John Travolta|Uma Thurman', 'https://i5.walmartimages.com/seo/Pulp-Fiction-Movie-Poster-Regular-Mia-Wallace-On-Bed-Size-24-X-36_ce193b8f-4979-4dd4-89fb-cb5bda97b87b.47bd5508be83004cfd0b4ae1123a208e.jpeg');

insert into "user" (id, username, password, email, telephone) values (1, 'sigma', 'sigma123', 'sigma@mail.com', '111-111-111');
insert into "user" (id, username, password, email, telephone) values (2, 'skibidi', 'skibidi123', 'skibidi@mail.com', '444-444-444');

insert into seat_type (id, name, cost) values (1, 'normal', 22.99);
insert into seat_type (id, name, cost) values (2, 'vip', 25.99);
insert into seat_type (id, name, cost) values (3, 'super vip', 32.99);

insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (1, 1, 12, 1, true, 1);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (2, 2, 20, 0, true, 1);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (3, 3, 20, 0, true, 1);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (4, 1, 32, 0, true, 2);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (5, 2, 20, 0, true, 2);
insert into room (id, room_number, capacity, occupied, is_open, cinema_id) values (6, 1, 91, 0, true, 3);

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
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (11, 'C', 3, false, 1, 1);
insert into seat (id, row_letter, column_number, is_occupied, room_id, type_id) values (12, 'C', 4, false, 1, 1);
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
insert into projection (id, time, film_id, room_id) values (12, '2025-01-09 22:40:27.000000', 4, 3);


insert into ticket (id, user_id, projection_id, seat_id) values (1, 1, 1, 10);



