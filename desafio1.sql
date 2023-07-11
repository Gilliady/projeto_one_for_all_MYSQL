DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plans (
    plan_id TINYINT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    plan_name VARCHAR(100) NOT NULL,
    plan_price DECIMAL(11,2) NOT NULL
);

CREATE TABLE artists (
    artist_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    artist_name VARCHAR(255) NOT NULL
);

CREATE TABLE albums (
    album_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    album_name VARCHAR(255) UNIQUE NOT NULL,
    album_release_year INT UNSIGNED NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id)
);

CREATE TABLE musics (
    music_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    music_name VARCHAR(255) NOT NULL,
    music_duration SMALLINT UNSIGNED NOT NULL,
    album_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albums (album_id)
);

CREATE TABLE users (
    user_id INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
    user_name VARCHAR(255) NOT NULL,
    user_age SMALLINT UNSIGNED NOT NULL,
    user_signature_date VARCHAR(11) NOT NULL,
    plan_id TINYINT UNSIGNED NOT NULL,
    FOREIGN KEY (plan_id) REFERENCES plans (plan_id)
);

CREATE TABLE followed_artists (
    user_id INT UNSIGNED NOT NULL,
    artist_id INT UNSIGNED NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (artist_id) REFERENCES artists (artist_id),
    PRIMARY KEY (user_id, artist_id)
);

CREATE TABLE musics_listened (
    user_id INT UNSIGNED NOT NULL,
    music_id INT UNSIGNED NOT NULL,
    music_date_played DATETIME NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users (user_id),
    FOREIGN KEY (music_id) REFERENCES musics (music_id),
    PRIMARY KEY (user_id, music_id)
);

INSERT INTO plans (plan_name, plan_price) VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO artists (artist_name) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Nina Simone'),
  ('Baco Exu do Blues'),
  ('Blind Guardian');

INSERT INTO albums (album_name, album_release_year, artist_id) VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 5),
  ('Somewhere Far Beyond', 2007, 6),
  ('I Put A Spell On You', 2012, 4);
  

INSERT INTO users (user_name, user_age, user_signature_date, plan_id) VALUES
  ('Barbara Liskov', 82, '2019-10-20', 1),
  ('Robert Cecil Martin', 58, '2017-01-06', 1),
  ('Ada Lovelace', 37, '2017-12-30', 4),
  ('Martin Fowler', 46, '2017-01-17', 4),
  ('Sandi Metz', 58, '2018-04-29', 4),
  ('Paulo Freire', 19, '2018-02-14', 2),
  ('Bell Hooks', 26, '2018-01-05', 2),
  ('Christopher Alexander', 85, '2019-06-05', 3),
  ('Judith Butler', 45, '2020-05-13', 3),
  ('Jorge Amado', 58, '2017-02-17', 3);

INSERT INTO followed_artists (user_id, artist_id) VALUES
  (1, 1),
  (1, 2),
  (1, 3),
  (2, 1),
  (2, 3),
  (3, 2),
  (4, 5),
  (5, 4),
  (5, 6),
  (6, 4),
  (6, 1),
  (7, 4),
  (9, 3),
  (10, 2);

INSERT INTO musics ( music_name, album_id, music_duration) VALUES
  ('BREAK MY SOUL', 1, 279),
  ("VIRGO'S GROOVE", 1, 369),
  ("ALIEN SUPERSTAR", 1, 116),
  ("Don't Stop Me Now", 2, 203),
  ("Under Pressure", 3, 152),
  ("Como Nossos Pais", 4, 105),
  ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
  ("Samba em Paris", 6, 267),
  ("The Bard's Song", 7, 244),
  ("Feeling Good", 8, 100);

INSERT INTO musics_listened (user_id, music_id, music_date_played) VALUES
  (1, 8, '2022-02-28'),
  (1, 2, '2020-05-02'),
  (1, 10, '2020-03-06'),
  (2, 2, '2022-08-05'),
  (2, 7, '2020-01-02'),
  (3, 10, '2020-11-13'),
  (3, 2, '2020-12-05'),
  (4, 8, '2021-08-15'),
  (5, 8, '2022-01-09'),
  (5, 5, '2020-08-06'),
  (6, 7, '2017-01-24'),
  (6, 1, '2017-10-12'),
  (7, 4, '2011-12-15'),
  (8, 4, '2012-03-17'),
  (9, 9, '2022-02-24'),
  (10, 3, '2015-12-13');