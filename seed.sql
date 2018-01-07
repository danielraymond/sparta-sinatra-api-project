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

INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Earth' , 'Planet' , 1.0 , 1.0 , 9.81 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('The Moon' , 'Moon' , 0.2727 , 0.0123 , 1.625 , 'Earth');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Jupiter' , 'Planet' , 10.97 , 317.83 , 24.79 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Saturn' , 'Planet' , 9.140 , 95.162 , 10.445 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Uranus' , 'Planet' , 3.981  , 14.536 , 8.69 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Neptune' , 'Planet' , 3.865 , 17.147 , 11.15 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Venus' , 'Planet' , 0.9499 , 0.815 , 8.872 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Mars' , 'Planet' , 0.5320 , 0.107 , 	3.7 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Ganymede' , 'Moon' , 0.4135 , 0.0248 , 1.428 , 'Jupiter');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Titan' , 'Moon' , 0.4043 , 0.0225 , 1.354 , 'Saturn');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Mercury' , 'Planet' , 0.3829 , 0.0553 , 3.7 , null);
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Callisto' , 'Moon' , 0.3783 , 0.018 , 1.23603 , 'Jupiter');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Io' , 'Moon' , 0.2859 , 0.015 , 1.797 , 'Jupiter');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Europa' , 'Moon' , 0.2450 , 0.008035 , 1.316 , 'Jupiter');
INSERT INTO object (title , object_type , radius , mass , gravity , planet) VALUES ('Triton' , 'Moon' , 0.2124 , 0.003599 ,	0.782 , 'Neptune');
