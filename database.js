const pg = require('pg-promise')();

const builder = process.env.USER
const dbconfig = {
    host: 'localhost',
    port: 5432,
    database: 'foodoo',
    user: builder,
    password: 'digitalcrafts'
}
const db = pg(dbconfig);


let findUser = (attribute, input) => {
    return db.query(`SELECT * FROM users WHERE ${attribute} = '${input}';`)
};

let getUserById = (id) => {
    return db.query(`SELECT * FROM users WHERE id = ${id};`)
};

let insertUser = (username, password, location, email) => {
    return db.query(`INSERT INTO users (username, password, location, email) 
                    VALUES ('${username}', '${password}', '${location}', '${email}'); `)
};


module.exports = {
    findUser,
    getUserById,
    insertUser
}