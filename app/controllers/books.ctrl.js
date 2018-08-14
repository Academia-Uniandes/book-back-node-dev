'use strict';

var express = require('express');
var router = express.Router();
var booksService = require('../services/books.srv.js');

router.get('/books/allBooks', (req, res) => {
    booksService.getAllBooks(function (books){
        for (let index = 0; index < books.length; index++) {
            const book = books[index];
            booksService.getBookAuthors(book.id, function(authors){
                book.authors = authors;
                if (index == books.length - 1) {
                    res.statusCode = 200;
                    res.send(books);
                }
            })
        }
    });
});

router.get('/books/getBook/:bookId', function(req, res){
    var bookId = req.params.bookId;
    
    booksService.getBookById(bookId, function(book){
        booksService.getBookAuthors(bookId, function(authors){
            book.authors = authors;
            booksService.getBookEditorial(bookId, function(editorial){
                book.editorial = editorial;
                res.statusCode = 200;
                res.send(book);  
            })
        });
    });
});

router.get('/books/getReviews/:bookId', function(req, res){
    var bookId = req.params.bookId;
    
    booksService.getReviews(bookId, function(reviews){
        booksService.getBookById(bookId, function(book){
            for (let index = 0; index < reviews.length; index++) {
                const review = reviews[index];
                review.book = book.name;
                if(index == reviews.length - 1) {
                    res.statusCode = 200;
                    res.send(reviews);
                }
            }  
        });
    });
});

module.exports = router;