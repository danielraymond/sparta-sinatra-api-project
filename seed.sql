DROP TABLE IF EXISTS object;

CREATE TABLE object (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  object_type TEXT,
  radius FLOAT

);

INSERT INTO object (title , object_type , radius) VALUES ('Earth' , 'Planet' , 1.0);
INSERT INTO object (title , object_type , radius) VALUES ('The Moon' , 'Moon' , 0.2727);
INSERT INTO object (title , object_type , radius) VALUES ('Mars' , 'Planet' , 0.5320);
