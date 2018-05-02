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

let getAllUsers = () => {
    return db.query("SELECT id, username, location, email FROM users;")
};

let insertUser = (username, password, location, email) => {
    return db.query(`INSERT INTO users (username, password, location, email) 
                    VALUES ('${username}', '${password}', '${location}', '${email}'); `)
};

let getAllEvents = () => {
    return db.query("SELECT * FROM events;")
};

let insertEvent = (user, title, eventDate, desc, size, eventtype, mealtype, client, menu, shoppingList) => {
    let qstr = `INSERT INTO events (userId, eventTitle, eventDate, eventDescription, eventSize, eventType, mealType, clientName, menu, shoppingList) 
  VALUES ('${user}', '${title}', '${eventDate}', '${desc}', ${size}, '${eventtype}', '${mealtype}', '${client}', '${menu}', '${shoppingList}');`;
    console.log(qstr);
    return db.query(qstr);
};

module.exports = {
    findUser,
    getUserById,
    getAllUsers,
    insertUser,
    getAllEvents,
    insertEvent
};