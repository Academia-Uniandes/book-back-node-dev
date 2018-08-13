'use strict';

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');
const conf = require('./config.js');
const databaseParams = conf.get('db');
const mysql  = require('mysql');
const db = require('./db.js');

var authorsController = require('./app/controllers/authors.ctrl.js');
var booksController = require('./app/controllers/books.ctrl.js');
var editorialsController = require('./app/controllers/editorials.ctrl.js');

const app = express();

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.options('*', cors());
app.use(cors());

app.use('/bookstore/api', [authorsController, booksController, editorialsController]);

app.use('/bookstore/api/*', function (req, res, next) {
    next();
});

function connectToDatabase() {
    var connection = mysql.createConnection({
        host: databaseParams.host,
        user: databaseParams.user,
        password: databaseParams.password,
        database: databaseParams.database
    });  
    
    connection.connect(function (err) {                 
        if (err) {                                   
            console.log('error when connecting to db:', err.code);
            setTimeout(handleDisconnect, dbParams.timeoutBeforeReconnection);   
        } else {
            console.log('Connected to db!');
            db.connection = connection;
        }                                           
    });                                             
    connection.on('error', function (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            handleDisconnect();                       
        } else {
            throw err;
        }
    });
}

connectToDatabase();

const port = conf.get('server').port
app.listen(port, () => {
    console.log('Bookstore back listening on ' + port);
});