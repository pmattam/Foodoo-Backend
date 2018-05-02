#! /usr/bin/env node

console.log("Server Starting");

require("dotenv").config();
require('dotenv-safe').config({
    allowEmptyValues: true
})

const express = require("express");
const app = express();

const bodyParser = require("body-parser");
const jwt = require('jsonwebtoken');
const db = require('./database');

const bcrypt = require('bcrypt');
const saltRounds = 10;
// will change to enviroment variable when deploying
// const secret = process.env.secretvarname
const secret = process.env.SECRET

// useful for grabing data out of post requests
app.use(bodyParser.urlencoded({
    extended: true
}));

/**bodyParser.json(options)
 * Parses the text as JSON and exposes the resulting object on req.body.
 */
app.use(bodyParser.json());

app.post('/login', function(req, res) {
    console.log(req.body);
    processLogin(req, res);
});

app.post('/register', function(req, res) {
    console.log(req.body);
    createAccount(req, res);
});

// login related
// Function to Handle Login Request
let processLogin = (req, res) => {
    let username = req.body.username;
    let password = req.body.password;
    db.findUser('username', username)
        .then((user) => {
            console.log(user);
            bcrypt.compare(password, user[0].password)
                .then(isValid => {
                    if (isValid) {
                        console.log("Inside then", user);
                        let token = createToken(user[0]);
                        let userObj = {};
                        userObj.id = user[0].id;
                        userObj.username = user[0].username;
                        userObj.email = user[0].email;
                        userObj.jwt = token;
                        res.end(JSON.stringify(userObj));
                    } else {
                        res.end('No token for you');
                    }
                })
                .catch(error => {
                    console.log(error);
                    res.end('Failed to Login');
                })
        })
};

let createToken = (user) => {
    let token = jwt.sign({ userID: user.id },
        secret, { expiresIn: '7d' }
    );
    return token;
};

let createAccount = (req, res) => {
    console.log(req.body);
    let userData = req.body;
    bcrypt.hash(userData.password, saltRounds)
        .then(encryptedPwd => {
            db.insertUser(userData.username, encryptedPwd, userData.location, userData.email)
                .then(() => res.end('New User Stored'))
                .catch(error => {
                    console.log(error);
                    res.end('Failed to store User');
                })
        })
        .catch(error => {
            console.log(error);
            res.end('Failed to generate Hash');
        })
};


//authorizes users based on their json webtoken
// Slicing the authorization value as the request.headers will have key value pair as this ... "authorization: Bearer <token>"
let userAuthorization = (request, response) => {
    console.log("Req headers inside authorization", request.headers);
    let { authorization } = request.headers;
    let payload;
    try {
        payload = jwt.verify(authorization.slice(7), secret);
    } catch (err) {
        console.log(err);
    }
    if (payload) {
        console.log('Payload', payload);
        console.log('User Authorization', payload.userID);
        return userID = payload.userID;
    }
    return false;
};

app.listen(process.env.PORT || 3000, () => console.log("Server is now listening."));