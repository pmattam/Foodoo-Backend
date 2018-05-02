DROP DATABASE IF EXISTS foodoo;
CREATE DATABASE foodoo;

\c foodoo;

CREATE TABLE users (
  id SERIAL PRIMARY KEY,
  username VARCHAR (100) UNIQUE NOT NULL,
  password VARCHAR (100) NOT NULL,
  location VARCHAR (150),
  email VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE clients (
  id SERIAL PRIMARY KEY,
  clientname VARCHAR (100) UNIQUE NOT NULL,
  phonenumber VARCHAR (13),
  address VARCHAR (150),
  email VARCHAR(100) UNIQUE
);

/*
menu and shopping list can be json. So, the cusom data (which is not limited just few items) can be saved based on the event.
for example, menu can be saved as '{
        "appetizer": "Crabcakes",
        "main": "Pasta",
        "dessert": "Bread Pudding",
        "drink": "Moscow Mule Mocktail"
      }'
same thing for shoppinglist as well:
*/
CREATE TABLE events (
  eventid SERIAL PRIMARY KEY,
  userid INTEGER NOT NULL,
  eventtitle VARCHAR (150) UNIQUE NOT NULL,
  eventdate TIMESTAMP,
  eventdescription VARCHAR (150),
  eventsize INTEGER,
  eventtype VARCHAR (50),
  mealtype VARCHAR (50),
  clientname VARCHAR (100),
  menu JSON,
  shoppinglist JSON
);

INSERT INTO users (username, password, location, email) VALUES 
  ('Dylan Bailey', '$2b$10$6QN.z5U5ZiybYaKLLJJsQ.DHPX8c64GJuD.tB/4Zd3XjWiHPPKlXW', 'Atlanta, GA', 'dylan@d.com'),
  ('Jaehee Kim', '$2b$10$zhQIgEdfpVhqPlvo6lQqkOd3w9vOLYyW1mPORTDexgjEtLQmQRuga', 'Atlanta, GA', 'jaehee@j.com'),
  ('Janelle Alexander', '$2b$10$dFhhMXVGP.LAlpT5n4R98.XDhEeMSbIMFnnRmS8WX/rXhLayBBWv6', 'Atlanta, GA', 'janelle@j.com'),
  ('Prathyusha Mattam', '$2b$10$O2R7SiqOEonm81TdYiPFhOC3mNNQz5CjiR8Go4KmpebeM8YhXMZ9.', 'Atlanta, GA', 'prathyusha@m.com');


INSERT INTO events (userId, eventTitle, eventDate, eventDescription, eventSize, eventType, mealType, clientName, menu, shoppingList) 
  VALUES ('3', 'Alexander Graduation', '2019-05-17 16:00:00', 'Casual event for a coding bootcamp graduation', 25, 'Graduation', 'Buffet', 'Alexander Janelle', '{"appetizer":"Crabcakes","main":"Pasta","dessert":"Bread Pudding","drink":"Moscow Mule Mocktail"}', '[{"item":"cavatelli","quantity":20,"unit":"lbs"},{"item":"bread","quantity":20,"unit":"loaves"},{"item":"Old Bay Seasoning","quantity":10,"unit":"cans"}]');

INSERT INTO events (userId, eventTitle, eventDate, eventDescription, eventSize, eventType, mealType, clientName, menu, shoppingList) 
  VALUES ('2', 'Kim Birthday', '2018-08-17 11:00:00', 'Elegant birthday', 100, 'Birthdaty', 'Sit-Down', 'Jaehee Kim', '{"appetizer":"Shrimp Cocktail","main":"Roasted Salmon","dessert":"Chocolate Mousse","drink":"Champagne"}', '[{"item":"chocolate","quantity":20,"unit":"lbs"},{"item":"shrimp","quantity":20,"unit":"loaves"},{"item":"champagne","quantity":10,"unit":"bottles"}]');

INSERT INTO events (userId, eventTitle, eventDate, eventDescription, eventSize, eventType, mealType, clientName, menu, shoppingList) 
  VALUES ('1', 'Baily Launch Party', '2017-10-17 16:00:00', 'Cool event for company launch party', 200, 'Corporate', 'Buffet', 'Bailey Dylan', '{"appetizer":"Swedish Meatballs","main":"Duck","dessert":"Lemon Tart","drink":"French 75"}', '[{"item":"lingonberry jam","quantity":20,"unit":"jars"},{"item":"lemons","quantity":200,"unit":"units"},{"item":"champagne","quantity":10,"unit":"bottles"}]');

INSERT INTO events (userId, eventTitle, eventDate, eventDescription, eventSize, eventType, mealType, clientName, menu, shoppingList) 
  VALUES ('4', 'Mattam Anniversary', '2018-12-16 16:00:00', 'Festive wedding anniversary', 75, 'Anniversary', 'Buffet', 'Mattam Prathyusha', '{"appetizer":"Spinach Quiche","main":"Pulav","dessert":"Gulab Jamun","drink":"Wine Spritzer"}', '[{"item":"spinach","quantity":20,"unit":"lbs"},{"item":"rice","quantity":50,"unit":"lbs"},{"item":"chardonnay","quantity":10,"unit":"bottles"}]');

