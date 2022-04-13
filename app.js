const path = require('path')
const express = require('express');
const mysql = require('mysql');
const session = require('express-session');
const md5 = require('md5');
const app = express();

//connecting to db
const connection=mysql.createConnection({
    host:'localhost',
    user:'root',
    password:'musakHan-7',
    database:'task1'
});

//checking connection is established
connection.connect(function(error) {
    if(!!error) console.log(error);
    else console.log('Database Connected!');
}); 

//config in express
app.use(express.json());
app.use(express.urlencoded({extended: false}))
app.use(session({
    secret: "random-value-123",
    resave: false,
    saveUninitialized: false
}))

//set front end template engine
app.set('views', path.join(__dirname,'views'));
app.set('view engine', 'ejs');

//routes
app.get('/',(req, res) => {
    res.render('index.ejs');
});
app.get('/admin',(req, res) => {
    res.render('login.ejs');
});
app.post('/admin',(req, res) => {
    let password = md5(req.body.password);
    let sql = `SELECT * FROM admin WHERE email = '${req.body.email}' AND password = '${password}'`;
    connection.query(sql, (err, rows) => {
        if (rows.length > 0) {
            req.session.admin = rows;
            res.redirect('set-doodle-time');
        }else{
            res.render('login.ejs', {
                error: 'Incorrect username or password'
            });
        }
    });
});
app.get('/logout', function(req, res){
    req.session.destroy(function(){
       console.log("user logged out.")
    });
    res.redirect('./admin');
 });
app.get('/set-doodle-time', checkSignIn, (req, res) => {
    let sql = "SELECT * FROM doodle_time";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('set-doodle-time.ejs', {
            doodle_times : rows
        });
    });
});
app.post('/set-doodle-time', checkSignIn, (req, res) => {
    let updateTimes = req.body;
    for (const index in updateTimes) {
        if (Object.hasOwnProperty.call(updateTimes, index)) {
            const updateTime = updateTimes[index];
            let sql = `UPDATE doodle_time SET time = '${updateTime}' where id = ${index}`;
            connection.query(sql, (e,r) => { if(e) throw e;})

        }
    }

    res.redirect('set-doodle-time')
});
app.get('/doodle-list', checkSignIn, (req, res) => {
    let sql = "SELECT * FROM doodle_time";
    connection.query(sql, (err, doodle_times) => {
        if(err) throw err;
        //get users
        let sql2 = "SELECT * FROM `user_doodle`";
        connection.query(sql2, (err, user_doodles) => {
            if(err) throw err;
            res.render('doodle-list.ejs', {
                doodle_times : doodle_times,
                user_doodles, user_doodles
            });
        })
        
    });
});
app.get('/guest-doodle',(req, res) => {
    let sql = "SELECT * FROM doodle_time";
    connection.query(sql, (err, doodle_times) => {
        if(err) throw err;
        //get users
        let sql2 = "SELECT * FROM `user_doodle`";
        connection.query(sql2, (err, user_doodles) => {
            if(err) throw err;
            res.render('guest-doodle.ejs', {
                doodle_times : doodle_times,
                user_doodles, user_doodles
            });
        })
        
    });
});
app.get('/create-doodle',(req, res) => {
    let sql = "SELECT * FROM doodle_time";
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.render('create-doodle.ejs', {
            doodle_times : rows
        });
    });
});
app.post('/create-doodle',(req, res) => {
    let name = req.body.name;
    let time = req.body.time;
    time = (Array.isArray(time))? time.join(',') : time;
    let sql = `INSERT INTO user_doodle VALUES (NULL, '${name}','${time}')`;
    let query = connection.query(sql, (err, rows) => {
        if(err) throw err;
        res.redirect('guest-doodle')
    });
});

function checkSignIn(req, res, next){
    if(req.session.admin){
       next();     //If session exists, proceed to page
    } else {
       res.redirect('./admin')
    }
 }

// Server Listening
app.listen(3000, () => {
    console.log('Server is running at port 3000');
});