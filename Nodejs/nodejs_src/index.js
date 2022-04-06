const express = require('express');
// get the client
const mysql = require('mysql2');
const cron = require('node-cron');

// Create connection
const db = mysql.createConnection({
    host     : process.env.MYSQL_SERVICE_HOST,
    user     : process.env.mysql_user,
    port     : process.env.MYSQL_SERVICE_PORT,
    password : process.env.mysql_pwd,
    database : process.env.mysql_db
});

// Connect
db.connect((err) => {
    if(err){
        throw err;
    }
    console.log('MySql Connected...');
});

const app = express();

function insert_rand_db(who_str) {

    let rand = parseInt(Math.random() * 1000);
     let post = {who:who_str, rand_num: rand};
        let sql = 'INSERT INTO random_nums SET ?';
        let query = db.query(sql, post, (err, result) => {
            if(err) throw err;
            console.log(result);           
        });
    
    return rand;
}

insert_rand_db("Nodejs");
cron.schedule('* * * * *', () => {
    insert_rand_db("Nodejs");       
});

// Insert when invoke brwoser localhostL3000/insert_db
app.get('/insert_db', (req, res) => {
    
    let rand = insert_rand_db("Nodejs_Web");
    res.send("Data is inserted.. (" + rand + ")")
});


app.listen('8080', () => {
    console.log('Server started on port 8080');
});