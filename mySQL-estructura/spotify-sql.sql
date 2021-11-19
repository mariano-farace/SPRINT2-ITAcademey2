DROP DATABASE IF EXISTS spotify;
CREATE DATABASE spotify CHARACTER SET utf8mb4;
USE spotify;
CREATE TABLE artist (
  artist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  picture VARCHAR(200) NOT NULL
);
CREATE TABLE realted_artists (
  artist_1 INT UNSIGNED NOT NULL,
  FOREIGN KEY (artist_1) REFERENCES artist(artist_id),
  artist_2 INT UNSIGNED NOT NULL,
  FOREIGN KEY (artist_2) REFERENCES artist(artist_id)
);
CREATE TABLE album (
  album_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  artist_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id),
  release_date TIMESTAMP NOT NULL,
  cover_image VARCHAR(200) NOT NULL
);
CREATE TABLE song (
  song_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  length INT UNSIGNED NOT NULL,
  album_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id),
  number_of_reproductions INT UNSIGNED NOT NULL
);
CREATE TABLE user (
  user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  date_born DATE NOT NULL,
  sex CHAR NOT NULL,
  country VARCHAR(50) NOT NULL,
  cp VARCHAR(20) NOT NULL,
  is_premium BOOL NOT NULL
);
CREATE TABLE favorite_songs (
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  song_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (song_id) REFERENCES song(song_id)
);
CREATE TABLE favorite_albums (
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  album_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (album_id) REFERENCES album(album_id)
);
CREATE TABLE favorite_artists (
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  artist_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (artist_id) REFERENCES artist(artist_id)
);
CREATE TABLE subscription (
  subscription_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  start_date TIMESTAMP NOT NULL,
  renewal_date TIMESTAMP NOT NULL,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id)
);
CREATE TABLE payment_info (
  payment_info_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  pp_username VARCHAR(50),
  cc_number VARCHAR(50),
  cc_expiration_date DATE,
  cc_security_code INT UNSIGNED
);
CREATE TABLE payment (
  payment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  payment_info_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (payment_info_id) REFERENCES payment_info(payment_info_id),
  payment_date TIMESTAMP NOT NULL,
  subscription_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (subscription_id) REFERENCES subscription(subscription_id),
  total INT UNSIGNED NOT NULL
);
CREATE TABLE playlist (
  playlist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  number_of_songs INT UNSIGNED NOT NULL,
  creation_date DATE NOT NULL,
  user_owner INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_owner) REFERENCES user(user_id),
  is_shared BOOL NOT NULL,
  has_been_deleted BOOL,
  deletion_date DATE
);
CREATE TABLE songs_x_playlist (
  song_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (song_id) REFERENCES song(song_id),
  playlist_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id),
  added_by INT UNSIGNED NOT NULL,
  FOREIGN KEY (added_by) REFERENCES user(user_id),
  date_added TIMESTAMP NOT NULL
);
-------------------------------------------------------------
INSERT INTO
  artist
VALUES(1, "Dire Straits", "_22101985_23_800.jpg");
INSERT INTO
  artist
VALUES(2, "Supertramp", "File:Supertramp1971.jpg");
INSERT INTO
  realted_artists
VALUES(1, 2);
INSERT INTO
  album
VALUES(
    1,
    "Free as a Bird",
    1,
    "1987-09-09 10:10:10",
    "File:Supertramp_-_Free_As_a_Bird.jpg"
  );
INSERT INTO
  album
VALUES(
    2,
    "Brothers in Arms",
    2,
    "1985-09-09 10:10:10",
    "File:DS_Brothers_in_Arms.jpg"
  );
INSERT INTO
  song
VALUES(1, "Money For Nothing", 185, 1, 6598771);
INSERT INTO
  song
VALUES(2, "So Far Away", 199, 1, 300224);
INSERT INTO
  song
VALUES(3, "It's Alright", 123, 2, 65496);
INSERT INTO
  user
VALUES(
    1,
    "winter_life",
    "winter_life@email.com",
    "ASDKJFL654",
    "2020-09-09",
    "F",
    "Italy",
    "LO9874",
    1
  );
INSERT INTO
  user
VALUES(
    2,
    "rafaelIopu999",
    "rafael_iopu@email.com",
    "password123",
    "1996-09-09",
    "M",
    "Greece",
    "T6547",
    0
  );
INSERT INTO
  favorite_songs
VALUES(1, 1);
INSERT INTO
  favorite_albums
VALUES(1, 1);
INSERT INTO
  favorite_artists
VALUES(1, 1);
INSERT INTO
  subscription
VALUES(
    1,
    "2020-09-09 10:10:10",
    "2022-09-09 10:10:10",
    1
  );
INSERT INTO
  payment_info
VALUES(
    1,
    1,
    "some_paypal_Username",
    NULL,
    NULL,
    NULL
  );
INSERT INTO
  payment
VALUES(1, 1, "2020-09-09 10:10:10", 1, 33);
INSERT INTO
  playlist
VALUES(1, 3, "2020-09-09", 1, 1, 0, NULL);
INSERT INTO
  songs_x_playlist
VALUES(1, 1, 1, "2020-09-09 10:10:10");
INSERT INTO
  songs_x_playlist
VALUES(2, 1, 2, "2020-09-09 10:10:10");
INSERT INTO
  songs_x_playlist
VALUES(3, 1, 2, "2020-09-09 10:10:10");