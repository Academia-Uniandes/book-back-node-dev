'use strict';

var express = require('express');
var router = express.Router();
var authorsService = require('../services/authors.srv.js');

router.get('/authors/allAuthors', function(req, res){
    authorsService.getAllAuthors(function(authors){
        res.statusCode = 200;
        res.send(authors);
    });
});

router.get('/authors/getAuthor/:authorId', function(req, res){
    var authorId = req.params.authorId;

    authorsService.getAuthorById(authorId, function(author){
        res.statusCode = 200;
        res.send(author);
    });
});

router.get('/authors/getBooks/:authorId', function(req, res){
    var authorId = req.params.authorId;

    authorsService.getBooks(authorId, function(books){
        res.statusCode = 200;
        res.send(books);
    });
});

module.exports = router;