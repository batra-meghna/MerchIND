const mysql = require('mysql2');
const dbConnection = mysql.createPool({
    host     : 'localhost', // MYSQL HOST NAME
    user     : 'root',        // MYSQL USERNAME
    password : 'iiita123',    // MYSQL PASSWORD
    database : 'bech_de'      // MYSQL DB NAME
}).promise();
module.exports = dbConnection;
