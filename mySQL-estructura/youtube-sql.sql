--estoy asumiendo que un video pertenece solo a un canal
DROP DATABASE IF EXISTS youtube;
CREATE DATABASE youtube CHARACTER SET utf8mb4;
USE youtube;
CREATE TABLE user (
  user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  email VARCHAR(50) NOT NULL,
  password VARCHAR(100) NOT NULL,
  date_born DATE NOT NULL,
  sex CHAR NOT NULL,
  country VARCHAR(50) NOT NULL,
  cp VARCHAR(20) NOT NULL
);
CREATE TABLE channel (
  channel_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_owner INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_owner) REFERENCES user(user_id),
  name VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  creation_date TIMESTAMP NOT NULL
);
CREATE TABLE video (
  video_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  title VARCHAR(50) NOT NULL,
  description VARCHAR(200) NOT NULL,
  size INT UNSIGNED NOT NULL,
  file_name VARCHAR(50) NOT NULL,
  length INT UNSIGNED NOT NULL,
  thumbnail VARCHAR(200) NOT NULL,
  views INT UNSIGNED NOT NULL,
  visibility_state ENUM('public', 'hidden', "private") NOT NULL,
  user_owner INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_owner) REFERENCES user(user_id),
  date_published TIMESTAMP NOT NULL,
  channel_it_belongs_to INT UNSIGNED,
  FOREIGN KEY (channel_it_belongs_to) REFERENCES channel(channel_id)
);
CREATE TABLE video_reaction_by_user (
  video_reaction_by_user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  reaction ENUM('like', 'dislike') NOT NULL,
  video_id INT UNSIGNED NOT NULL,
  reaction_date TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (video_id) REFERENCES video(video_id)
);
CREATE TABLE tag (
  tag_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tag_text VARCHAR(20) NOT NULL
);
CREATE TABLE tag_x_video (
  tag_x_video_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  tag_id INT UNSIGNED NOT NULL,
  video_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (tag_id) REFERENCES tag(tag_id),
  FOREIGN KEY (video_id) REFERENCES video(video_id)
);
CREATE TABLE channel_subscriptions (
  channel_subscriptions_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  channel_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (channel_id) REFERENCES channel(channel_id)
);
CREATE TABLE comment (
  comment_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  comment_owner INT UNSIGNED NOT NULL,
  FOREIGN KEY (comment_owner) REFERENCES user(user_id),
  body VARCHAR(300) NOT NULL,
  creation_date TIMESTAMP NOT NULL,
  video_commented INT UNSIGNED NOT NULL,
  FOREIGN KEY (video_commented) REFERENCES video(video_id)
);
CREATE TABLE comment_reaction_by_user (
  comment_reaction_by_user_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  user_id INT UNSIGNED NOT NULL,
  reaction ENUM('like', 'dislike') NOT NULL,
  comment_id INT UNSIGNED NOT NULL,
  reaction_date TIMESTAMP NOT NULL,
  FOREIGN KEY (user_id) REFERENCES user(user_id),
  FOREIGN KEY (comment_id) REFERENCES comment(comment_id)
);
CREATE TABLE playlist (
  playlist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(50) NOT NULL,
  creation_date TIMESTAMP NOT NULL,
  user_owner INT UNSIGNED NOT NULL,
  FOREIGN KEY (user_owner) REFERENCES user(user_id),
  visibility_state ENUM('public', "private") NOT NULL
);
CREATE TABLE videos_x_playlist (
  videos_x_playlist_id INT UNSIGNED AUTO_INCREMENT PRIMARY KEY,
  video_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (video_id) REFERENCES video(video_id),
  playlist_id INT UNSIGNED NOT NULL,
  FOREIGN KEY (playlist_id) REFERENCES playlist(playlist_id)
);
-------------------------------------------------------------------------------------------------------
INSERT INTO
  user
VALUES(
    1,
    "Mariano_6547",
    "mariano@email.com",
    "lakjsdflksj57",
    "1988-04-29",
    "M",
    "Antartica",
    "654623"
  );
INSERT INTO
  user
VALUES(
    2,
    "hernan1926",
    "hernan@email.com",
    "qwe1273",
    "1926-04-29",
    "M",
    "Sudan",
    "W8542124"
  );
INSERT INTO
  channel
VALUES(
    1,
    1,
    "Docummentaries",
    "This channel has the best docummentaries ever",
    "2021-09-09 10:10:10"
  );
INSERT INTO
  video
VALUES(
    1,
    "The Endurance",
    "The Endurance is a 2000 documentary film directed by George Butler",
    654687,
    "Vid65489674321.mp4",
    7322,
    "some-URL-The_Endurance_cover.jpg",
    156,
    "public",
    1,
    "2021-09-09 10:10:10",
    1
  );
INSERT INTO
  video_reaction_by_user
VALUES(1, 1, "like", 1, "2021-10-10 10:10:10");
INSERT INTO
  video_reaction_by_user
VALUES(2, 2, "dislike", 1, "2021-10-10 10:10:10");
INSERT INTO
  tag
VALUES(1, "long videos");
INSERT INTO
  tag
VALUES(2, "adventure");
INSERT INTO
  tag_x_video
VALUES(1, 1, 1);
INSERT INTO
  tag_x_video
VALUES(2, 2, 1);
INSERT INTO
  channel_subscriptions
VALUES(1, 1, 1);
INSERT INTO
  channel_subscriptions
VALUES(2, 2, 1);
INSERT INTO
  comment
VALUES(
    1,
    2,
    "I don't like your video",
    "2021-11-11 10:10:10",
    1
  );
INSERT INTO
  comment_reaction_by_user
VALUES(1, 1, "dislike", 1, "2021-11-11 10:10:10");
INSERT INTO
  playlist
VALUES(
    1,
    "Videos I do not like",
    "2021-12-12 10:10:10",
    2,
    "public"
  );
INSERT INTO
  videos_x_playlist
VALUES(1, 1, 1);