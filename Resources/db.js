const mysql = require('mysql2');
require("dotenv").config();

const mysql_Pool = mysql.createPool(process.env.DATABASE_URL);

module.exports = { mysql_Pool }; 