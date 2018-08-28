'use strict';

var express = require('express');
var router = express.Router();
var booksService = require('../services/books.srv.js');

router.get('/books', (req, res) => {
    booksService.getAllBooks(function (books){
        res.statusCode = 200;
        res.send(books);
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

module.exports = router;