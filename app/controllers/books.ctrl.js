'use strict';

var express = require('express');
var router = express.Router();
var booksService = require('../services/books.srv.js');

router.get('/books', (req, res) => {
    booksService.getAllBooks(function (books) {
        for (let index = 0; index < books.length; index++) {
            let book = books[index];
            booksService.getBookAuthors(book.id, function (authors) {
                book.authors = authors;
                if (index == books.length - 1) {
                    res.statusCode = 200;
                    res.send(books);
                }
            }, function (err) {
                sendServiceError(err, res);
            });
        }
    }, function (err) {
        sendServiceError(err, res);
    });
});

router.get('/books/:bookId', function (req, res) {
    var bookId = req.params.bookId;

    booksService.getBookById(bookId, function (book) {
        booksService.getBookAuthors(bookId, function (authors) {
            book.authors = authors;
            booksService.getBookEditorial(bookId, function (editorial) {
                book.editorial = editorial;
                res.statusCode = 200;
                res.send(book);
            }, function (err) {
                sendServiceError(err, res);
            })
        }, function (err) {
            sendServiceError(err, res);
        });
    }, function (err) {
        sendServiceError(err, res);
    });
});

router.get('/books/:bookId/reviews', function (req, res) {
    var bookId = req.params.bookId;

    booksService.getReviews(bookId, function (reviews) {
        booksService.getBookById(bookId, function (book) {
            for (let index = 0; index < reviews.length; index++) {
                const review = reviews[index];
                review.book = book.name;
                if (index == reviews.length - 1) {
                    res.statusCode = 200;
                    res.send(reviews);
                }
            }
        }, function (err) {
            sendServiceError(err, res);
        });
    }, function (err) {
        sendServiceError(err, res);
    });
});

function sendServiceError(err, res) {
    res.statusCode = 500;
    res.send(err);
}

module.exports = router;