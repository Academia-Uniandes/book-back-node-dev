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

router.get('/books/:bookId', function(req, res){
    var bookId = req.params.bookId;
    
    booksService.getBookById(bookId, function(book){
        booksService.getBookAuthors(bookId, function(authors){
            book.authors = authors;
            booksService.getBookEditorial(bookId, function(editorial){
                book.editorial = editorial;
                res.statusCode = 200;
                res.send(book);  
            }, function (err){
                res.statusCode = 500;
                res.send(err);
            })
        }, function (err){
            res.statusCode = 500;
            res.send(err);
        });
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

module.exports = router;