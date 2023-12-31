create table if not exists compilation (
compilation_id SERIAL primary key,
name VARCHAR(40) unique,
release_date date
);

create table if not exists album (
album_id SERIAL primary key,
name VARCHAR(60) unique,
release_date date
);

create table if not exists track (
track_id SERIAL primary key,
name VARCHAR(100),
duration DECIMAL(3, 2) check(duration<12),
album_belonging INTEGER references album(album_id)
);

create table if not exists compilation_track (
compilation_track_id SERIAL primary key,
compilation_id INT not null,
track_id INT not null,
constraint fk_compilation foreign key(compilation_id) references compilation(compilation_id) on delete cascade,
constraint fk_track foreign key(track_id) references track(track_id) on delete cascade
);

create table if not exists artist (
artist_id SERIAL primary key,
name VARCHAR(80) unique
);

create table if not exists album_artist (
album_artist_id SERIAL primary key,
album_id INT not null,
artist_id INT not null,
constraint fk_album foreign key(album_id) references album(album_id) on delete cascade,
constraint fk_artist foreign key(artist_id) references artist(artist_id) on delete cascade
);

create table if not exists genre (
genre_id SERIAL primary key,
name VARCHAR(40) unique
);

create table if not exists artist_genre (
artist_genre_id SERIAL primary key,
artist_id INT not null,
genre_id INT not null,
constraint fk_artist foreign key(artist_id) references artist(artist_id) on delete cascade,
constraint fk_genre foreign key(genre_id) references genre(genre_id) on delete cascade
);



