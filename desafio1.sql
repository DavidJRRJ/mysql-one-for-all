DROP DATABASE IF EXISTS SpotifyClone;

  CREATE DATABASE IF NOT EXISTS SpotifyClone;

  CREATE TABLE SpotifyClone.plans(
      plan_id INT NOT NULL  AUTO_INCREMENT PRIMARY KEY,
      name_plan VARCHAR(50) NOT NULL,
      price_plan DECIMAL(5, 2) NOT NULL
  ) engine = InnoDB;

   CREATE TABLE SpotifyClone.users(
      id_user INT PRIMARY KEY AUTO_INCREMENT,
      name VARCHAR(50) NOT NULL,
      age INT NOT NULL,
      signature_date DATE,
      plan_id INT,
      FOREIGN KEY (plan_id) REFERENCES SpotifyClone.plans(plan_id)
    ) engine = InnoDB;

   CREATE TABLE SpotifyClone.artists(
      id_artist INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
      artist_name VARCHAR(50) NOT NULL
    ) engine = InnoDB;

     CREATE TABLE SpotifyClone.albuns(
      id_album INT PRIMARY KEY AUTO_INCREMENT,
      name_album VARCHAR(50) NOT NULL,
      id_artist INT,
      release_year DATE NOT NULL,
      FOREIGN KEY (id_artist) REFERENCES artists(id_artist)
    ) engine = InnoDB;

     CREATE TABLE SpotifyClone.musics(
      id_music INT PRIMARY KEY AUTO_INCREMENT,
      id_album INT NOT NULL,
      music_name VARCHAR(255) NOT NULL,
      duration INT NOT NULL,
      FOREIGN KEY (id_album) REFERENCES albuns(id_album)
    ) engine = InnoDB;

     CREATE TABLE SpotifyClone.historic(
      id_user INT NOT NULL,
      id_music INT NOT NULL,
      reprodution_data DATETIME,
      CONSTRAINT PRIMARY KEY(id_music, id_user),
      FOREIGN KEY (id_user) REFERENCES users(id_user),
      FOREIGN KEY (id_music) REFERENCES musics(id_music)
    ) engine = InnoDB;

     CREATE TABLE SpotifyClone.follow(
      id_user INT NOT NULL,
      id_artist INT NOT NULL,
      CONSTRAINT PRIMARY KEY (id_user, id_artist),
      FOREIGN KEY (id_artist) REFERENCES artists(id_artist),
      FOREIGN KEY (id_user) REFERENCES users(id_user)
    ) engine = InnoDB;

  INSERT INTO SpotifyClone.plans (name_plan, price_plan)
  VALUES
    ('gratuito', '0.00'),
    ('familiar', '7.99'),
    ('universitário', '5.99'),
    ('pessoal', '6.99')
    ;
  
INSERT INTO SpotifyClone.users(name, age, plan_id, signature_date)
VALUES
  ('Barbara Liskov',82,1,'2019-10-20'),
  ('Robert Cecil Martin',58,1,'2017-01-06'),
  ('Ada Lovelace',37,2,'2017-12-30'),
  ('Martin Fowler',46,2,'2017-01-17'),
  ('Sandi Metz',58,2,'2018-04-29'),
  ('Paulo Freire',19,3,'2018-02-14'),
  ('Bell Hooks',26,3,'2018-01-05'),
  ('Christopher Alexander',85,4,'2019-06-05'),
  ('Judith Butler',45,4,'2020-05-13'),
  ('Jorge Amado',	58,4,'2017-02-17')
  ;

INSERT INTO SpotifyClone.artists(artist_name)
VALUES
('Elis Regina'),
('Beyoncé'),
('Queen'),
('Baco Exu do Blues'),
('Blind Guardian'),
('Nina Simone')
;

INSERT INTO SpotifyClone.albuns(name_album, id_artist, release_year)
VALUES 
('Renaissance',2,'2022-07-29'),
('Jazz',3,'1978-11-10'),
('Hot Space',3,'1982-07-30'),
('Falso Brilhante',1,'1998-03-17'),
('Vento de Maio',1,'2001-12-01'),
('QVVJFA?',4,'2003-02-01'),
('Somewhere Far Beyond',5,'2007-05-02'),
('I Put A Spell On You',6,'2012-04-30')
;

INSERT INTO SpotifyClone.musics(music_name, id_album, duration)
VALUES 
("BREAK MY SOUL",1, 279),
("VIRGO’S GROOVE", 1,369),
("ALIEN SUPERSTAR",1, 116),
("Don’t Stop Me Now",2, 203),
("Under Pressure",3, 152),
("Como Nossos Pais",4, 105),
("O Medo de Amar é o Medo de Ser Livre",5, 207),
("Samba em Paris",6, 267),
("The Bard’s Song",7, 244),
("Feeling Good",8, 100)
;

INSERT INTO SpotifyClone.follow(id_user, id_artist)
VALUES
(1,1),
(1,2),
(1,3),
(2,1),
(2,3),
(3,2),
(4,4),
(5,5),
(5,6),
(6,6),
(6,1),
(7,6),
(9,3),
(10,2)
;

INSERT INTO SpotifyClone.historic(id_music, id_user, reprodution_data)
VALUES 
(8,1,"2022-02-28 10:45:55"),
(2,1,"2020-05-02 05:30:35"),
(10,1,"2020-03-06 11:22:33"),
(10,2,"2022-08-05 08:05:17"),
(7,2,"2020-01-02 07:40:33"),
(10,3,"2020-11-13 16:55:13"),
(2,3,"2020-12-05 18:38:30"),
(8,4,"2021-08-15 17:10:10"),
(8,5,"2022-01-09 01:44:33"),
(5,5,"2020-08-06 15:23:43"),
(7,6,"2017-01-24 00:31:17"),
(1,6, "2017-10-12 12:35:20"),
(4,7,"2011-12-15 22:30:49"),
(4,8,"2012-03-17 14:56:41"),
(9,9,"2022-02-24 21:14:22"),
(3,10,"2015-12-13 08:30:22");