create database movies;
use movies;

-- Main Nouns Tables
create table movies(
    movie_id int auto_increment,
    title varchar(25),
    year int,
    director_id int ,
    primary key(movie_id),
    foreign key (director_id) references directors(director_id)
);

create table directors(
	director_id int auto_increment,
    director_name varchar(25),
    primary key(director_id)
);

create table actors(
	actor_id int auto_increment,
    actor_name varchar(25),
    primary key (actor_id)
);

-- Mapping Tables
create table actors_movies(
	actor_id int,
    movie_id int,
    foreign key(actor_id) references actors(actor_id),
    foreign key(movie_id) references movies(movie_id),
    primary key(actor_id, movie_id)
);