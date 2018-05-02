# Foodoo-Backend

### DB notes
* psql -d postgres -f ./foodoo.sql   ====> creates db and tables
* psql -d foodoo  ==========> opens up db in terminal


## Create a new Event - POST -  http://localhost:3001/events

## Headers - Authorization: Bearer <token>

## Body - 

{
        "userid": 3,
        "eventtitle": "Alexander Graduation",
        "eventdate": "17-May-2018 4:00 PM",
        "eventdescription": "Casual event for a coding bootcamp graduation",
        "eventsize": 25,
        "eventtype": "Graduation",
        "mealtype": "Buffet",
        "clientname": "Alexander Janelle",
        "menu": {
            "appetizer": "Crabcakes",
            "main": "Pasta",
            "dessert": "Bread Pudding",
            "drink": "Moscow Mule Mocktail"
        },
        "shoppinglist": [
            {
                "item": "cavatelli",
                "quantity": 20,
                "unit": "lbs"
            },
            {
                "item": "bread",
                "quantity": 20,
                "unit": "loaves"
            },
            {
                "item": "Old Bay Seasoning",
                "quantity": 10,
                "unit": "cans"
            }
        ]
    }

### Get All Events - GET - http://localhost:3001/events

## Headers - Authorization: Bearer <token>



### Get All Users - http://localhost:3001/users

## Headers - Authorization: Bearer <token>



### Login Existing User - POST - http://localhost:3001/login

## content-type: application/json

## Body - for each user

{ "email": "dylan@d.com", "password": "dylan" }

{ "email": "jaehee@j.com", "password": "jaehee" }

{ “email”: “janelle@j.com“, "password": "janelle"}

{ "email": "prathyusha@m.com", "password": "prathyusha" } 


### Register new user - POST -  http://localhost:3001/register

## Header - Content-Type - application/json

## Body - 

{ "username": "Janelle Alexander", "password": "janelle", "location": "Atlanta, GA", "email": "janelle@j.com" }