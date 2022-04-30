-- -- --clear database on start up
DROP TABLE IF EXISTS questions CASCADE;
DROP TABLE IF EXISTS answers CASCADE;
DROP TABLE IF EXISTS photos CASCADE;
DROP DATABASE IF EXISTS sdc;

-- --create db
CREATE DATABASE sdc;

-- --connect to db
\c sdc

--create table if it doesnt exists

CREATE TABLE IF NOT EXISTS questions (
  id SERIAL PRIMARY KEY NOT NULL,
  product_id INT NOT NULL,
  question_body VARCHAR(250) NOT NULL,
  question_date BIGINT NOT NULL,
  asker_name VARCHAR(100) NOT NULL,
  question_email VARCHAR(100),
  question_reported BOOLEAN DEFAULT false,
  question_helpfulness INT DEFAULT  0
);

CREATE TABLE IF NOT EXISTS answers (
  id SERIAL PRIMARY KEY NOT NULL,
  question_id INT NOT NULL,
  answer_body VARCHAR(250),
  answer_date BIGINT,
  answer_name VARCHAR(100),
  answer_email VARCHAR(100),
  answer_reported BOOLEAN DEFAULT false,
  answer_helpfulness INT DEFAULT 0,
  FOREIGN KEY (question_id) REFERENCES questions (id)
);

CREATE TABLE IF NOT EXISTS photos (
  id SERIAL PRIMARY KEY NOT NULL,
  answer_id INT NOT NULL,
  photos_url TEXT,
  FOREIGN KEY (answer_id) REFERENCES answers (id)
);


CREATE INDEX IF NOT EXISTS question_idx ON questions (product_id);
CREATE INDEX IF NOT EXISTS answer_idx ON answers (question_id);
CREATE INDEX IF NOT EXISTS answer_photos_idx ON photos (answer_id);


