const { Pool, Client } = require('pg');
const dotenv = require('dotenv');


//cloud connection
const { USER, HOST, DATABASE, PASSWORD, PORT } = process.env;

const credentials = {
  user: USER,
  host: HOST,
  database: "sdc",
  password: PASSWORD,
  port: PORT,
};

const pool = new Pool(credentials);
const client = new Client(credentials);


//test query
pool.query('SELECT NOW()', (err, res) => {
  if (err) {
    console.log(err);
  } else {
    console.log(res.rows);
  }
})

module.exports = pool;