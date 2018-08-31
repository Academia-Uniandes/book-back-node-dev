'use strict';

var express = require('express');
var router = express.Router();
var authorsService = require('../services/authors.srv.js');

router.get('/authors', function(req, res){
    authorsService.getAllAuthors(function(authors){
        res.statusCode = 200;
        res.send(authors);
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

router.get('/authors/:authorId', function(req, res){
    var authorId = req.params.authorId;

    authorsService.getAuthorById(authorId, function(author){
        res.statusCode = 200;
        res.send(author);
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

router.get('/authors/:authorId/books', function(req, res){
    var authorId = req.params.authorId;

    authorsService.getBooks(authorId, function(books){
        res.statusCode = 200;
        res.send(books);
    }, function (err){
        res.statusCode = 500;
        res.send(err);
    });
});

module.exports = router;