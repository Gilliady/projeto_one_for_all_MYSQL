DROP DATABASE IF EXISTS SpotifyClone;
CREATE DATABASE IF NOT EXISTS SpotifyClone;
USE SpotifyClone;

CREATE TABLE plano (
    plano_id TINYINT PRIMARY KEY AUTO_INCREMENT,
    plano_nome VARCHAR(100) NOT NULL,
    plano_preco DECIMAL(11,2) NOT NULL
);

CREATE TABLE artistas (
    artista_id INT PRIMARY KEY AUTO_INCREMENT,
    artista_nome VARCHAR(255) NOT NULL
);

CREATE TABLE albuns (
    album_id INT PRIMARY KEY AUTO_INCREMENT,
    album_nome VARCHAR(255) UNIQUE NOT NULL,
    album_release_year INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id)
);

CREATE TABLE musicas (
    musica_id INT PRIMARY KEY AUTO_INCREMENT,
    musica_nome VARCHAR(255) NOT NULL,
    musica_duracao SMALLINT NOT NULL,
    album_id INT NOT NULL,
    FOREIGN KEY (album_id) REFERENCES albuns (album_id)
);

CREATE TABLE usuarios (
    usuario_id INT PRIMARY KEY AUTO_INCREMENT,
    usuario_nome VARCHAR(255) NOT NULL,
    usuario_idade SMALLINT NOT NULL,
    usuario_data_assinatura VARCHAR(11) NOT NULL,
    plano_id TINYINT NOT NULL,
    FOREIGN KEY (plano_id) REFERENCES plano (plano_id)
);

CREATE TABLE artistas_seguidos (
    usuario_id INT NOT NULL,
    artista_id INT NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (artista_id) REFERENCES artistas (artista_id),
    PRIMARY KEY (usuario_id, artista_id)
);

CREATE TABLE musicas_escutadas (
    usuario_id INT NOT NULL,
    musica_id INT NOT NULL,
    musica_data_reproducao DATETIME NOT NULL,
    FOREIGN KEY (usuario_id) REFERENCES usuarios (usuario_id),
    FOREIGN KEY (musica_id) REFERENCES musicas (musica_id),
    PRIMARY KEY (usuario_id, musica_id)
);

INSERT INTO plano (plano_nome, plano_preco) VALUES
  ('gratuito', 0.00),
  ('universitário', 5.99),
  ('pessoal', 6.99),
  ('familiar', 7.99);

INSERT INTO artistas (artista_nome) VALUES
  ('Beyoncé'),
  ('Queen'),
  ('Elis Regina'),
  ('Nina Simone'),
  ('Baco Exu do Blues'),
  ('Blind Guardian');

INSERT INTO albuns (album_nome, album_release_year, artista_id) VALUES
  ('Renaissance', 2022, 1),
  ('Jazz', 1978, 2),
  ('Hot Space', 1982, 2),
  ('Falso Brilhante', 1998, 3),
  ('Vento de Maio', 2001, 3),
  ('QVVJFA?', 2003, 5),
  ('Somewhere Far Beyond', 2007, 6),
  ('I Put A Spell On You', 2012, 4);
  

INSERT INTO usuarios (usuario_nome, usuario_idade, usuario_data_assinatura, plano_id) VALUES
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

INSERT INTO artistas_seguidos (usuario_id, artista_id) VALUES
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

INSERT INTO musicas ( musica_nome, album_id, musica_duracao) VALUES
  ('BREAaK MY SOUL', 1, 279),
  ("VIRGaO'S GROOVE", 1, 369),
  ("ALIEaN SUPERSTAR", 1, 116),
  ("Don't Stop Me Now", 2, 203),
  ("Under Pressure", 3, 152),
  ("Como Nossos Pais", 4, 105),
  ("O Medo de Amar é o Medo de Ser Livre", 5, 207),
  ("Samba em Paris", 6, 267),
  ("The Bard's Song", 7, 244),
  ("Feeling Good", 8, 100);


  INSERT INTO musicas_escutadas (usuario_id, musica_id, musica_data_reproducao) VALUES
	(1, 8, '2022-02-28 10:45:55'),
	(1, 2, '2020-05-02 05:30:35'),
	(1, 10, '2020-03-06 11:22:33'),
	(2, 10, '2022-08-05 08:05:17'),
	(2, 7, '2020-01-02 07:40:33'),
	(3, 10, '2020-11-13 16:55:13'),
	(3, 2, '2020-12-05 18:38:30'),
	(4, 8, '2021-08-15 17:10:10'),
	(5, 8, '2022-01-09 01:44:33'),
	(5, 5, '2020-08-06 15:23:43'),
	(6, 7, '2017-01-24 00:31:17'),
	(6, 1, '2017-10-12 12:35:20'),
	(7, 4, '2011-12-15 22:30:49'),
	(8, 4, '2012-03-17 14:56:41'),
	(9, 9, '2022-02-24 21:14:22'),
	(10, 3, '2015-12-13 08:30:22');