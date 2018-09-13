'use strict';

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors');

const conf = require('./config.js');
const db = require('./db.js');

const app = express();

var authorsController = require('./app/controllers/authors.ctrl.js');
var booksController = require('./app/controllers/books.ctrl.js');
var editorialsController = require('./app/controllers/editorials.ctrl.js');

const port = conf.get('server').port;

app.options('*', cors());
app.use(cors());

app.use(bodyParser.json());

app.use('/bookstore/api', [authorsController, booksController, editorialsController]);

app.use('/bookstore/api/*', function (req, res, next) {
    next();
});

function connectToDatabase() {
    var connection = db.connection;

    connection.connect(function (err) {                 
        if (err) {                                   
            console.log('Error when connecting to db:', err.code);
            setTimeout(connectToDatabase, conf.get('db').timeoutBeforeReconnection);   
        } else {
            console.log('Connected to the db !');
        }                                           
    });                                             
    connection.on('error', function (err) {
        if (err.code === 'PROTOCOL_CONNECTION_LOST') {
            connectToDatabase();                       
        } else {
            throw err;
        }
    });
}

connectToDatabase();

app.listen(port, () => {
    console.log('Bookstore back listening on ' + port);
});