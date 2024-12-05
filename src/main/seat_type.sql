create table seat_type
(
    id   integer      not null
        primary key,
    name varchar(255) not null,
    cost real         not null
);

alter table seat_type
    owner to postgres;

INSERT INTO public.seat_type (id, name, cost) VALUES (2, 'SEUPER VIP', 90.89);
INSERT INTO public.seat_type (id, name, cost) VALUES (1, 'auew', 118.8);
INSERT INTO public.seat_type (id, name, cost) VALUES (3, 'aeio', 60.93);
INSERT INTO public.seat_type (id, name, cost) VALUES (4, 'rzoy', 80.43);
INSERT INTO public.seat_type (id, name, cost) VALUES (5, 'todt', 90.4);
INSERT INTO public.seat_type (id, name, cost) VALUES (6, 'jtso', 272.67);
INSERT INTO public.seat_type (id, name, cost) VALUES (7, 'mewr', 292.13);
INSERT INTO public.seat_type (id, name, cost) VALUES (8, 'tctg', 255.22);
INSERT INTO public.seat_type (id, name, cost) VALUES (9, 'dlyp', 105.09);
INSERT INTO public.seat_type (id, name, cost) VALUES (10, 'fofw', 129.98);
INSERT INTO public.seat_type (id, name, cost) VALUES (11, 'jarp', 41.55);
INSERT INTO public.seat_type (id, name, cost) VALUES (12, 'pvbo', 215.89);
INSERT INTO public.seat_type (id, name, cost) VALUES (13, 'cksq', 179.15);
INSERT INTO public.seat_type (id, name, cost) VALUES (14, 'wcwm', 272.45);
INSERT INTO public.seat_type (id, name, cost) VALUES (15, 'msqw', 57.88);
INSERT INTO public.seat_type (id, name, cost) VALUES (16, 'mtts', 259.66);
INSERT INTO public.seat_type (id, name, cost) VALUES (17, 'kgpd', 101.54);
INSERT INTO public.seat_type (id, name, cost) VALUES (18, 'zilx', 223.06);
INSERT INTO public.seat_type (id, name, cost) VALUES (19, 'swpw', 27.3);
INSERT INTO public.seat_type (id, name, cost) VALUES (20, 'dzxv', 37.2);
