'use strict';

const express = require('express');
const bodyParser = require('body-parser');
const cors = require('cors')

const app = express();

var authorsController = require('./app/controllers/authors.ctrl.js');
var booksController = require('./app/controllers/books.ctrl.js');
var editorialsController = require('./app/controllers/editorials.ctrl.js');

const port = 8000;

app.options('*', cors());
app.use(cors());

// require('./app/routes')(app, {});

app.use('/bookstore/api', [authorsController, booksController, editorialsController]);

app.use('/bookstore/api/*', function (req, res, next) {
    next();
});

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());

app.listen(port, () => {
  console.log('Bookstore back listening on ' + port);
});