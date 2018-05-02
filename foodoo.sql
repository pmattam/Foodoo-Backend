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
  name VARCHAR (100) UNIQUE NOT NULL,
  phonenumber VARCHAR (13),
  address VARCHAR (150) NOT NULL,
  email VARCHAR(100) UNIQUE NOT NULL
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
  eventId SERIAL PRIMARY KEY,
  userId INTEGER NOT NULL,
  eventTitle VARCHAR (150) UNIQUE NOT NULL,
  eventDate TIMESTAMP,
  eventDescription VARCHAR (150),
  eventSize INTEGER,
  eventType VARCHAR (50),
  mealType VARCHAR (50),
  clientName VARCHAR (100),
  menu JSON,
  shoppingList JSON
);

-- insert users for initial testing. An entry will be created when new user is registered
/*
INSERT INTO users (username, password, email, location) VALUES 
  ('prathyusha', '$2a$10$TENai6QG7BWzwA.gqAwdI.P40Zct1IYWHs1ylV4A40pbg1fliQxrS', 'prathyusha@gmail.com', 'Atlanta, GA');
*/