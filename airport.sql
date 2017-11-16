DROP TABLE passengers_flights;
DROP TABLE flights;
DROP TABLE airports;
DROP TABLE passengers;

CREATE TABLE airports
(
  id SERIAL8 PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  city VARCHAR(255),
  runways INT,
  airport_type VARCHAR(255)
);

CREATE TABLE flights
(
  id SERIAL8 PRIMARY KEY,
  number VARCHAR(255) NOT NULL,
  airport_id INT8 REFERENCES airports(id)
);

CREATE TABLE passengers
(
  id SERIAL8 PRIMARY KEY,
  first_name VARCHAR(255),
  last_name VARCHAR(255),
  address VARCHAR(255)
);

CREATE TABLE passengers_flights
(
  id SERIAL8 PRIMARY KEY,
  passenger_id INT8 REFERENCES passengers(id),
  flight_id INT8 REFERENCES flights(id)
);


INSERT INTO airports (name, city, runways, airport_type) VALUES ('Heathrow', 'London', 3, 'international');
INSERT INTO airports (name, city, runways, airport_type) VALUES ('Edinburgh','Edinburgh', 1, 'international');
INSERT INTO airports (name, city, runways, airport_type) VALUES ('JFK','New York', 4, 'international');

INSERT INTO flights (number, airport_id) VALUES ('BA1453', 1);
INSERT INTO flights (number, airport_id) VALUES ('EJ6796', 1);
INSERT INTO flights (number, airport_id) VALUES ('RY786', 2);
INSERT INTO flights (number, airport_id) VALUES ('SY78', 3);

INSERT INTO passengers (first_name, last_name, address) VALUES ('Sian', 'RD', 'Edinburgh');
INSERT INTO passengers (first_name, last_name, address) VALUES ('Upul', 'Dissanayaka', 'Edinburgh');
INSERT INTO passengers (first_name, last_name, address) VALUES ('Tom', 'Cruise','Los Angeles');
INSERT INTO passengers (first_name, last_name, address) VALUES ('Chuck', 'Berry', 'Saint Louis');
INSERT INTO passengers (first_name, last_name, address) VALUES ('Sara', 'Montague', 'London');

INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (1, 1);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (1, 2);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (2, 2);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (2, 4);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (1, 3);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (3, 1);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (4, 1);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (5, 3);
INSERT INTO passengers_flights (passenger_id, flight_id) VALUES (3, 3);

-- q1 and q2
-- SELECT airports.name as airport_name, flights.number as flight_number FROM airports
-- INNER JOIN flights ON flights.airport_id = airports.id

-- q3
-- SELECT airports.name as airport_name, flights.number as flight_number FROM airports
-- INNER JOIN flights ON flights.airport_id = airports.id
-- WHERE airports.name = 'Heathrow'

-- q4
-- FROM airports
-- INNER JOIN flights
-- ON flights.airport_id = airports.id
-- WHERE flights.number = 'BA1453'

-- q5, q6
-- SELECT flights.number, passengers.first_name, passengers.last_name FROM flights
-- INNER JOIN passengers_flights
-- ON passengers_flights.flight_id = flights.id
-- INNER JOIN passengers
-- on passengers_flights.passenger_id = passengers.id
-- WHERE (passengers.id = 3) OR (passengers.first_name = 'Sian')

-- q7 two new columns in flights table to add destinations, time etc
