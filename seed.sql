DROP TABLE IF EXISTS object;

CREATE TABLE object (

  id SERIAL PRIMARY KEY,
  title VARCHAR(255),
  object_type TEXT,
  radius FLOAT,
  mass FLOAT,
  gravity FLOAT,
  planet TEXT

);

INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Earth' , 'Terrestrial Planet' , 1.0 , 1.0 , 9.81 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('The Moon' , 'Moon' , 0.2727 , 0.0123 , 1.625 , 'Earth');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Jupiter' , 'Gas Giant' , 10.97 , 317.83 , 24.79 , null);
