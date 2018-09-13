'use strict';

var express = require('express');
var router = express.Router();
var authorsService = require('../services/authors.srv.js');

router.get('/authors', function (req, res) {
    authorsService.getAllAuthors(function (authors) {
        res.statusCode = 200;
        res.send(authors);
    }, function (err) {
        sendServiceError(err, res);
    });
});

router.get('/authors/:authorId', function (req, res) {
    var authorId = req.params.authorId;

    authorsService.getAuthorById(authorId, function (author) {
        res.statusCode = 200;
        res.send(author);
    }, function (err) {
        sendServiceError(err, res);
    });
});

router.put('/authors', function (req, res) {
    var author = req.body;

    authorsService.updateAuthor(author, function () {
        res.statusCode = 200;
        res.send(true);
    }, function (err) {
        sendServiceError(err, res);
    });
});

router.post('/authors', function (req, res) {
    var author = req.body;

    authorsService.createAuthor(author, function () {
        res.statusCode = 200;
        res.send(true);
    }, function (err) {
        sendServiceError(err, res);
    });
});

router.get('/authors/:authorId/books', function (req, res) {
    var authorId = req.params.authorId;

    authorsService.getBooks(authorId, function (books) {
        res.statusCode = 200;
        res.send(books);
    }, function (err) {
        sendServiceError(err, res);
    });
});

function sendServiceError(err, res) {
    res.statusCode = err.errorCode;
    res.send(err);
}

module.exports = router;