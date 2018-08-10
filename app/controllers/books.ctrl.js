'use strict';

var express = require('express');
var router = express.Router();
var booksService = require('../services/books.srv.js');

router.get('/books/allBooks', (req, res) => {
    booksService.getAllBooks(function (books){
        res.statusCode = 200;
        res.send(books);
    });
});

module.exports = router;